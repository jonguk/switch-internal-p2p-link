#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/queue_manager/ingress_queue_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Integration Test Module for Ingress Pipeline
// =============================================================================

SC_MODULE(TestIngressPipeline) {
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External Interface Signals (to Ingress Port Manager)
    sc_signal<bool> ext_in_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_in_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_in_keep;
    sc_signal<bool> ext_in_last;
    sc_signal<bool> ext_in_ready;
    
    // AXIS Interface Signals (between Port Manager and Queue Manager)
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // Internal Bus Interface Signals (from Queue Manager)
    sc_signal<bool> internal_valid;
    sc_signal<PacketEntry> internal_packet;
    sc_signal<bool> internal_ready;
    
    // AXI Interface Signals for Port Manager (dummy for this test)
    sc_signal<bool> port_axi_master_valid;
    sc_signal<sc_bv<32>> port_axi_master_addr;
    sc_signal<sc_bv<32>> port_axi_master_data;
    sc_signal<bool> port_axi_master_ready;
    
    sc_signal<bool> port_axi_slave_valid;
    sc_signal<sc_bv<32>> port_axi_slave_addr;
    sc_signal<sc_bv<32>> port_axi_slave_data;
    sc_signal<bool> port_axi_slave_ready;
    
    // AXI Interface Signals for Queue Manager (dummy for this test)
    sc_signal<bool> queue_axi_master_valid;
    sc_signal<sc_bv<32>> queue_axi_master_addr;
    sc_signal<sc_bv<32>> queue_axi_master_data;
    sc_signal<bool> queue_axi_master_ready;
    
    sc_signal<bool> queue_axi_slave_valid;
    sc_signal<sc_bv<32>> queue_axi_slave_addr;
    sc_signal<sc_bv<32>> queue_axi_slave_data;
    sc_signal<bool> queue_axi_slave_ready;
    
    // Credit Return Interface Signals (for Port Manager)
    sc_signal<bool> credit_return_valid;
    sc_signal<bool> credit_return_ready;
    
    // DUTs (Devices Under Test)
    IngressPortManager* port_mgr;
    IngressQueueManager* queue_mgr;
    
    // Control variables
    bool internal_ready_control;
    
    SC_CTOR(TestIngressPipeline) : clk("clk", 10, SC_NS), internal_ready_control(false) {
        // Create DUTs
        port_mgr = new IngressPortManager("ingress_port_manager");
        queue_mgr = new IngressQueueManager("ingress_queue_manager");
        
        // Connect Ingress Port Manager
        port_mgr->clk(clk);
        port_mgr->rst_n(rst_n);
        
        // External interface
        port_mgr->ext_valid(ext_in_valid);
        port_mgr->ext_data(ext_in_data);
        port_mgr->ext_keep(ext_in_keep);
        port_mgr->ext_last(ext_in_last);
        port_mgr->ext_ready(ext_in_ready);
        
        // AXIS output (to Queue Manager)
        port_mgr->axis_tvalid(axis_tvalid);
        port_mgr->axis_tdata(axis_tdata);
        port_mgr->axis_tkeep(axis_tkeep);
        port_mgr->axis_tuser(axis_tuser);
        port_mgr->axis_tlast(axis_tlast);
        port_mgr->axis_tready(axis_tready);
        
        // AXI interfaces for Port Manager
        port_mgr->axi_master_valid(port_axi_master_valid);
        port_mgr->axi_master_addr(port_axi_master_addr);
        port_mgr->axi_master_data(port_axi_master_data);
        port_mgr->axi_master_ready(port_axi_master_ready);
        
        port_mgr->axi_slave_valid(port_axi_slave_valid);
        port_mgr->axi_slave_addr(port_axi_slave_addr);
        port_mgr->axi_slave_data(port_axi_slave_data);
        port_mgr->axi_slave_ready(port_axi_slave_ready);
        
        // Credit return interface
        port_mgr->credit_return_valid(credit_return_valid);
        port_mgr->credit_return_ready(credit_return_ready);
        
        // Connect Ingress Queue Manager
        queue_mgr->clk(clk);
        queue_mgr->rst_n(rst_n);
        
        // AXIS input (from Port Manager)
        queue_mgr->axis_tvalid(axis_tvalid);
        queue_mgr->axis_tdata(axis_tdata);
        queue_mgr->axis_tkeep(axis_tkeep);
        queue_mgr->axis_tuser(axis_tuser);
        queue_mgr->axis_tlast(axis_tlast);
        queue_mgr->axis_tready(axis_tready);
        
        // Internal Bus interface
        queue_mgr->internal_valid(internal_valid);
        queue_mgr->internal_packet(internal_packet);
        queue_mgr->internal_ready(internal_ready);
        
        // AXI interfaces for Queue Manager
        queue_mgr->axi_master_valid(queue_axi_master_valid);
        queue_mgr->axi_master_addr(queue_axi_master_addr);
        queue_mgr->axi_master_data(queue_axi_master_data);
        queue_mgr->axi_master_ready(queue_axi_master_ready);
        
        queue_mgr->axi_slave_valid(queue_axi_slave_valid);
        queue_mgr->axi_slave_addr(queue_axi_slave_addr);
        queue_mgr->axi_slave_data(queue_axi_slave_data);
        queue_mgr->axi_slave_ready(queue_axi_slave_ready);
        
        // Configure DUTs
        port_mgr->set_port_id(1);
        queue_mgr->set_port_id(1);
        
        SC_THREAD(test_process);
        SC_THREAD(internal_ready_driver);
    }
    
    ~TestIngressPipeline() {
        delete port_mgr;
        delete queue_mgr;
    }
    
    void test_process() {
        std::cout << "\n=== Testing Ingress Pipeline Integration ===" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Basic packet flow
        test_basic_packet_flow();
        
        // Test 3: Multiple packets with different sizes
        test_multiple_packets();
        
        // Test 4: Header preservation and processing
        test_header_processing();
        
        // Test 5: Credit processing
        test_credit_flow();
        
        std::cout << "=== All Ingress Pipeline Integration tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void internal_ready_driver() {
        // Control internal_ready based on internal_ready_control
        while (true) {
            wait(clk.posedge_event());
            internal_ready.write(internal_ready_control);
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        
        // External interface
        ext_in_valid.write(false);
        ext_in_data.write(0);
        ext_in_keep.write(0);
        ext_in_last.write(false);
        
        // AXI interfaces
        port_axi_master_ready.write(true);
        port_axi_slave_valid.write(false);
        port_axi_slave_addr.write(0);
        port_axi_slave_data.write(0);
        
        queue_axi_master_ready.write(true);
        queue_axi_slave_valid.write(false);
        queue_axi_slave_addr.write(0);
        queue_axi_slave_data.write(0);
        
        // Credit return interface
        credit_return_valid.write(false);
        
        wait(50, SC_NS);
    }
    
    void test_reset() {
        std::cout << "Testing reset functionality..." << std::endl;
        
        // Apply reset
        rst_n.write(false);
        wait(100, SC_NS);  // Increased reset time
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);  // Increased post-reset wait time
        
        // Check post-reset state
        bool ext_ready = ext_in_ready.read();
        bool axis_ready = axis_tready.read();
        bool internal_val = internal_valid.read();
        
        std::cout << "  ext_in_ready: " << ext_ready << std::endl;
        std::cout << "  axis_tready: " << axis_ready << std::endl;
        std::cout << "  internal_valid: " << internal_val << std::endl;
        
        assert(ext_ready == true);    // Port Manager should be ready
        assert(axis_ready == true);   // Queue Manager should be ready
        assert(internal_val == false);
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_basic_packet_flow() {
        std::cout << "Testing basic packet flow..." << std::endl;
        
        // Create test packet data
        std::vector<uint8_t> packet_data = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};
        
        // Create expected header for comparison (dest_port will be 0 as set by Port Manager)
        InternalHeader expected_header;
        expected_header.source_port = 1;    // Port Manager's port ID
        expected_header.dest_port = 0;      // Always 0 from Ingress Port Manager (routing decision later)
        expected_header.packet_type = PacketType::DATA;
        expected_header.channel_type = ChannelType::LOW_PRIORITY;
        expected_header.packet_length = packet_data.size();
        
        std::cout << "  Sending packet: " << packet_data.size() << " bytes" << std::endl;
        
        // Send packet through external interface
        send_external_packet(packet_data, expected_header);
        
        // Wait for processing through both modules (without internal ready)
        wait(200, SC_NS);
        
        // Enable internal ready to allow transmission
        internal_ready_control = true;
        std::cout << "  Enabling internal_ready..." << std::endl;
        
        // Wait for internal transmission to start
        bool found_transmission = false;
        for (int i = 0; i < 50; i++) {
            wait(clk.posedge_event());
            if (internal_valid.read()) {
                found_transmission = true;
                std::cout << "  Found internal_valid at cycle " << i << std::endl;
                break;
            }
        }
        
        if (!found_transmission) {
            std::cout << "  No internal_valid found in 50 cycles, checking current state:" << std::endl;
            std::cout << "    internal_valid: " << internal_valid.read() << std::endl;
            std::cout << "    internal_ready: " << internal_ready.read() << std::endl;
            assert(false);
        }
        
        // Check that packet came out on internal bus
        assert(internal_valid.read() == true);
        PacketEntry received_packet = internal_packet.read();
        
        // Debug: Print received packet information
        std::cout << "  Expected: src=" << (int)expected_header.source_port 
                  << ", dst=" << (int)expected_header.dest_port
                  << ", type=" << (int)expected_header.packet_type
                  << ", size=" << packet_data.size() << std::endl;
        std::cout << "  Received: src=" << (int)received_packet.header.source_port 
                  << ", dst=" << (int)received_packet.header.dest_port
                  << ", type=" << (int)received_packet.header.packet_type
                  << ", size=" << received_packet.payload.size() << std::endl;
        
        // Verify packet structure
        assert(received_packet.header.source_port == expected_header.source_port);
        assert(received_packet.header.dest_port == expected_header.dest_port);
        assert(received_packet.header.packet_type == expected_header.packet_type);
        assert(received_packet.payload.size() == packet_data.size());
        
        // Verify payload content
        for (size_t i = 0; i < packet_data.size(); i++) {
            assert(received_packet.payload[i] == packet_data[i]);
        }
        
        // Disable internal ready for next test
        internal_ready_control = false;
        wait(10, SC_NS);
        
        std::cout << "  Basic packet flow test PASSED" << std::endl;
    }
    
    void test_multiple_packets() {
        std::cout << "Testing multiple packets with different sizes..." << std::endl;
        
        struct TestPacket {
            std::vector<uint8_t> data;
        };
        
        std::vector<TestPacket> test_packets = {
            {{0x11, 0x22}},
            {{0x33, 0x44, 0x55, 0x66}},
            {{0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE}}
        };
        
        std::vector<PacketEntry> received_packets;
        
        // Enable internal ready for packet transmission
        internal_ready_control = true;
        
        // Send and receive packets one by one
        for (size_t i = 0; i < test_packets.size(); i++) {
            InternalHeader header;
            header.source_port = 1;
            header.dest_port = 0;  // Will be 0 from Port Manager
            header.packet_type = PacketType::DATA;
            header.channel_type = ChannelType::LOW_PRIORITY;
            header.packet_length = test_packets[i].data.size();
            
            std::cout << "  Sending packet " << (i+1) << ": " << test_packets[i].data.size() 
                      << " bytes" << std::endl;
            
            // Disable internal ready initially
            internal_ready_control = false;
            
            // Send packet
            send_external_packet(test_packets[i].data, header);
            wait(200, SC_NS);  // Wait for processing
            
            // Enable internal ready to allow transmission
            internal_ready_control = true;
            
            // Check for internal transmission
            bool found_transmission = false;
            for (int j = 0; j < 50; j++) {
                wait(clk.posedge_event());
                if (internal_valid.read()) {
                    found_transmission = true;
                    std::cout << "    Found internal_valid at timeout = " << j << std::endl;
                    break;
                }
            }
            
            if (found_transmission) {
                PacketEntry received = internal_packet.read();
                received_packets.push_back(received);
                
                std::cout << "  Received packet " << (i+1) << ": " 
                          << received.payload.size() << " bytes" << std::endl;
            } else {
                std::cout << "  No transmission found for packet " << (i+1) << std::endl;
            }
            
            // Wait for handshake completion
            wait(50, SC_NS);
        }
        
        // Verify all packets
        assert(received_packets.size() == test_packets.size());
        for (size_t i = 0; i < test_packets.size(); i++) {
            assert(received_packets[i].header.dest_port == 0);  // Always 0 from Port Manager
            assert(received_packets[i].payload.size() == test_packets[i].data.size());
            
            for (size_t j = 0; j < test_packets[i].data.size(); j++) {
                assert(received_packets[i].payload[j] == test_packets[i].data[j]);
            }
        }
        
        // Disable internal ready for next test
        internal_ready_control = false;
        wait(10, SC_NS);
        
        std::cout << "  Multiple packets test PASSED" << std::endl;
    }
    
    void test_header_processing() {
        std::cout << "Testing header preservation and processing..." << std::endl;
        
        // Enable internal ready for packet transmission
        internal_ready_control = true;
        
        // Test with high priority control packet
        std::vector<uint8_t> control_data = {0xC0, 0xDE};
        InternalHeader expected_header;
        expected_header.source_port = 1;
        expected_header.dest_port = 0;  // Will be 0 from Port Manager
        expected_header.packet_type = PacketType::DATA;  // Will be DATA from Port Manager
        expected_header.channel_type = ChannelType::LOW_PRIORITY;  // Will be LOW_PRIORITY from Port Manager
        expected_header.packet_length = control_data.size();
        
        std::cout << "  Sending control packet with detailed header..." << std::endl;
        
        // Disable internal ready initially
        internal_ready_control = false;
        
        send_external_packet(control_data, expected_header);
        wait(200, SC_NS);
        
        // Enable internal ready to allow transmission
        internal_ready_control = true;
        
        // Check for internal transmission
        bool found_transmission = false;
        for (int j = 0; j < 50; j++) {
            wait(clk.posedge_event());
            if (internal_valid.read()) {
                found_transmission = true;
                std::cout << "    Found internal_valid at timeout = " << j << std::endl;
                break;
            }
        }
        
        assert(found_transmission);
        PacketEntry received = internal_packet.read();
        
        // Debug: Print received header information
        std::cout << "  Expected: src=" << (int)expected_header.source_port 
                  << ", dst=" << (int)expected_header.dest_port
                  << ", type=" << (int)expected_header.packet_type
                  << ", channel=" << (int)expected_header.channel_type << std::endl;
        std::cout << "  Received: src=" << (int)received.header.source_port 
                  << ", dst=" << (int)received.header.dest_port
                  << ", type=" << (int)received.header.packet_type
                  << ", channel=" << (int)received.header.channel_type << std::endl;
        
        // Verify basic header fields (note: Port Manager sets its own values)
        assert(received.header.source_port == expected_header.source_port);
        assert(received.header.dest_port == expected_header.dest_port);  // Always 0 from Port Manager
        assert(received.header.packet_type == expected_header.packet_type);  // Always DATA from Port Manager
        assert(received.header.channel_type == expected_header.channel_type);  // Always LOW_PRIORITY from Port Manager
        assert(received.payload.size() == control_data.size());
        
        // Disable internal ready for next test
        internal_ready_control = false;
        wait(10, SC_NS);
        
        std::cout << "  Header processing test PASSED" << std::endl;
    }
    
    void test_credit_flow() {
        std::cout << "Testing credit processing through pipeline..." << std::endl;
        
        // Note: In current architecture, Ingress Port Manager always sets:
        // - dest_port = 0 (routing decision is made later)
        // - packet_type = DATA (all external packets are treated as data)
        // Therefore, credit processing happens at queue 0, not the original destination
        
        uint8_t actual_queue = 0;  // dest_port = 0 maps to queue 0
        uint16_t initial_credits = queue_mgr->get_available_credits(actual_queue);
        uint64_t initial_total_processed = queue_mgr->get_total_packets_processed();
        
        std::cout << "  Initial credits for queue " << (int)actual_queue 
                  << ": " << initial_credits << std::endl;
        std::cout << "  Initial total packets processed: " << initial_total_processed << std::endl;
        
        // Enable internal ready for packet transmission
        internal_ready_control = true;
        
        // Send a regular data packet (will be processed as DATA, not CREDIT)
        std::vector<uint8_t> data_packet = {0xCC, 0xED, 0x15};
        InternalHeader header;
        header.source_port = 1;
        header.dest_port = 0;  // Will be 0 from Port Manager
        header.packet_type = PacketType::DATA;  // Will be DATA from Port Manager
        header.channel_type = ChannelType::LOW_PRIORITY;
        header.packet_length = data_packet.size();
        
        std::cout << "  Sending data packet..." << std::endl;
        
        // Disable internal ready initially
        internal_ready_control = false;
        
        send_external_packet(data_packet, header);
        wait(200, SC_NS);  // Allow time for processing
        
        // Enable internal ready to allow transmission
        internal_ready_control = true;
        
        // Check for internal transmission
        bool found_transmission = false;
        for (int j = 0; j < 50; j++) {
            wait(clk.posedge_event());
            if (internal_valid.read()) {
                found_transmission = true;
                std::cout << "    Found internal_valid at timeout = " << j << std::endl;
                break;
            }
        }
        
        assert(found_transmission);
        PacketEntry received = internal_packet.read();
        
        // Check that packet was processed through the pipeline
        uint64_t final_total_processed = queue_mgr->get_total_packets_processed();
        std::cout << "  Final total packets processed: " << final_total_processed << std::endl;
        
        assert(final_total_processed > initial_total_processed);
        assert(received.header.source_port == 1);
        assert(received.header.dest_port == 0);
        assert(received.payload.size() == data_packet.size());
        
        // Disable internal ready for cleanup
        internal_ready_control = false;
        wait(10, SC_NS);
        
        std::cout << "  Credit flow test PASSED (data packet processing verified)" << std::endl;
    }
    
    void send_external_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header) {
        // Convert header to be embedded in the packet
        sc_bv<AXIS_USER_WIDTH> header_bits = header.to_sc_bv();
        
        // Calculate number of beats needed
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;  // 64 bytes per beat for 512-bit width
        size_t beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        std::cout << "    Sending " << packet_data.size() << " bytes in " << beats << " beats" << std::endl;
        
        for (size_t beat = 0; beat < beats; beat++) {
            // Set up data for this beat
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
            
            // Send beat
            ext_in_valid.write(true);
            ext_in_data.write(data_beat);
            ext_in_keep.write(keep_beat);
            ext_in_last.write(beat == beats - 1);
            
            wait(clk.posedge_event());
            assert(ext_in_ready.read() == true);
        }
        
        // Clear signals
        ext_in_valid.write(false);
        ext_in_last.write(false);
        wait(clk.posedge_event());
    }
    
    void wait_for_internal_transmission() {
        // Wait for internal valid to be asserted
        int timeout = 0;
        bool found = false;
        
        while (timeout < 2000) {  // Increased timeout
            wait(clk.posedge_event());
            if (internal_valid.read()) {
                found = true;
                std::cout << "    Found internal_valid at timeout = " << timeout << std::endl;
                break;
            }
            timeout++;
        }
        
        if (!found) {
            std::cout << "ERROR: Timeout waiting for internal transmission! (timeout=" << timeout << ")" << std::endl;
            std::cout << "  Current internal_valid: " << internal_valid.read() << std::endl;
            std::cout << "  Current internal_ready: " << internal_ready.read() << std::endl;
            assert(false);
        }
        
        // Wait a bit more for signal to settle
        wait(2, SC_NS);
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting Ingress Pipeline Integration tests..." << std::endl;
    
    TestIngressPipeline test_module("test_ingress_pipeline");
    
    sc_start();
    
    return 0;
}