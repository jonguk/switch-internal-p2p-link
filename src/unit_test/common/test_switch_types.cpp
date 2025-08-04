#include <systemc.h>
#include <cassert>
#include <iostream>
#include "../../systemc/common/switch_types.h"

using namespace switch_internal_p2p;

// =============================================================================
// Test Module for switch_types.h
// =============================================================================

SC_MODULE(TestSwitchTypes) {
    sc_clock clk;
    
    SC_CTOR(TestSwitchTypes) : clk("clk", 10, SC_NS) {
        SC_THREAD(test_process);
    }
    
    void test_process() {
        std::cout << "\n=== Testing switch_types.h ===" << std::endl;
        
        // Test 1: Basic Constants
        test_basic_constants();
        
        // Test 2: InternalHeader Structure
        test_internal_header();
        
        // Test 3: AxisPacket Structure
        test_axis_packet();
        
        // Test 4: CreditInfo Structure
        test_credit_info();
        
        // Test 5: PacketEntry Structure
        test_packet_entry();
        
        // Test 6: QueueStats Structure
        test_queue_stats();
        
        std::cout << "=== All switch_types tests PASSED ===" << std::endl;
        sc_stop();
    }
    
private:
    void test_basic_constants() {
        std::cout << "Testing basic constants..." << std::endl;
        
        // Test constants are reasonable
        assert(MAX_PORTS > 0 && MAX_PORTS <= 256);
        assert(MAX_QUEUES_PER_PORT > 0 && MAX_QUEUES_PER_PORT <= 16);
        assert(MAX_PACKET_SIZE >= MIN_PACKET_SIZE);
        assert(AXIS_DATA_WIDTH > 0 && AXIS_DATA_WIDTH % 8 == 0);
        assert(AXIS_KEEP_WIDTH == AXIS_DATA_WIDTH / 8);
        
        std::cout << "  MAX_PORTS: " << MAX_PORTS << std::endl;
        std::cout << "  MAX_QUEUES_PER_PORT: " << MAX_QUEUES_PER_PORT << std::endl;
        std::cout << "  AXIS_DATA_WIDTH: " << AXIS_DATA_WIDTH << std::endl;
        std::cout << "  Basic constants test PASSED" << std::endl;
    }
    
    void test_internal_header() {
        std::cout << "Testing InternalHeader structure..." << std::endl;
        
        // Test default constructor
        InternalHeader header1;
        assert(header1.source_port_id == 0);
        assert(header1.dest_port_id == 0);
        assert(header1.queue_id == 0);
        assert(header1.channel_type == ChannelType::VARIABLE_PAYLOAD);
        assert(header1.packet_type == PacketType::DATA);
        assert(header1.priority == Priority::LOW);
        assert(header1.packet_length == 0);
        assert(header1.credit_info == 0);
        
        // Test field assignments
        header1.source_port_id = 1;
        header1.dest_port_id = 2;
        header1.queue_id = 3;
        header1.channel_type = ChannelType::FIXED_PAYLOAD;
        header1.packet_type = PacketType::CREDIT;
        header1.priority = Priority::HIGH;
        header1.packet_length = 1500;
        header1.credit_info = 10;
        
        assert(header1.source_port_id == 1);
        assert(header1.dest_port_id == 2);
        assert(header1.queue_id == 3);
        assert(header1.channel_type == ChannelType::FIXED_PAYLOAD);
        assert(header1.packet_type == PacketType::CREDIT);
        assert(header1.priority == Priority::HIGH);
        assert(header1.packet_length == 1500);
        assert(header1.credit_info == 10);
        
        std::cout << "  InternalHeader test PASSED" << std::endl;
    }
    
    void test_axis_packet() {
        std::cout << "Testing AxisPacket structure..." << std::endl;
        
        AxisPacket packet;
        
        // Test default values
        assert(packet.tlast == false);
        assert(packet.tvalid == false);
        assert(packet.tready == false);
        
        // Test field assignments
        packet.tdata = sc_bv<AXIS_DATA_WIDTH>("0x12345678");
        packet.tkeep = sc_bv<AXIS_KEEP_WIDTH>("0xFF");
        packet.tuser = sc_bv<AXIS_USER_WIDTH>("0xABCDEF");
        packet.tlast = true;
        packet.tvalid = true;
        packet.tready = true;
        
        assert(packet.tlast == true);
        assert(packet.tvalid == true);
        assert(packet.tready == true);
        
        std::cout << "  AxisPacket test PASSED" << std::endl;
    }
    
    void test_credit_info() {
        std::cout << "Testing CreditInfo structure..." << std::endl;
        
        // Test default constructor
        CreditInfo credit1;
        assert(credit1.port_id == 0);
        assert(credit1.queue_id == 0);
        assert(credit1.credits == 0);
        
        // Test parameterized constructor
        CreditInfo credit2(5, 3, 100);
        assert(credit2.port_id == 5);
        assert(credit2.queue_id == 3);
        assert(credit2.credits == 100);
        
        std::cout << "  CreditInfo test PASSED" << std::endl;
    }
    
    void test_packet_entry() {
        std::cout << "Testing PacketEntry structure..." << std::endl;
        
        PacketEntry entry;
        
        // Test default values
        assert(entry.timestamp == 0);
        assert(entry.payload.empty());
        
        // Test payload assignment
        entry.payload = {0x01, 0x02, 0x03, 0x04};
        entry.timestamp = 12345;
        
        assert(entry.payload.size() == 4);
        assert(entry.payload[0] == 0x01);
        assert(entry.payload[3] == 0x04);
        assert(entry.timestamp == 12345);
        
        // Test total_size calculation
        size_t expected_size = sizeof(InternalHeader) + 4;
        assert(entry.total_size() == expected_size);
        
        std::cout << "  PacketEntry test PASSED" << std::endl;
    }
    
    void test_queue_stats() {
        std::cout << "Testing QueueStats structure..." << std::endl;
        
        QueueStats stats;
        
        // Test default values
        assert(stats.packets_received == 0);
        assert(stats.packets_transmitted == 0);
        assert(stats.bytes_received == 0);
        assert(stats.bytes_transmitted == 0);
        assert(stats.packets_dropped == 0);
        assert(stats.current_depth == 0);
        assert(stats.max_depth == 0);
        assert(stats.available_credits == DEFAULT_CREDITS);
        
        // Test field updates
        stats.packets_received = 100;
        stats.packets_transmitted = 95;
        stats.bytes_received = 150000;
        stats.bytes_transmitted = 142500;
        stats.current_depth = 5;
        stats.max_depth = 10;
        stats.available_credits = 50;
        
        assert(stats.packets_received == 100);
        assert(stats.packets_transmitted == 95);
        assert(stats.bytes_received == 150000);
        assert(stats.bytes_transmitted == 142500);
        assert(stats.current_depth == 5);
        assert(stats.max_depth == 10);
        assert(stats.available_credits == 50);
        
        std::cout << "  QueueStats test PASSED" << std::endl;
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting switch_types unit tests..." << std::endl;
    
    TestSwitchTypes test_module("test_switch_types");
    
    sc_start();
    
    return 0;
}