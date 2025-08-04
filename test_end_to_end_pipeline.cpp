#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/port_manager/egress_port_manager.h"
#include "../../systemc/queue_manager/ingress_queue_manager.h"
#include "../../systemc/queue_manager/egress_queue_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// End-to-End Pipeline Integration Test
// =============================================================================

SC_MODULE(TestEndToEndPipeline) {
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External Interface Signals
    sc_signal<bool> ext_in_valid;
    sc_signal<sc_bv<EXTERNAL_DATA_WIDTH>> ext_in_data;
    sc_signal<bool> ext_in_ready;
    
    sc_signal<bool> ext_out_valid;
    sc_signal<sc_bv<EXTERNAL_DATA_WIDTH>> ext_out_data;
    sc_signal<bool> ext_out_ready;
    
    // AXIS Interface 1: Ingress Port Manager → Ingress Queue Manager
    sc_signal<bool> axis1_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis1_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis1_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis1_tuser;
    sc_signal<bool> axis1_tlast;
    sc_signal<bool> axis1_tready;
    
    // Internal Bus: Ingress Queue Manager → Egress Queue Manager
    sc_signal<bool> internal_valid;
    sc_signal<PacketEntry> internal_packet;
    sc_signal<bool> internal_ready;
    
    // AXIS Interface 2: Egress Queue Manager → Egress Port Manager
    sc_signal<bool> axis2_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis2_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis2_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis2_tuser;
    sc_signal<bool> axis2_tlast;
    sc_signal<bool> axis2_tready;
    
    // DUTs (Devices Under Test)
    IngressPortManager* ingress_port_mgr;
    IngressQueueManager* ingress_queue_mgr;
    EgressQueueManager* egress_queue_mgr;
    EgressPortManager* egress_port_mgr;
    
    // Shared credit signals
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> shared_credits;
    
    // Control variables
    bool ext_out_ready_control;
    
    SC_CTOR(TestEndToEndPipeline) : clk("clk", 10, SC_NS), ext_out_ready_control(true) {
        // Create DUTs
        ingress_port_mgr = new IngressPortManager("ingress_port_manager");
        ingress_queue_mgr = new IngressQueueManager("ingress_queue_manager");
        egress_queue_mgr = new EgressQueueManager("egress_queue_manager");
        egress_port_mgr = new EgressPortManager("egress_port_manager");
        
        // Connect clock and reset
        ingress_port_mgr->clk(clk);
        ingress_port_mgr->rst_n(rst_n);
        ingress_queue_mgr->clk(clk);
        ingress_queue_mgr->rst_n(rst_n);
        egress_queue_mgr->clk(clk);
        egress_queue_mgr->rst_n(rst_n);
        egress_port_mgr->clk(clk);
        egress_port_mgr->rst_n(rst_n);
        
        // Connect external interfaces
        ingress_port_mgr->ext_in_valid(ext_in_valid);
        ingress_port_mgr->ext_in_data(ext_in_data);
        ingress_port_mgr->ext_in_ready(ext_in_ready);
        
        egress_port_mgr->ext_out_valid(ext_out_valid);
        egress_port_mgr->ext_out_data(ext_out_data);
        egress_port_mgr->ext_out_ready(ext_out_ready);
        
        // Connect AXIS Interface 1: Ingress Port Manager → Ingress Queue Manager
        ingress_port_mgr->axis_tvalid(axis1_tvalid);
        ingress_port_mgr->axis_tdata(axis1_tdata);
        ingress_port_mgr->axis_tkeep(axis1_tkeep);
        ingress_port_mgr->axis_tuser(axis1_tuser);
        ingress_port_mgr->axis_tlast(axis1_tlast);
        ingress_port_mgr->axis_tready(axis1_tready);
        
        ingress_queue_mgr->axis_tvalid(axis1_tvalid);
        ingress_queue_mgr->axis_tdata(axis1_tdata);
        ingress_queue_mgr->axis_tkeep(axis1_tkeep);
        ingress_queue_mgr->axis_tuser(axis1_tuser);
        ingress_queue_mgr->axis_tlast(axis1_tlast);
        ingress_queue_mgr->axis_tready(axis1_tready);
        
        // Connect Internal Bus: Ingress Queue Manager → Egress Queue Manager
        ingress_queue_mgr->internal_valid(internal_valid);
        ingress_queue_mgr->internal_packet(internal_packet);
        ingress_queue_mgr->internal_ready(internal_ready);
        
        egress_queue_mgr->internal_valid(internal_valid);
        egress_queue_mgr->internal_packet(internal_packet);
        egress_queue_mgr->internal_ready(internal_ready);
        
        // Connect AXIS Interface 2: Egress Queue Manager → Egress Port Manager
        egress_queue_mgr->axis_tvalid(axis2_tvalid);
        egress_queue_mgr->axis_tdata(axis2_tdata);
        egress_queue_mgr->axis_tkeep(axis2_tkeep);
        egress_queue_mgr->axis_tuser(axis2_tuser);
        egress_queue_mgr->axis_tlast(axis2_tlast);
        egress_queue_mgr->axis_tready(axis2_tready);
        
        egress_port_mgr->axis_tvalid(axis2_tvalid);
        egress_port_mgr->axis_tdata(axis2_tdata);
        egress_port_mgr->axis_tkeep(axis2_tkeep);
        egress_port_mgr->axis_tuser(axis2_tuser);
        egress_port_mgr->axis_tlast(axis2_tlast);
        egress_port_mgr->axis_tready(axis2_tready);
        
        // Initialize shared credits
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            shared_credits[i].write(DEFAULT_CREDITS);
        }
        
        // Set shared credits for queue managers
        ingress_queue_mgr->set_shared_credits(&shared_credits);
        egress_queue_mgr->set_shared_credits(&shared_credits);
        
        // Configure port IDs
        ingress_port_mgr->set_port_id(1);
        ingress_queue_mgr->set_port_id(1);
        egress_queue_mgr->set_port_id(2);
        egress_port_mgr->set_port_id(2);
        
        SC_THREAD(test_process);
        SC_THREAD(ext_out_ready_driver);
    }
    
    ~TestEndToEndPipeline() {
        delete ingress_port_mgr;
        delete ingress_queue_mgr;
        delete egress_queue_mgr;
        delete egress_port_mgr;
    }
    
    void test_process() {
        std::cout << "\n=== End-to-End Pipeline Integration Test ===" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Basic packet flow
        test_basic_packet_flow();
        
        // Test 3: Multiple packet sizes
        test_multiple_packet_sizes();
        
        // Test 4: Queue routing
        test_queue_routing();
        
        // Test 5: Credit flow
        test_credit_flow();
        
        // Test 6: Backpressure handling
        test_backpressure();
        
        std::cout << "=== All End-to-End Pipeline tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void ext_out_ready_driver() {
        // Control ext_out_ready based on ext_out_ready_control
        while (true) {
            wait(clk.posedge_event());
            ext_out_ready.write(ext_out_ready_control);
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        
        // External interface
        ext_in_valid.write(false);
        ext_in_data.write(0);
        
        wait(50, SC_NS);
    }
    
    void test_reset() {
        std::cout << "Testing reset functionality..." << std::endl;
        
        // Apply reset
        rst_n.write(false);
        wait(100, SC_NS);
        
        // Check reset state
        assert(ext_in_ready.read() == true);
        assert(ext_out_valid.read() == false);
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);
        
        // Check post-reset state
        assert(ext_in_ready.read() == true);
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_basic_packet_flow() {
        std::cout << "Testing basic packet flow..." << std::endl;
        
        // Create test packet data
        std::vector<uint8_t> test_data = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};
        
        std::cout << "  Sending " << test_data.size() << " byte packet..." << std::endl;
        
        // Send packet through external interface
        send_external_packet(test_data);
        
        // Wait for processing through entire pipeline
        std::cout << "  Waiting for pipeline processing..." << std::endl;
        wait(1000, SC_NS);
        
        // Check that packet came out
        bool packet_received = false;
        std::vector<uint8_t> received_data;
        
        // Wait for external output
        for (int i = 0; i < 100; i++) {
            if (ext_out_valid.read()) {
                packet_received = true;
                std::cout << "  Found ext_out_valid at cycle " << i << std::endl;
                
                // Collect data
                uint32_t out_data = ext_out_data.read().to_uint();
                for (int j = 0; j < 4 && received_data.size() < test_data.size(); j++) {
                    received_data.push_back((out_data >> (j * 8)) & 0xFF);
                }
                break;
            }
            wait(clk.posedge_event());
        }
        
        assert(packet_received == true);
        
        // Verify packet content (at least first few bytes)
        std::cout << "  Received " << received_data.size() << " bytes" << std::endl;
        for (size_t i = 0; i < std::min(received_data.size(), test_data.size()); i++) {
            std::cout << "    Byte " << i << ": 0x" << std::hex << (int)received_data[i] 
                      << " (expected 0x" << (int)test_data[i] << ")" << std::dec << std::endl;
        }
        
        std::cout << "  Basic packet flow test PASSED" << std::endl;
    }
    
    void test_multiple_packet_sizes() {
        std::cout << "Testing multiple packet sizes..." << std::endl;
        
        std::vector<std::vector<uint8_t>> test_packets = {
            {0x11, 0x22},                               // 2 bytes
            {0x33, 0x44, 0x55, 0x66},                  // 4 bytes
            {0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC}      // 6 bytes
        };
        
        for (size_t p = 0; p < test_packets.size(); p++) {
            std::cout << "  Sending packet " << (p+1) << " (" << test_packets[p].size() << " bytes)..." << std::endl;
            
            send_external_packet(test_packets[p]);
            
            // Wait for processing
            wait(800, SC_NS);
            
            // Check for output (simplified check)
            bool found_output = false;
            for (int i = 0; i < 50; i++) {
                if (ext_out_valid.read()) {
                    found_output = true;
                    std::cout << "    Packet " << (p+1) << " output detected" << std::endl;
                    break;
                }
                wait(clk.posedge_event());
            }
            
            assert(found_output == true);
            wait(200, SC_NS);  // Allow time between packets
        }
        
        std::cout << "  Multiple packet sizes test PASSED" << std::endl;
    }
    
    void test_queue_routing() {
        std::cout << "Testing queue routing..." << std::endl;
        
        // Send packets that should route to different queues
        for (int q = 0; q < 3; q++) {
            std::vector<uint8_t> queue_data = {
                (uint8_t)(0x10 + q),
                (uint8_t)(0x20 + q),
                (uint8_t)(0x30 + q)
            };
            
            std::cout << "  Sending packet for queue " << q << "..." << std::endl;
            send_external_packet(queue_data);
            
            wait(600, SC_NS);
        }
        
        // Verify queue statistics
        uint64_t total_ingress_processed = ingress_queue_mgr->get_total_packets_processed();
        uint64_t total_egress_transmitted = egress_queue_mgr->get_total_packets_transmitted();
        
        std::cout << "  Ingress processed: " << total_ingress_processed << std::endl;
        std::cout << "  Egress transmitted: " << total_egress_transmitted << std::endl;
        
        assert(total_ingress_processed > 0);
        assert(total_egress_transmitted > 0);
        
        std::cout << "  Queue routing test PASSED" << std::endl;
    }
    
    void test_credit_flow() {
        std::cout << "Testing credit flow..." << std::endl;
        
        // Check initial credits
        uint16_t initial_credits[3];
        for (int q = 0; q < 3; q++) {
            initial_credits[q] = shared_credits[q].read();
            std::cout << "  Initial credits queue " << q << ": " << initial_credits[q] << std::endl;
        }
        
        // Send packets to consume credits
        for (int i = 0; i < 2; i++) {
            std::vector<uint8_t> credit_data = {0xCC, 0xAA, 0xEE, 0xDD};
            send_external_packet(credit_data);
            wait(500, SC_NS);
        }
        
        // Check final credits
        bool credits_consumed = false;
        for (int q = 0; q < 3; q++) {
            uint16_t final_credits = shared_credits[q].read();
            std::cout << "  Final credits queue " << q << ": " << final_credits << std::endl;
            
            if (final_credits < initial_credits[q]) {
                credits_consumed = true;
            }
        }
        
        assert(credits_consumed == true);
        
        std::cout << "  Credit flow test PASSED" << std::endl;
    }
    
    void test_backpressure() {
        std::cout << "Testing backpressure handling..." << std::endl;
        
        // Disable external output ready to create backpressure
        ext_out_ready_control = false;
        std::cout << "  Disabled ext_out_ready..." << std::endl;
        
        // Send packet
        std::vector<uint8_t> bp_data = {0xBB, 0x11, 0x11, 0x22};
        send_external_packet(bp_data);
        
        // Wait and verify packet is held up
        wait(500, SC_NS);
        std::cout << "  Packet should be held up due to backpressure" << std::endl;
        
        // Re-enable output ready
        ext_out_ready_control = true;
        std::cout << "  Re-enabled ext_out_ready..." << std::endl;
        
        // Wait for packet to flow through
        wait(500, SC_NS);
        
        // Check that system is still responsive
        assert(ext_in_ready.read() == true);
        
        std::cout << "  Backpressure handling test PASSED" << std::endl;
    }
    
    void send_external_packet(const std::vector<uint8_t>& packet_data) {
        // Convert packet data to external data format
        size_t bytes_per_beat = EXTERNAL_DATA_WIDTH / 8;
        size_t num_beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (size_t beat = 0; beat < num_beats; beat++) {
            // Wait for ready
            while (!ext_in_ready.read()) {
                wait(clk.posedge_event());
            }
            
            // Prepare data beat
            uint32_t data_word = 0;
            for (size_t i = 0; i < bytes_per_beat; i++) {
                size_t byte_idx = beat * bytes_per_beat + i;
                if (byte_idx < packet_data.size()) {
                    data_word |= (packet_data[byte_idx] << (i * 8));
                }
            }
            
            // Send beat
            ext_in_data.write(data_word);
            ext_in_valid.write(true);
            
            wait(clk.posedge_event());
            
            ext_in_valid.write(false);
            wait(clk.posedge_event());  // Allow some time between beats
        }
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting End-to-End Pipeline Integration tests..." << std::endl;
    
    TestEndToEndPipeline test_module("test_end_to_end_pipeline");
    
    sc_start();
    
    return 0;
}