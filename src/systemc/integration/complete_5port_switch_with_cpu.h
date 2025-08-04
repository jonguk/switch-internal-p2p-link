#ifndef COMPLETE_5PORT_SWITCH_WITH_CPU_H
#define COMPLETE_5PORT_SWITCH_WITH_CPU_H

#include <systemc.h>
#include <array>
#include "../common/switch_types.h"
#include "../port_manager/ingress_port_manager.h"
#include "../port_manager/egress_port_manager.h"
#include "../queue_manager/ingress_queue_manager.h"
#include "../queue_manager/egress_queue_manager.h"
#include "../router/port_router.h"

namespace switch_internal_p2p {

// =============================================================================
// Complete 5-Port Switch with CPU Port
// 4 Regular Ports + 1 CPU Port (Port 4) for Error Forwarding
// =============================================================================

SC_MODULE(Complete5PortSwitchWithCPU) {
public:
    // =============================================================================
    // External Interfaces (4 regular ports only, CPU port is internal)
    // =============================================================================
    
    // Clock and Reset
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // External AXIS Interfaces - Input (4 regular ports)
    std::array<sc_in<bool>, 4> ext_axis_in_tvalid;
    std::array<sc_in<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_in_tdata;
    std::array<sc_in<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_in_tkeep;
    std::array<sc_in<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_in_tuser;
    std::array<sc_in<bool>, 4> ext_axis_in_tlast;
    std::array<sc_out<bool>, 4> ext_axis_in_tready;
    
    // External AXIS Interfaces - Output (4 regular ports)
    std::array<sc_out<bool>, 4> ext_axis_out_tvalid;
    std::array<sc_out<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_out_tdata;
    std::array<sc_out<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_out_tkeep;
    std::array<sc_out<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_out_tuser;
    std::array<sc_out<bool>, 4> ext_axis_out_tlast;
    std::array<sc_in<bool>, 4> ext_axis_out_tready;
    
    // CPU AXIS Interface would be external ports in real implementation
    // For testing purposes, we'll provide access methods to internal signals
    
    // CPU Configuration Interface (simplified for testing)
    // In real implementation, this would be proper AXI interface
    
    // =============================================================================
    // Constructor and Destructor
    // =============================================================================
    
    SC_CTOR(Complete5PortSwitchWithCPU) :
        total_error_packets(0),
        total_packets_processed(0),
        total_bytes_processed(0)
    {
        // Create component instances
        create_components();
        
        // Connect all components
        connect_components();
        
        // Initialize configuration
        initialize_system();
        
        // Register SystemC processes
        SC_CTHREAD(statistics_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(error_monitoring_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        std::cout << "[Complete5PortSwitchWithCPU] Created complete 5-port switch with CPU port" << std::endl;
    }
    
    ~Complete5PortSwitchWithCPU() {
        // Clean up component instances
        for (int i = 0; i < 4; i++) {
            delete ingress_port_managers[i];
            delete egress_port_managers[i];
        }
        delete port_router;
        
        std::cout << "[Complete5PortSwitchWithCPU] Destroyed" << std::endl;
    }
    
    // =============================================================================
    // Public Configuration and Monitoring Methods
    // =============================================================================
    
    void configure_global_port_mapping(uint16_t global_port_id, uint8_t local_port_id) {
        if (local_port_id < 5) {  // 0-4 ports (including CPU port 4)
            std::cout << "[Complete5PortSwitchWithCPU] Configure mapping: Global " 
                      << global_port_id << " → Local " << (int)local_port_id 
                      << (local_port_id == 4 ? " (CPU Port)" : "") << std::endl;
        }
    }
    
    void enable_error_forwarding_to_cpu(bool enable) {
        error_forwarding_enabled = enable;
        std::cout << "[Complete5PortSwitchWithCPU] Error forwarding to CPU: " 
                  << (enable ? "ENABLED" : "DISABLED") << std::endl;
    }
    
    void add_error_condition(uint8_t error_type) {
        error_conditions.push_back(error_type);
        std::cout << "[Complete5PortSwitchWithCPU] Added error condition: " << (int)error_type << std::endl;
    }
    
    // CPU Configuration Methods (simplified for testing)
    void cpu_write_config(uint32_t addr, uint32_t data) {
        std::cout << "[Complete5PortSwitchWithCPU] 🖥️  CPU Config Write: addr=0x" << std::hex << addr 
                  << ", data=0x" << data << std::dec << std::endl;
        handle_cpu_config(addr, data);
    }
    
    uint32_t cpu_read_stats(uint32_t addr) {
        if (addr == 0x4000) {
            return total_packets_processed & 0xFFFFFFFF;
        } else if (addr == 0x4004) {
            return (total_packets_processed >> 32) & 0xFFFFFFFF;
        } else if (addr == 0x4008) {
            return total_error_packets & 0xFFFFFFFF;
        }
        return 0;
    }
    
    // Performance monitoring
    uint64_t get_total_packets_processed() const { return total_packets_processed; }
    uint64_t get_total_bytes_processed() const { return total_bytes_processed; }
    uint64_t get_total_error_packets() const { return total_error_packets; }
    
    // Component access
    IngressPortManager* get_ingress_port_manager(int port_id) {
        return (port_id >= 0 && port_id < 4) ? ingress_port_managers[port_id] : nullptr;  // Only regular ports
    }
    
    EgressPortManager* get_egress_port_manager(int port_id) {
        return (port_id >= 0 && port_id < 4) ? egress_port_managers[port_id] : nullptr;   // Only regular ports
    }
    
    IngressQueueManager* get_ingress_queue_manager(int port_id) {
        return port_router ? port_router->get_ingress_manager(port_id) : nullptr;  // 0-4 (includes CPU)
    }
    
    EgressQueueManager* get_egress_queue_manager(int port_id) {
        return port_router ? port_router->get_egress_manager(port_id) : nullptr;   // 0-4 (includes CPU)
    }
    
    PortRouter<5>* get_port_router() { return port_router; }
    
    // CPU AXIS Interface Access (for testing)
    bool get_cpu_axis_tvalid() const { return cpu_egress_tvalid.read(); }
    sc_bv<AXIS_DATA_WIDTH> get_cpu_axis_tdata() const { return cpu_egress_tdata.read(); }
    sc_bv<AXIS_KEEP_WIDTH> get_cpu_axis_tkeep() const { return cpu_egress_tkeep.read(); }
    sc_bv<AXIS_USER_WIDTH> get_cpu_axis_tuser() const { return cpu_egress_tuser.read(); }
    bool get_cpu_axis_tlast() const { return cpu_egress_tlast.read(); }
    void set_cpu_axis_tready(bool ready) { cpu_egress_tready.write(ready); }

private:
    // =============================================================================
    // Component Instances
    // =============================================================================
    
    // Port Managers (4 regular ports only, CPU port has no external PM)
    std::array<IngressPortManager*, 4> ingress_port_managers;
    std::array<EgressPortManager*, 4> egress_port_managers;
    
    // Central Port Router (contains 5 Ingress + 5 Egress Queue Managers)
    PortRouter<5>* port_router;
    
    // =============================================================================
    // Internal AXIS Signal Arrays (4 regular ports + 1 CPU port)
    // =============================================================================
    
    // Ingress PM → Ingress QM (regular ports only)
    std::array<sc_signal<bool>, 4> ingress_pm_to_qm_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> ingress_pm_to_qm_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> ingress_pm_to_qm_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> ingress_pm_to_qm_tuser;
    std::array<sc_signal<bool>, 4> ingress_pm_to_qm_tlast;
    std::array<sc_signal<bool>, 4> ingress_pm_to_qm_tready;
    
    // Egress QM → Egress PM (regular ports only)
    std::array<sc_signal<bool>, 4> egress_qm_to_pm_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> egress_qm_to_pm_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> egress_qm_to_pm_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> egress_qm_to_pm_tuser;
    std::array<sc_signal<bool>, 4> egress_qm_to_pm_tlast;
    std::array<sc_signal<bool>, 4> egress_qm_to_pm_tready;
    
    // CPU Port signals (Port 4 - CPU Egress QM → CPU)
    sc_signal<bool> cpu_egress_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> cpu_egress_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> cpu_egress_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> cpu_egress_tuser;
    sc_signal<bool> cpu_egress_tlast;
    sc_signal<bool> cpu_egress_tready;
    
    // Dummy signals for CPU Ingress QM (not used, but needed for Port Router)
    sc_signal<bool> cpu_ingress_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> cpu_ingress_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> cpu_ingress_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> cpu_ingress_tuser;
    sc_signal<bool> cpu_ingress_tlast;
    sc_signal<bool> cpu_ingress_tready;
    
    // AXI signals for Port Router
    sc_signal<bool> router_axi_master_valid;
    sc_signal<sc_bv<32>> router_axi_master_addr;
    sc_signal<sc_bv<32>> router_axi_master_data;
    sc_signal<bool> router_axi_master_ready;
    sc_signal<bool> router_axi_slave_valid;
    sc_signal<sc_bv<32>> router_axi_slave_addr;
    sc_signal<sc_bv<32>> router_axi_slave_data;
    sc_signal<bool> router_axi_slave_ready;
    
    // Individual Port Manager AXI signals (regular ports only)
    std::array<sc_signal<bool>, 4> ingress_pm_axi_master_valid;
    std::array<sc_signal<sc_bv<32>>, 4> ingress_pm_axi_master_addr;
    std::array<sc_signal<sc_bv<32>>, 4> ingress_pm_axi_master_data;
    std::array<sc_signal<bool>, 4> ingress_pm_axi_master_ready;
    std::array<sc_signal<bool>, 4> ingress_pm_axi_slave_valid;
    std::array<sc_signal<sc_bv<32>>, 4> ingress_pm_axi_slave_addr;
    std::array<sc_signal<sc_bv<32>>, 4> ingress_pm_axi_slave_data;
    std::array<sc_signal<bool>, 4> ingress_pm_axi_slave_ready;
    
    std::array<sc_signal<bool>, 4> egress_pm_axi_master_valid;
    std::array<sc_signal<sc_bv<32>>, 4> egress_pm_axi_master_addr;
    std::array<sc_signal<sc_bv<32>>, 4> egress_pm_axi_master_data;
    std::array<sc_signal<bool>, 4> egress_pm_axi_master_ready;
    std::array<sc_signal<bool>, 4> egress_pm_axi_slave_valid;
    std::array<sc_signal<sc_bv<32>>, 4> egress_pm_axi_slave_addr;
    std::array<sc_signal<sc_bv<32>>, 4> egress_pm_axi_slave_data;
    std::array<sc_signal<bool>, 4> egress_pm_axi_slave_ready;
    
    // Credit return signals for Port Managers
    std::array<sc_signal<bool>, 4> credit_return_valid;
    std::array<sc_signal<bool>, 4> credit_return_ready;
    
    // =============================================================================
    // Error Management State
    // =============================================================================
    
    bool error_forwarding_enabled;
    std::vector<uint8_t> error_conditions;
    uint64_t total_error_packets;
    
    // =============================================================================
    // Statistics and State
    // =============================================================================
    
    uint64_t total_packets_processed;
    uint64_t total_bytes_processed;
    
    // =============================================================================
    // SystemC Processes
    // =============================================================================
    
    void statistics_process();
    void error_monitoring_process();
    
    // =============================================================================
    // Helper Functions
    // =============================================================================
    
    void create_components();
    void connect_components();
    void initialize_system();
    void forward_error_packet_to_cpu(const PacketEntry& error_packet, uint8_t error_type);
    void handle_cpu_config(uint32_t addr, uint32_t data);
};

} // namespace switch_internal_p2p

#endif // COMPLETE_5PORT_SWITCH_WITH_CPU_H