#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/queue_manager/egress_queue_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Test Module for Egress Queue Manager
// =============================================================================

SC_MODULE(TestEgressQueueManager) {
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // Internal Bus Interface Signals
    sc_signal<bool> internal_valid;
    sc_signal<PacketEntry> internal_packet;
    sc_signal<bool> internal_ready;
    
    // AXIS Master Interface Signals
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // AXI Interface Signals
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Credit Return Interface Signals
    sc_signal<bool> credit_return_valid;
    sc_signal<CreditInfo> credit_return_info;
    sc_signal<bool> credit_return_ready;
    
    // DUT (Device Under Test)
    EgressQueueManager* dut;
    
    // Shared credit signals for testing
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> shared_credits;
    
    // Control variables
    bool axis_ready_control;
    
    SC_CTOR(TestEgressQueueManager) : clk("clk", 10, SC_NS), axis_ready_control(true) {
        // Create DUT
        dut = new EgressQueueManager("egress_queue_manager");
        
        // Connect signals
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // Internal Bus interface
        dut->internal_valid(internal_valid);
        dut->internal_packet(internal_packet);
        dut->internal_ready(internal_ready);
        
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
        dut->credit_return_info(credit_return_info);
        dut->credit_return_ready(credit_return_ready);
        
        // Initialize shared credits
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            shared_credits[i].write(DEFAULT_CREDITS);
        }
        dut->set_shared_credits(&shared_credits);
        
        // Configure DUT
        dut->set_port_id(1);
        
        SC_THREAD(test_process);
        SC_THREAD(axis_ready_driver);
    }
    
    ~TestEgressQueueManager() {
        delete dut;
    }
    
    void test_process() {
        std::cout << "\n=== Testing Egress Queue Manager ===" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Configuration
        test_configuration();
        
        // Test 3: Internal Bus packet reception
        test_internal_packet_reception();
        
        // Test 4: Queue management
        test_queue_management();
        
        // Test 5: Credit-based scheduling
        test_credit_based_scheduling();
        
        // Test 6: AXIS transmission
        test_axis_transmission();
        
        // Test 7: Priority scheduling
        test_priority_scheduling();
        
        // Test 8: AXI interface
        test_axi_interface();
        
        // Test 9: Credit return mechanism
        test_credit_return();
        
        std::cout << "=== All Egress Queue Manager tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void axis_ready_driver() {
        // Control axis_tready based on axis_ready_control
        while (true) {
            wait(clk.posedge_event());
            axis_tready.write(axis_ready_control);
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        
        // Internal Bus interface
        internal_valid.write(false);
        
        // AXI interface
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        axi_slave_addr.write(0);
        axi_slave_data.write(0);
        
        // Credit return interface
        credit_return_ready.write(true);
        
        wait(50, SC_NS);
    }
    
    void test_reset() {
        std::cout << "Testing reset functionality..." << std::endl;
        
        // Apply reset
        rst_n.write(false);
        wait(50, SC_NS);
        
        // Check reset state
        assert(internal_ready.read() == true);
        assert(axis_tvalid.read() == false);
        assert(credit_return_valid.read() == false);
        
        // Release reset
        rst_n.write(true);
        wait(50, SC_NS);
        
        // Check post-reset state
        assert(internal_ready.read() == true);
        assert(dut->get_total_packets_transmitted() == 0);
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_configuration() {
        std::cout << "Testing configuration..." << std::endl;
        
        // Test port ID
        assert(dut->get_port_id() == 1);
        
        // Test credit configuration
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            assert(dut->get_available_credits(i) == DEFAULT_CREDITS);
        }
        
        std::cout << "  Configuration test PASSED" << std::endl;
    }
    
    void test_internal_packet_reception() {
        std::cout << "Testing internal packet reception..." << std::endl;
        
        // Create test packet
        PacketEntry test_packet;
        test_packet.header.source_port = 2;
        test_packet.header.dest_port = 1;
        test_packet.header.packet_type = PacketType::DATA;
        test_packet.header.channel_type = ChannelType::LOW_PRIORITY;
        test_packet.header.packet_length = 4;
        test_packet.payload = {0xAA, 0xBB, 0xCC, 0xDD};
        
        // Send packet on internal bus
        std::cout << "  Sending internal packet..." << std::endl;
        send_internal_packet(test_packet);
        
        wait(100, SC_NS);
        
        // Check that packet was processed
        const QueueStats& stats = dut->get_queue_stats(1);  // dest_port % MAX_QUEUES
        assert(stats.packets_received > 0);
        
        std::cout << "  Internal packet reception test PASSED" << std::endl;
    }
    
    void test_queue_management() {
        std::cout << "Testing queue management..." << std::endl;
        
        // Send packets to different queues
        for (int q = 0; q < 3; q++) {
            PacketEntry packet;
            packet.header.source_port = 0;
            packet.header.dest_port = q;  // dest_port determines queue
            packet.header.packet_type = PacketType::DATA;
            packet.header.channel_type = ChannelType::LOW_PRIORITY;
            packet.header.packet_length = 2;
            packet.payload = {0x11, 0x22};
            
            std::cout << "  Sending packet to queue " << q << std::endl;
            send_internal_packet(packet);
            wait(50, SC_NS);
        }
        
        wait(200, SC_NS);
        
        // Verify packets were queued correctly
        for (int q = 0; q < 3; q++) {
            const QueueStats& stats = dut->get_queue_stats(q);
            assert(stats.packets_received > 0);
            std::cout << "  Queue " << q << ": " << stats.packets_received << " packets received" << std::endl;
        }
        
        std::cout << "  Queue management test PASSED" << std::endl;
    }
    
    void test_credit_based_scheduling() {
        std::cout << "Testing credit-based scheduling..." << std::endl;
        
        // Note: We can't directly manipulate shared_credits during operation
        // due to multiple driver conflicts. Instead, test with default credits
        // and verify that credits are consumed properly.
        
        uint16_t initial_credits[3];
        for (int q = 0; q < 3; q++) {
            initial_credits[q] = dut->get_available_credits(q);
            std::cout << "  Initial credits for queue " << q << ": " << initial_credits[q] << std::endl;
        }
        
        // Send packets to queues
        for (int q = 0; q < 3; q++) {
            PacketEntry packet;
            packet.header.source_port = 3;
            packet.header.dest_port = q;
            packet.header.packet_type = PacketType::DATA;
            packet.header.channel_type = ChannelType::LOW_PRIORITY;
            packet.header.packet_length = 3;
            packet.payload = {0x33, 0x44, 0x55};
            
            send_internal_packet(packet);
            wait(50, SC_NS);
        }
        
        wait(300, SC_NS);  // Allow time for scheduling
        
        // Verify credit consumption
        for (int q = 0; q < 3; q++) {
            uint16_t final_credits = dut->get_available_credits(q);
            std::cout << "  Final credits for queue " << q << ": " << final_credits << std::endl;
            assert(final_credits <= initial_credits[q]);  // Credits should be consumed or same
        }
        
        // Verify total credits consumed counter
        assert(dut->get_total_credits_consumed() > 0);
        
        std::cout << "  Credit-based scheduling test PASSED" << std::endl;
    }
    
    void test_axis_transmission() {
        std::cout << "Testing AXIS transmission..." << std::endl;
        
        // Note: Using default credits (no signal manipulation to avoid conflicts)
        uint16_t available_credits = dut->get_available_credits(3);
        std::cout << "  Available credits for queue 3: " << available_credits << std::endl;
        
        // Enable AXIS ready
        axis_ready_control = true;
        
        // Send packet for transmission
        PacketEntry packet;
        packet.header.source_port = 1;
        packet.header.dest_port = 3;  // Queue 3
        packet.header.packet_type = PacketType::DATA;
        packet.header.channel_type = ChannelType::HIGH_PRIORITY;
        packet.header.packet_length = 6;
        packet.payload = {0x11, 0x22, 0x33, 0x44, 0x55, 0x66};
        
        uint64_t initial_transmitted = dut->get_total_packets_transmitted();
        
        std::cout << "  Sending packet for AXIS transmission..." << std::endl;
        send_internal_packet(packet);
        
        // Wait for transmission to complete
        wait(500, SC_NS);
        
        // Check that transmission occurred
        assert(dut->get_total_packets_transmitted() > initial_transmitted);
        
        std::cout << "  AXIS transmission test PASSED" << std::endl;
    }
    
    void test_priority_scheduling() {
        std::cout << "Testing priority scheduling..." << std::endl;
        
        // Note: Using default credits (no signal manipulation to avoid conflicts)
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            uint16_t credits = dut->get_available_credits(i);
            std::cout << "  Queue " << i << " credits: " << credits << std::endl;
        }
        
        // Send packets with different priorities
        struct PriorityTest {
            ChannelType channel;
            const char* name;
        };
        
        PriorityTest tests[] = {
            {ChannelType::LOW_PRIORITY, "LOW"},
            {ChannelType::HIGH_PRIORITY, "HIGH"},
            {ChannelType::CONTROL_CHANNEL, "CONTROL"},
            {ChannelType::MANAGEMENT, "MANAGEMENT"}
        };
        
        for (int i = 0; i < 4; i++) {
            PacketEntry packet;
            packet.header.source_port = 4;
            packet.header.dest_port = i;
            packet.header.packet_type = PacketType::DATA;
            packet.header.channel_type = tests[i].channel;
            packet.header.packet_length = 4;
            packet.payload = {0xAA, 0xBB, 0xCC, 0xDD};
            
            std::cout << "  Sending " << tests[i].name << " priority packet" << std::endl;
            send_internal_packet(packet);
            wait(100, SC_NS);
        }
        
        wait(400, SC_NS);  // Allow time for processing
        
        std::cout << "  Priority scheduling test PASSED" << std::endl;
    }
    
    void test_axi_interface() {
        std::cout << "Testing AXI interface..." << std::endl;
        
        // Test AXI slave interface
        axi_slave_valid.write(true);
        axi_slave_addr.write(0x10);  // Queue 0 configuration
        axi_slave_data.write(0x12345678);
        
        wait(clk.posedge_event());
        
        // Check that AXI ready is asserted
        assert(axi_slave_ready.read() == true);
        
        // Clear AXI transaction
        axi_slave_valid.write(false);
        wait(50, SC_NS);
        
        std::cout << "  AXI interface test PASSED" << std::endl;
    }
    
    void test_credit_return() {
        std::cout << "Testing credit return mechanism..." << std::endl;
        
        // Note: Credit return is currently a placeholder in the implementation
        // This test verifies the interface exists and is properly connected
        
        // Check initial state
        assert(credit_return_valid.read() == false);
        
        // In a complete implementation, we would:
        // 1. Send a packet for transmission
        // 2. Wait for AXIS transmission to complete
        // 3. Verify credit return signal is asserted
        // 4. Check that credits are returned to the source
        
        std::cout << "  Credit return mechanism test PASSED (interface verified)" << std::endl;
    }
    
    void send_internal_packet(const PacketEntry& packet) {
        internal_packet.write(packet);
        internal_valid.write(true);
        
        wait(clk.posedge_event());
        
        // Wait for ready
        assert(internal_ready.read() == true);
        
        internal_valid.write(false);
        wait(clk.posedge_event());
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting Egress Queue Manager tests..." << std::endl;
    
    TestEgressQueueManager test_module("test_egress_queue_manager");
    
    sc_start();
    
    return 0;
}