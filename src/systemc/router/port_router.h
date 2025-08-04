#ifndef PORT_ROUTER_H
#define PORT_ROUTER_H

#include <systemc.h>
#include <vector>
#include <array>
#include "../common/switch_types.h"
#include "../queue_manager/ingress_queue_manager.h"
#include "../queue_manager/egress_queue_manager.h"

namespace switch_internal_p2p {

// =============================================================================
// Port Statistics Structure (forward declaration)
// =============================================================================

struct PortStats {
    uint64_t packets_received;      // Total packets received on this port
    uint64_t packets_transmitted;   // Total packets transmitted from this port
    uint64_t bytes_received;        // Total bytes received
    uint64_t bytes_transmitted;     // Total bytes transmitted  
    uint64_t packets_dropped;       // Packets dropped due to congestion
    uint32_t current_queue_depth;   // Current total queue depth
    sc_time last_activity;          // Last activity timestamp
    
    PortStats() : packets_received(0), packets_transmitted(0),
                  bytes_received(0), bytes_transmitted(0),
                  packets_dropped(0), current_queue_depth(0),
                  last_activity(SC_ZERO_TIME) {}
};

// =============================================================================
// Port Router - N개 포트를 지원하는 Parameterized Router
// =============================================================================

template<int NUM_PORTS>
SC_MODULE(PortRouter) {
public:
    // =============================================================================
    // Template Parameter Validation
    // =============================================================================
    static_assert(NUM_PORTS > 0 && NUM_PORTS <= 32, "NUM_PORTS must be between 1 and 32");
    
    // =============================================================================
    // Ports and Signals
    // =============================================================================
    
    // Clock and Reset
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // External AXIS Interfaces (per port)
    std::array<sc_in<bool>, NUM_PORTS> ext_axis_in_tvalid;
    std::array<sc_in<sc_bv<AXIS_DATA_WIDTH>>, NUM_PORTS> ext_axis_in_tdata;
    std::array<sc_in<sc_bv<AXIS_KEEP_WIDTH>>, NUM_PORTS> ext_axis_in_tkeep;
    std::array<sc_in<sc_bv<AXIS_USER_WIDTH>>, NUM_PORTS> ext_axis_in_tuser;
    std::array<sc_in<bool>, NUM_PORTS> ext_axis_in_tlast;
    std::array<sc_out<bool>, NUM_PORTS> ext_axis_in_tready;
    
    std::array<sc_out<bool>, NUM_PORTS> ext_axis_out_tvalid;
    std::array<sc_out<sc_bv<AXIS_DATA_WIDTH>>, NUM_PORTS> ext_axis_out_tdata;
    std::array<sc_out<sc_bv<AXIS_KEEP_WIDTH>>, NUM_PORTS> ext_axis_out_tkeep;
    std::array<sc_out<sc_bv<AXIS_USER_WIDTH>>, NUM_PORTS> ext_axis_out_tuser;
    std::array<sc_out<bool>, NUM_PORTS> ext_axis_out_tlast;
    std::array<sc_in<bool>, NUM_PORTS> ext_axis_out_tready;
    
    // Global AXI Interface (for configuration and monitoring)
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
    
    SC_CTOR(PortRouter) : 
        routing_table(),
        total_packets_routed(0),
        total_bytes_routed(0),
        port_stats()
    {
        // Initialize routing table
        initialize_routing_table();
        
        // Initialize port statistics
        for (int i = 0; i < NUM_PORTS; i++) {
            port_stats[i] = PortStats();
        }
        
        // Create and connect Queue Managers
        create_queue_managers();
        
        // Connect internal routing network
        connect_routing_network();
        
        // Register SystemC processes
        SC_CTHREAD(routing_core_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(credit_management_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_METHOD(axi_slave_process);
        sensitive << axi_slave_valid << axi_slave_addr << axi_slave_data;
        
        std::cout << "[PortRouter] Created with " << NUM_PORTS << " ports" << std::endl;
    }
    
    ~PortRouter() {
        // Clean up dynamically allocated Queue Managers
        for (int i = 0; i < NUM_PORTS; i++) {
            if (ingress_managers[i]) {
                delete ingress_managers[i];
            }
            if (egress_managers[i]) {
                delete egress_managers[i];
            }
        }
    }
    
    // =============================================================================
    // Public Configuration Methods
    // =============================================================================
    
    void set_routing_entry(uint8_t dest_port, uint8_t output_port) {
        if (dest_port < NUM_PORTS && output_port < NUM_PORTS) {
            routing_table[dest_port] = output_port;
            std::cout << "[PortRouter] Set routing: dest_port=" << (int)dest_port 
                      << " -> output_port=" << (int)output_port << std::endl;
        }
    }
    
    uint8_t get_routing_entry(uint8_t dest_port) const {
        if (dest_port < NUM_PORTS) {
            return routing_table[dest_port];
        }
        return 0; // Default to port 0
    }
    
    // Performance monitoring
    uint64_t get_total_packets_routed() const { return total_packets_routed; }
    uint64_t get_total_bytes_routed() const { return total_bytes_routed; }
    
    PortStats get_port_stats(int port_id) const {
        if (port_id >= 0 && port_id < NUM_PORTS) {
            return port_stats[port_id];
        }
        return PortStats();
    }
    
    IngressQueueManager* get_ingress_manager(int port_id) {
        if (port_id >= 0 && port_id < NUM_PORTS) {
            return ingress_managers[port_id];
        }
        return nullptr;
    }
    
    EgressQueueManager* get_egress_manager(int port_id) {
        if (port_id >= 0 && port_id < NUM_PORTS) {
            return egress_managers[port_id];
        }
        return nullptr;
    }
    
    static constexpr int get_num_ports() { return NUM_PORTS; }

private:
    // =============================================================================
    // Internal State Variables
    // =============================================================================
    
    // Queue Manager instances (Ingress and Egress per port)
    std::array<IngressQueueManager*, NUM_PORTS> ingress_managers;
    std::array<EgressQueueManager*, NUM_PORTS> egress_managers;
    
    // Routing table
    std::array<uint8_t, NUM_PORTS> routing_table;
    
    // Internal AXIS interconnect signals (Ingress → Routing Network)
    std::array<sc_signal<bool>, NUM_PORTS> ingress_to_router_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, NUM_PORTS> ingress_to_router_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, NUM_PORTS> ingress_to_router_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, NUM_PORTS> ingress_to_router_tuser;
    std::array<sc_signal<sc_bv<AXIS_DEST_WIDTH>>, NUM_PORTS> ingress_to_router_tdest;
    std::array<sc_signal<bool>, NUM_PORTS> ingress_to_router_tlast;
    std::array<sc_signal<bool>, NUM_PORTS> ingress_to_router_tready;
    
    // Internal AXIS interconnect signals (Routing Network → Egress)
    std::array<sc_signal<bool>, NUM_PORTS> router_to_egress_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, NUM_PORTS> router_to_egress_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, NUM_PORTS> router_to_egress_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, NUM_PORTS> router_to_egress_tuser;
    std::array<sc_signal<sc_bv<AXIS_DEST_WIDTH>>, NUM_PORTS> router_to_egress_tdest;
    std::array<sc_signal<bool>, NUM_PORTS> router_to_egress_tlast;
    std::array<sc_signal<bool>, NUM_PORTS> router_to_egress_tready;
    
    // Individual AXI interfaces for Ingress Queue Managers
    std::array<sc_signal<bool>, NUM_PORTS> ingress_axi_master_valid;
    std::array<sc_signal<sc_bv<32>>, NUM_PORTS> ingress_axi_master_addr;
    std::array<sc_signal<sc_bv<32>>, NUM_PORTS> ingress_axi_master_data;
    std::array<sc_signal<bool>, NUM_PORTS> ingress_axi_master_ready;
    std::array<sc_signal<bool>, NUM_PORTS> ingress_axi_slave_valid;
    std::array<sc_signal<sc_bv<32>>, NUM_PORTS> ingress_axi_slave_addr;
    std::array<sc_signal<sc_bv<32>>, NUM_PORTS> ingress_axi_slave_data;
    std::array<sc_signal<bool>, NUM_PORTS> ingress_axi_slave_ready;
    
    // Individual AXI interfaces for Egress Queue Managers
    std::array<sc_signal<bool>, NUM_PORTS> egress_axi_master_valid;
    std::array<sc_signal<sc_bv<32>>, NUM_PORTS> egress_axi_master_addr;
    std::array<sc_signal<sc_bv<32>>, NUM_PORTS> egress_axi_master_data;
    std::array<sc_signal<bool>, NUM_PORTS> egress_axi_master_ready;
    std::array<sc_signal<bool>, NUM_PORTS> egress_axi_slave_valid;
    std::array<sc_signal<sc_bv<32>>, NUM_PORTS> egress_axi_slave_addr;
    std::array<sc_signal<sc_bv<32>>, NUM_PORTS> egress_axi_slave_data;
    std::array<sc_signal<bool>, NUM_PORTS> egress_axi_slave_ready;
    
    // Credit management
    std::array<std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT>, NUM_PORTS> shared_credits;
    std::array<sc_signal<bool>, NUM_PORTS> credit_return_valid;
    std::array<sc_signal<CreditInfo>, NUM_PORTS> credit_return_info;
    std::array<sc_signal<bool>, NUM_PORTS> credit_return_ready;
    
    // Statistics
    uint64_t total_packets_routed;
    uint64_t total_bytes_routed;
    std::array<PortStats, NUM_PORTS> port_stats;
    
    // AXI Stream protocol compliance
    std::array<bool, NUM_PORTS> tvalid_clear_needed;
    
    // =============================================================================
    // SystemC Processes
    // =============================================================================
    
    void routing_core_process();        // Central routing logic
    void credit_management_process();   // Credit system management
    void axi_slave_process();          // AXI configuration interface
    
    // =============================================================================
    // Helper Functions
    // =============================================================================
    
    void create_queue_managers();
    void connect_routing_network();
    void initialize_routing_table();
    void update_port_stats(int port_id, const PacketEntry& packet, bool is_ingress);
    uint8_t route_packet(const PacketEntry& packet);
};

} // namespace switch_internal_p2p

// Include template implementation
#include "port_router_impl.h"

#endif // PORT_ROUTER_H