#ifndef PORT_ROUTER_IMPL_H
#define PORT_ROUTER_IMPL_H

#include "port_router.h"

namespace switch_internal_p2p {

// =============================================================================
// Template Implementation for PortRouter
// =============================================================================

template<int NUM_PORTS>
void PortRouter<NUM_PORTS>::create_queue_managers() {
    std::cout << "[PortRouter] Creating " << NUM_PORTS << " Ingress and Egress Queue Managers..." << std::endl;
    
    for (int i = 0; i < NUM_PORTS; i++) {
        // Create Ingress Queue Manager instance
        std::string ingress_name = "ingress_manager_" + std::to_string(i);
        ingress_managers[i] = new IngressQueueManager(ingress_name.c_str());
        
        // Create Egress Queue Manager instance
        std::string egress_name = "egress_manager_" + std::to_string(i);
        egress_managers[i] = new EgressQueueManager(egress_name.c_str());
        
        // Configure port IDs
        ingress_managers[i]->set_port_id(i);
        egress_managers[i]->set_port_id(i);
        
        // Connect clock and reset
        ingress_managers[i]->clk(clk);
        ingress_managers[i]->rst_n(rst_n);
        egress_managers[i]->clk(clk);
        egress_managers[i]->rst_n(rst_n);
        
        // Connect Ingress external AXIS interfaces (from external ports)
        ingress_managers[i]->axis_tvalid(ext_axis_in_tvalid[i]);
        ingress_managers[i]->axis_tdata(ext_axis_in_tdata[i]);
        ingress_managers[i]->axis_tkeep(ext_axis_in_tkeep[i]);
        ingress_managers[i]->axis_tuser(ext_axis_in_tuser[i]);
        ingress_managers[i]->axis_tlast(ext_axis_in_tlast[i]);
        ingress_managers[i]->axis_tready(ext_axis_in_tready[i]);
        
        // Connect Egress external AXIS interfaces (to external ports)
        egress_managers[i]->axis_tvalid(ext_axis_out_tvalid[i]);
        egress_managers[i]->axis_tdata(ext_axis_out_tdata[i]);
        egress_managers[i]->axis_tkeep(ext_axis_out_tkeep[i]);
        egress_managers[i]->axis_tuser(ext_axis_out_tuser[i]);
        egress_managers[i]->axis_tlast(ext_axis_out_tlast[i]);
        egress_managers[i]->axis_tready(ext_axis_out_tready[i]);
        
        // Connect Ingress internal AXIS output (to routing network)
        ingress_managers[i]->internal_tvalid(ingress_to_router_tvalid[i]);
        ingress_managers[i]->internal_tdata(ingress_to_router_tdata[i]);
        ingress_managers[i]->internal_tkeep(ingress_to_router_tkeep[i]);
        ingress_managers[i]->internal_tuser(ingress_to_router_tuser[i]);
        ingress_managers[i]->internal_tdest(ingress_to_router_tdest[i]);
        ingress_managers[i]->internal_tlast(ingress_to_router_tlast[i]);
        ingress_managers[i]->internal_tready(ingress_to_router_tready[i]);
        
        // Connect Egress internal AXIS input (from routing network)
        egress_managers[i]->internal_tvalid(router_to_egress_tvalid[i]);
        egress_managers[i]->internal_tdata(router_to_egress_tdata[i]);
        egress_managers[i]->internal_tkeep(router_to_egress_tkeep[i]);
        egress_managers[i]->internal_tuser(router_to_egress_tuser[i]);
        egress_managers[i]->internal_tdest(router_to_egress_tdest[i]);
        egress_managers[i]->internal_tlast(router_to_egress_tlast[i]);
        egress_managers[i]->internal_tready(router_to_egress_tready[i]);
        
        // Connect individual AXI interfaces for Ingress
        ingress_managers[i]->axi_master_valid(ingress_axi_master_valid[i]);
        ingress_managers[i]->axi_master_addr(ingress_axi_master_addr[i]);
        ingress_managers[i]->axi_master_data(ingress_axi_master_data[i]);
        ingress_managers[i]->axi_master_ready(ingress_axi_master_ready[i]);
        ingress_managers[i]->axi_slave_valid(ingress_axi_slave_valid[i]);
        ingress_managers[i]->axi_slave_addr(ingress_axi_slave_addr[i]);
        ingress_managers[i]->axi_slave_data(ingress_axi_slave_data[i]);
        ingress_managers[i]->axi_slave_ready(ingress_axi_slave_ready[i]);
        
        // Connect individual AXI interfaces for Egress
        egress_managers[i]->axi_master_valid(egress_axi_master_valid[i]);
        egress_managers[i]->axi_master_addr(egress_axi_master_addr[i]);
        egress_managers[i]->axi_master_data(egress_axi_master_data[i]);
        egress_managers[i]->axi_master_ready(egress_axi_master_ready[i]);
        egress_managers[i]->axi_slave_valid(egress_axi_slave_valid[i]);
        egress_managers[i]->axi_slave_addr(egress_axi_slave_addr[i]);
        egress_managers[i]->axi_slave_data(egress_axi_slave_data[i]);
        egress_managers[i]->axi_slave_ready(egress_axi_slave_ready[i]);
        
        // Connect credit return interface for Egress
        egress_managers[i]->credit_return_valid(credit_return_valid[i]);
        egress_managers[i]->credit_return_info(credit_return_info[i]);
        egress_managers[i]->credit_return_ready(credit_return_ready[i]);
        
        std::cout << "[PortRouter] Created Ingress and Egress Managers for port " << i << std::endl;
    }
}

template<int NUM_PORTS>
void PortRouter<NUM_PORTS>::connect_routing_network() {
    std::cout << "[PortRouter] Connecting AXIS routing network..." << std::endl;
    
    // Initialize internal AXIS signals and individual AXI interfaces
    for (int i = 0; i < NUM_PORTS; i++) {
        // Initialize ingress to router AXIS signals
        ingress_to_router_tvalid[i].write(false);
        ingress_to_router_tready[i].write(true);
        
        // Initialize router to egress AXIS signals
        router_to_egress_tvalid[i].write(false);
        router_to_egress_tready[i].write(true);
        
        // Initialize credit return
        credit_return_ready[i].write(true);
        
        // Initialize individual AXI signals for Ingress
        ingress_axi_master_valid[i].write(false);
        ingress_axi_master_ready[i].write(true);
        ingress_axi_slave_valid[i].write(false);
        ingress_axi_slave_ready[i].write(true);
        
        // Initialize individual AXI signals for Egress
        egress_axi_master_valid[i].write(false);
        egress_axi_master_ready[i].write(true);
        egress_axi_slave_valid[i].write(false);
        egress_axi_slave_ready[i].write(true);
    }
    
    std::cout << "[PortRouter] AXIS routing network connected" << std::endl;
}

template<int NUM_PORTS>
void PortRouter<NUM_PORTS>::initialize_routing_table() {
    std::cout << "[PortRouter] Initializing routing table..." << std::endl;
    
    // Default routing: each port routes to itself (loopback for testing)
    for (int i = 0; i < NUM_PORTS; i++) {
        routing_table[i] = i;
    }
    
    std::cout << "[PortRouter] Routing table initialized with loopback" << std::endl;
}

template<int NUM_PORTS>
void PortRouter<NUM_PORTS>::routing_core_process() {
    // Routing state for each ingress port
    std::array<bool, NUM_PORTS> routing_in_progress;
    std::array<uint8_t, NUM_PORTS> target_egress_port;
    std::array<int, NUM_PORTS> current_beat_count;
    
    // Initialize routing state
    for (int i = 0; i < NUM_PORTS; i++) {
        routing_in_progress[i] = false;
        target_egress_port[i] = 0;
        current_beat_count[i] = 0;
        tvalid_clear_needed[i] = false;
    }
    
    while (true) {
        wait(); // Wait for clock edge
        
        // Handle deferred tvalid clears (AXI Stream protocol compliance)
        for (int i = 0; i < NUM_PORTS; i++) {
            if (tvalid_clear_needed[i]) {
                router_to_egress_tvalid[i].write(false);
                tvalid_clear_needed[i] = false;
                std::cout << "[PortRouter] 🧹 Cleared tvalid for egress port " << i << std::endl;
            }
        }
        
        if (!rst_n.read()) {
            // Reset state
            total_packets_routed = 0;
            total_bytes_routed = 0;
            for (int i = 0; i < NUM_PORTS; i++) {
                routing_in_progress[i] = false;
                target_egress_port[i] = 0;
                current_beat_count[i] = 0;
                tvalid_clear_needed[i] = false;
            }
            continue;
        }
        
        // Process each ingress port
        for (int ingress_port = 0; ingress_port < NUM_PORTS; ingress_port++) {
            if (ingress_to_router_tvalid[ingress_port].read()) {
                if (!routing_in_progress[ingress_port]) {
                    // Start of new packet - extract routing info from tdest
                    sc_bv<AXIS_DEST_WIDTH> tdest = ingress_to_router_tdest[ingress_port].read();
                    uint8_t dest_port_id = tdest.range(7, 0).to_uint();
                    
                    // Map local port ID to egress port (simple direct mapping for now)
                    if (dest_port_id < NUM_PORTS) {
                        target_egress_port[ingress_port] = dest_port_id;
                    } else {
                        target_egress_port[ingress_port] = 0;  // Default to port 0
                    }
                    
                    routing_in_progress[ingress_port] = true;
                    current_beat_count[ingress_port] = 0;
                    
                    std::cout << "[PortRouter] 🚀 Started routing from ingress port " 
                              << ingress_port << " to egress port " 
                              << (int)target_egress_port[ingress_port] << std::endl;
                }
                
                uint8_t egress_port = target_egress_port[ingress_port];
                
                                    // Check if target egress is ready
                if (router_to_egress_tready[egress_port].read()) {
                    // Forward AXIS beat to target egress port
                    router_to_egress_tvalid[egress_port].write(true);
                    router_to_egress_tdata[egress_port].write(ingress_to_router_tdata[ingress_port].read());
                    router_to_egress_tkeep[egress_port].write(ingress_to_router_tkeep[ingress_port].read());
                    router_to_egress_tuser[egress_port].write(ingress_to_router_tuser[ingress_port].read());
                    router_to_egress_tdest[egress_port].write(ingress_to_router_tdest[ingress_port].read());
                    router_to_egress_tlast[egress_port].write(ingress_to_router_tlast[ingress_port].read());
                    
                    // DEBUG: Log actual signal transmission
                    std::cout << "[PortRouter] 📡 SIGNAL SENT: egress_port=" << (int)egress_port 
                              << ", tvalid=1, tlast=" << (ingress_to_router_tlast[ingress_port].read() ? "1" : "0")
                              << ", tready=" << (router_to_egress_tready[egress_port].read() ? "1" : "0") << std::endl;
                    
                    // Acknowledge ingress
                    ingress_to_router_tready[ingress_port].write(true);
                    
                    current_beat_count[ingress_port]++;
                    
                    // Check if this is the last beat
                    if (ingress_to_router_tlast[ingress_port].read()) {
                        // FIXED: Clear routing state immediately, but defer tvalid clear to next cycle
                        routing_in_progress[ingress_port] = false;
                        // Schedule tvalid clear for next cycle to follow AXI Stream protocol
                        tvalid_clear_needed[egress_port] = true;
                        total_packets_routed++;
                        
                        std::cout << "[PortRouter] ✅ Completed routing packet from port " 
                                  << ingress_port << " to port " << (int)egress_port
                                  << " in " << current_beat_count[ingress_port] << " beats" << std::endl;
                    }
                } else {
                    // Target egress not ready - backpressure
                    ingress_to_router_tready[ingress_port].write(false);
                }
            } else {
                // No data from this ingress port
                ingress_to_router_tready[ingress_port].write(true);
                
                // Clear routing state when ingress is no longer sending
                if (routing_in_progress[ingress_port]) {
                    routing_in_progress[ingress_port] = false;
                    // Don't immediately clear egress signals - let cleanup logic handle it
                }
            }
        }
        
        // 🚨 DISABLED: Signal cleanup logic removed to prevent delta cycle issues
        // Let Egress QM handle signal lifecycle naturally
        // Router only sets tvalid=true, never clears it in the same process
    }
}

template<int NUM_PORTS>
void PortRouter<NUM_PORTS>::credit_management_process() {
    while (true) {
        wait(); // Wait for clock edge
        
        if (!rst_n.read()) {
            // Reset all credits
            for (int p = 0; p < NUM_PORTS; p++) {
                for (int q = 0; q < MAX_QUEUES_PER_PORT; q++) {
                    shared_credits[p][q].write(DEFAULT_CREDITS);
                }
            }
            continue;
        }
        
        // Credit management logic would go here
        // For now, just maintain credits at default levels
    }
}

template<int NUM_PORTS>
void PortRouter<NUM_PORTS>::axi_slave_process() {
    if (!rst_n.read()) {
        axi_slave_ready.write(false);
        axi_master_valid.write(false);
        return;
    }
    
    // Simple AXI slave implementation
    axi_slave_ready.write(true);
    axi_master_valid.write(false);
    
    if (axi_slave_valid.read()) {
        uint32_t addr = axi_slave_addr.read().to_uint();
        uint32_t data = axi_slave_data.read().to_uint();
        
        // Handle AXI configuration writes
        switch (addr & 0xF0) {
            case 0x00: // Port configuration
                // Configure port-specific settings
                break;
            case 0x10: // Routing table configuration
                // Configure routing entries
                break;
            case 0x80: // 🚀 FIX: Global Port Mapping (forward to all Ingress QMs)
                {
                    std::cout << "[PortRouter] 📡 Forwarding Global Port mapping to all Ingress QMs: "
                              << "addr=0x" << std::hex << addr << ", data=0x" << data << std::dec << std::endl;
                    
                    // Handle 0x88: Set mapping: [31:16] = global_id, [7:0] = local_port
                    if ((addr & 0xFF) == 0x88) {
                        uint16_t global_id = (data >> 16) & 0xFFFF;
                        uint8_t local_port = data & 0xFF;
                        
                        // Set mapping on all Ingress Queue Managers
                        for (int port = 0; port < NUM_PORTS; port++) {
                            if (ingress_managers[port]) {
                                ingress_managers[port]->set_global_to_local_mapping(global_id, local_port);
                                std::cout << "[PortRouter] ✅ Set mapping on QM" << port 
                                          << ": Global " << global_id << " → Local " << (int)local_port << std::endl;
                            }
                        }
                    }
                }
                break;
            default:
                break;
        }
    }
}

template<int NUM_PORTS>
void PortRouter<NUM_PORTS>::update_port_stats(int port_id, const PacketEntry& packet, bool is_ingress) {
    if (port_id >= 0 && port_id < NUM_PORTS) {
        if (is_ingress) {
            port_stats[port_id].packets_received++;
            port_stats[port_id].bytes_received += packet.total_size;
        } else {
            port_stats[port_id].packets_transmitted++;
            port_stats[port_id].bytes_transmitted += packet.total_size;
        }
        port_stats[port_id].last_activity = sc_time_stamp();
    }
}

template<int NUM_PORTS>
uint8_t PortRouter<NUM_PORTS>::route_packet(const PacketEntry& packet) {
    uint8_t dest_port = packet.header.dest_port;
    
    // Use routing table to determine output port
    if (dest_port < NUM_PORTS) {
        return routing_table[dest_port];
    }
    
    // Default to port 0 for unknown destinations
    return 0;
}

} // namespace switch_internal_p2p

#endif // PORT_ROUTER_IMPL_H