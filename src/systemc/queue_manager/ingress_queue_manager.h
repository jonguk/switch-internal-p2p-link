#ifndef INGRESS_QUEUE_MANAGER_H
#define INGRESS_QUEUE_MANAGER_H

#include <systemc.h>
#include <queue>
#include <vector>
#include <array>
#include "../common/switch_types.h"

namespace switch_internal_p2p {

// =============================================================================
// Ingress Queue Manager
// =============================================================================

SC_MODULE(IngressQueueManager) {
public:
    // =============================================================================
    // Ports and Signals
    // =============================================================================
    
    // Clock and Reset
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // AXIS Slave Interface (from Ingress Port Manager)
    sc_in<bool> axis_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_in<bool> axis_tlast;
    sc_out<bool> axis_tready;  // Always ready (no backpressure)
    
    // Internal AXIS Interface (to Routing & Switching Core / Egress Queue Manager)
    sc_out<bool> internal_tvalid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> internal_tdata;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> internal_tkeep;
    sc_out<sc_bv<AXIS_USER_WIDTH>> internal_tuser;  // Local port mapping info
    sc_out<sc_bv<AXIS_DEST_WIDTH>> internal_tdest;  // Local destination port for routing
    sc_out<bool> internal_tlast;
    sc_in<bool> internal_tready;
    
    // AXI Interface (to Port-level AXI Switch)
    sc_out<bool> axi_master_valid;
    sc_out<sc_bv<32>> axi_master_addr;
    sc_out<sc_bv<32>> axi_master_data;
    sc_in<bool> axi_master_ready;
    
    sc_in<bool> axi_slave_valid;
    sc_in<sc_bv<32>> axi_slave_addr;
    sc_in<sc_bv<32>> axi_slave_data;
    sc_out<bool> axi_slave_ready;
    
    // Shared Credit Variables (with Egress Queue Manager)
    // Note: In actual implementation, this would be through shared memory
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> shared_available_credits;
    
    // =============================================================================
    // Constructor and Destructor
    // =============================================================================
    
    SC_CTOR(IngressQueueManager) : 
        port_id(0),
        total_packets_processed(0),
        total_credits_added(0) {
        
        // Initialize queue buffers
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            queue_stats[i] = QueueStats();
            packet_queues[i] = std::queue<PacketEntry>();
        }
        
        // Register processes
        SC_CTHREAD(axis_receive_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(packet_processing_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(internal_transmit_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_METHOD(axi_slave_process);
        sensitive << axi_slave_valid << axi_slave_addr << axi_slave_data;
        
        // Initialize shared credit variables
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            shared_available_credits[i].write(DEFAULT_CREDITS);
        }
        
        // 🚀 Initialize Global Port ID Lookup Table
        initialize_lookup_table();
    }
    
    // =============================================================================
    // Configuration
    // =============================================================================
    
    void set_port_id(uint8_t id) { port_id = id; }
    uint8_t get_port_id() const { return port_id; }
    
    // =============================================================================
    // Statistics and Monitoring
    // =============================================================================
    
    const QueueStats& get_queue_stats(uint8_t queue_id) const {
        return queue_stats[queue_id % MAX_QUEUES_PER_PORT];
    }
    
    uint64_t get_total_packets_processed() const { return total_packets_processed; }
    uint64_t get_total_credits_added() const { return total_credits_added; }
    
    // Credit management for external access
    uint16_t get_available_credits(uint8_t queue_id) const {
        return shared_available_credits[queue_id % MAX_QUEUES_PER_PORT].read();
    }
    
    void add_credits(uint8_t queue_id, uint16_t credits) {
        uint8_t qid = queue_id % MAX_QUEUES_PER_PORT;
        uint16_t current = shared_available_credits[qid].read();
        uint16_t new_credits = std::min((uint32_t)current + credits, (uint32_t)MAX_CREDITS_PER_QUEUE);
        shared_available_credits[qid].write(new_credits);
        total_credits_added += credits;
    }
    
    // 🚀 Global Port ID Mapping Functions
    void initialize_lookup_table();                                    // Initialize with default values
    void set_global_to_local_mapping(uint16_t global_id, uint8_t local_port);  // Set single mapping
    uint8_t lookup_global_to_local(uint16_t global_id) const;         // Perform lookup
    bool is_lookup_table_ready() const { return lookup_table_initialized; }

private:
    // =============================================================================
    // Internal Types and Constants
    // =============================================================================
    
    static const size_t QUEUE_DEPTH = 256;  // Maximum packets per queue
    
    // =============================================================================
    // Member Variables
    // =============================================================================
    
    // Configuration
    uint8_t port_id;
    
    // 🚀 Global Port ID → Local Port Number Mapping (12-bit)
    static const uint32_t MAX_GLOBAL_PORTS = 4096;   // Maximum global port IDs (2^12)
    std::array<uint8_t, MAX_GLOBAL_PORTS> global_to_local_lookup;  // Lookup table
    bool lookup_table_initialized;
    
    // Queue Management (unified packet storage - no Header/Payload separation)
    std::array<std::queue<PacketEntry>, MAX_QUEUES_PER_PORT> packet_queues;
    std::array<QueueStats, MAX_QUEUES_PER_PORT> queue_stats;
    
    // Statistics
    uint64_t total_packets_processed;
    uint64_t total_credits_added;
    
    // Packet assembly buffer
    std::vector<uint8_t> current_packet_data;
    InternalHeader current_header;
    bool packet_in_assembly;
    
    // Internal transmission queue
    std::queue<PacketEntry> internal_tx_queue;
    
    // =============================================================================
    // Process Declarations
    // =============================================================================
    
    void axis_receive_process();            // Receive AXIS packets
    void packet_processing_process();       // Process and convert packets
    void internal_transmit_process();       // Transmit to internal bus
    void axi_slave_process();               // Handle AXI slave interface
    
    // =============================================================================
    // Helper Functions
    // =============================================================================
    
    void process_received_packet(const std::vector<uint8_t>& packet_data, 
                                const InternalHeader& header);
    void convert_raw_to_internal(const std::vector<uint8_t>& raw_data,
                                const InternalHeader& header,
                                PacketEntry& packet_entry);
    void extract_and_process_credits(const InternalHeader& header);
    void send_axis_beat(const PacketEntry& packet, size_t beat_index);
    bool enqueue_packet(uint8_t queue_id, const PacketEntry& packet);
    bool dequeue_packet(uint8_t queue_id, PacketEntry& packet);
    void update_queue_stats(uint8_t queue_id, const PacketEntry& packet, bool is_enqueue);
};

} // namespace switch_internal_p2p

#endif // INGRESS_QUEUE_MANAGER_H