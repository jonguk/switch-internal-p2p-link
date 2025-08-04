#ifndef EGRESS_PORT_MANAGER_H
#define EGRESS_PORT_MANAGER_H

#include <systemc.h>
#include <queue>
#include <vector>
#include "../common/switch_types.h"

namespace switch_internal_p2p {

// =============================================================================
// Egress Port Manager
// =============================================================================

SC_MODULE(EgressPortManager) {
public:
    // =============================================================================
    // Ports and Signals
    // =============================================================================
    
    // Clock and Reset
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // AXIS Slave Interface (from Egress Queue Manager)
    sc_in<bool> axis_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_in<bool> axis_tlast;
    sc_out<bool> axis_tready;
    
    // External Interface (to external Ingressor)
    sc_out<bool> ext_valid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_out<bool> ext_last;
    sc_in<bool> ext_ready;
    
    // AXI Interface (to Port-level AXI Switch)
    sc_out<bool> axi_master_valid;
    sc_out<sc_bv<32>> axi_master_addr;
    sc_out<sc_bv<32>> axi_master_data;
    sc_in<bool> axi_master_ready;
    
    sc_in<bool> axi_slave_valid;
    sc_in<sc_bv<32>> axi_slave_addr;
    sc_in<sc_bv<32>> axi_slave_data;
    sc_out<bool> axi_slave_ready;
    
    // =============================================================================
    // Constructor and Destructor
    // =============================================================================
    
    SC_CTOR(EgressPortManager) : 
        port_id(0),
        packets_transmitted(0),
        packets_buffered(0) {
        
        // Initialize circular buffer
        circular_buffer.resize(BUFFER_SIZE);
        buffer_head = 0;
        buffer_tail = 0;
        buffer_count = 0;
        
        // Register processes
        SC_CTHREAD(axis_receive_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(external_transmit_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_METHOD(axi_slave_process);
        sensitive << axi_slave_valid << axi_slave_addr << axi_slave_data;
    }
    
    // =============================================================================
    // Configuration
    // =============================================================================
    
    void set_port_id(uint8_t id) { port_id = id; }
    uint8_t get_port_id() const { return port_id; }
    
    // =============================================================================
    // Statistics and Monitoring
    // =============================================================================
    
    uint64_t get_packets_transmitted() const { return packets_transmitted; }
    uint64_t get_packets_buffered() const { return packets_buffered; }
    uint32_t get_buffer_utilization() const { return buffer_count; }
    bool is_buffer_full() const { return buffer_count >= BUFFER_SIZE; }
    bool is_buffer_empty() const { return buffer_count == 0; }

private:
    // =============================================================================
    // Internal Types and Constants
    // =============================================================================
    
    static const size_t BUFFER_SIZE = 512;  // Single circular buffer size
    
    struct UnifiedPacketEntry {
        std::vector<uint8_t> packet_data;  // Complete packet (no Header/Payload separation)
        InternalHeader header;             // For format conversion reference
        uint32_t timestamp;
        bool valid;
        
        UnifiedPacketEntry() : timestamp(0), valid(false) {}
        
        size_t total_size() const {
            return packet_data.size();
        }
    };
    
    // =============================================================================
    // Member Variables
    // =============================================================================
    
    // Configuration
    uint8_t port_id;
    
    // Single Circular Buffer (unified packet storage)
    std::vector<UnifiedPacketEntry> circular_buffer;
    size_t buffer_head;
    size_t buffer_tail;
    size_t buffer_count;
    
    // Statistics
    uint64_t packets_transmitted;
    uint64_t packets_buffered;
    
    // Packet assembly for AXIS reception
    std::vector<uint8_t> current_packet_buffer;
    InternalHeader current_header;
    bool packet_in_progress;
    
    // External transmission state
    UnifiedPacketEntry current_tx_packet;
    bool ext_transmission_active;
    size_t ext_tx_offset;
    
    // =============================================================================
    // Process Declarations
    // =============================================================================
    
    void axis_receive_process();            // Receive from AXIS interface
    void external_transmit_process();       // Transmit to external interface
    void axi_slave_process();               // Handle AXI slave interface
    
    // =============================================================================
    // Helper Functions
    // =============================================================================
    
    void store_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header);
    bool retrieve_packet(UnifiedPacketEntry& packet);
    void convert_internal_to_external(const std::vector<uint8_t>& internal_data,
                                     const InternalHeader& header,
                                     std::vector<uint8_t>& external_data);
    void send_external_packet(const UnifiedPacketEntry& packet);
    void handle_bandwidth_mismatch();
    void process_latency_hiding();
};

} // namespace switch_internal_p2p

#endif // EGRESS_PORT_MANAGER_H