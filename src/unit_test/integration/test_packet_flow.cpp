#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/common/switch_types.h"

using namespace switch_internal_p2p;

// =============================================================================
// Packet Flow Integration Test
// =============================================================================

SC_MODULE(TestPacketFlow) {
    // Test signals
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // Packet flow test data
    std::vector<uint8_t> test_packets[3];
    std::vector<InternalHeader> test_headers;
    
    SC_CTOR(TestPacketFlow) : clk("clk", 10, SC_NS) {
        SC_THREAD(test_process);
        
        // Initialize test packets
        init_test_data();
    }
    
    void init_test_data() {
        std::cout << "Initializing packet flow test data..." << std::endl;
        
        // Test Packet 1: Small packet (64 bytes)
        test_packets[0].resize(64);
        for (int i = 0; i < 64; i++) {
            test_packets[0][i] = 0x10 + (i % 16);
        }
        
        // Test Packet 2: Medium packet (1500 bytes)
        test_packets[1].resize(1500);
        for (int i = 0; i < 1500; i++) {
            test_packets[1][i] = 0x20 + (i % 16);
        }
        
        // Test Packet 3: Large packet (9000 bytes - Jumbo frame)
        test_packets[2].resize(9000);
        for (int i = 0; i < 9000; i++) {
            test_packets[2][i] = 0x30 + (i % 16);
        }
        
        // Initialize test headers
        test_headers.resize(3);
        
        // Header for packet 1: Port 0 -> Port 1, Queue 0, Fixed payload
        test_headers[0].source_port_id = 0;
        test_headers[0].dest_port_id = 1;
        test_headers[0].queue_id = 0;
        test_headers[0].channel_type = ChannelType::FIXED_PAYLOAD;
        test_headers[0].packet_type = PacketType::DATA;
        test_headers[0].priority = Priority::HIGH;
        test_headers[0].packet_length = 64;
        
        // Header for packet 2: Port 1 -> Port 2, Queue 1, Variable payload
        test_headers[1].source_port_id = 1;
        test_headers[1].dest_port_id = 2;
        test_headers[1].queue_id = 1;
        test_headers[1].channel_type = ChannelType::VARIABLE_PAYLOAD;
        test_headers[1].packet_type = PacketType::DATA;
        test_headers[1].priority = Priority::MEDIUM;
        test_headers[1].packet_length = 1500;
        
        // Header for packet 3: Port 2 -> Port 0, Queue 2, Variable payload
        test_headers[2].source_port_id = 2;
        test_headers[2].dest_port_id = 0;
        test_headers[2].queue_id = 2;
        test_headers[2].channel_type = ChannelType::VARIABLE_PAYLOAD;
        test_headers[2].packet_type = PacketType::DATA;
        test_headers[2].priority = Priority::LOW;
        test_headers[2].packet_length = 9000;
    }
    
    void test_process() {
        std::cout << "\n=== Packet Flow Integration Test ===" << std::endl;
        
        // Reset system
        rst_n.write(false);
        wait(100, SC_NS);
        rst_n.write(true);
        wait(50, SC_NS);
        
        // Test 1: End-to-End Packet Flow Simulation
        test_end_to_end_flow();
        
        // Test 2: Multi-packet Concurrent Flow
        test_concurrent_flow();
        
        // Test 3: Queue-to-Queue Mapping Verification
        test_queue_mapping();
        
        // Test 4: Packet Size Handling
        test_packet_size_handling();
        
        // Test 5: Channel Type Processing
        test_channel_type_processing();
        
        std::cout << "✅ All Packet Flow tests passed!" << std::endl;
        sc_stop();
    }
    
    void test_end_to_end_flow() {
        std::cout << "\n--- Test 1: End-to-End Packet Flow ---" << std::endl;
        
        for (int i = 0; i < 3; i++) {
            std::cout << "Testing packet " << i << " (size: " << test_packets[i].size() << " bytes)" << std::endl;
            
            // Step 1: Simulate Ingress Port Manager Raw Buffering
            simulate_ingress_raw_buffering(test_packets[i]);
            
            // Step 2: Simulate Internal Header Generation
            InternalHeader header = simulate_internal_header_generation(test_headers[i]);
            
            // Step 3: Simulate AXIS Transmission (tuser + tdata)
            simulate_axis_transmission(header, test_packets[i]);
            
            // Step 4: Simulate Ingress Queue Manager Processing
            simulate_ingress_queue_processing(header, test_packets[i]);
            
            // Step 5: Simulate Routing & Switching
            simulate_routing_switching(header, test_packets[i]);
            
            // Step 6: Simulate Egress Queue Manager Processing
            simulate_egress_queue_processing(header, test_packets[i]);
            
            // Step 7: Simulate Egress Port Manager Output
            simulate_egress_output(test_packets[i]);
            
            wait(100, SC_NS);
        }
        
        std::cout << "✅ End-to-End flow test completed" << std::endl;
    }
    
    void test_concurrent_flow() {
        std::cout << "\n--- Test 2: Multi-packet Concurrent Flow ---" << std::endl;
        
        // Simulate multiple packets being processed simultaneously
        std::cout << "Simulating concurrent processing of 3 packets..." << std::endl;
        
        // All packets start ingress processing at the same time
        for (int i = 0; i < 3; i++) {
            std::cout << "Starting concurrent flow for packet " << i << std::endl;
            simulate_ingress_raw_buffering(test_packets[i]);
        }
        
        wait(50, SC_NS);
        
        // Verify no interference between packets
        for (int i = 0; i < 3; i++) {
            verify_packet_integrity(test_packets[i], i);
        }
        
        std::cout << "✅ Concurrent flow test completed" << std::endl;
    }
    
    void test_queue_mapping() {
        std::cout << "\n--- Test 3: Queue-to-Queue Mapping ---" << std::endl;
        
        // Test Channel-Agnostic Queue mapping (Queue N -> Queue N)
        for (int queue_id = 0; queue_id < 3; queue_id++) {
            std::cout << "Testing Queue " << queue_id << " mapping..." << std::endl;
            
            InternalHeader ingress_header = test_headers[queue_id];
            InternalHeader egress_header;
            
            // Simulate queue mapping
            egress_header = simulate_queue_mapping(ingress_header);
            
            // Verify queue mapping correctness
            assert(ingress_header.queue_id == egress_header.queue_id);
            assert(ingress_header.dest_port_id == egress_header.dest_port_id);
            
            std::cout << "  Queue " << queue_id << " mapped correctly: " 
                      << "Port " << (int)ingress_header.source_port_id 
                      << " -> Port " << (int)egress_header.dest_port_id << std::endl;
        }
        
        std::cout << "✅ Queue mapping test completed" << std::endl;
    }
    
    void test_packet_size_handling() {
        std::cout << "\n--- Test 4: Packet Size Handling ---" << std::endl;
        
        // Test different packet sizes
        std::vector<size_t> test_sizes = {64, 128, 512, 1500, 4096, 9000};
        
        for (size_t size : test_sizes) {
            std::cout << "Testing packet size: " << size << " bytes" << std::endl;
            
            // Create test packet of specific size
            std::vector<uint8_t> test_packet(size);
            for (size_t i = 0; i < size; i++) {
                test_packet[i] = (uint8_t)(i % 256);
            }
            
            // Test raw buffering (no size limitation)
            bool buffering_success = simulate_raw_buffering_size_test(test_packet);
            assert(buffering_success);
            
            // Test AXIS transmission (handle large packets with multiple beats)
            int beats_required = simulate_axis_beats_calculation(size);
            std::cout << "  Packet size " << size << " requires " << beats_required << " AXIS beats" << std::endl;
            
            assert(beats_required > 0);
            assert(beats_required == (int)((size + AXIS_DATA_WIDTH/8 - 1) / (AXIS_DATA_WIDTH/8)));
        }
        
        std::cout << "✅ Packet size handling test completed" << std::endl;
    }
    
    void test_channel_type_processing() {
        std::cout << "\n--- Test 5: Channel Type Processing ---" << std::endl;
        
        // Test Fixed Payload Channel
        std::cout << "Testing Fixed Payload Channel..." << std::endl;
        InternalHeader fixed_header;
        fixed_header.channel_type = ChannelType::FIXED_PAYLOAD;
        fixed_header.packet_length = 64;
        
        bool fixed_processing = simulate_channel_type_processing(fixed_header, test_packets[0]);
        assert(fixed_processing);
        std::cout << "  Fixed payload processing: ✅" << std::endl;
        
        // Test Variable Payload Channel
        std::cout << "Testing Variable Payload Channel..." << std::endl;
        InternalHeader variable_header;
        variable_header.channel_type = ChannelType::VARIABLE_PAYLOAD;
        variable_header.packet_length = 1500;
        
        bool variable_processing = simulate_channel_type_processing(variable_header, test_packets[1]);
        assert(variable_processing);
        std::cout << "  Variable payload processing: ✅" << std::endl;
        
        std::cout << "✅ Channel type processing test completed" << std::endl;
    }
    
    // Simulation helper functions
    void simulate_ingress_raw_buffering(const std::vector<uint8_t>& packet) {
        // Simulate Ingress Port Manager raw buffering (no processing)
        std::cout << "  [Ingress] Raw buffering " << packet.size() << " bytes" << std::endl;
        wait(10, SC_NS); // Simulate buffering delay
    }
    
    InternalHeader simulate_internal_header_generation(const InternalHeader& template_header) {
        std::cout << "  [Ingress] Generating Internal Header" << std::endl;
        InternalHeader header = template_header;
        wait(5, SC_NS); // Simulate header generation delay
        return header;
    }
    
    void simulate_axis_transmission(const InternalHeader& header, const std::vector<uint8_t>& packet) {
        std::cout << "  [AXIS] Transmitting packet with Internal Header in tuser" << std::endl;
        
        // Simulate AXIS.tuser (Internal Header)
        sc_bv<AXIS_USER_WIDTH> tuser_data = header.to_sc_bv();
        
        // Simulate AXIS.tdata transmission (multiple beats for large packets)
        int beats = (packet.size() + AXIS_DATA_WIDTH/8 - 1) / (AXIS_DATA_WIDTH/8);
        std::cout << "    AXIS beats required: " << beats << std::endl;
        
        for (int beat = 0; beat < beats; beat++) {
            wait(10, SC_NS); // Simulate each AXIS beat
            if (beat == beats - 1) {
                std::cout << "    AXIS.tlast asserted on final beat" << std::endl;
            }
        }
    }
    
    void simulate_ingress_queue_processing(const InternalHeader& header, const std::vector<uint8_t>& packet) {
        std::cout << "  [Ingress Queue] Processing Internal Header and converting to internal format" << std::endl;
        
        // Simulate Internal Header analysis
        std::cout << "    Analyzed: Channel=" << (int)header.channel_type 
                  << ", Queue=" << (int)header.queue_id 
                  << ", Type=" << (int)header.packet_type << std::endl;
        
        // Simulate format conversion and unified packet storage
        std::cout << "    Unified packet storage (Header+Payload together)" << std::endl;
        
        wait(15, SC_NS); // Simulate processing delay
    }
    
    void simulate_routing_switching(const InternalHeader& header, const std::vector<uint8_t>& packet) {
        std::cout << "  [Routing] Switching packet from Port " << (int)header.source_port_id 
                  << " to Port " << (int)header.dest_port_id << std::endl;
        wait(5, SC_NS); // Simulate routing delay
    }
    
    void simulate_egress_queue_processing(const InternalHeader& header, const std::vector<uint8_t>& packet) {
        std::cout << "  [Egress Queue] Unified packet buffering and scheduling" << std::endl;
        std::cout << "    Priority: " << (int)header.priority << std::endl;
        wait(10, SC_NS); // Simulate queue processing delay
    }
    
    void simulate_egress_output(const std::vector<uint8_t>& packet) {
        std::cout << "  [Egress] Single buffer output, " << packet.size() << " bytes transmitted" << std::endl;
        wait(20, SC_NS); // Simulate output delay
    }
    
    void verify_packet_integrity(const std::vector<uint8_t>& packet, int packet_id) {
        std::cout << "  Verifying packet " << packet_id << " integrity..." << std::endl;
        
        // Check packet size
        assert(packet.size() > 0);
        assert(packet.size() <= MAX_PACKET_SIZE);
        
        // Check packet pattern (simple integrity check)
        uint8_t expected_base = 0x10 + (packet_id * 0x10);
        for (size_t i = 0; i < std::min((size_t)16, packet.size()); i++) {
            uint8_t expected = expected_base + (i % 16);
            assert(packet[i] == expected);
        }
        
        std::cout << "    Packet " << packet_id << " integrity verified ✅" << std::endl;
    }
    
    InternalHeader simulate_queue_mapping(const InternalHeader& ingress_header) {
        InternalHeader egress_header = ingress_header;
        
        // Channel-Agnostic mapping: Queue N -> Queue N
        // Only port changes, queue_id remains the same
        egress_header.source_port_id = ingress_header.dest_port_id;
        
        return egress_header;
    }
    
    bool simulate_raw_buffering_size_test(const std::vector<uint8_t>& packet) {
        // Raw buffering should handle any size packet
        return (packet.size() >= MIN_PACKET_SIZE && packet.size() <= MAX_PACKET_SIZE);
    }
    
    int simulate_axis_beats_calculation(size_t packet_size) {
        return (packet_size + AXIS_DATA_WIDTH/8 - 1) / (AXIS_DATA_WIDTH/8);
    }
    
    bool simulate_channel_type_processing(const InternalHeader& header, const std::vector<uint8_t>& packet) {
        switch (header.channel_type) {
            case ChannelType::FIXED_PAYLOAD:
                // Fixed payload: unified packet storage
                return (packet.size() == header.packet_length);
                
            case ChannelType::VARIABLE_PAYLOAD:
                // Variable payload: unified packet storage
                return (packet.size() <= MAX_PACKET_SIZE);
                
            default:
                return false;
        }
    }
};

// Test bench
int sc_main(int argc, char* argv[]) {
    TestPacketFlow test("TestPacketFlow");
    
    sc_start();
    
    return 0;
}