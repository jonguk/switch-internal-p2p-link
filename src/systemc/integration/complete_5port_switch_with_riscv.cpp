#include "complete_5port_switch_with_riscv.h"
#include <iostream>

namespace switch_internal_p2p {

// =============================================================================
// Public Access Methods
// =============================================================================

uint32_t Complete5PortSwitchWithRISCV::get_cpu_packets_processed() const {
    return riscv_cpu_port ? riscv_cpu_port->get_packets_processed() : 0;
}

uint32_t Complete5PortSwitchWithRISCV::get_cpu_credits() const {
    return riscv_cpu_port ? riscv_cpu_port->get_current_credits() : 0;
}

bool Complete5PortSwitchWithRISCV::is_cpu_ready() const {
    return riscv_cpu_port ? riscv_cpu_port->is_ready_for_packets() : false;
}

void Complete5PortSwitchWithRISCV::cpu_write_config(uint32_t addr, uint32_t data) {
    std::cout << "[Complete5PortSwitchWithRISCV] 🔧 CPU Config Write: addr=0x" 
              << std::hex << addr << ", data=0x" << data << std::dec << std::endl;
    
    // Handle configuration based on address ranges
    handle_cpu_config(addr, data);
}

uint32_t Complete5PortSwitchWithRISCV::cpu_read_stats(uint32_t addr) {
    uint32_t data = 0;
    
    // Statistics read based on address
    switch (addr) {
        case 0x4000: // Total packets processed
            data = total_packets_processed;
            break;
        case 0x4004: // Total error packets
            data = total_error_packets;
            break;
        case 0x4008: // CPU packets processed
            data = get_cpu_packets_processed();
            break;
        case 0x400C: // CPU credits
            data = get_cpu_credits();
            break;
        case 0x4010: // Total bytes processed (low 32-bit)
            data = static_cast<uint32_t>(total_bytes_processed & 0xFFFFFFFF);
            break;
        case 0x4014: // Total bytes processed (high 32-bit)
            data = static_cast<uint32_t>((total_bytes_processed >> 32) & 0xFFFFFFFF);
            break;
        default:
            data = 0xDEADBEEF; // Invalid address marker
            break;
    }
    
    std::cout << "[Complete5PortSwitchWithRISCV] 📊 CPU Stats Read: addr=0x" 
              << std::hex << addr << ", data=0x" << data << std::dec << std::endl;
    
    return data;
}

void Complete5PortSwitchWithRISCV::add_error_condition(uint8_t error_type) {
    error_conditions.push_back(error_type);
    std::cout << "[Complete5PortSwitchWithRISCV] ➕ Added error condition: 0x" 
              << std::hex << (int)error_type << std::dec << std::endl;
}

// =============================================================================
// Component Creation and Initialization
// =============================================================================

void Complete5PortSwitchWithRISCV::create_components() {
    std::cout << "[Complete5PortSwitchWithRISCV] 🏗️  Creating components..." << std::endl;
    
    // Create RISC-V CPU Port (Port 4)
    riscv_cpu_port = new RISCVCpuWrapper("riscv_cpu_port");
    
    // Create Port Router (5 ports total)
    // Port Router creates its own internal Queue Managers
    port_router = new PortRouter<TOTAL_PORTS>("port_router");
    
    std::cout << "[Complete5PortSwitchWithRISCV] ✅ All components created" << std::endl;
}

void Complete5PortSwitchWithRISCV::connect_components() {
    std::cout << "[Complete5PortSwitchWithRISCV] 🔗 Connecting components..." << std::endl;
    
    // Connect Port Router to external AXIS interfaces
    port_router->clk(clk);
    port_router->rst_n(rst_n);
    
    // Connect Port Router AXI interfaces (REQUIRED for binding)
    port_router->axi_master_valid(router_axi_master_valid);
    port_router->axi_master_addr(router_axi_master_addr);
    port_router->axi_master_data(router_axi_master_data);
    port_router->axi_master_ready(router_axi_master_ready);
    
    port_router->axi_slave_valid(router_axi_slave_valid);
    port_router->axi_slave_addr(router_axi_slave_addr);
    port_router->axi_slave_data(router_axi_slave_data);
    port_router->axi_slave_ready(router_axi_slave_ready);
    
    // Connect regular ports (1-4) to external ports (0-3)  
    // Port Router 1-4 → External Ports 0-3
    for (int i = 0; i < NUM_REGULAR_PORTS; i++) {
        int router_port = i + 1;  // Port Router ports 1-4
        int external_port = i;    // External ports 0-3
        
        port_router->ext_axis_in_tvalid[router_port](ext_axis_in_tvalid[external_port]);
        port_router->ext_axis_in_tdata[router_port](ext_axis_in_tdata[external_port]);
        port_router->ext_axis_in_tkeep[router_port](ext_axis_in_tkeep[external_port]);
        port_router->ext_axis_in_tuser[router_port](ext_axis_in_tuser[external_port]);
        port_router->ext_axis_in_tlast[router_port](ext_axis_in_tlast[external_port]);
        port_router->ext_axis_in_tready[router_port](ext_axis_in_tready[external_port]);
        
        port_router->ext_axis_out_tvalid[router_port](ext_axis_out_tvalid[external_port]);
        port_router->ext_axis_out_tdata[router_port](ext_axis_out_tdata[external_port]);
        port_router->ext_axis_out_tkeep[router_port](ext_axis_out_tkeep[external_port]);
        port_router->ext_axis_out_tuser[router_port](ext_axis_out_tuser[external_port]);
        port_router->ext_axis_out_tlast[router_port](ext_axis_out_tlast[external_port]);
        port_router->ext_axis_out_tready[router_port](ext_axis_out_tready[external_port]);
    }
    
    // Connect RISC-V CPU port (Port 0)
    connect_cpu_port();
    
    std::cout << "[Complete5PortSwitchWithRISCV] ✅ All components connected" << std::endl;
}

// connect_regular_port is no longer needed as Port Router handles internal connections

void Complete5PortSwitchWithRISCV::connect_cpu_port() {
    // Connect RISC-V CPU basic signals
    riscv_cpu_port->clk(clk);
    riscv_cpu_port->rst_n(rst_n);
    
    // Connect RISC-V CPU AXI interfaces (REQUIRED for binding - slave only)
    riscv_cpu_port->axi_slave_valid(cpu_axi_slave_valid);
    riscv_cpu_port->axi_slave_addr(cpu_axi_slave_addr);
    riscv_cpu_port->axi_slave_data(cpu_axi_slave_data);
    riscv_cpu_port->axi_slave_ready(cpu_axi_slave_ready);
    
    // Connect RISC-V CPU AXIS interfaces (REQUIRED for binding - standalone)
    riscv_cpu_port->axis_in_tvalid(cpu_axis_in_tvalid);
    riscv_cpu_port->axis_in_tdata(cpu_axis_in_tdata);
    riscv_cpu_port->axis_in_tkeep(cpu_axis_in_tkeep);
    riscv_cpu_port->axis_in_tuser(cpu_axis_in_tuser);
    riscv_cpu_port->axis_in_tlast(cpu_axis_in_tlast);
    riscv_cpu_port->axis_in_tready(cpu_axis_in_tready);
    
    riscv_cpu_port->axis_out_tvalid(cpu_axis_out_tvalid);
    riscv_cpu_port->axis_out_tdata(cpu_axis_out_tdata);
    riscv_cpu_port->axis_out_tkeep(cpu_axis_out_tkeep);
    riscv_cpu_port->axis_out_tuser(cpu_axis_out_tuser);
    riscv_cpu_port->axis_out_tlast(cpu_axis_out_tlast);
    riscv_cpu_port->axis_out_tready(cpu_axis_out_tready);
    
    // Connect CPU AXIS to Port Router Port 0
    // CPU → Port Router Port 0 (CPU sends packets to switch)
    port_router->ext_axis_in_tvalid[CPU_PORT_ID](cpu_axis_out_tvalid);
    port_router->ext_axis_in_tdata[CPU_PORT_ID](cpu_axis_out_tdata);
    port_router->ext_axis_in_tkeep[CPU_PORT_ID](cpu_axis_out_tkeep);
    port_router->ext_axis_in_tuser[CPU_PORT_ID](cpu_axis_out_tuser);
    port_router->ext_axis_in_tlast[CPU_PORT_ID](cpu_axis_out_tlast);
    port_router->ext_axis_in_tready[CPU_PORT_ID](cpu_axis_out_tready);
    
    // Port Router Port 0 → CPU (CPU receives packets from switch)
    port_router->ext_axis_out_tvalid[CPU_PORT_ID](cpu_axis_in_tvalid);
    port_router->ext_axis_out_tdata[CPU_PORT_ID](cpu_axis_in_tdata);
    port_router->ext_axis_out_tkeep[CPU_PORT_ID](cpu_axis_in_tkeep);
    port_router->ext_axis_out_tuser[CPU_PORT_ID](cpu_axis_in_tuser);
    port_router->ext_axis_out_tlast[CPU_PORT_ID](cpu_axis_in_tlast);
    port_router->ext_axis_out_tready[CPU_PORT_ID](cpu_axis_in_tready);
}

void Complete5PortSwitchWithRISCV::initialize_system() {
    std::cout << "[Complete5PortSwitchWithRISCV] ⚙️  Initializing system..." << std::endl;
    
    // Initialize statistics
    total_error_packets = 0;
    total_packets_processed = 0;
    total_bytes_processed = 0;
    
    // Initialize error forwarding
    error_forwarding_enabled = true;
    error_conditions.clear();
    
    // Add default error conditions
    error_conditions.push_back(0x01); // CRC Error
    error_conditions.push_back(0x02); // Queue Overflow
    error_conditions.push_back(0x03); // Routing Error
    
    // Initialize Port Router AXI signals (REQUIRED)
    router_axi_master_valid.write(false);
    router_axi_master_addr.write(sc_bv<32>("0"));
    router_axi_master_data.write(sc_bv<32>("0"));
    router_axi_master_ready.write(true);
    
    router_axi_slave_valid.write(false);
    router_axi_slave_addr.write(sc_bv<32>("0"));
    router_axi_slave_data.write(sc_bv<32>("0"));
    router_axi_slave_ready.write(true);
    
    // Initialize RISC-V CPU AXI signals (REQUIRED - slave only)
    cpu_axi_slave_valid.write(false);
    cpu_axi_slave_addr.write(0);
    cpu_axi_slave_data.write(0);
    
    // Initialize RISC-V CPU AXIS signals (REQUIRED - standalone)
    cpu_axis_in_tvalid.write(false);
    cpu_axis_in_tdata.write(sc_bv<AXIS_DATA_WIDTH>("0"));
    cpu_axis_in_tkeep.write(sc_bv<AXIS_DATA_WIDTH/8>("0"));
    cpu_axis_in_tuser.write(sc_bv<AXIS_USER_WIDTH>("0"));
    cpu_axis_in_tlast.write(false);
    
    cpu_axis_out_tvalid.write(false);
    cpu_axis_out_tdata.write(sc_bv<AXIS_DATA_WIDTH>("0"));
    cpu_axis_out_tkeep.write(sc_bv<AXIS_DATA_WIDTH/8>("0"));
    cpu_axis_out_tuser.write(sc_bv<AXIS_USER_WIDTH>("0"));
    cpu_axis_out_tlast.write(false);
    cpu_axis_out_tready.write(true);
    
    std::cout << "[Complete5PortSwitchWithRISCV] ✅ System initialized" << std::endl;
}

void Complete5PortSwitchWithRISCV::cleanup() {
    // Clean up CPU port
    if (riscv_cpu_port) delete riscv_cpu_port;
    
    // Clean up router (which handles its own internal Queue Managers)
    if (port_router) delete port_router;
}

// =============================================================================
// SystemC Processes
// =============================================================================

void Complete5PortSwitchWithRISCV::statistics_process() {
    while (true) {
        wait(1, SC_US); // Update every microsecond
        
        // Collect statistics from all components
        uint32_t new_total = 0;
        uint64_t new_bytes = 0;
        
        // Regular ports
        for (int i = 0; i < NUM_REGULAR_PORTS; i++) {
            // Add statistics collection logic here
            // new_total += get_port_packets(i);
            // new_bytes += get_port_bytes(i);
        }
        
        // CPU port
        if (riscv_cpu_port) {
            new_total += riscv_cpu_port->get_packets_processed();
        }
        
        total_packets_processed = new_total;
        total_bytes_processed = new_bytes;
        
        // Log statistics periodically
        static int stats_counter = 0;
        if (++stats_counter >= 10000) { // Every 10ms
            stats_counter = 0;
            std::cout << "[Complete5PortSwitchWithRISCV] 📊 Stats: packets=" 
                      << total_packets_processed << ", bytes=" << total_bytes_processed
                      << ", errors=" << total_error_packets << std::endl;
        }
    }
}

void Complete5PortSwitchWithRISCV::error_monitoring_process() {
    while (true) {
        wait(100, SC_US); // Check every 100 microseconds
        
        if (!error_forwarding_enabled) {
            continue;
        }
        
        // Monitor for error conditions in the system
        // This is a simplified version - in real implementation,
        // error detection would be integrated into each component
        
        // Example error packet forwarding (simulated)
        static int error_simulation_counter = 0;
        error_simulation_counter++;
        
        // Simulate an error every 50000 cycles for demonstration
        if (error_simulation_counter % 50000 == 0) {
            // Create a dummy error packet for demonstration
            PacketEntry error_packet;
            error_packet.header.channel_type = static_cast<uint8_t>(ChannelType::HIGH_PRIORITY);
            error_packet.header.queue_id = 0xFF;  // Special error queue
            error_packet.header.dest_port = CPU_PORT_ID;    // CPU port
            error_packet.header.source_port = 0;  // From port 0
            error_packet.header.packet_length = 64;  // Error info size
            error_packet.header.sequence_number = total_error_packets;
            
            // Forward to CPU
            forward_error_packet_to_cpu(error_packet, 0x01);  // CRC Error type
        }
    }
}

// =============================================================================
// Helper Methods
// =============================================================================

void Complete5PortSwitchWithRISCV::forward_error_packet_to_cpu(const PacketEntry& error_packet, uint8_t error_type) {
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
    
    std::cout << "[Complete5PortSwitchWithRISCV] 🚨 Error detected (type=0x" 
              << std::hex << (int)error_type << std::dec 
              << "), forwarding to RISC-V CPU (Port " << CPU_PORT_ID << ")" << std::endl;
    
    // In a real implementation, this would inject the error packet 
    // into the Port Router's internal routing to CPU port
    // For now, we just log the event
    
    std::cout << "[Complete5PortSwitchWithRISCV] 📤 Error packet #" << total_error_packets 
              << " queued for RISC-V CPU port" << std::endl;
}

void Complete5PortSwitchWithRISCV::handle_cpu_config(uint32_t addr, uint32_t data) {
    std::cout << "[Complete5PortSwitchWithRISCV] 🔧 CPU Config: addr=0x" 
              << std::hex << addr << ", data=0x" << data << std::dec << std::endl;
    
    if (addr >= 0x1000 && addr < 0x2000) {
        // Port Router configuration
        router_axi_slave_valid.write(true);
        router_axi_slave_addr.write(sc_bv<32>(addr - 0x1000));
        router_axi_slave_data.write(sc_bv<32>(data));
        wait(1, SC_NS);
        router_axi_slave_valid.write(false);
        
    } else if (addr >= 0x3000 && addr < 0x3100) {
        // Error management configuration
        if (addr == 0x3000) {
            enable_error_forwarding(data != 0);
        } else if (addr == 0x3004) {
            add_error_condition(data & 0xFF);
        }
    }
    
    // Note: Individual Port Manager configurations are handled internally by Port Router
}

} // namespace switch_internal_p2p