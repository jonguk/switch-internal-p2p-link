#include <systemc.h>
#include <iostream>
#include <vector>
#include <cassert>
#include "../../systemc/queue_manager/ingress_queue_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Ingress Queue Manager New Format Test
// Tests new 9-byte external packet header format processing
// =============================================================================

SC_MODULE(TestIngressQueueManagerNewFormat) {
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
    
    // Internal Bus Master Interface (to Egress Queue Manager)
    sc_signal<bool> internal_valid;
    sc_signal<PacketEntry> internal_packet;
    sc_signal<bool> internal_ready;
    
    // AXI Interface (dummy)
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Credit Return Master Interface - NOT USED in Ingress Queue Manager
    
    // DUT
    IngressQueueManager* dut;
    
    SC_CTOR(TestIngressQueueManagerNewFormat) : clk("clk", 10, SC_NS) {
        std::cout << "=== Ingress Queue Manager New Format Test ===" << std::endl;
        
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
        
        // Internal bus interface
        dut->internal_valid(internal_valid);
        dut->internal_packet(internal_packet);
        dut->internal_ready(internal_ready);
        
        // AXI interface
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Credit return interface - NOT USED in Ingress Queue Manager
        
        // Configure DUT
        dut->set_port_id(1);
        
        SC_THREAD(test_process);
        SC_THREAD(internal_ready_driver);
    }
    
    ~TestIngressQueueManagerNewFormat() {
        delete dut;
    }
    
    void test_process() {
        // Initialize signals
        initialize_signals();
        
        // Test 1: 새로운 큐 할당 로직 (queue_id 직접 사용)
        test_new_queue_assignment();
        
        // Test 2: queue_id 범위 검증
        test_queue_id_validation();
        
        // Test 3: 헤더 CRC 정보 표시
        test_header_crc_display();
        
        // Test 4: 다양한 큐로 패킷 분산
        test_multiple_queue_distribution();
        
        std::cout << "=== All new format tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void internal_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            internal_ready.write(true);  // Always ready to receive
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        axis_tvalid.write(false);
        axis_tlast.write(false);
        // internal_ready는 internal_ready_driver에서 제어
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        
        wait(100, SC_NS);
        
        rst_n.write(true);
        wait(100, SC_NS);
        
        std::cout << "Signal initialization complete" << std::endl;
    }
    
    void test_new_queue_assignment() {
        std::cout << "\n--- Test 1: New Queue Assignment Logic (queue_id direct use) ---" << std::endl;
        
        // 새로운 9바이트 헤더 포맷을 사용한 패킷 생성
        // Queue ID = 3으로 직접 지정
        ExternalPacketHeader ext_header;
        ext_header.channel_type = 1;        // HIGH_PRIORITY
        ext_header.queue_id = 3;            // 🚀 직접 큐 지정!
        ext_header.dest_port = 0x1000;
        ext_header.source_port = 0x2000;
        ext_header.total_packet_size = 13;   // 9 + 4
        ext_header.header_crc = ext_header.calculate_crc();
        
        // InternalHeader로 변환
        InternalHeader internal_header(ext_header);
        internal_header.packet_type = PacketType::DATA;
        
        // 테스트 패킷 데이터 (원본 9바이트 헤더 + 페이로드)
        std::vector<uint8_t> packet_data;
        uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        packet_data.push_back(0xAA);
        packet_data.push_back(0xBB);
        packet_data.push_back(0xCC);
        packet_data.push_back(0xDD);
        
        std::cout << "  Sending packet with queue_id = 3" << std::endl;
        
        // AXIS로 패킷 전송
        send_axis_packet(packet_data, internal_header);
        
        // 처리 완료 대기
        wait(200, SC_NS);
        
        // 큐 3에 패킷이 들어갔는지 확인
        std::cout << "  Queue 3 stats: received=" << dut->get_queue_stats(3).packets_received 
                  << ", transmitted=" << dut->get_queue_stats(3).packets_transmitted << std::endl;
        
        assert(dut->get_queue_stats(3).packets_received >= 1);
        std::cout << "✅ Packet correctly assigned to queue 3" << std::endl;
    }
    
    void test_queue_id_validation() {
        std::cout << "\n--- Test 2: Queue ID Range Validation ---" << std::endl;
        
        // Invalid queue ID (범위 초과)
        ExternalPacketHeader ext_header;
        ext_header.channel_type = 0;
        ext_header.queue_id = 15;           // 🚨 유효 범위 초과 (MAX=8)
        ext_header.dest_port = 0x3000;
        ext_header.source_port = 0x4000;
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
        
        std::cout << "  Sending packet with invalid queue_id = 15" << std::endl;
        
        // 초기 큐 0 통계 확인
        uint64_t initial_queue0_count = dut->get_queue_stats(0).packets_received;
        
        // AXIS로 패킷 전송
        send_axis_packet(packet_data, internal_header);
        
        // 처리 완료 대기
        wait(200, SC_NS);
        
        // 큐 0으로 fallback되었는지 확인
        uint64_t final_queue0_count = dut->get_queue_stats(0).packets_received;
        assert(final_queue0_count > initial_queue0_count);
        
        std::cout << "✅ Invalid queue_id correctly handled (fallback to queue 0)" << std::endl;
    }
    
    void test_header_crc_display() {
        std::cout << "\n--- Test 3: Header CRC Information Display ---" << std::endl;
        
        // CRC가 있는 패킷 생성
        ExternalPacketHeader ext_header;
        ext_header.channel_type = 2;        // CONTROL_CHANNEL
        ext_header.queue_id = 1;
        ext_header.dest_port = 0x5000;
        ext_header.source_port = 0x6000;
        ext_header.total_packet_size = 11;   // 9 + 2
        ext_header.header_crc = ext_header.calculate_crc();
        
        InternalHeader internal_header(ext_header);
        internal_header.packet_type = PacketType::DATA;
        
        std::cout << "  Expected CRC in log: 0x" << std::hex << (int)ext_header.header_crc << std::dec << std::endl;
        
        // 테스트 패킷 데이터
        std::vector<uint8_t> packet_data;
        uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        packet_data.push_back(0x12);
        packet_data.push_back(0x34);
        
        // AXIS로 패킷 전송
        send_axis_packet(packet_data, internal_header);
        
        // 처리 완료 대기
        wait(200, SC_NS);
        
        std::cout << "✅ Header CRC information displayed in logs" << std::endl;
    }
    
    void test_multiple_queue_distribution() {
        std::cout << "\n--- Test 4: Multiple Queue Distribution ---" << std::endl;
        
        // 여러 큐에 패킷 분산
        std::vector<uint8_t> target_queues = {0, 1, 2, 4, 7};  // 다양한 큐 ID
        
        for (auto queue_id : target_queues) {
            ExternalPacketHeader ext_header;
            ext_header.channel_type = queue_id % 4;  // 다양한 채널 타입
            ext_header.queue_id = queue_id;
            ext_header.dest_port = 0x7000 + queue_id * 0x100;
            ext_header.source_port = 0x8000 + queue_id * 0x100;
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
            packet_data.push_back(queue_id);  // 큐 ID를 페이로드에 포함
            
            std::cout << "  Sending packet to queue " << (int)queue_id << std::endl;
            
            // AXIS로 패킷 전송
            send_axis_packet(packet_data, internal_header);
            wait(50, SC_NS);  // 패킷 간 간격
        }
        
        // 처리 완료 대기
        wait(300, SC_NS);
        
        // 모든 대상 큐에 패킷이 들어갔는지 확인
        for (auto queue_id : target_queues) {
            auto stats = dut->get_queue_stats(queue_id);
            std::cout << "  Queue " << (int)queue_id << ": received=" << stats.packets_received << std::endl;
            assert(stats.packets_received >= 1);
        }
        
        std::cout << "✅ Packets correctly distributed to multiple queues" << std::endl;
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
};

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused warnings
    
    std::cout << "Starting Ingress Queue Manager New Format Test..." << std::endl;
    
    TestIngressQueueManagerNewFormat test_module("test_ingress_queue_manager_new_format");
    
    sc_start();
    
    return 0;
}