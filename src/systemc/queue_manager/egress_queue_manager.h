#ifndef EGRESS_QUEUE_MANAGER_H
#define EGRESS_QUEUE_MANAGER_H

#include <systemc.h>
#include <queue>
#include <vector>
#include <array>
#include "../common/switch_types.h"

namespace switch_internal_p2p {

// =============================================================================
// Egress Queue Manager
// =============================================================================

SC_MODULE(EgressQueueManager) {
public:
    // =============================================================================
    // Ports and Signals
    // =============================================================================
    
    // Clock and Reset
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Internal AXIS Interface (from Routing & Switching Core / Ingress Queue Manager)
    sc_in<bool> internal_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> internal_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> internal_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> internal_tuser;   // Local port mapping info
    sc_in<sc_bv<AXIS_DEST_WIDTH>> internal_tdest;   // Local destination port for routing
    sc_in<bool> internal_tlast;
    sc_out<bool> internal_tready;
    
    // AXIS Master Interface (to Egress Port Manager)
    sc_out<bool> axis_tvalid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_out<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_out<bool> axis_tlast;
    sc_in<bool> axis_tready;
    
    // AXI Interface (to Port-level AXI Switch)
    sc_out<bool> axi_master_valid;
    sc_out<sc_bv<32>> axi_master_addr;
    sc_out<sc_bv<32>> axi_master_data;
    sc_in<bool> axi_master_ready;
    
    sc_in<bool> axi_slave_valid;
    sc_in<sc_bv<32>> axi_slave_addr;
    sc_in<sc_bv<32>> axi_slave_data;
    sc_out<bool> axi_slave_ready;
    
    // Credit Return Interface (to source Ingress Queue Manager)
    sc_out<bool> credit_return_valid;
    sc_out<CreditInfo> credit_return_info;
    sc_in<bool> credit_return_ready;
    
    // =============================================================================
    // Constructor and Destructor
    // =============================================================================
    
    SC_CTOR(EgressQueueManager) : 
        port_id(0),
        shared_available_credits(nullptr),
        total_packets_transmitted(0),
        total_credits_consumed(0) {
        
        // Initialize queue buffers
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            queue_stats[i] = QueueStats();
            packet_queues[i] = std::queue<PacketEntry>();
        }
        
        // Register processes
        SC_CTHREAD(internal_receive_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(credit_based_scheduling_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(axis_transmit_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(credit_return_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_METHOD(axi_slave_process);
        sensitive << axi_slave_valid << axi_slave_addr << axi_slave_data;
    }
    
    // =============================================================================
    // Configuration
    // =============================================================================
    
    void set_port_id(uint8_t id) { port_id = id; }
    uint8_t get_port_id() const { return port_id; }
    
    void set_shared_credits(std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT>* credits) {
        shared_available_credits = credits;
    }
    
    // =============================================================================
    // Statistics and Monitoring
    // =============================================================================
    
    const QueueStats& get_queue_stats(uint8_t queue_id) const {
        return queue_stats[queue_id % MAX_QUEUES_PER_PORT];
    }
    
    uint64_t get_total_packets_transmitted() const { return total_packets_transmitted; }
    uint64_t get_total_credits_consumed() const { return total_credits_consumed; }
    
    // Credit management
    uint16_t get_available_credits(uint8_t queue_id) const {
        if (shared_available_credits) {
            return (*shared_available_credits)[queue_id % MAX_QUEUES_PER_PORT].read();
        }
        return 0;
    }
    
    bool consume_credits(uint8_t queue_id, uint16_t credits) {
        if (!shared_available_credits) return false;
        
        uint8_t qid = queue_id % MAX_QUEUES_PER_PORT;
        uint16_t current = (*shared_available_credits)[qid].read();
        
        if (current >= credits) {
            (*shared_available_credits)[qid].write(current - credits);
            total_credits_consumed += credits;
            return true;
        }
        return false;
    }

private:
    // =============================================================================
    // Internal Types and Constants
    // =============================================================================
    
    static const size_t QUEUE_DEPTH = 256;  // Maximum packets per queue
    static const size_t MIN_PACKETS_PER_QUEUE = 2;  // Minimum buffering
    
    struct SchedulingEntry {
        uint8_t queue_id;
        Priority priority;
        uint16_t required_credits;
        PacketEntry packet;
        
        SchedulingEntry() : queue_id(0), priority(Priority::LOW), required_credits(1) {}
    };
    
    // =============================================================================
    // Member Variables
    // =============================================================================
    
    // Configuration
    uint8_t port_id;
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT>* shared_available_credits;
    
    // Queue Management (unified packet storage - no Header/Payload separation)
    std::array<std::queue<PacketEntry>, MAX_QUEUES_PER_PORT> packet_queues;
    std::array<QueueStats, MAX_QUEUES_PER_PORT> queue_stats;
    
    // Scheduling
    std::queue<SchedulingEntry> scheduled_packets;
    
    // Statistics
    uint64_t total_packets_transmitted;
    uint64_t total_credits_consumed;
    
    // AXIS transmission state
    PacketEntry current_tx_packet;
    bool axis_transmission_active;
    size_t axis_tx_offset;
    
    // =============================================================================
    // Process Declarations
    // =============================================================================
    
    void internal_receive_process();        // Receive from internal bus
    void credit_based_scheduling_process(); // Credit-based queue scheduling
    void axis_transmit_process();           // Transmit AXIS packets
    void credit_return_process();           // Return credits to source
    void axi_slave_process();               // Handle AXI slave interface
    
    // =============================================================================
    // Helper Functions
    // =============================================================================
    
    bool enqueue_packet(uint8_t queue_id, const PacketEntry& packet);
    bool dequeue_packet(uint8_t queue_id, PacketEntry& packet);
    uint8_t select_highest_priority_queue();
    uint16_t calculate_required_credits(const PacketEntry& packet);
    void send_axis_packet(const PacketEntry& packet);
    void return_credits_to_source(const PacketEntry& packet);
    void update_queue_stats(uint8_t queue_id, const PacketEntry& packet, bool is_enqueue);
    Priority get_packet_priority(const PacketEntry& packet);
};

} // namespace switch_internal_p2p

#endif // EGRESS_QUEUE_MANAGER_H