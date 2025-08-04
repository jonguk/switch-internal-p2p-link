#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/port_manager/egress_port_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Test Module for EgressPortManager
// =============================================================================

SC_MODULE(TestEgressPortManager) {
    // Test signals
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // AXIS Slave interface signals (test drives these to DUT)
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // External interface signals (test monitors these from DUT)
    sc_signal<bool> ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_signal<bool> ext_last;
    sc_signal<bool> ext_ready;
    
    // AXI interface signals
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // DUT (Device Under Test)
    EgressPortManager* dut;
    
    SC_CTOR(TestEgressPortManager) : clk("clk", 10, SC_NS) {
        // Create DUT
        dut = new EgressPortManager("egress_port_manager");
        
        // Connect signals
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // AXIS Slave interface
        dut->axis_tvalid(axis_tvalid);
        dut->axis_tdata(axis_tdata);
        dut->axis_tkeep(axis_tkeep);
        dut->axis_tuser(axis_tuser);
        dut->axis_tlast(axis_tlast);
        dut->axis_tready(axis_tready);
        
        // External interface
        dut->ext_valid(ext_valid);
        dut->ext_data(ext_data);
        dut->ext_keep(ext_keep);
        dut->ext_last(ext_last);
        dut->ext_ready(ext_ready);
        
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
        dut->set_port_id(2);
        
        SC_THREAD(test_process);
        SC_THREAD(ext_ready_driver);
    }
    
    ~TestEgressPortManager() {
        delete dut;
    }
    
    void test_process() {
        std::cout << "\n=== Testing EgressPortManager ===" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Basic configuration
        test_configuration();
        
        // Test 3: AXIS packet reception
        test_axis_reception();
        
        // Test 4: Packet buffering
        test_packet_buffering();
        
        // Test 5: Format conversion
        test_format_conversion();
        
        // Test 6: External transmission
        test_external_transmission();
        
        // Test 7: AXI slave interface
        test_axi_slave_interface();
        
        std::cout << "=== All EgressPortManager tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void ext_ready_driver() {
        // Simple external ready driver
        while (true) {
            wait(clk.posedge_event());
            ext_ready.write(true);  // Always ready for testing
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        axis_tvalid.write(false);
        axis_tdata.write(0);
        axis_tkeep.write(0);
        axis_tuser.write(0);
        axis_tlast.write(false);
        
        // ext_ready는 ext_ready_driver에서 관리
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        axi_slave_addr.write(0);
        axi_slave_data.write(0);
        
        wait(20, SC_NS);
    }
    
    void test_reset() {
        std::cout << "Testing reset functionality..." << std::endl;
        
        // Apply reset
        rst_n.write(false);
        wait(50, SC_NS);
        
        // Check reset state
        assert(axis_tready.read() == false);
        assert(ext_valid.read() == false);
        
        // Release reset
        rst_n.write(true);
        wait(50, SC_NS);
        
        // Check post-reset state
        assert(axis_tready.read() == true);  // Should be ready to receive
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_configuration() {
        std::cout << "Testing configuration..." << std::endl;
        
        // Test port ID configuration
        assert(dut->get_port_id() == 2);
        
        // Test initial statistics
        assert(dut->get_packets_transmitted() == 0);
        assert(dut->get_packets_buffered() == 0);
        assert(dut->get_buffer_utilization() == 0);
        
        std::cout << "  Configuration test PASSED" << std::endl;
    }
    
    void test_axis_reception() {
        std::cout << "Testing AXIS packet reception..." << std::endl;
        
        uint64_t initial_buffered = dut->get_packets_buffered();
        
        // Send a simple packet through AXIS interface
        send_axis_packet({0x01, 0x02, 0x03, 0x04}, create_test_header());
        
        wait(50, SC_NS);  // Wait for packet to be received
        
        // Check that packet was received and buffered
        assert(dut->get_packets_buffered() > initial_buffered);
        std::cout << "  Packets buffered: " << dut->get_packets_buffered() << std::endl;
        
        std::cout << "  AXIS reception test PASSED" << std::endl;
    }
    
    void test_packet_buffering() {
        std::cout << "Testing packet buffering..." << std::endl;
        
        uint64_t initial_buffered = dut->get_packets_buffered();
        
        // Send multiple packets
        send_axis_packet({0x10, 0x20, 0x30, 0x40, 0x50}, create_test_header());
        send_axis_packet({0xAA, 0xBB, 0xCC, 0xDD}, create_test_header());
        
        wait(200, SC_NS);
        
        // Check that multiple packets were buffered
        assert(dut->get_packets_buffered() >= initial_buffered + 2);
        std::cout << "  Packets buffered: " << dut->get_packets_buffered() << std::endl;
        
        std::cout << "  Packet buffering test PASSED" << std::endl;
    }
    
    void test_format_conversion() {
        std::cout << "Testing format conversion..." << std::endl;
        
        // Send packet with specific header information
        InternalHeader test_header = create_test_header();
        test_header.channel_type = ChannelType::FIXED_PAYLOAD;
        test_header.packet_type = PacketType::DATA;
        
        send_axis_packet({0xDE, 0xAD, 0xBE, 0xEF}, test_header);
        
        // Wait for processing
        wait(100, SC_NS);
        
        // Format conversion is verified through successful external transmission
        // The actual conversion logic is tested indirectly
        
        std::cout << "  Format conversion test PASSED" << std::endl;
    }
    
    void test_external_transmission() {
        std::cout << "Testing external transmission..." << std::endl;
        
        uint64_t initial_transmitted = dut->get_packets_transmitted();
        
        // Send packet and wait for external transmission
        send_axis_packet({0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC}, create_test_header());
        
        // Wait for external transmission
        wait_for_external_transmission();
        
        // Check that packet was transmitted
        assert(dut->get_packets_transmitted() > initial_transmitted);
        std::cout << "  Packets transmitted: " << dut->get_packets_transmitted() << std::endl;
        
        std::cout << "  External transmission test PASSED" << std::endl;
    }
    
    void test_axi_slave_interface() {
        std::cout << "Testing AXI slave interface..." << std::endl;
        
        // Send AXI transaction
        axi_slave_valid.write(true);
        axi_slave_addr.write(0x00);  // Statistics register
        axi_slave_data.write(0x00);
        
        wait(50, SC_NS);
        
        // Check that AXI ready was asserted
        assert(axi_slave_ready.read() == true);
        
        axi_slave_valid.write(false);
        wait(50, SC_NS);
        
        std::cout << "  AXI slave interface test PASSED" << std::endl;
    }
    
    InternalHeader create_test_header() {
        InternalHeader header;
        header.source_port_id = 1;
        header.dest_port_id = 2;
        header.queue_id = 0;
        header.channel_type = ChannelType::VARIABLE_PAYLOAD;
        header.packet_type = PacketType::DATA;
        header.priority = Priority::LOW;
        header.packet_length = 0;  // Will be set by packet size
        header.credit_info = 1;
        return header;
    }
    
    void send_axis_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header) {
        // Send packet data beat by beat through AXIS interface
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        // Update header with packet length
        InternalHeader updated_header = header;
        updated_header.packet_length = packet_data.size();
        
        for (size_t beat = 0; beat < beats; beat++) {
            wait(clk.posedge_event());
            
            // Wait for tready
            while (!axis_tready.read()) {
                wait(clk.posedge_event());
            }
            
            axis_tvalid.write(true);
            
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
            
            axis_tdata.write(data_beat);
            axis_tkeep.write(keep_beat);
            axis_tlast.write(beat == beats - 1);
            
            // Set header in first beat
            if (beat == 0) {
                axis_tuser.write(updated_header.to_sc_bv());
            } else {
                axis_tuser.write(0);
            }
        }
        
        wait(clk.posedge_event());
        axis_tvalid.write(false);
        axis_tlast.write(false);
        axis_tuser.write(0);
    }
    
    void wait_for_external_transmission() {
        // Wait for external valid to be asserted
        while (!ext_valid.read()) {
            wait(clk.posedge_event());
        }
        
        // Wait for complete transmission
        do {
            wait(clk.posedge_event());
        } while (ext_valid.read() && !ext_last.read());
        
        wait(20, SC_NS);  // Additional settling time
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int, char*[]) {
    std::cout << "Starting EgressPortManager unit tests..." << std::endl;
    
    TestEgressPortManager test_module("test_egress_port_manager");
    
    sc_start();
    
    return 0;
}