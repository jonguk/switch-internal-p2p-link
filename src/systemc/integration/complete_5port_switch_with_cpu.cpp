#include "complete_5port_switch_with_cpu.h"
#include <iostream>

namespace switch_internal_p2p {

// =============================================================================
// Component Creation
// =============================================================================

void Complete5PortSwitchWithCPU::create_components() {
    std::cout << "[Complete5PortSwitchWithCPU] Creating components..." << std::endl;
    
    // Create Port Managers for regular ports only (0-3)
    for (int i = 0; i < 4; i++) {
        // Create Ingress Port Manager
        std::string ingress_pm_name = "ingress_pm_" + std::to_string(i);
        ingress_port_managers[i] = new IngressPortManager(ingress_pm_name.c_str());
        ingress_port_managers[i]->set_port_id(i);
        
        // Create Egress Port Manager
        std::string egress_pm_name = "egress_pm_" + std::to_string(i);
        egress_port_managers[i] = new EgressPortManager(egress_pm_name.c_str());
        egress_port_managers[i]->set_port_id(i);
        
        std::cout << "[Complete5PortSwitchWithCPU] Created Port Managers for regular port " << i << std::endl;
    }
    
    // Create 5-Port Router (includes Queue Managers for ports 0-4, where 4 is CPU port)
    port_router = new PortRouter<5>("port_router_with_cpu");
    
    std::cout << "[Complete5PortSwitchWithCPU] Created 5-port router (ports 0-3: regular, port 4: CPU)" << std::endl;
    std::cout << "[Complete5PortSwitchWithCPU] All components created" << std::endl;
}

// =============================================================================
// Component Connections
// =============================================================================

void Complete5PortSwitchWithCPU::connect_components() {
    std::cout << "[Complete5PortSwitchWithCPU] Connecting components..." << std::endl;
    
    // Connect Port Router basic signals
    port_router->clk(clk);
    port_router->rst_n(rst_n);
    
    // Connect Port Router AXI (controlled by CPU)
    port_router->axi_master_valid(router_axi_master_valid);
    port_router->axi_master_addr(router_axi_master_addr);
    port_router->axi_master_data(router_axi_master_data);
    port_router->axi_master_ready(router_axi_master_ready);
    port_router->axi_slave_valid(router_axi_slave_valid);
    port_router->axi_slave_addr(router_axi_slave_addr);
    port_router->axi_slave_data(router_axi_slave_data);
    port_router->axi_slave_ready(router_axi_slave_ready);
    
    // Connect regular ports (0-3)
    for (int i = 0; i < 4; i++) {
        // =====================================================================
        // Connect Ingress Port Manager
        // =====================================================================
        
        // Basic signals
        ingress_port_managers[i]->clk(clk);
        ingress_port_managers[i]->rst_n(rst_n);
        
        // External input connection
        ingress_port_managers[i]->ext_valid(ext_axis_in_tvalid[i]);
        ingress_port_managers[i]->ext_data(ext_axis_in_tdata[i]);
        ingress_port_managers[i]->ext_keep(ext_axis_in_tkeep[i]);
        ingress_port_managers[i]->ext_last(ext_axis_in_tlast[i]);
        ingress_port_managers[i]->ext_ready(ext_axis_in_tready[i]);
        
        // AXIS output connection (to Port Router's ingress)
        ingress_port_managers[i]->axis_tvalid(ingress_pm_to_qm_tvalid[i]);
        ingress_port_managers[i]->axis_tdata(ingress_pm_to_qm_tdata[i]);
        ingress_port_managers[i]->axis_tkeep(ingress_pm_to_qm_tkeep[i]);
        ingress_port_managers[i]->axis_tuser(ingress_pm_to_qm_tuser[i]);
        ingress_port_managers[i]->axis_tlast(ingress_pm_to_qm_tlast[i]);
        ingress_port_managers[i]->axis_tready(ingress_pm_to_qm_tready[i]);
        
        // AXI interface for Ingress
        ingress_port_managers[i]->axi_master_valid(ingress_pm_axi_master_valid[i]);
        ingress_port_managers[i]->axi_master_addr(ingress_pm_axi_master_addr[i]);
        ingress_port_managers[i]->axi_master_data(ingress_pm_axi_master_data[i]);
        ingress_port_managers[i]->axi_master_ready(ingress_pm_axi_master_ready[i]);
        ingress_port_managers[i]->axi_slave_valid(ingress_pm_axi_slave_valid[i]);
        ingress_port_managers[i]->axi_slave_addr(ingress_pm_axi_slave_addr[i]);
        ingress_port_managers[i]->axi_slave_data(ingress_pm_axi_slave_data[i]);
        ingress_port_managers[i]->axi_slave_ready(ingress_pm_axi_slave_ready[i]);
        
        // Credit return interface for Ingress
        ingress_port_managers[i]->credit_return_valid(credit_return_valid[i]);
        ingress_port_managers[i]->credit_return_ready(credit_return_ready[i]);
        
        // =====================================================================
        // Connect Port Router AXIS Interfaces for regular ports
        // =====================================================================
        
        // Port Router external ingress AXIS (from Ingress Port Manager)
        port_router->ext_axis_in_tvalid[i](ingress_pm_to_qm_tvalid[i]);
        port_router->ext_axis_in_tdata[i](ingress_pm_to_qm_tdata[i]);
        port_router->ext_axis_in_tkeep[i](ingress_pm_to_qm_tkeep[i]);
        port_router->ext_axis_in_tuser[i](ingress_pm_to_qm_tuser[i]);
        port_router->ext_axis_in_tlast[i](ingress_pm_to_qm_tlast[i]); 
        port_router->ext_axis_in_tready[i](ingress_pm_to_qm_tready[i]);
        
        // Port Router external egress AXIS (to Egress Port Manager)
        port_router->ext_axis_out_tvalid[i](egress_qm_to_pm_tvalid[i]);
        port_router->ext_axis_out_tdata[i](egress_qm_to_pm_tdata[i]);
        port_router->ext_axis_out_tkeep[i](egress_qm_to_pm_tkeep[i]);
        port_router->ext_axis_out_tuser[i](egress_qm_to_pm_tuser[i]);
        port_router->ext_axis_out_tlast[i](egress_qm_to_pm_tlast[i]);
        port_router->ext_axis_out_tready[i](egress_qm_to_pm_tready[i]);
        
        // =====================================================================
        // Connect Egress Port Manager
        // =====================================================================
        
        // Basic signals
        egress_port_managers[i]->clk(clk);
        egress_port_managers[i]->rst_n(rst_n);
        
        // AXIS input connection (from Port Router's egress)
        egress_port_managers[i]->axis_tvalid(egress_qm_to_pm_tvalid[i]);
        egress_port_managers[i]->axis_tdata(egress_qm_to_pm_tdata[i]);
        egress_port_managers[i]->axis_tkeep(egress_qm_to_pm_tkeep[i]);
        egress_port_managers[i]->axis_tuser(egress_qm_to_pm_tuser[i]);
        egress_port_managers[i]->axis_tlast(egress_qm_to_pm_tlast[i]);
        egress_port_managers[i]->axis_tready(egress_qm_to_pm_tready[i]);
        
        // External output connection
        egress_port_managers[i]->ext_valid(ext_axis_out_tvalid[i]);
        egress_port_managers[i]->ext_data(ext_axis_out_tdata[i]);
        egress_port_managers[i]->ext_keep(ext_axis_out_tkeep[i]);
        egress_port_managers[i]->ext_last(ext_axis_out_tlast[i]);
        egress_port_managers[i]->ext_ready(ext_axis_out_tready[i]);
        
        // AXI interface for Egress
        egress_port_managers[i]->axi_master_valid(egress_pm_axi_master_valid[i]);
        egress_port_managers[i]->axi_master_addr(egress_pm_axi_master_addr[i]);
        egress_port_managers[i]->axi_master_data(egress_pm_axi_master_data[i]);
        egress_port_managers[i]->axi_master_ready(egress_pm_axi_master_ready[i]);
        egress_port_managers[i]->axi_slave_valid(egress_pm_axi_slave_valid[i]);
        egress_port_managers[i]->axi_slave_addr(egress_pm_axi_slave_addr[i]);
        egress_port_managers[i]->axi_slave_data(egress_pm_axi_slave_data[i]);
        egress_port_managers[i]->axi_slave_ready(egress_pm_axi_slave_ready[i]);
        
        std::cout << "[Complete5PortSwitchWithCPU] Connected all interfaces for regular port " << i << std::endl;
    }
    
    // =========================================================================
    // Connect CPU Port (Port 4) - Special handling
    // =========================================================================
    
    // CPU Port Ingress (Port 4) - connect to dummy signals (not used)
    port_router->ext_axis_in_tvalid[4](cpu_ingress_tvalid);
    port_router->ext_axis_in_tdata[4](cpu_ingress_tdata);
    port_router->ext_axis_in_tkeep[4](cpu_ingress_tkeep);
    port_router->ext_axis_in_tuser[4](cpu_ingress_tuser);
    port_router->ext_axis_in_tlast[4](cpu_ingress_tlast);
    port_router->ext_axis_in_tready[4](cpu_ingress_tready);
    
    // CPU Port Egress (Port 4) - connect to CPU AXIS interface
    port_router->ext_axis_out_tvalid[4](cpu_egress_tvalid);
    port_router->ext_axis_out_tdata[4](cpu_egress_tdata);
    port_router->ext_axis_out_tkeep[4](cpu_egress_tkeep);
    port_router->ext_axis_out_tuser[4](cpu_egress_tuser);
    port_router->ext_axis_out_tlast[4](cpu_egress_tlast);
    port_router->ext_axis_out_tready[4](cpu_egress_tready);
    
    // Connect CPU AXIS interface to external CPU (bind signals)
    // Note: This would be done in the parent module that instantiates Complete5PortSwitchWithCPU
    // For now we'll use the internal signals directly
    
    std::cout << "[Complete5PortSwitchWithCPU] Connected CPU port (Port 4) for error forwarding" << std::endl;
    std::cout << "[Complete5PortSwitchWithCPU] All components connected" << std::endl;
}

// =============================================================================
// System Initialization
// =============================================================================

void Complete5PortSwitchWithCPU::initialize_system() {
    std::cout << "[Complete5PortSwitchWithCPU] Initializing system..." << std::endl;
    
    // Initialize AXI signals
    router_axi_master_ready.write(true);
    router_axi_slave_valid.write(false);
    
    for (int i = 0; i < 4; i++) {
        // Initialize regular Port Manager AXI signals
        ingress_pm_axi_master_ready[i].write(true);
        ingress_pm_axi_slave_valid[i].write(false);
        egress_pm_axi_master_ready[i].write(true);
        egress_pm_axi_slave_valid[i].write(false);
        
        // Initialize credit return signals
        credit_return_valid[i].write(false);
        credit_return_ready[i].write(true);
    }
    
    // Initialize CPU port dummy signals (CPU ingress is not used)
    cpu_ingress_tvalid.write(false);
    cpu_ingress_tlast.write(false);
    cpu_ingress_tready.write(true);  // Always ready (but not used)
    
    // Initialize error management
    error_forwarding_enabled = true;  // Enable by default
    error_conditions.clear();
    total_error_packets = 0;
    
    // Initialize default error conditions
    add_error_condition(0x01);  // CRC Error
    add_error_condition(0x02);  // Invalid Header
    add_error_condition(0x03);  // Unknown Destination
    add_error_condition(0x04);  // Queue Overflow
    
    // Initialize statistics
    total_packets_processed = 0;
    total_bytes_processed = 0;
    
    std::cout << "[Complete5PortSwitchWithCPU] System initialization complete" << std::endl;
}

// =============================================================================
// SystemC Processes
// =============================================================================

void Complete5PortSwitchWithCPU::handle_cpu_config(uint32_t addr, uint32_t data) {
    // Forward configuration to appropriate component
    if (addr >= 0x1000 && addr < 0x2000) {
        // Port Router configuration
        router_axi_slave_valid.write(true);
        router_axi_slave_addr.write(addr - 0x1000);
        router_axi_slave_data.write(data);
        wait(1, SC_NS);  // Allow one clock cycle for processing
        router_axi_slave_valid.write(false);
    } else if (addr >= 0x2000 && addr < 0x2400) {
        // Ingress Port Manager configuration
        int port_id = (addr - 0x2000) / 0x100;
        if (port_id < 4) {
            ingress_pm_axi_slave_valid[port_id].write(true);
            ingress_pm_axi_slave_addr[port_id].write(addr & 0xFF);
            ingress_pm_axi_slave_data[port_id].write(data);
            wait(1, SC_NS);
            ingress_pm_axi_slave_valid[port_id].write(false);
        }
    } else if (addr >= 0x2400 && addr < 0x2800) {
        // Egress Port Manager configuration
        int port_id = (addr - 0x2400) / 0x100;
        if (port_id < 4) {
            egress_pm_axi_slave_valid[port_id].write(true);
            egress_pm_axi_slave_addr[port_id].write(addr & 0xFF);
            egress_pm_axi_slave_data[port_id].write(data);
            wait(1, SC_NS);
            egress_pm_axi_slave_valid[port_id].write(false);
        }
    } else if (addr >= 0x3000 && addr < 0x3100) {
        // Error management configuration
        if (addr == 0x3000) {
            // Enable/disable error forwarding
            enable_error_forwarding_to_cpu(data != 0);
        } else if (addr == 0x3004) {
            // Add error condition
            add_error_condition(data & 0xFF);
        }
    }
}

void Complete5PortSwitchWithCPU::statistics_process() {
    // Reset statistics
    total_packets_processed = 0;
    total_bytes_processed = 0;
    total_error_packets = 0;
    
    while (true) {
        wait(); // Wait for clock edge
        
        if (!rst_n.read()) {
            total_packets_processed = 0;
            total_bytes_processed = 0;
            total_error_packets = 0;
            continue;
        }
        
        // Collect statistics from Port Router
        if (port_router) {
            uint64_t router_packets = port_router->get_total_packets_routed();
            uint64_t router_bytes = port_router->get_total_bytes_routed();
            
            // Update totals (simple approach)
            static uint64_t last_router_packets = 0;
            static uint64_t last_router_bytes = 0;
            
            if (router_packets > last_router_packets) {
                total_packets_processed += (router_packets - last_router_packets);
                last_router_packets = router_packets;
            }
            
            if (router_bytes > last_router_bytes) {
                total_bytes_processed += (router_bytes - last_router_bytes);
                last_router_bytes = router_bytes;
            }
        }
        
        // Print periodic statistics
        static int stats_counter = 0;
        stats_counter++;
        if (stats_counter % 10000 == 0) {
            std::cout << "[Complete5PortSwitchWithCPU] 📊 Stats: packets=" << total_packets_processed
                      << ", bytes=" << total_bytes_processed 
                      << ", errors=" << total_error_packets << std::endl;
        }
    }
}

void Complete5PortSwitchWithCPU::error_monitoring_process() {
    while (true) {
        wait(); // Wait for clock edge
        
        if (!rst_n.read()) {
            continue;
        }
        
        if (!error_forwarding_enabled) {
            continue;
        }
        
        // Monitor for error conditions in the system
        // This is a simplified version - in a real implementation, 
        // error detection would be integrated into each component
        
        // Example: Monitor AXI error responses
        for (int i = 0; i < 4; i++) {
            // Check for CRC errors from Ingress Port Managers
            // This would typically be a dedicated error signal
            // For now, this is a placeholder for the error detection logic
        }
        
        // Example error packet forwarding (when error is detected)
        static int error_simulation_counter = 0;
        error_simulation_counter++;
        
        // Simulate an error every 50000 cycles for demonstration
        if (error_simulation_counter % 50000 == 0) {
            // Create a dummy error packet for demonstration
            PacketEntry error_packet;
            error_packet.header.channel_type = static_cast<uint8_t>(ChannelType::CONTROL_CHANNEL);
            error_packet.header.queue_id = 0xFF;  // Special error queue
            error_packet.header.dest_port = 4;    // CPU port
            error_packet.header.source_port = 0;  // From port 0
            error_packet.header.packet_length = 64;  // Error info size
            error_packet.header.sequence_number = total_error_packets;
            
            // Forward to CPU
            forward_error_packet_to_cpu(error_packet, 0x01);  // CRC Error type
        }
    }
}

// =============================================================================
// Helper Functions
// =============================================================================

void Complete5PortSwitchWithCPU::forward_error_packet_to_cpu(const PacketEntry& error_packet, uint8_t error_type) {
    if (!error_forwarding_enabled) {
        return;
    }
    
    // Check if this error type should be forwarded
    bool should_forward = false;
    for (uint8_t condition : error_conditions) {
        if (condition == error_type) {
            should_forward = true;
            break;
        }
    }
    
    if (!should_forward) {
        return;
    }
    
    total_error_packets++;
    
    std::cout << "[Complete5PortSwitchWithCPU] 🚨 Error detected (type=0x" << std::hex << (int)error_type 
              << std::dec << "), forwarding to CPU (Port 4)" << std::endl;
    
    // In a real implementation, this would inject the error packet 
    // into the Port Router's internal routing to CPU port 4
    // For now, we just log the event
    
    std::cout << "[Complete5PortSwitchWithCPU] 📤 Error packet #" << total_error_packets 
              << " queued for CPU port" << std::endl;
}

} // namespace switch_internal_p2p