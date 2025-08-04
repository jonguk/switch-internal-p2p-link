#include "complete_4port_switch.h"
#include <iostream>

namespace switch_internal_p2p {

// =============================================================================
// Component Creation
// =============================================================================

void Complete4PortSwitch::create_components() {
    std::cout << "[Complete4PortSwitch] Creating components..." << std::endl;
    
    // Create Port Managers
    for (int i = 0; i < 4; i++) {
        // Create Ingress Port Manager
        std::string ingress_pm_name = "ingress_pm_" + std::to_string(i);
        ingress_port_managers[i] = new IngressPortManager(ingress_pm_name.c_str());
        ingress_port_managers[i]->set_port_id(i);
        
        // Create Egress Port Manager
        std::string egress_pm_name = "egress_pm_" + std::to_string(i);
        egress_port_managers[i] = new EgressPortManager(egress_pm_name.c_str());
        egress_port_managers[i]->set_port_id(i);
        
        std::cout << "[Complete4PortSwitch] Created Port Managers for port " << i << std::endl;
    }
    
    // Create Port Router (contains Queue Managers)
    port_router = new PortRouter<4>("port_router");
    
    std::cout << "[Complete4PortSwitch] All components created" << std::endl;
}

// =============================================================================
// Component Connections
// =============================================================================

void Complete4PortSwitch::connect_components() {
    std::cout << "[Complete4PortSwitch] Connecting components..." << std::endl;
    
    // Connect Port Router basic signals
    port_router->clk(clk);
    port_router->rst_n(rst_n);
    
    // Connect Port Router AXI
    port_router->axi_master_valid(router_axi_master_valid);
    port_router->axi_master_addr(router_axi_master_addr);
    port_router->axi_master_data(router_axi_master_data);
    port_router->axi_master_ready(router_axi_master_ready);
    port_router->axi_slave_valid(router_axi_slave_valid);
    port_router->axi_slave_addr(router_axi_slave_addr);
    port_router->axi_slave_data(router_axi_slave_data);
    port_router->axi_slave_ready(router_axi_slave_ready);
    
    for (int i = 0; i < 4; i++) {
        // =====================================================================
        // Connect Ingress Port Manager
        // =====================================================================
        
        // Basic signals
        ingress_port_managers[i]->clk(clk);
        ingress_port_managers[i]->rst_n(rst_n);
        
        // External input connection (use ext_* signals for IngressPortManager)
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
        
        // Credit return interface for Ingress (dummy connections)
        ingress_port_managers[i]->credit_return_valid(credit_return_valid[i]);
        ingress_port_managers[i]->credit_return_ready(credit_return_ready[i]);
        
        // =====================================================================
        // Connect Port Router AXIS Interfaces
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
        
        // External output connection (use ext_* signals for EgressPortManager)
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
        
        std::cout << "[Complete4PortSwitch] Connected all interfaces for port " << i << std::endl;
    }
    
    std::cout << "[Complete4PortSwitch] All components connected" << std::endl;
}

// =============================================================================
// System Initialization
// =============================================================================

void Complete4PortSwitch::initialize_system() {
    std::cout << "[Complete4PortSwitch] Initializing system..." << std::endl;
    
    // Initialize AXI signals
    router_axi_master_ready.write(true);
    router_axi_slave_valid.write(false);
    
    for (int i = 0; i < 4; i++) {
        // Initialize Ingress Port Manager AXI signals
        ingress_pm_axi_master_ready[i].write(true);
        ingress_pm_axi_slave_valid[i].write(false);
        
        // Initialize Egress Port Manager AXI signals  
        egress_pm_axi_master_ready[i].write(true);
        egress_pm_axi_slave_valid[i].write(false);
        
        // Initialize credit return signals
        credit_return_valid[i].write(false);
        credit_return_ready[i].write(true);
    }
    
    // Initialize statistics
    total_packets_processed = 0;
    total_bytes_processed = 0;
    
    // 🚀 Configure routing table for round-robin routing
    configure_round_robin_routing();
    
    std::cout << "[Complete4PortSwitch] System initialization complete" << std::endl;
}

void Complete4PortSwitch::configure_round_robin_routing() {
    std::cout << "[Complete4PortSwitch] 🔧 Configuring full routing table..." << std::endl;
    
    // Configure full routing: all ports can reach all destinations
    // Each ingress queue manager needs mappings for ALL destination ports
    
    IngressQueueManager* ingress_qm0 = port_router->get_ingress_manager(0);
    IngressQueueManager* ingress_qm1 = port_router->get_ingress_manager(1);
    IngressQueueManager* ingress_qm2 = port_router->get_ingress_manager(2);
    IngressQueueManager* ingress_qm3 = port_router->get_ingress_manager(3);
    
    if (ingress_qm0 && ingress_qm1 && ingress_qm2 && ingress_qm3) {
        // Configure ALL destination mappings for each ingress port
        // Global Port ID → Local Port ID (1:1 mapping)
        
        for (int dst_port = 0; dst_port < 4; dst_port++) {
            ingress_qm0->set_global_to_local_mapping(dst_port, dst_port);
            ingress_qm1->set_global_to_local_mapping(dst_port, dst_port);
            ingress_qm2->set_global_to_local_mapping(dst_port, dst_port);
            ingress_qm3->set_global_to_local_mapping(dst_port, dst_port);
        }
        
        std::cout << "[Complete4PortSwitch] ✅ Full routing table configured:" << std::endl;
        std::cout << "   All ports → All destinations (Global ID = Local ID)" << std::endl;
        std::cout << "   Port 0: Can reach ports 0,1,2,3" << std::endl;
        std::cout << "   Port 1: Can reach ports 0,1,2,3" << std::endl;
        std::cout << "   Port 2: Can reach ports 0,1,2,3" << std::endl;
        std::cout << "   Port 3: Can reach ports 0,1,2,3" << std::endl;
    } else {
        std::cout << "[Complete4PortSwitch] ❌ ERROR: Could not access ingress queue managers" << std::endl;
    }
}

// =============================================================================
// SystemC Processes
// =============================================================================

void Complete4PortSwitch::axi_configuration_process() {
    // Handle AXI configuration requests
    axi_slave_ready.write(true);
    
    if (axi_slave_valid.read()) {
        uint32_t addr = axi_slave_addr.read().to_uint();
        uint32_t data = axi_slave_data.read().to_uint();
        
        std::cout << "[Complete4PortSwitch] AXI Config: addr=0x" << std::hex << addr 
                  << ", data=0x" << data << std::dec << std::endl;
        
        // Forward configuration to appropriate component
        if (addr >= 0x1000 && addr < 0x2000) {
            // Port Router configuration
            router_axi_slave_valid.write(true);
            router_axi_slave_addr.write(addr - 0x1000);
            router_axi_slave_data.write(data);
        } else if (addr >= 0x2000 && addr < 0x2400) {
            // Ingress Port Manager configuration
            int port_id = (addr - 0x2000) / 0x100;
            if (port_id < 4) {
                ingress_pm_axi_slave_valid[port_id].write(true);
                ingress_pm_axi_slave_addr[port_id].write(addr & 0xFF);
                ingress_pm_axi_slave_data[port_id].write(data);
            }
        } else if (addr >= 0x2400 && addr < 0x2800) {
            // Egress Port Manager configuration
            int port_id = (addr - 0x2400) / 0x100;
            if (port_id < 4) {
                egress_pm_axi_slave_valid[port_id].write(true);
                egress_pm_axi_slave_addr[port_id].write(addr & 0xFF);
                egress_pm_axi_slave_data[port_id].write(data);
            }
        }
    } else {
        // Clear AXI slave signals
        router_axi_slave_valid.write(false);
        for (int i = 0; i < 4; i++) {
            ingress_pm_axi_slave_valid[i].write(false);
            egress_pm_axi_slave_valid[i].write(false);
        }
    }
}

void Complete4PortSwitch::statistics_process() {
    // Reset statistics
    total_packets_processed = 0;
    total_bytes_processed = 0;
    
    while (true) {
        wait(); // Wait for clock edge
        
        if (!rst_n.read()) {
            total_packets_processed = 0;
            total_bytes_processed = 0;
            continue;
        }
        
        // Collect statistics from Port Router
        if (port_router) {
            uint64_t router_packets = port_router->get_total_packets_routed();
            uint64_t router_bytes = port_router->get_total_bytes_routed();
            
            // Update totals (simple approach - in practice you'd need more sophisticated tracking)
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
            std::cout << "[Complete4PortSwitch] Stats: packets=" << total_packets_processed
                      << ", bytes=" << total_bytes_processed << std::endl;
        }
    }
}

} // namespace switch_internal_p2p