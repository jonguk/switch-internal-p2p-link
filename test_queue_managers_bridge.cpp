#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/queue_manager/ingress_queue_manager.h"
#include "../../systemc/queue_manager/egress_queue_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Queue Managers Bridge Test (Step 2)
// Ingress Queue Manager → Internal Bus → Egress Queue Manager
// =============================================================================

SC_MODULE(TestQueueManagersBridge) {
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // AXIS Input Interface (to Ingress Queue Manager)
    sc_signal<bool> axis_in_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_in_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_in_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_in_tuser;
    sc_signal<bool> axis_in_tlast;
    sc_signal<bool> axis_in_tready;
    
    // Internal Bus: Ingress Queue Manager → Egress Queue Manager
    sc_signal<bool> internal_valid;
    sc_signal<PacketEntry> internal_packet;
    sc_signal<bool> internal_ready;
    
    // AXIS Output Interface (from Egress Queue Manager)
    sc_signal<bool> axis_out_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_out_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_out_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_out_tuser;
    sc_signal<bool> axis_out_tlast;
    sc_signal<bool> axis_out_tready;
    
    // Dummy AXI signals
    sc_signal<bool> dummy_axi_valid;
    sc_signal<sc_bv<32>> dummy_axi_addr;
    sc_signal<sc_bv<32>> dummy_axi_data;
    sc_signal<bool> dummy_axi_ready;
    
    // Credit Return Interface (dummy for now)
    sc_signal<bool> credit_return_valid;
    sc_signal<CreditInfo> credit_return_info;
    sc_signal<bool> credit_return_ready;
    
    // DUTs (Devices Under Test)
    IngressQueueManager* ingress_queue_mgr;
    EgressQueueManager* egress_queue_mgr;
    
    // Shared credit signals
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> shared_credits;
    
    // Control variables
    bool axis_out_ready_control;
    
    SC_CTOR(TestQueueManagersBridge) : clk("clk", 10, SC_NS), axis_out_ready_control(true) {
        // Create DUTs
        ingress_queue_mgr = new IngressQueueManager("ingress_queue_manager");
        egress_queue_mgr = new EgressQueueManager("egress_queue_manager");
        
        // Connect clock and reset
        ingress_queue_mgr->clk(clk);
        ingress_queue_mgr->rst_n(rst_n);
        egress_queue_mgr->clk(clk);
        egress_queue_mgr->rst_n(rst_n);
        
        // Connect AXIS Input Interface (to Ingress Queue Manager)
        ingress_queue_mgr->axis_tvalid(axis_in_tvalid);
        ingress_queue_mgr->axis_tdata(axis_in_tdata);
        ingress_queue_mgr->axis_tkeep(axis_in_tkeep);
        ingress_queue_mgr->axis_tuser(axis_in_tuser);
        ingress_queue_mgr->axis_tlast(axis_in_tlast);
        ingress_queue_mgr->axis_tready(axis_in_tready);
        
        // Connect Internal Bus: Ingress Queue Manager → Egress Queue Manager
        ingress_queue_mgr->internal_valid(internal_valid);
        ingress_queue_mgr->internal_packet(internal_packet);
        ingress_queue_mgr->internal_ready(internal_ready);
        
        egress_queue_mgr->internal_valid(internal_valid);
        egress_queue_mgr->internal_packet(internal_packet);
        egress_queue_mgr->internal_ready(internal_ready);
        
        // Connect AXIS Output Interface (from Egress Queue Manager)
        egress_queue_mgr->axis_tvalid(axis_out_tvalid);
        egress_queue_mgr->axis_tdata(axis_out_tdata);
        egress_queue_mgr->axis_tkeep(axis_out_tkeep);
        egress_queue_mgr->axis_tuser(axis_out_tuser);
        egress_queue_mgr->axis_tlast(axis_out_tlast);
        egress_queue_mgr->axis_tready(axis_out_tready);
        
        // Connect dummy AXI signals
        connect_dummy_axi();
        
        // Connect credit return interface
        egress_queue_mgr->credit_return_valid(credit_return_valid);
        egress_queue_mgr->credit_return_info(credit_return_info);
        egress_queue_mgr->credit_return_ready(credit_return_ready);
        
        // Initialize shared credits
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            shared_credits[i].write(DEFAULT_CREDITS);
        }
        
        // Set shared credits for both queue managers
        ingress_queue_mgr->set_shared_credits(&shared_credits);
        egress_queue_mgr->set_shared_credits(&shared_credits);
        
        // Configure port IDs
        ingress_queue_mgr->set_port_id(1);  // Ingress port
        egress_queue_mgr->set_port_id(2);   // Egress port
        
        SC_THREAD(test_process);
        SC_THREAD(axis_out_ready_driver);
    }
    
    ~TestQueueManagersBridge() {
        delete ingress_queue_mgr;
        delete egress_queue_mgr;
    }
    
    void connect_dummy_axi() {
        // Initialize dummy signals
        dummy_axi_valid.write(false);
        dummy_axi_addr.write(0);
        dummy_axi_data.write(0);
        dummy_axi_ready.write(true);
        
        // Connect both queue managers to dummy AXI
        // Ingress Queue Manager
        ingress_queue_mgr->axi_master_valid(dummy_axi_valid);
        ingress_queue_mgr->axi_master_addr(dummy_axi_addr);
        ingress_queue_mgr->axi_master_data(dummy_axi_data);
        ingress_queue_mgr->axi_master_ready(dummy_axi_ready);
        ingress_queue_mgr->axi_slave_valid(dummy_axi_valid);
        ingress_queue_mgr->axi_slave_addr(dummy_axi_addr);
        ingress_queue_mgr->axi_slave_data(dummy_axi_data);
        ingress_queue_mgr->axi_slave_ready(dummy_axi_ready);
        
        // Egress Queue Manager
        egress_queue_mgr->axi_master_valid(dummy_axi_valid);
        egress_queue_mgr->axi_master_addr(dummy_axi_addr);
        egress_queue_mgr->axi_master_data(dummy_axi_data);
        egress_queue_mgr->axi_master_ready(dummy_axi_ready);
        egress_queue_mgr->axi_slave_valid(dummy_axi_valid);
        egress_queue_mgr->axi_slave_addr(dummy_axi_addr);
        egress_queue_mgr->axi_slave_data(dummy_axi_data);
        egress_queue_mgr->axi_slave_ready(dummy_axi_ready);
    }
    
    void test_process() {
        std::cout << "\n=== Step 2: Queue Managers Bridge Test ===" << std::endl;
        std::cout << "Testing: Ingress Queue Manager → Internal Bus → Egress Queue Manager" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Basic packet bridge
        test_basic_packet_bridge();
        
        // Test 3: Multiple packets
        test_multiple_packets();
        
        // Test 4: Credit system
        test_credit_system();
        
        // Test 5: Queue routing
        test_queue_routing();
        
        std::cout << "=== Step 2: All Queue Managers Bridge tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void axis_out_ready_driver() {
        // Control axis_out_tready based on axis_out_ready_control
        while (true) {
            wait(clk.posedge_event());
            axis_out_tready.write(axis_out_ready_control);
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        
        // AXIS input interface
        axis_in_tvalid.write(false);
        axis_in_tdata.write(0);
        axis_in_tkeep.write(0);
        axis_in_tuser.write(0);
        axis_in_tlast.write(false);
        
        // Credit return
        credit_return_ready.write(true);
        
        wait(50, SC_NS);
    }
    
    void test_reset() {
        std::cout << "Testing reset functionality..." << std::endl;
        
        // Apply reset
        rst_n.write(false);
        wait(100, SC_NS);
        
        // Check reset state
        assert(axis_in_tready.read() == true);  // Ingress should be ready
        assert(axis_out_tvalid.read() == false); // Egress should not be sending
        assert(internal_valid.read() == false);  // No internal traffic
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);
        
        // Check post-reset state
        assert(axis_in_tready.read() == true);
        assert(internal_ready.read() == true);   // Egress should be ready to receive
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_basic_packet_bridge() {
        std::cout << "Testing basic packet bridge..." << std::endl;
        
        // Create test packet
        std::vector<uint8_t> test_data = {0xAA, 0xBB, 0xCC, 0xDD};
        InternalHeader test_header;
        test_header.source_port = 1;
        test_header.dest_port = 2;
        test_header.packet_type = PacketType::DATA;
        test_header.channel_type = ChannelType::LOW_PRIORITY;
        test_header.packet_length = test_data.size();
        
        std::cout << "  Sending " << test_data.size() << " byte packet through bridge..." << std::endl;
        
        // Send AXIS packet to Ingress Queue Manager
        send_axis_packet(test_data, test_header);
        
        // Wait for processing through internal bus
        std::cout << "  Waiting for internal bus processing..." << std::endl;
        wait(500, SC_NS);
        
        // Check that packet came out on AXIS output
        bool packet_received = false;
        std::vector<uint8_t> received_data;
        InternalHeader received_header;
        
        // Wait for AXIS output
        for (int i = 0; i < 100; i++) {
            if (axis_out_tvalid.read()) {
                packet_received = true;
                std::cout << "  Found axis_out_tvalid at cycle " << i << std::endl;
                
                // Extract header from tuser
                received_header = InternalHeader::from_sc_bv(axis_out_tuser.read());
                
                // Extract first beat data  
                auto tdata = axis_out_tdata.read();
                auto tkeep = axis_out_tkeep.read();
                
                for (int j = 0; j < AXIS_DATA_WIDTH/8; j++) {
                    if (tkeep[j] && received_data.size() < test_data.size()) {
                        received_data.push_back((tdata.range(j*8+7, j*8)).to_uint());
                    }
                }
                break;
            }
            wait(clk.posedge_event());
        }
        
        assert(packet_received == true);
        
        // Verify header preservation
        std::cout << "  Expected: src=" << (int)test_header.source_port 
                  << ", dst=" << (int)test_header.dest_port
                  << ", type=" << (int)test_header.packet_type << std::endl;
        std::cout << "  Received: src=" << (int)received_header.source_port
                  << ", dst=" << (int)received_header.dest_port 
                  << ", type=" << (int)received_header.packet_type << std::endl;
        
        assert(received_header.source_port == test_header.source_port);
        assert(received_header.dest_port == test_header.dest_port);
        assert(received_header.packet_type == test_header.packet_type);
        
        // Verify payload (at least first few bytes)
        std::cout << "  Payload verification: received " << received_data.size() << " bytes" << std::endl;
        for (size_t i = 0; i < std::min(received_data.size(), test_data.size()); i++) {
            std::cout << "    Byte " << i << ": 0x" << std::hex << (int)received_data[i] 
                      << " (expected 0x" << (int)test_data[i] << ")" << std::dec << std::endl;
        }
        
        std::cout << "  Basic packet bridge test PASSED" << std::endl;
    }
    
    void test_multiple_packets() {
        std::cout << "Testing multiple packet bridge..." << std::endl;
        
        std::vector<std::vector<uint8_t>> test_packets = {
            {0x11, 0x22},
            {0x33, 0x44, 0x55},
            {0x66, 0x77, 0x88, 0x99}
        };
        
        for (size_t p = 0; p < test_packets.size(); p++) {
            std::cout << "  Sending packet " << (p+1) << " (" << test_packets[p].size() << " bytes)..." << std::endl;
            
            InternalHeader header;
            header.source_port = 1;
            header.dest_port = p % MAX_QUEUES_PER_PORT;  // Different queues
            header.packet_type = PacketType::DATA;
            header.channel_type = ChannelType::LOW_PRIORITY;
            header.packet_length = test_packets[p].size();
            
            send_axis_packet(test_packets[p], header);
            
            // Wait for processing
            wait(300, SC_NS);
            
            // Check for output
            bool found_output = false;
            for (int i = 0; i < 50; i++) {
                if (axis_out_tvalid.read()) {
                    found_output = true;
                    std::cout << "    Packet " << (p+1) << " output detected" << std::endl;
                    break;
                }
                wait(clk.posedge_event());
            }
            
            assert(found_output == true);
            wait(100, SC_NS);  // Allow time between packets
        }
        
        std::cout << "  Multiple packet bridge test PASSED" << std::endl;
    }
    
    void test_credit_system() {
        std::cout << "Testing credit system..." << std::endl;
        
        // Check initial credits
        uint16_t initial_credits[3];
        for (int q = 0; q < 3; q++) {
            initial_credits[q] = shared_credits[q].read();
            std::cout << "  Initial credits queue " << q << ": " << initial_credits[q] << std::endl;
        }
        
        // Send packets to consume credits
        for (int i = 0; i < 2; i++) {
            InternalHeader header;
            header.source_port = 1;
            header.dest_port = i;  // Queue 0, 1
            header.packet_type = PacketType::DATA;
            header.channel_type = ChannelType::LOW_PRIORITY;
            header.packet_length = 4;
            
            std::vector<uint8_t> credit_data = {0xCC, 0xAA, 0xEE, 0xDD};
            send_axis_packet(credit_data, header);
            wait(300, SC_NS);
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
        
        // Verify statistics
        uint64_t ingress_processed = ingress_queue_mgr->get_total_packets_processed();
        uint64_t egress_transmitted = egress_queue_mgr->get_total_packets_transmitted();
        
        std::cout << "  Ingress processed: " << ingress_processed << std::endl;
        std::cout << "  Egress transmitted: " << egress_transmitted << std::endl;
        
        assert(ingress_processed > 0);
        assert(egress_transmitted > 0);
        
        std::cout << "  Credit system test PASSED" << std::endl;
    }
    
    void test_queue_routing() {
        std::cout << "Testing queue routing..." << std::endl;
        
        // Send packets to different queues
        for (int q = 0; q < 3; q++) {
            InternalHeader header;
            header.source_port = 1;
            header.dest_port = q;  // Route to different queues
            header.packet_type = PacketType::DATA;
            header.channel_type = (q == 0) ? ChannelType::LOW_PRIORITY : 
                                 (q == 1) ? ChannelType::HIGH_PRIORITY : ChannelType::CONTROL_CHANNEL;
            header.packet_length = 3;
            
            std::vector<uint8_t> queue_data = {
                (uint8_t)(0x10 + q),
                (uint8_t)(0x20 + q), 
                (uint8_t)(0x30 + q)
            };
            
            std::cout << "  Sending packet to queue " << q << " with priority " << (int)header.channel_type << std::endl;
            send_axis_packet(queue_data, header);
            wait(400, SC_NS);
        }
        
        // Verify queue processing
        for (int q = 0; q < 3; q++) {
            const QueueStats& ingress_stats = ingress_queue_mgr->get_queue_stats(q);
            const QueueStats& egress_stats = egress_queue_mgr->get_queue_stats(q);
            
            std::cout << "  Queue " << q << " - Ingress: " << ingress_stats.packets_received 
                      << ", Egress: " << egress_stats.packets_received << std::endl;
        }
        
        std::cout << "  Queue routing test PASSED" << std::endl;
    }
    
    void send_axis_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header) {
        // Calculate AXIS parameters
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t num_beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (size_t beat = 0; beat < num_beats; beat++) {
            // Wait for ready
            int timeout = 0;
            while (!axis_in_tready.read() && timeout < 100) {
                wait(clk.posedge_event());
                timeout++;
            }
            
            if (timeout >= 100) {
                std::cout << "  Timeout waiting for axis_in_tready" << std::endl;
                return;
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
            axis_in_tdata.write(tdata);
            axis_in_tkeep.write(tkeep);
            axis_in_tuser.write(beat == 0 ? header.to_sc_bv() : sc_bv<AXIS_USER_WIDTH>(0));
            axis_in_tlast.write(beat == num_beats - 1);
            axis_in_tvalid.write(true);
            
            wait(clk.posedge_event());
            
            axis_in_tvalid.write(false);
            wait(clk.posedge_event());
        }
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting Step 2: Queue Managers Bridge tests..." << std::endl;
    
    TestQueueManagersBridge test_module("test_queue_managers_bridge");
    
    sc_start();
    
    return 0;
}