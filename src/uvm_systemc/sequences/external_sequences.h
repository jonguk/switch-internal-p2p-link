#ifndef EXTERNAL_SEQUENCES_H
#define EXTERNAL_SEQUENCES_H

#include <systemc.h>
#include <uvm>
#include <random>
#include "../common/uvm_types.h"

namespace uvm_switch_verification {

using namespace uvm;

// =============================================================================
// Base External Sequence
// =============================================================================

class external_base_sequence : public uvm_sequence<external_transaction> {
public:
    UVM_OBJECT_UTILS(external_base_sequence)
    
    external_base_sequence(const std::string& name = "external_base_sequence") 
        : uvm_sequence<external_transaction>(name), 
          rng(std::random_device{}()) {}
    
protected:
    std::mt19937 rng;
    
    // Helper function to create test packet
    external_transaction* create_test_packet(int size, uint8_t source_port, uint8_t dest_port, 
                                           packet_type_t pkt_type = DATA, 
                                           channel_type_t channel = LOW_PRIORITY) {
        external_transaction* trans = new external_transaction("test_packet");
        
        // Create header
        internal_header_t header = {};
        header.source_port = source_port;
        header.dest_port = dest_port;
        header.channel_type = channel;
        header.packet_type = pkt_type;
        header.packet_length = size;
        header.reserved = 0;
        
        trans->header = *reinterpret_cast<uint64_t*>(&header);
        
        // Create data payload
        trans->data.resize(size);
        for (int i = 0; i < size; i++) {
            trans->data[i] = 0x10 + (i % 256);
        }
        
        trans->last = true;
        trans->delay_cycles = 0;
        
        return trans;
    }
};

// =============================================================================
// Single Packet Sequence
// =============================================================================

class single_packet_sequence : public external_base_sequence {
public:
    // Configurable parameters
    int packet_size;
    uint8_t source_port;
    uint8_t dest_port;
    packet_type_t packet_type;
    channel_type_t channel_type;
    
    UVM_OBJECT_UTILS(single_packet_sequence)
    
    single_packet_sequence(const std::string& name = "single_packet_sequence") 
        : external_base_sequence(name),
          packet_size(64),
          source_port(1),
          dest_port(2),
          packet_type(DATA),
          channel_type(LOW_PRIORITY) {}
    
    virtual void body() override {
        UVM_INFO(get_name(), "Starting single packet sequence", UVM_LOW);
        
        external_transaction* trans = create_test_packet(packet_size, source_port, dest_port, 
                                                       packet_type, channel_type);
        
        UVM_INFO(get_name(), 
                 ("Sending packet: " + trans->convert2string()).c_str(), 
                 UVM_MEDIUM);
        
        start_item(trans);
        finish_item(trans);
        
        UVM_INFO(get_name(), "Single packet sequence completed", UVM_LOW);
    }
};

// =============================================================================
// Multiple Packets Sequence
// =============================================================================

class multiple_packets_sequence : public external_base_sequence {
public:
    // Configurable parameters
    int num_packets;
    int min_size;
    int max_size;
    bool randomize_size;
    bool randomize_delay;
    int max_delay;
    
    UVM_OBJECT_UTILS(multiple_packets_sequence)
    
    multiple_packets_sequence(const std::string& name = "multiple_packets_sequence") 
        : external_base_sequence(name),
          num_packets(10),
          min_size(32),
          max_size(256),
          randomize_size(true),
          randomize_delay(true),
          max_delay(5) {}
    
    virtual void body() override {
        UVM_INFO(get_name(), 
                 ("Starting multiple packets sequence: " + std::to_string(num_packets) + " packets").c_str(), 
                 UVM_LOW);
        
        for (int i = 0; i < num_packets; i++) {
            // Determine packet size
            int pkt_size = randomize_size ? 
                          std::uniform_int_distribution<int>(min_size, max_size)(rng) : 
                          min_size;
            
            // Create packet
            external_transaction* trans = create_test_packet(pkt_size, 1, 2 + (i % 4));
            
            // Add delay if randomized
            if (randomize_delay && max_delay > 0) {
                trans->delay_cycles = std::uniform_int_distribution<int>(0, max_delay)(rng);
            }
            
            UVM_INFO(get_name(), 
                     ("Sending packet " + std::to_string(i+1) + "/" + std::to_string(num_packets) + 
                      ": " + trans->convert2string()).c_str(), 
                     UVM_MEDIUM);
            
            start_item(trans);
            finish_item(trans);
        }
        
        UVM_INFO(get_name(), "Multiple packets sequence completed", UVM_LOW);
    }
};

// =============================================================================
// Burst Packets Sequence (Back-to-back)
// =============================================================================

class burst_packets_sequence : public external_base_sequence {
public:
    int burst_size;
    int packet_size;
    
