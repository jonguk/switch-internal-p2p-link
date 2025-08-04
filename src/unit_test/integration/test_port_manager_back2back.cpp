#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/port_manager/egress_port_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Back-to-Back Test Module for Port Managers
// =============================================================================

SC_MODULE(TestPortManagerBack2Back) {
    // Test clocks and reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External input interface (to Ingress Port Manager)
    sc_signal<bool> ext_in_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_in_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_in_keep;
    sc_signal<bool> ext_in_last;
    sc_signal<bool> ext_in_ready;
    
    // External output interface (from Egress Port Manager)
    sc_signal<bool> ext_out_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_out_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_out_keep;
    sc_signal<bool> ext_out_last;
    sc_signal<bool> ext_out_ready;
    
    // Internal AXIS interface (Ingress → Egress)
    sc_signal<bool> internal_axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> internal_axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> internal_axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> internal_axis_tuser;
    sc_signal<bool> internal_axis_tlast;
    sc_signal<bool> internal_axis_tready;
    
    // AXI interfaces (simplified for testing)
    sc_signal<bool> ingress_axi_master_valid, egress_axi_master_valid;
    sc_signal<sc_bv<32>> ingress_axi_master_addr, egress_axi_master_addr;
    sc_signal<sc_bv<32>> ingress_axi_master_data, egress_axi_master_data;
    sc_signal<bool> axi_master_ready;
    
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> ingress_axi_slave_ready, egress_axi_slave_ready;
    
    // Credit return interface (simplified for testing)
    sc_signal<bool> credit_return_valid;
    sc_signal<bool> credit_return_ready;
    
    // Device Under Test
    IngressPortManager* ingress_port;
    EgressPortManager* egress_port;
    
    SC_CTOR(TestPortManagerBack2Back) : clk("clk", 10, SC_NS) {
        // Create port managers
        ingress_port = new IngressPortManager("ingress_port");
        egress_port = new EgressPortManager("egress_port");
        
        // Connect Ingress Port Manager
        ingress_port->clk(clk);
        ingress_port->rst_n(rst_n);
        // External interface
        ingress_port->ext_valid(ext_in_valid);
        ingress_port->ext_data(ext_in_data);
        ingress_port->ext_keep(ext_in_keep);
        ingress_port->ext_last(ext_in_last);
        ingress_port->ext_ready(ext_in_ready);
        // AXIS Master interface (to internal)
        ingress_port->axis_tvalid(internal_axis_tvalid);
        ingress_port->axis_tdata(internal_axis_tdata);
        ingress_port->axis_tkeep(internal_axis_tkeep);
        ingress_port->axis_tuser(internal_axis_tuser);
        ingress_port->axis_tlast(internal_axis_tlast);
        ingress_port->axis_tready(internal_axis_tready);
        // AXI interfaces
        ingress_port->axi_master_valid(ingress_axi_master_valid);
        ingress_port->axi_master_addr(ingress_axi_master_addr);
        ingress_port->axi_master_data(ingress_axi_master_data);
        ingress_port->axi_master_ready(axi_master_ready);
        ingress_port->axi_slave_valid(axi_slave_valid);
        ingress_port->axi_slave_addr(axi_slave_addr);
        ingress_port->axi_slave_data(axi_slave_data);
        ingress_port->axi_slave_ready(ingress_axi_slave_ready);
        // Credit return
        ingress_port->credit_return_valid(credit_return_valid);
        ingress_port->credit_return_ready(credit_return_ready);
        
        // Connect Egress Port Manager
        egress_port->clk(clk);
        egress_port->rst_n(rst_n);
        // AXIS Slave interface (from internal)
        egress_port->axis_tvalid(internal_axis_tvalid);
        egress_port->axis_tdata(internal_axis_tdata);
        egress_port->axis_tkeep(internal_axis_tkeep);
        egress_port->axis_tuser(internal_axis_tuser);
        egress_port->axis_tlast(internal_axis_tlast);
        egress_port->axis_tready(internal_axis_tready);
        // External interface
        egress_port->ext_valid(ext_out_valid);
        egress_port->ext_data(ext_out_data);
        egress_port->ext_keep(ext_out_keep);
        egress_port->ext_last(ext_out_last);
        egress_port->ext_ready(ext_out_ready);
        // AXI interfaces
        egress_port->axi_master_valid(egress_axi_master_valid);
        egress_port->axi_master_addr(egress_axi_master_addr);
        egress_port->axi_master_data(egress_axi_master_data);
        egress_port->axi_master_ready(axi_master_ready);
        egress_port->axi_slave_valid(axi_slave_valid);
        egress_port->axi_slave_addr(axi_slave_addr);
        egress_port->axi_slave_data(axi_slave_data);
        egress_port->axi_slave_ready(egress_axi_slave_ready);
        
        // Configure port managers
        ingress_port->set_port_id(1);
        egress_port->set_port_id(2);
        
        SC_THREAD(test_process);
        SC_THREAD(ext_out_ready_driver);
    }
    
    ~TestPortManagerBack2Back() {
        delete ingress_port;
        delete egress_port;
    }
    
    void test_process() {
        std::cout << "\n=== Testing Port Manager Back-to-Back Integration ===" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Basic packet flow
        test_basic_packet_flow();
        
        // Test 3: Multiple packet flow
        test_multiple_packet_flow();
        
        // Test 4: Header preservation
        test_header_preservation();
        
        // Test 5: Performance analysis
        test_performance_analysis();
        
        std::cout << "=== All Back-to-Back Integration tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void ext_out_ready_driver() {
        // External output ready driver
        while (true) {
            wait(clk.posedge_event());
            ext_out_ready.write(true);  // Always ready for testing
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        
        // External input interface
        ext_in_valid.write(false);
        ext_in_data.write(0);
        ext_in_keep.write(0);
        ext_in_last.write(false);
        
        // AXI interfaces
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        axi_slave_addr.write(0);
        axi_slave_data.write(0);
        
        // Credit return
        credit_return_valid.write(false);
        
        wait(20, SC_NS);
    }
    
    void test_reset() {
        std::cout << "Testing reset functionality..." << std::endl;
        
        // Apply reset
        rst_n.write(false);
        wait(50, SC_NS);
        
        // Check reset state
        assert(ext_in_ready.read() == false);  // Ingress not ready
        assert(ext_out_valid.read() == false); // Egress not transmitting
        
        // Release reset
        rst_n.write(true);
        wait(50, SC_NS);
        
        // Check post-reset state
        assert(ext_in_ready.read() == true);   // Ingress ready to receive
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_basic_packet_flow() {
        std::cout << "Testing basic packet flow..." << std::endl;
        
        // Record initial statistics
        uint64_t initial_ingress_received = ingress_port->get_packets_received();
        uint64_t initial_ingress_forwarded = ingress_port->get_packets_forwarded();
        uint64_t initial_egress_buffered = egress_port->get_packets_buffered();
        uint64_t initial_egress_transmitted = egress_port->get_packets_transmitted();
        
        std::cout << "  Initial stats - Ingress RX: " << initial_ingress_received 
                  << ", TX: " << initial_ingress_forwarded
                  << ", Egress Buffered: " << initial_egress_buffered
                  << ", TX: " << initial_egress_transmitted << std::endl;
        
        // Send test packet
        std::vector<uint8_t> test_packet = {0xDE, 0xAD, 0xBE, 0xEF, 0xCA, 0xFE};
        send_external_packet(test_packet);
        
        // Wait for complete processing
        wait(200, SC_NS);
        
        // Verify packet went through the entire pipeline
        assert(ingress_port->get_packets_received() > initial_ingress_received);
        assert(ingress_port->get_packets_forwarded() > initial_ingress_forwarded);
        assert(egress_port->get_packets_buffered() > initial_egress_buffered);
        assert(egress_port->get_packets_transmitted() > initial_egress_transmitted);
        
        std::cout << "  Final stats - Ingress RX: " << ingress_port->get_packets_received()
                  << ", TX: " << ingress_port->get_packets_forwarded()
                  << ", Egress Buffered: " << egress_port->get_packets_buffered()
                  << ", TX: " << egress_port->get_packets_transmitted() << std::endl;
        
        std::cout << "  Basic packet flow test PASSED" << std::endl;
    }
    
    void test_multiple_packet_flow() {
        std::cout << "Testing multiple packet flow..." << std::endl;
        
        uint64_t initial_ingress_received = ingress_port->get_packets_received();
        uint64_t initial_egress_transmitted = egress_port->get_packets_transmitted();
        
        // Send multiple packets of different sizes
        std::vector<std::vector<uint8_t>> test_packets = {
            {0x01, 0x02, 0x03, 0x04},                                    // 4 bytes
            {0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70, 0x80},          // 8 bytes
            {0xAA, 0xBB},                                                // 2 bytes
            {0xFF, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88, 0x77, 0x66} // 10 bytes
        };
        
        for (const auto& packet : test_packets) {
            send_external_packet(packet);
            wait(50, SC_NS);  // Small delay between packets
        }
        
        // Wait for all packets to be processed
        wait(400, SC_NS);
        
        // Verify all packets were processed
        uint64_t packets_processed = ingress_port->get_packets_received() - initial_ingress_received;
        uint64_t packets_transmitted = egress_port->get_packets_transmitted() - initial_egress_transmitted;
        
        std::cout << "  Packets processed: " << packets_processed 
                  << ", Packets transmitted: " << packets_transmitted << std::endl;
        
        assert(packets_processed >= test_packets.size());
        assert(packets_transmitted >= test_packets.size());
        
        std::cout << "  Multiple packet flow test PASSED" << std::endl;
    }
    
    void test_header_preservation() {
        std::cout << "Testing header preservation..." << std::endl;
        
        // This test verifies that internal headers are properly generated by ingress
        // and consumed by egress port managers
        
        // Send a packet and monitor internal AXIS interface
        std::vector<uint8_t> test_packet = {0x12, 0x34, 0x56, 0x78};
        send_external_packet(test_packet);
        
        // Monitor internal AXIS tuser field
        sc_bv<AXIS_USER_WIDTH> captured_header = 0;
        bool header_captured = false;
        
        // Wait for internal AXIS transaction
        for (int i = 0; i < 100 && !header_captured; i++) {
            wait(clk.posedge_event());
            if (internal_axis_tvalid.read() && internal_axis_tready.read()) {
                captured_header = internal_axis_tuser.read();
                if (captured_header != 0) {
                    header_captured = true;
                    std::cout << "  Captured internal header: 0x" 
                              << std::hex << captured_header.to_uint64() << std::dec << std::endl;
                }
            }
        }
        
        assert(header_captured);
        assert(captured_header != 0);
        
        // Decode header to verify content
        InternalHeader decoded_header = InternalHeader::from_sc_bv(captured_header);
        
        std::cout << "  Header details - Source: " << (int)decoded_header.source_port
                  << ", Dest: " << (int)decoded_header.dest_port
                  << ", Length: " << decoded_header.packet_length
                  << ", Type: " << (int)decoded_header.packet_type << std::endl;
        
        assert(decoded_header.source_port == 1);  // Ingress port ID
        assert(decoded_header.packet_length == test_packet.size());
        
        std::cout << "  Header preservation test PASSED" << std::endl;
    }
    
    void test_performance_analysis() {
        std::cout << "Testing performance analysis..." << std::endl;
        
        // Measure processing latency
        sc_time start_time = sc_time_stamp();
        
        // Send a packet and measure time to external output
        std::vector<uint8_t> test_packet = {0x55, 0xAA, 0x55, 0xAA};
        send_external_packet(test_packet);
        
        // Wait for external output
        while (!ext_out_valid.read()) {
            wait(clk.posedge_event());
        }
        
        sc_time processing_time = sc_time_stamp() - start_time;
        
        std::cout << "  Processing latency: " << processing_time << std::endl;
        
        // Verify reasonable processing time (should be within a few clock cycles)
        assert(processing_time < sc_time(500, SC_NS));
        
        // Check buffer utilizations
        std::cout << "  Ingress buffer utilization: " << ingress_port->get_buffer_utilization() << std::endl;
        std::cout << "  Egress buffer utilization: " << egress_port->get_buffer_utilization() << std::endl;
        
        std::cout << "  Performance analysis test PASSED" << std::endl;
    }
    
    void send_external_packet(const std::vector<uint8_t>& packet_data) {
        // Send packet data beat by beat through external interface
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        std::cout << "  Sending packet of " << packet_data.size() 
                  << " bytes in " << beats << " beats" << std::endl;
        
        for (size_t beat = 0; beat < beats; beat++) {
            // Wait for ready
            while (!ext_in_ready.read()) {
                wait(clk.posedge_event());
            }
            
            wait(clk.posedge_event());
            
            ext_in_valid.write(true);
            
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
        }
        
        wait(clk.posedge_event());
        ext_in_valid.write(false);
        ext_in_last.write(false);
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int, char*[]) {
    std::cout << "Starting Port Manager Back-to-Back Integration tests..." << std::endl;
    
    TestPortManagerBack2Back test_module("test_port_manager_back2back");
    
    sc_start();
    
    return 0;
}