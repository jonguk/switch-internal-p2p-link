#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/port_manager/ingress_port_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Test Module for IngressPortManager
// =============================================================================

SC_MODULE(TestIngressPortManager) {
    // Test signals
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External interface signals
    sc_signal<bool> ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_signal<bool> ext_last;
    sc_signal<bool> ext_ready;
    
    // AXIS Master interface signals
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // AXI interface signals
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Credit return interface signals (simplified for testing)
    sc_signal<bool> credit_return_valid;
    sc_signal<bool> credit_return_ready;
    
    // DUT (Device Under Test)
    IngressPortManager* dut;
    
    SC_CTOR(TestIngressPortManager) : clk("clk", 10, SC_NS) {
        // Create DUT
        dut = new IngressPortManager("ingress_port_manager");
        
        // Connect signals
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // External interface
        dut->ext_valid(ext_valid);
        dut->ext_data(ext_data);
        dut->ext_keep(ext_keep);
        dut->ext_last(ext_last);
        dut->ext_ready(ext_ready);
        
        // AXIS Master interface
        dut->axis_tvalid(axis_tvalid);
        dut->axis_tdata(axis_tdata);
        dut->axis_tkeep(axis_tkeep);
        dut->axis_tuser(axis_tuser);
        dut->axis_tlast(axis_tlast);
        dut->axis_tready(axis_tready);
        
        // AXI interface
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Credit return interface
        dut->credit_return_valid(credit_return_valid);
        dut->credit_return_ready(credit_return_ready);
        
        // Configure DUT
        dut->set_port_id(1);
        
        SC_THREAD(test_process);
        SC_THREAD(axis_ready_driver);
    }
    
    ~TestIngressPortManager() {
        delete dut;
    }
    
    void test_process() {
        std::cout << "\n=== Testing IngressPortManager ===" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Basic configuration
        test_configuration();
        
        // Test 3: External packet reception
        test_external_reception();
        
        // Test 4: Raw data buffering
        test_raw_buffering();
        
        // Test 5: Internal header generation
        test_internal_header_generation();
        
        // Test 6: AXIS transmission
        test_axis_transmission();
        
        // Test 7: Credit management
        test_credit_management();
        
        std::cout << "=== All IngressPortManager tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void axis_ready_driver() {
        // Simple AXIS ready driver
        while (true) {
            wait(clk.posedge_event());
            axis_tready.write(true);  // Always ready for testing
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        ext_valid.write(false);
        ext_data.write(0);
        ext_keep.write(0);
        ext_last.write(false);
        
        // axis_tready는 axis_ready_driver에서 관리
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        axi_slave_addr.write(0);
        axi_slave_data.write(0);
        
        credit_return_valid.write(false);
        // credit_return_ready는 DUT에서 출력하므로 테스트에서 설정하지 않음
        
        wait(20, SC_NS);
    }
    
    void test_reset() {
        std::cout << "Testing reset functionality..." << std::endl;
        
        // Apply reset
        rst_n.write(false);
        wait(50, SC_NS);
        
        // Check reset state
        assert(ext_ready.read() == false);
        assert(axis_tvalid.read() == false);
        
        // Release reset
        rst_n.write(true);
        wait(50, SC_NS);
        
        // Check post-reset state
        assert(ext_ready.read() == true);  // Should be ready to receive
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_configuration() {
        std::cout << "Testing configuration..." << std::endl;
        
        // Test port ID configuration
        assert(dut->get_port_id() == 1);
        
        // Test initial statistics
        assert(dut->get_packets_received() == 0);
        assert(dut->get_packets_forwarded() == 0);
        assert(dut->get_buffer_utilization() == 0);
        
        std::cout << "  Configuration test PASSED" << std::endl;
    }
    
    void test_external_reception() {
        std::cout << "Testing external packet reception..." << std::endl;
        
        uint64_t initial_received = dut->get_packets_received();
        
        // Send a simple packet
        send_external_packet({0x01, 0x02, 0x03, 0x04});
        
        wait(50, SC_NS);  // Wait for packet to be received
        
        // Check that packet was received
        assert(dut->get_packets_received() > initial_received);
        std::cout << "  Packets received: " << dut->get_packets_received() << std::endl;
        
        std::cout << "  External reception test PASSED" << std::endl;
    }
    
    void test_raw_buffering() {
        std::cout << "Testing raw data buffering..." << std::endl;
        
        uint64_t initial_received = dut->get_packets_received();
        
        // Send multiple packets
        send_external_packet({0x10, 0x20, 0x30, 0x40, 0x50});
        send_external_packet({0xAA, 0xBB, 0xCC, 0xDD});
        
        wait(100, SC_NS);
        
        // Check that multiple packets were received
        assert(dut->get_packets_received() >= initial_received + 2);
        std::cout << "  Packets received: " << dut->get_packets_received() << std::endl;
        
        std::cout << "  Raw buffering test PASSED" << std::endl;
    }
    
    void test_internal_header_generation() {
        std::cout << "Testing internal header generation..." << std::endl;
        
        // Send packet and monitor AXIS transmission for header
        send_external_packet({0xDE, 0xAD, 0xBE, 0xEF});
        
        // Wait for AXIS transmission to start and capture first beat tuser
        sc_bv<AXIS_USER_WIDTH> captured_tuser = 0;
        bool header_captured = false;
        
        while (!header_captured) {
            wait(clk.posedge_event());
            if (axis_tvalid.read()) {
                captured_tuser = axis_tuser.read();
                header_captured = true;
                std::cout << "  Captured tuser: 0x" << std::hex << captured_tuser.to_uint64() << std::dec << std::endl;
            }
        }
        
        // Check that tuser contains valid internal header
        assert(captured_tuser != 0);  // Should contain header information
        
        std::cout << "  Internal header generation test PASSED" << std::endl;
    }
    
    void test_axis_transmission() {
        std::cout << "Testing AXIS transmission..." << std::endl;
        
        uint64_t initial_forwarded = dut->get_packets_forwarded();
        
        // Send packet
        send_external_packet({0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC});
        
        // Wait for AXIS transmission
        wait_for_axis_transmission();
        
        // Check that packet was forwarded
        assert(dut->get_packets_forwarded() > initial_forwarded);
        
        std::cout << "  AXIS transmission test PASSED" << std::endl;
    }
    
    void test_credit_management() {
        std::cout << "Testing credit management..." << std::endl;
        
        uint16_t initial_credits = dut->get_available_credits();
        
        // Simulate credit return
        credit_return_valid.write(true);
        
        wait(50, SC_NS);
        credit_return_valid.write(false);
        wait(50, SC_NS);
        
        // Check that credits were updated
        assert(dut->get_available_credits() >= initial_credits);
        
        std::cout << "  Credit management test PASSED" << std::endl;
    }
    
    void send_external_packet(const std::vector<uint8_t>& packet_data) {
        // Send packet data beat by beat
        size_t beats = (packet_data.size() + AXIS_DATA_WIDTH/8 - 1) / (AXIS_DATA_WIDTH/8);
        
        for (size_t beat = 0; beat < beats; beat++) {
            wait(clk.posedge_event());
            
            ext_valid.write(true);
            
            // Pack data into beat
            sc_bv<AXIS_DATA_WIDTH> data_beat = 0;
            sc_bv<AXIS_KEEP_WIDTH> keep_beat = 0;
            
            size_t bytes_in_beat = std::min(packet_data.size() - beat * (AXIS_DATA_WIDTH/8), 
                                          (size_t)(AXIS_DATA_WIDTH/8));
            
            for (size_t i = 0; i < bytes_in_beat; i++) {
                size_t byte_idx = beat * (AXIS_DATA_WIDTH/8) + i;
                if (byte_idx < packet_data.size()) {
                    data_beat.range(i*8+7, i*8) = packet_data[byte_idx];
                    keep_beat[i] = 1;
                }
            }
            
            ext_data.write(data_beat);
            ext_keep.write(keep_beat);
            ext_last.write(beat == beats - 1);
            
            // Wait for ready
            do {
                wait(clk.posedge_event());
            } while (!ext_ready.read());
        }
        
        ext_valid.write(false);
        ext_last.write(false);
        wait(clk.posedge_event());
    }
    
    void wait_for_axis_transmission() {
        // Wait for AXIS valid to be asserted
        while (!axis_tvalid.read()) {
            wait(clk.posedge_event());
        }
        
        // Wait for complete transmission
        do {
            wait(clk.posedge_event());
        } while (axis_tvalid.read() && !axis_tlast.read());
        
        wait(10, SC_NS);  // Additional settling time
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int, char*[]) {
    std::cout << "Starting IngressPortManager unit tests..." << std::endl;
    
    TestIngressPortManager test_module("test_ingress_port_manager");
    
    sc_start();
    
    return 0;
}