    UVM_OBJECT_UTILS(burst_packets_sequence)
    
    burst_packets_sequence(const std::string& name = "burst_packets_sequence") 
        : external_base_sequence(name),
          burst_size(5),
          packet_size(128) {}
    
    virtual void body() override {
        UVM_INFO(get_name(), 
                 ("Starting burst packets sequence: " + std::to_string(burst_size) + " packets").c_str(), 
                 UVM_LOW);
        
        for (int i = 0; i < burst_size; i++) {
            external_transaction* trans = create_test_packet(packet_size, 3, 1);
            
            // No delay for burst (back-to-back)
            trans->delay_cycles = 0;
            
            UVM_INFO(get_name(), 
                     ("Sending burst packet " + std::to_string(i+1) + "/" + std::to_string(burst_size)).c_str(), 
                     UVM_HIGH);
            
            start_item(trans);
            finish_item(trans);
        }
        
        UVM_INFO(get_name(), "Burst packets sequence completed", UVM_LOW);
    }
};

// =============================================================================
// Different Packet Types Sequence
// =============================================================================

class mixed_packet_types_sequence : public external_base_sequence {
public:
    UVM_OBJECT_UTILS(mixed_packet_types_sequence)
    
    mixed_packet_types_sequence(const std::string& name = "mixed_packet_types_sequence") 
        : external_base_sequence(name) {}
    
    virtual void body() override {
        UVM_INFO(get_name(), "Starting mixed packet types sequence", UVM_LOW);
        
        // Send DATA packet
        external_transaction* data_trans = create_test_packet(100, 1, 2, DATA, LOW_PRIORITY);
        UVM_INFO(get_name(), "Sending DATA packet", UVM_MEDIUM);
        start_item(data_trans);
        finish_item(data_trans);
        
        // Send CONTROL packet
        external_transaction* ctrl_trans = create_test_packet(64, 1, 3, CONTROL, HIGH_PRIORITY);
        UVM_INFO(get_name(), "Sending CONTROL packet", UVM_MEDIUM);
        start_item(ctrl_trans);
        finish_item(ctrl_trans);
        
        // Send CREDIT packet
        external_transaction* credit_trans = create_test_packet(32, 2, 1, CREDIT, LOW_PRIORITY);
        UVM_INFO(get_name(), "Sending CREDIT packet", UVM_MEDIUM);
        start_item(credit_trans);
        finish_item(credit_trans);
        
        UVM_INFO(get_name(), "Mixed packet types sequence completed", UVM_LOW);
    }
};

// =============================================================================
// Stress Test Sequence
// =============================================================================

class stress_test_sequence : public external_base_sequence {
public:
    int total_packets;
    int max_burst_size;
    
    UVM_OBJECT_UTILS(stress_test_sequence)
    
    stress_test_sequence(const std::string& name = "stress_test_sequence") 
        : external_base_sequence(name),
          total_packets(100),
          max_burst_size(10) {}
    
    virtual void body() override {
        UVM_INFO(get_name(), 
                 ("Starting stress test sequence: " + std::to_string(total_packets) + " packets").c_str(), 
                 UVM_LOW);
        
        int packets_sent = 0;
        
        while (packets_sent < total_packets) {
            // Random burst size
            int burst_size = std::uniform_int_distribution<int>(1, max_burst_size)(rng);
            burst_size = std::min(burst_size, total_packets - packets_sent);
            
            UVM_INFO(get_name(), 
                     ("Sending burst of " + std::to_string(burst_size) + " packets").c_str(), 
                     UVM_HIGH);
            
            // Send burst
            for (int i = 0; i < burst_size; i++) {
                int pkt_size = std::uniform_int_distribution<int>(32, 512)(rng);
                uint8_t dest = 1 + std::uniform_int_distribution<int>(0, 3)(rng);
                
                external_transaction* trans = create_test_packet(pkt_size, 1, dest);
                trans->delay_cycles = 0; // Back-to-back in burst
                
                start_item(trans);
                finish_item(trans);
                
                packets_sent++;
            }
            
            // Random inter-burst delay
            int inter_burst_delay = std::uniform_int_distribution<int>(1, 20)(rng);
            // Note: In real implementation, we'd wait here
        }
        
        UVM_INFO(get_name(), "Stress test sequence completed", UVM_LOW);
    }
};

} // namespace uvm_switch_verification

#endif // EXTERNAL_SEQUENCES_H