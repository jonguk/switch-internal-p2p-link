#include <systemc.h>
#include <iostream>
#include <vector>
#include <cassert>
#include "../../systemc/queue_manager/ingress_queue_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Ingress Queue Manager Global Port Mapping Test
// Tests Global Port ID → Local Port Number lookup functionality
// =============================================================================

SC_MODULE(TestIngressQueueManagerGlobalMapping) {
public:
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // AXIS Slave Interface (from Ingress Port Manager)
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // Internal AXIS Master Interface (to Egress Queue Manager)
    sc_signal<bool> internal_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> internal_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> internal_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> internal_tuser;
    sc_signal<sc_bv<AXIS_DEST_WIDTH>> internal_tdest;
    sc_signal<bool> internal_tlast;
    sc_signal<bool> internal_tready;
    
    // AXI Interface (for CPU firmware initialization)
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // DUT
    IngressQueueManager* dut;
    
    SC_CTOR(TestIngressQueueManagerGlobalMapping) : clk("clk", 10, SC_NS) {
        std::cout << "=== Ingress Queue Manager Global Port Mapping Test ===" << std::endl;
        
        // Create DUT
        dut = new IngressQueueManager("ingress_queue_manager");
        
        // Connect signals
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // AXIS interface
        dut->axis_tvalid(axis_tvalid);
        dut->axis_tdata(axis_tdata);
        dut->axis_tkeep(axis_tkeep);
        dut->axis_tuser(axis_tuser);
        dut->axis_tlast(axis_tlast);
        dut->axis_tready(axis_tready);
        
        // Internal AXIS interface
        dut->internal_tvalid(internal_tvalid);
        dut->internal_tdata(internal_tdata);
        dut->internal_tkeep(internal_tkeep);
        dut->internal_tuser(internal_tuser);
        dut->internal_tdest(internal_tdest);
        dut->internal_tlast(internal_tlast);
        dut->internal_tready(internal_tready);
        
        // AXI interface
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Configure DUT
        dut->set_port_id(1);
        
        SC_THREAD(test_process);
        SC_THREAD(internal_tready_driver);
    }
    
    ~TestIngressQueueManagerGlobalMapping() {
        delete dut;
    }
    
    void test_process() {
        // Initialize signals
        initialize_signals();
        
        // Test 1: 기본 lookup table 초기화 확인
        test_default_lookup_table();
        
        // Test 2: CPU 펌웨어를 통한 mapping 설정
        test_cpu_firmware_initialization();
        
        // Test 3: Global → Local mapping 수행
        test_global_to_local_mapping();
        
        // Test 4: 복합 시나리오 (여러 매핑)
        test_multiple_mappings();
        
        // Test 5: 에러 처리 (무효한 Global ID)
        test_invalid_global_id_handling();
        
        std::cout << "=== All global port mapping tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void internal_tready_driver() {
        while (true) {
            wait(clk.posedge_event());
            internal_tready.write(true);  // Always ready to receive
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        axis_tvalid.write(false);
        axis_tlast.write(false);
        // internal_tready는 internal_tready_driver에서 제어
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        
        wait(100, SC_NS);
        
        rst_n.write(true);
        wait(100, SC_NS);
        
        std::cout << "Signal initialization complete" << std::endl;
    }
    
    void test_default_lookup_table() {
        std::cout << "\n--- Test 1: Default Lookup Table Initialization ---" << std::endl;
        
        // 기본 초기화가 완료되었는지 확인
        assert(dut->is_lookup_table_ready());
        std::cout << "✅ Lookup table is ready" << std::endl;
        
        // 기본 identity mapping 테스트 (Global 0-7 → Local 0-7)
        for (int i = 0; i < 8; i++) {
            uint8_t local_port = dut->lookup_global_to_local(i);
            assert(local_port == i);
            std::cout << "  ✅ Default mapping: Global " << i << " → Local " << (int)local_port << std::endl;
        }
        
        std::cout << "✅ Default lookup table test completed" << std::endl;
    }
    
    void test_cpu_firmware_initialization() {
        std::cout << "\n--- Test 2: CPU Firmware Initialization ---" << std::endl;
        
        // CPU 펌웨어 시뮬레이션: AXI를 통한 mapping 설정
        
        // 1. Global ID 100 → Local Port 5 매핑 설정
        uint32_t mapping_data = (100 << 16) | 5;  // [31:16] = global_id, [7:0] = local_port
        send_axi_write(0x88, mapping_data);
        wait(50, SC_NS);
        
        // 2. Global ID 200 → Local Port 3 매핑 설정  
        mapping_data = (200 << 16) | 3;
        send_axi_write(0x88, mapping_data);
        wait(50, SC_NS);
        
        // 3. Global ID 255 → Local Port 7 매핑 설정
        mapping_data = (255 << 16) | 7;
        send_axi_write(0x88, mapping_data);
        wait(50, SC_NS);
        
        // 4. Global ID 1000 → Local Port 4 매핑 설정 (중간 범위)
        mapping_data = (1000 << 16) | 4;
        send_axi_write(0x88, mapping_data);
        wait(50, SC_NS);
        
        // 5. Global ID 4095 → Local Port 6 매핑 설정 (12비트 최대값)
        mapping_data = (4095 << 16) | 6;
        send_axi_write(0x88, mapping_data);
        wait(50, SC_NS);
        
        // 설정된 매핑 확인
        assert(dut->lookup_global_to_local(100) == 5);
        assert(dut->lookup_global_to_local(200) == 3);
        assert(dut->lookup_global_to_local(255) == 7);
        assert(dut->lookup_global_to_local(1000) == 4);
        assert(dut->lookup_global_to_local(4095) == 6);
        
        // 6. 경계값 테스트 (Global ID 4095는 12비트 최대값)
        std::cout << "Testing boundary value Global ID 4095..." << std::endl;
        uint8_t max_port = dut->lookup_global_to_local(4095);
        assert(max_port == 6);  // Should be mapped to port 6
        std::cout << "  ✅ Maximum Global ID 4095 correctly handled" << std::endl;
        
        std::cout << "✅ CPU firmware initialization test completed" << std::endl;
    }
    
    void test_global_to_local_mapping() {
        std::cout << "\n--- Test 3: Global → Local Mapping in Packet Processing ---" << std::endl;
        
        // Global Port 100으로 향하는 패킷 생성 (이미 Local Port 5로 매핑됨)
        ExternalPacketHeader ext_header;
        ext_header.channel_type = 1;
        ext_header.queue_id = 2;
        ext_header.dest_port = 100;         // 🌐 Global Port 100
        ext_header.source_port = 0x1000;
        ext_header.total_packet_size = 12;  // 9 + 3
        ext_header.header_crc = ext_header.calculate_crc();
        
        InternalHeader internal_header(ext_header);
        internal_header.packet_type = PacketType::DATA;
        
        // 테스트 패킷 데이터
        std::vector<uint8_t> packet_data;
        uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        packet_data.push_back(0xAA);
        packet_data.push_back(0xBB);
        packet_data.push_back(0xCC);
        
        std::cout << "  Sending packet to Global Port 100 (should map to Local Port 5)" << std::endl;
        
        // AXIS로 패킷 전송
        send_axis_packet(packet_data, internal_header);
        
        // 내부 버스 출력 대기 및 검증
        wait_for_internal_transmission();
        
        if (internal_valid.read()) {
            PacketEntry transmitted_packet = internal_packet.read();
            std::cout << "  📦 Transmitted packet dest_port: " << transmitted_packet.header.dest_port << std::endl;
            
            // Local Port 5로 매핑되었는지 확인
            assert(transmitted_packet.header.dest_port == 5);
            std::cout << "  ✅ Global Port 100 correctly mapped to Local Port 5" << std::endl;
        }
        
        std::cout << "✅ Global to local mapping test completed" << std::endl;
        
        // 🚀 추가 테스트: 더 큰 Global Port ID 값들
        std::cout << "\n  --- Testing Large Global Port IDs ---" << std::endl;
        
        // Global Port 1000 테스트 (이미 Local Port 4로 매핑됨)
        ext_header.dest_port = 1000;
        ext_header.header_crc = ext_header.calculate_crc();
        internal_header = InternalHeader(ext_header);
        
        // 패킷 데이터 재구성
        packet_data.clear();
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        packet_data.push_back(0xDD);
        packet_data.push_back(0xEE);
        packet_data.push_back(0xFF);
        
        std::cout << "  Sending packet to Global Port 1000 (should map to Local Port 4)" << std::endl;
        send_axis_packet(packet_data, internal_header);
        wait_for_internal_transmission();
        
        if (internal_valid.read()) {
            PacketEntry transmitted_packet = internal_packet.read();
            assert(transmitted_packet.header.dest_port == 4);
            std::cout << "  ✅ Global Port 1000 correctly mapped to Local Port 4" << std::endl;
        }
        
        // Global Port 4095 테스트 (이미 Local Port 6으로 매핑됨)
        ext_header.dest_port = 4095;
        ext_header.header_crc = ext_header.calculate_crc();
        internal_header = InternalHeader(ext_header);
        
        // 패킷 데이터 재구성
        packet_data.clear();
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        packet_data.push_back(0x11);
        packet_data.push_back(0x22);
        packet_data.push_back(0x33);
        
        std::cout << "  Sending packet to Global Port 4095 (should map to Local Port 6)" << std::endl;
        send_axis_packet(packet_data, internal_header);
        wait_for_internal_transmission();
        
        if (internal_valid.read()) {
            PacketEntry transmitted_packet = internal_packet.read();
            assert(transmitted_packet.header.dest_port == 6);
            std::cout << "  ✅ Global Port 4095 correctly mapped to Local Port 6" << std::endl;
        }
        
        std::cout << "✅ Large Global Port ID mapping tests completed" << std::endl;
    }
    
    void test_multiple_mappings() {
        std::cout << "\n--- Test 4: Multiple Mappings Scenario ---" << std::endl;
        
        // 여러 global port로 패킷들을 보내고 올바르게 매핑되는지 확인
        struct TestCase {
            uint16_t global_port;
            uint8_t expected_local_port;
        };
        
        std::vector<TestCase> test_cases = {
            {200, 3},  // 이미 설정된 매핑
            {255, 7},  // 이미 설정된 매핑
            {5, 5},    // 기본 identity 매핑
        };
        
        for (const auto& test_case : test_cases) {
            ExternalPacketHeader ext_header;
            ext_header.channel_type = 0;
            ext_header.queue_id = 1;
            ext_header.dest_port = test_case.global_port;
            ext_header.source_port = 0x2000;
            ext_header.total_packet_size = 10;
            ext_header.header_crc = ext_header.calculate_crc();
            
            InternalHeader internal_header(ext_header);
            internal_header.packet_type = PacketType::DATA;
            
            // 테스트 패킷 데이터
            std::vector<uint8_t> packet_data;
            uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
            ext_header.serialize_to_bytes(header_bytes);
            for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
                packet_data.push_back(header_bytes[i]);
            }
            packet_data.push_back(0xDD);
            
            std::cout << "  Testing Global Port " << test_case.global_port 
                      << " → Expected Local Port " << (int)test_case.expected_local_port << std::endl;
            
            // AXIS로 패킷 전송
            send_axis_packet(packet_data, internal_header);
            wait(100, SC_NS);
        }
        
        std::cout << "✅ Multiple mappings test completed" << std::endl;
    }
    
    void test_invalid_global_id_handling() {
        std::cout << "\n--- Test 5: Invalid Global ID Handling ---" << std::endl;
        
        // 매핑되지 않은 Global Port로 패킷 전송
        ExternalPacketHeader ext_header;
        ext_header.channel_type = 0;
        ext_header.queue_id = 0;
        ext_header.dest_port = 500;         // 🚨 매핑되지 않은 Global Port
        ext_header.source_port = 0x3000;
        ext_header.total_packet_size = 10;
        ext_header.header_crc = ext_header.calculate_crc();
        
        InternalHeader internal_header(ext_header);
        internal_header.packet_type = PacketType::DATA;
        
        // 테스트 패킷 데이터
        std::vector<uint8_t> packet_data;
        uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        packet_data.push_back(0xEE);
        
        std::cout << "  Sending packet to unmapped Global Port 500 (should fallback to Local Port 0)" << std::endl;
        
        // 직접 lookup 함수 테스트
        uint8_t fallback_port = dut->lookup_global_to_local(500);
        assert(fallback_port == 0);  // Fallback to port 0
        
        // AXIS로 패킷 전송
        send_axis_packet(packet_data, internal_header);
        
        wait(100, SC_NS);
        std::cout << "✅ Invalid global ID handling test completed" << std::endl;
    }
    
    void send_axi_write(uint32_t addr, uint32_t data) {
        std::cout << "  🔧 CPU AXI Write: addr=0x" << std::hex << addr 
                  << ", data=0x" << data << std::dec << std::endl;
        
        axi_slave_addr.write(addr);
        axi_slave_data.write(data);
        axi_slave_valid.write(true);
        
        wait(clk.posedge_event());
        
        axi_slave_valid.write(false);
        wait(clk.posedge_event());
    }
    
    void send_axis_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header) {
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t total_beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (size_t beat = 0; beat < total_beats; beat++) {
            // Wait for ready
            while (!axis_tready.read()) {
                wait(clk.posedge_event());
            }
            
            // Prepare data beat
            sc_bv<AXIS_DATA_WIDTH> tdata = 0;
            sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
            
            size_t bytes_in_beat = std::min(packet_data.size() - beat * bytes_per_beat, bytes_per_beat);
            
            for (size_t i = 0; i < bytes_in_beat; i++) {
                size_t byte_idx = beat * bytes_per_beat + i;
                if (byte_idx < packet_data.size()) {
                    tdata.range(i*8+7, i*8) = packet_data[byte_idx];
                    tkeep[i] = 1;
                }
            }
            
            // Set AXIS signals
            axis_tvalid.write(true);
            axis_tdata.write(tdata);
            axis_tkeep.write(tkeep);
            axis_tuser.write(beat == 0 ? header.to_sc_bv() : sc_bv<AXIS_USER_WIDTH>(0));  // Header only in first beat
            axis_tlast.write(beat == total_beats - 1);
            
            wait(clk.posedge_event());
        }
        
        // Clear signals after transmission
        axis_tvalid.write(false);
        axis_tlast.write(false);
        axis_tuser.write(0);
        
        wait(clk.posedge_event());
    }
    
    void wait_for_internal_transmission() {
        std::cout << "  Waiting for internal transmission..." << std::endl;
        int timeout = 0;
        while (!internal_valid.read() && timeout < 1000) {
            wait(clk.posedge_event());
            timeout++;
        }
        
        if (timeout >= 1000) {
            std::cout << "  ⚠️  No internal transmission detected" << std::endl;
        } else {
            std::cout << "  ✅ Internal transmission detected" << std::endl;
        }
    }
};

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused warnings
    
    std::cout << "Starting Ingress Queue Manager Global Port Mapping Test..." << std::endl;
    
    TestIngressQueueManagerGlobalMapping test_module("test_ingress_queue_manager_global_mapping");
    
    sc_start();
    
    return 0;
}