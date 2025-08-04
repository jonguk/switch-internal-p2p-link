#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/queue_manager/ingress_queue_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Test Module for IngressQueueManager
// =============================================================================

SC_MODULE(TestIngressQueueManager) {
    // Test signals
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // AXIS Slave interface signals
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // Internal Bus interface signals
    sc_signal<bool> internal_valid;
    sc_signal<PacketEntry> internal_packet;
    sc_signal<bool> internal_ready;
    
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
    IngressQueueManager* dut;
    
    // Control variables
    bool internal_ready_control;
    
    SC_CTOR(TestIngressQueueManager) : clk("clk", 10, SC_NS), internal_ready_control(true) {
        // Create DUT
        dut = new IngressQueueManager("ingress_queue_manager");
        
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
        
        // Internal Bus interface
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
        
        // Configure DUT
        dut->set_port_id(2);
        
        SC_THREAD(test_process);
        SC_THREAD(internal_ready_driver);
    }
    
    ~TestIngressQueueManager() {
        delete dut;
    }
    
    void test_process() {
        std::cout << "\n=== Testing IngressQueueManager ===" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Basic configuration
        test_configuration();
        
        // Test 3: AXIS packet reception
        test_axis_reception();
        
        // Test 4: Internal header processing
        test_internal_header_processing();
        
        // Test 5: Credit processing
        test_credit_processing();
        
        // Test 6: Packet format conversion
        test_packet_conversion();
        
        // Test 7: Queue management
        test_queue_management();
        
        // Test 8: Internal bus transmission
        test_internal_transmission();
        
        // Test 9: Shared credit variables
        test_shared_credits();
        
        std::cout << "=== All IngressQueueManager tests PASSED ===" << std::endl;
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
        axis_tvalid.write(false);
        axis_tdata.write(0);
        axis_tkeep.write(0);
        axis_tuser.write(0);
        axis_tlast.write(false);
        
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
        assert(axis_tready.read() == true);  // Should always be ready (no backpressure)
        assert(internal_valid.read() == false);
        
        // Release reset
        rst_n.write(true);
        wait(50, SC_NS);
        
        // Check post-reset state
        assert(axis_tready.read() == true);  // Still ready
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_configuration() {
        std::cout << "Testing configuration..." << std::endl;
        
        // Test port ID configuration
        assert(dut->get_port_id() == 2);
        
        // Test initial statistics
        assert(dut->get_total_packets_processed() == 0);
        assert(dut->get_total_credits_added() == 0);
        
        // Test initial queue stats
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            const QueueStats& stats = dut->get_queue_stats(i);
            assert(stats.packets_received == 0);
            assert(stats.current_depth == 0);
            assert(stats.available_credits == DEFAULT_CREDITS);
        }
        
        std::cout << "  Configuration test PASSED" << std::endl;
    }
    
    void test_axis_reception() {
        std::cout << "Testing AXIS packet reception..." << std::endl;
        
        // Create test packet with internal header
        InternalHeader header;
        header.source_port = 1;
        header.dest_port = 2;
        header.channel_type = ChannelType::LOW_PRIORITY;
        header.packet_type = PacketType::DATA;
        header.packet_length = 64;
        
        std::vector<uint8_t> packet_data = {0x11, 0x22, 0x33, 0x44, 0x55, 0x66};
        
        std::cout << "  Sending AXIS packet..." << std::endl;
        send_axis_packet(packet_data, header);
        
        std::cout << "  Waiting for packet processing..." << std::endl;
        wait(500, SC_NS);  // Increased wait time for debugging
        
        // Check that packet was processed
        uint64_t total_processed = dut->get_total_packets_processed();
        std::cout << "  Total packets processed: " << total_processed << std::endl;
        assert(total_processed > 0);
        
        std::cout << "  AXIS reception test PASSED" << std::endl;
    }
    
    void test_internal_header_processing() {
        std::cout << "Testing internal header processing..." << std::endl;
        
        // Send packet with specific header information
        InternalHeader header;
        header.source_port = 3;
        header.dest_port = 4;
        header.channel_type = ChannelType::HIGH_PRIORITY;
        header.packet_type = PacketType::CONTROL;
        header.packet_length = 128;
        
        std::vector<uint8_t> packet_data = {0xAA, 0xBB, 0xCC, 0xDD};
        
        send_axis_packet(packet_data, header);
        
        wait(100, SC_NS);
        
        // Check queue-specific processing
        const QueueStats& queue_stats = dut->get_queue_stats(2);
        assert(queue_stats.packets_received > 0);
        
        std::cout << "  Internal header processing test PASSED" << std::endl;
    }
    
    void test_credit_processing() {
        std::cout << "Testing credit processing..." << std::endl;
        
        uint8_t target_queue = 2;  // dest_port = 2 maps to queue 2
        uint16_t initial_credits = dut->get_available_credits(target_queue);
        uint64_t initial_credits_added = dut->get_total_credits_added();
        
        std::cout << "  Initial credits for queue " << (int)target_queue << ": " << initial_credits << std::endl;
        
        // Send packet with credit information  
        InternalHeader header;
        header.source_port = 1;
        header.dest_port = 2;  // This will be assigned to queue 2 (dest_port % MAX_QUEUES_PER_PORT)
        header.packet_type = PacketType::CREDIT;
        header.packet_length = 10;  // 10 credits (using packet_length field)
        
        std::vector<uint8_t> packet_data = {0x01, 0x02, 0x03, 0x04};
        
        send_axis_packet(packet_data, header);
        
        wait(200, SC_NS);  // Increased wait time
        
        // Check that credits were added to the correct queue
        uint16_t final_credits = dut->get_available_credits(target_queue);
        std::cout << "  Final credits for queue " << (int)target_queue << ": " << final_credits << std::endl;
        
        assert(final_credits > initial_credits);
        assert(dut->get_total_credits_added() > initial_credits_added);
        
        std::cout << "  Credit processing test PASSED" << std::endl;
    }
    
    void test_packet_conversion() {
        std::cout << "Testing packet format conversion..." << std::endl;
        
        // Send raw packet data
        std::vector<uint8_t> raw_data = {
            0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xDE, 0xF0,
            0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88
        };
        
        InternalHeader header;
        header.source_port = 0;
        header.dest_port = 1;
        header.packet_length = raw_data.size();
        
        send_axis_packet(raw_data, header);
        
        // Wait for internal transmission
        wait_for_internal_transmission();
        
        // Check that packet was converted and transmitted
        PacketEntry transmitted_packet = internal_packet.read();
        assert(transmitted_packet.payload.size() == raw_data.size());
        
        std::cout << "  Packet conversion test PASSED" << std::endl;
    }
    
    void test_queue_management() {
        std::cout << "Testing queue management..." << std::endl;
        
        // Send packets to different queues (using dest_port % MAX_QUEUES as queue assignment)
        for (int q = 0; q < 3; q++) {
            InternalHeader header;
            header.source_port = 0;
            header.dest_port = q;  // dest_port will be used for queue assignment
            
            std::vector<uint8_t> packet_data = {(uint8_t)(0x10 + q), (uint8_t)(0x20 + q)};
            
            send_axis_packet(packet_data, header);
            wait(50, SC_NS);
        }
        
        wait(200, SC_NS);
        
        // Check that packets were distributed to correct queues
        for (int q = 0; q < 3; q++) {
            const QueueStats& stats = dut->get_queue_stats(q);
            assert(stats.packets_received > 0);
        }
        
        std::cout << "  Queue management test PASSED" << std::endl;
    }
    
    void test_internal_transmission() {
        std::cout << "Testing internal bus transmission..." << std::endl;
        
        // Send packet
        InternalHeader header;
        header.source_port = 1;
        header.dest_port = 3;
        
        std::vector<uint8_t> packet_data = {0xFF, 0xEE, 0xDD, 0xCC};
        
        send_axis_packet(packet_data, header);
        
        // Wait for internal transmission
        wait_for_internal_transmission();
        
        // Verify internal packet structure
        PacketEntry transmitted_packet = internal_packet.read();
        assert(transmitted_packet.header.source_port == 1);
        assert(transmitted_packet.header.dest_port == 3);
        assert(transmitted_packet.payload.size() == packet_data.size());
        
        std::cout << "  Internal transmission test PASSED" << std::endl;
    }
    
    void test_shared_credits() {
        std::cout << "Testing shared credit variables..." << std::endl;
        
        // Test direct credit manipulation
        uint16_t initial_credits = dut->get_available_credits(0);
        
        dut->add_credits(0, 20);
        wait(10, SC_NS);
        
        uint16_t new_credits = dut->get_available_credits(0);
        assert(new_credits == initial_credits + 20);
        
        // Test credit bounds
        dut->add_credits(0, 1000);  // Try to add too many
        wait(10, SC_NS);
        
        uint16_t bounded_credits = dut->get_available_credits(0);
        assert(bounded_credits <= MAX_CREDITS_PER_QUEUE);
        
        std::cout << "  Shared credits test PASSED" << std::endl;
    }
    
    void send_axis_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header) {
        // Convert header to tuser using the proper method
        sc_bv<AXIS_USER_WIDTH> tuser_value = header.to_sc_bv();
        
        std::cout << "    [TestBench] Sending packet: src=" << (int)header.source_port 
                  << ", dst=" << (int)header.dest_port 
                  << ", size=" << packet_data.size() << " bytes" << std::endl;
        
        // Send packet data beat by beat
        size_t beats = (packet_data.size() + AXIS_DATA_WIDTH/8 - 1) / (AXIS_DATA_WIDTH/8);
        std::cout << "    [TestBench] Packet will be sent in " << beats << " beats" << std::endl;
        
        for (size_t beat = 0; beat < beats; beat++) {
            std::cout << "    [TestBench] Beat " << beat << ": Setting axis_tvalid=true" << std::endl;
            axis_tvalid.write(true);
            
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
            
            axis_tdata.write(data_beat);
            axis_tkeep.write(keep_beat);
            axis_tuser.write(tuser_value);
            axis_tlast.write(beat == beats - 1);
            
            std::cout << "    [TestBench] Beat " << beat << ": Waiting for clock edge..." << std::endl;
            wait(clk.posedge_event());  // Wait for clock edge after setting signals
            
            // Wait for ready (should always be ready)
            assert(axis_tready.read() == true);
        }
        
        std::cout << "    [TestBench] Clearing axis_tvalid and axis_tlast" << std::endl;
        axis_tvalid.write(false);
        axis_tlast.write(false);
        wait(clk.posedge_event());
    }
    
    void wait_for_internal_transmission() {
        // Wait for internal valid to be asserted
        while (!internal_valid.read()) {
            wait(clk.posedge_event());
        }
        
        wait(10, SC_NS);  // Additional settling time
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting IngressQueueManager unit tests..." << std::endl;
    
    TestIngressQueueManager test_module("test_ingress_queue_manager");
    
    sc_start();
    
    return 0;
}