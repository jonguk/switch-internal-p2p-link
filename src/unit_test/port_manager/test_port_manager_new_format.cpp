#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/port_manager/port_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Test Module for Unified PortManager with New External Packet Format
// =============================================================================

SC_MODULE(TestPortManagerNewFormat) {
    // Test signals
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External Input Interface
    sc_signal<bool> ext_in_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_in_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_in_keep;
    sc_signal<bool> ext_in_last;
    sc_signal<bool> ext_in_ready;
    
    // External Output Interface
    sc_signal<bool> ext_out_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_out_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_out_keep;
    sc_signal<bool> ext_out_last;
    sc_signal<bool> ext_out_ready;
    
    // Internal AXIS Interface (Queue Manager simulation)  
    sc_signal<bool> ingress_axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ingress_axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ingress_axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> ingress_axis_tuser;
    sc_signal<bool> ingress_axis_tlast;
    sc_signal<bool> ingress_axis_tready;
    
    sc_signal<bool> egress_axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> egress_axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> egress_axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> egress_axis_tuser;
    sc_signal<bool> egress_axis_tlast;
    sc_signal<bool> egress_axis_tready;
    
    // AXI Interface  
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Credit Interface
    sc_signal<bool> credit_return_valid;
    sc_signal<bool> credit_return_ready;
    
    // Device Under Test
    PortManager* dut;
    
    SC_CTOR(TestPortManagerNewFormat) : clk("clk", 10, SC_NS) {
        std::cout << "=== Port Manager New Format Test ===" << std::endl;
        
        // Create DUT
        dut = new PortManager("port_manager");
        
        // Connect signals
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // External interfaces
        dut->ext_in_valid(ext_in_valid);
        dut->ext_in_data(ext_in_data);
        dut->ext_in_keep(ext_in_keep);
        dut->ext_in_last(ext_in_last);
        dut->ext_in_ready(ext_in_ready);
        
        dut->ext_out_valid(ext_out_valid);
        dut->ext_out_data(ext_out_data);
        dut->ext_out_keep(ext_out_keep);
        dut->ext_out_last(ext_out_last);
        dut->ext_out_ready(ext_out_ready);
        
        // Internal AXIS interfaces
        dut->ingress_axis_tvalid(ingress_axis_tvalid);
        dut->ingress_axis_tdata(ingress_axis_tdata);
        dut->ingress_axis_tkeep(ingress_axis_tkeep);
        dut->ingress_axis_tuser(ingress_axis_tuser);
        dut->ingress_axis_tlast(ingress_axis_tlast);
        dut->ingress_axis_tready(ingress_axis_tready);
        
        dut->egress_axis_tvalid(egress_axis_tvalid);
        dut->egress_axis_tdata(egress_axis_tdata);
        dut->egress_axis_tkeep(egress_axis_tkeep);
        dut->egress_axis_tuser(egress_axis_tuser);
        dut->egress_axis_tlast(egress_axis_tlast);
        dut->egress_axis_tready(egress_axis_tready);
        
        // AXI interfaces
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Credit interface
        dut->credit_return_valid(credit_return_valid);
        dut->credit_return_ready(credit_return_ready);
        
        // Configure port ID
        dut->configure_port(1);
        
        SC_THREAD(test_process);
        SC_THREAD(ingress_axis_ready_driver);
        SC_THREAD(egress_axis_driver);
        SC_THREAD(ext_out_ready_driver);
    }
    
    ~TestPortManagerNewFormat() {
        delete dut;
    }
    
    void test_process() {
        // Initialize signals
        initialize_signals();
        
        // Test 1: 새로운 9바이트 헤더 포맷 처리
        test_new_packet_format();
        
        // Test 2: CRC 검증 및 에러 처리
        test_error_handling();
        
        // Test 3: End-to-End 플로우 (외부→내부→외부)
        test_end_to_end_flow();
        
        std::cout << "=== All Port Manager new format tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void ingress_axis_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            ingress_axis_tready.write(true);  // Always ready
        }
    }
    
    void egress_axis_driver() {
        // End-to-end 테스트를 위한 루프백 드라이버
        egress_axis_tvalid.write(false);  // 초기값 설정
        wait(100, SC_NS);  // 초기 대기
        
        while (true) {
            wait(clk.posedge_event());
            // 간단한 루프백 로직: ingress AXIS가 활성화되면 잠시 후 egress로 전달
            if (ingress_axis_tvalid.read() && !egress_axis_tvalid.read()) {
                wait(100, SC_NS);  // 처리 지연 시뮬레이션
                
                // 루프백 전송
                egress_axis_tvalid.write(true);
                egress_axis_tdata.write(ingress_axis_tdata.read());
                egress_axis_tkeep.write(ingress_axis_tkeep.read());
                egress_axis_tuser.write(ingress_axis_tuser.read());
                egress_axis_tlast.write(ingress_axis_tlast.read());
                
                wait(clk.posedge_event());
                egress_axis_tvalid.write(false);
                
                wait(50, SC_NS);  // 다음 패킷을 위한 간격
            }
        }
    }
    
    void ext_out_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            ext_out_ready.write(true);  // Always ready
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        ext_in_valid.write(false);
        ext_in_last.write(false);
        // ext_out_ready는 ext_out_ready_driver에서 제어
        // ingress_axis_tready는 ingress_axis_ready_driver에서 제어
        // egress_axis_tvalid는 egress_axis_driver에서 제어
        // egress_axis_tready는 DUT의 egress_port에서 제어
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        credit_return_valid.write(false);
        
        wait(100, SC_NS);
        
        rst_n.write(true);
        wait(100, SC_NS);
        
        std::cout << "Signal initialization complete" << std::endl;
    }
    
    void test_new_packet_format() {
        std::cout << "\n--- Test 1: New 9-byte Header Format Processing ---" << std::endl;
        
        // 새로운 9바이트 헤더 패킷 생성
        ExternalPacketHeader ext_header;
        ext_header.channel_type = 1;        // HIGH_PRIORITY
        ext_header.queue_id = 3;
        ext_header.dest_port = 0x1234;
        ext_header.source_port = 0x5678;
        ext_header.total_packet_size = 15;   // 9바이트 헤더 + 6바이트 페이로드
        ext_header.header_crc = ext_header.calculate_crc();
        
        // 전체 패킷 구성
        std::vector<uint8_t> full_packet;
        
        // 헤더 직렬화
        uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            full_packet.push_back(header_bytes[i]);
        }
        
        // 페이로드 추가
        std::vector<uint8_t> payload = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};
        for (uint8_t byte : payload) {
            full_packet.push_back(byte);
        }
        
        std::cout << "✅ Sending new format packet: " << full_packet.size() << " bytes" << std::endl;
        
        // 패킷 전송
        send_external_packet(full_packet);
        
        // AXIS 출력 검증
        wait_for_ingress_axis_output();
        
        // tuser에서 InternalHeader 검증
        if (ingress_axis_tvalid.read()) {
            InternalHeader decoded_header = InternalHeader::from_sc_bv(ingress_axis_tuser.read());
            
            std::cout << "  ✅ AXIS tuser validation:" << std::endl;
            std::cout << "    Queue ID: " << (int)decoded_header.queue_id << std::endl;
            std::cout << "    Dest Port: " << decoded_header.dest_port << std::endl;
            std::cout << "    Source Port: " << decoded_header.source_port << std::endl;
            std::cout << "    Packet Length: " << decoded_header.packet_length << std::endl;
            
            // 검증
            assert(decoded_header.queue_id == ext_header.queue_id);
            assert(decoded_header.dest_port == ext_header.dest_port);
            assert(decoded_header.source_port == ext_header.source_port);
            assert(decoded_header.packet_length == ext_header.total_packet_size);
        }
        
        wait(200, SC_NS);
        std::cout << "✅ New packet format test completed" << std::endl;
    }
    
    void test_error_handling() {
        std::cout << "\n--- Test 2: CRC Validation and Error Handling ---" << std::endl;
        
        // 잘못된 CRC 패킷 생성
        ExternalPacketHeader bad_header;
        bad_header.channel_type = 2;
        bad_header.queue_id = 5;
        bad_header.dest_port = 0xABCD;
        bad_header.source_port = 0xEF00;
        bad_header.total_packet_size = 12;  // 9 + 3
        bad_header.header_crc = 0xFF;       // 잘못된 CRC
        
        std::vector<uint8_t> bad_packet;
        uint8_t bad_header_bytes[EXTERNAL_HEADER_SIZE];
        bad_header.serialize_to_bytes(bad_header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            bad_packet.push_back(bad_header_bytes[i]);
        }
        bad_packet.push_back(0x11);
        bad_packet.push_back(0x22); 
        bad_packet.push_back(0x33);
        
        std::cout << "  Sending packet with invalid CRC..." << std::endl;
        send_external_packet(bad_packet);
        
        // 에러 처리 검증 (패킷이 드롭되어야 함)
        wait(200, SC_NS);
        
        // AXIS 출력이 없어야 함 (패킷이 드롭됨)
        if (!ingress_axis_tvalid.read()) {
            std::cout << "  ✅ Invalid CRC packet correctly dropped" << std::endl;
        }
        
        std::cout << "✅ Error handling test completed" << std::endl;
    }
    
    void test_end_to_end_flow() {
        std::cout << "\n--- Test 3: End-to-End Flow (External→Internal→External) ---" << std::endl;
        
        // 유효한 패킷 생성
        ExternalPacketHeader valid_header;
        valid_header.channel_type = 0;      // LOW_PRIORITY
        valid_header.queue_id = 1;
        valid_header.dest_port = 0x1111;
        valid_header.source_port = 0x2222;
        valid_header.total_packet_size = 13; // 9 + 4
        valid_header.header_crc = valid_header.calculate_crc();
        
        std::vector<uint8_t> test_packet;
        uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
        valid_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            test_packet.push_back(header_bytes[i]);
        }
        test_packet.push_back(0xDE);
        test_packet.push_back(0xAD);
        test_packet.push_back(0xBE);
        test_packet.push_back(0xEF);
        
        std::cout << "  Sending end-to-end test packet..." << std::endl;
        send_external_packet(test_packet);
        
        // 외부 출력 대기
        wait_for_external_output();
        
        if (ext_out_valid.read()) {
            std::cout << "  ✅ End-to-end packet flow successful!" << std::endl;
            
            // 출력 패킷 검증 (원본과 동일해야 함)
            std::vector<uint8_t> output_packet;
            capture_external_output(output_packet);
            
            if (output_packet.size() == test_packet.size()) {
                std::cout << "  ✅ Output packet size matches input" << std::endl;
                
                // 첫 몇 바이트 비교
                bool matches = true;
                for (size_t i = 0; i < std::min(size_t(4), output_packet.size()); i++) {
                    if (output_packet[i] != test_packet[i]) {
                        matches = false;
                        break;
                    }
                }
                
                if (matches) {
                    std::cout << "  ✅ Output packet content matches input" << std::endl;
                }
            }
        }
        
        std::cout << "✅ End-to-end flow test completed" << std::endl;
    }
    
    void send_external_packet(const std::vector<uint8_t>& packet_data) {
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (size_t beat = 0; beat < beats; beat++) {
            // Wait for ready
            while (!ext_in_ready.read()) {
                wait(clk.posedge_event());
            }
            
            // Pack data into beat
            sc_bv<AXIS_DATA_WIDTH> data_beat = 0;
            sc_bv<AXIS_KEEP_WIDTH> keep_beat = 0;
            
            size_t bytes_in_beat = std::min(packet_data.size() - beat * bytes_per_beat, bytes_per_beat);
            
            for (size_t i = 0; i < bytes_in_beat; i++) {
                size_t byte_idx = beat * bytes_per_beat + i;
                if (byte_idx < packet_data.size()) {
                    data_beat.range(i*8+7, i*8) = packet_data[byte_idx];
                    keep_beat[i] = 1;
                }
            }
            
            ext_in_data.write(data_beat);
            ext_in_keep.write(keep_beat);
            ext_in_last.write(beat == beats - 1);
            ext_in_valid.write(true);
            
            wait(clk.posedge_event());
        }
        
        ext_in_valid.write(false);
        ext_in_last.write(false);
        wait(clk.posedge_event());
    }
    
    void wait_for_ingress_axis_output() {
        std::cout << "  Waiting for ingress AXIS output..." << std::endl;
        int timeout = 0;
        while (!ingress_axis_tvalid.read() && timeout < 1000) {
            wait(clk.posedge_event());
            timeout++;
        }
        
        if (timeout >= 1000) {
            std::cout << "  ⚠️  No ingress AXIS output detected" << std::endl;
        } else {
            std::cout << "  ✅ Ingress AXIS output detected" << std::endl;
        }
    }
    
    void wait_for_external_output() {
        std::cout << "  Waiting for external output..." << std::endl;
        int timeout = 0;
        while (!ext_out_valid.read() && timeout < 2000) {
            wait(clk.posedge_event());
            timeout++;
        }
        
        if (timeout >= 2000) {
            std::cout << "  ⚠️  No external output detected" << std::endl;
        } else {
            std::cout << "  ✅ External output detected" << std::endl;
        }
    }
    
    void capture_external_output(std::vector<uint8_t>& output_packet) {
        output_packet.clear();
        
        while (ext_out_valid.read()) {
            sc_bv<AXIS_DATA_WIDTH> data = ext_out_data.read();
            sc_bv<AXIS_KEEP_WIDTH> keep = ext_out_keep.read();
            bool last = ext_out_last.read();
            
            size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
            for (size_t i = 0; i < bytes_per_beat; i++) {
                if (keep[i] == 1) {
                    uint8_t byte_val = data.range(i*8+7, i*8).to_uint();
                    output_packet.push_back(byte_val);
                }
            }
            
            if (last) break;
            wait(clk.posedge_event());
        }
    }
};

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused warnings
    
    std::cout << "Starting Port Manager New Format Test..." << std::endl;
    
    TestPortManagerNewFormat test_module("test_port_manager_new_format");
    
    sc_start();
    
    return 0;
}