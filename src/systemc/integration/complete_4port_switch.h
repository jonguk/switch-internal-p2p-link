#ifndef COMPLETE_4PORT_SWITCH_H
#define COMPLETE_4PORT_SWITCH_H

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
// Complete 4-Port Switch
// Integrates all components: Port Managers + Queue Managers + Port Router
// =============================================================================

SC_MODULE(Complete4PortSwitch) {
public:
    // =============================================================================
    // External Interfaces (4 ports)
    // =============================================================================
    
    // Clock and Reset
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // External AXIS Interfaces - Input (4 ports)
    std::array<sc_in<bool>, 4> ext_axis_in_tvalid;
    std::array<sc_in<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_in_tdata;
    std::array<sc_in<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_in_tkeep;
    std::array<sc_in<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_in_tuser;
    std::array<sc_in<bool>, 4> ext_axis_in_tlast;
    std::array<sc_out<bool>, 4> ext_axis_in_tready;
    
    // External AXIS Interfaces - Output (4 ports)
    std::array<sc_out<bool>, 4> ext_axis_out_tvalid;
    std::array<sc_out<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_out_tdata;
    std::array<sc_out<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_out_tkeep;
    std::array<sc_out<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_out_tuser;
    std::array<sc_out<bool>, 4> ext_axis_out_tlast;
    std::array<sc_in<bool>, 4> ext_axis_out_tready;
    
    // Global AXI Interface (for configuration)
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
    
    SC_CTOR(Complete4PortSwitch) :
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
        SC_METHOD(axi_configuration_process);
        sensitive << axi_slave_valid << axi_slave_addr << axi_slave_data;
        
        SC_CTHREAD(statistics_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        std::cout << "[Complete4PortSwitch] Created complete 4-port switch" << std::endl;
    }
    
    ~Complete4PortSwitch() {
        // Clean up component instances
        for (int i = 0; i < 4; i++) {
            delete ingress_port_managers[i];
            delete egress_port_managers[i];
        }
        delete port_router;
        
        std::cout << "[Complete4PortSwitch] Destroyed" << std::endl;
    }
    
    // =============================================================================
    // Public Configuration and Monitoring Methods
    // =============================================================================
    
    void configure_global_port_mapping(uint16_t global_port_id, uint8_t local_port_id) {
        if (local_port_id < 4) {
            // Configure the ingress queue manager for the specified local port
            // This would typically be done via AXI write in a real system
            std::cout << "[Complete4PortSwitch] Configure mapping: Global " 
                      << global_port_id << " → Local " << (int)local_port_id << std::endl;
        }
    }
    
    void set_routing_table(uint8_t dest_port, uint8_t output_port) {
        if (dest_port < 4 && output_port < 4) {
            std::cout << "[Complete4PortSwitch] Set routing: Port " 
                      << (int)dest_port << " → Port " << (int)output_port << std::endl;
        }
    }
    
    // Performance monitoring
    uint64_t get_total_packets_processed() const { return total_packets_processed; }
    uint64_t get_total_bytes_processed() const { return total_bytes_processed; }
    
    // Component access
    IngressPortManager* get_ingress_port_manager(int port_id) {
        return (port_id >= 0 && port_id < 4) ? ingress_port_managers[port_id] : nullptr;
    }
    
    EgressPortManager* get_egress_port_manager(int port_id) {
        return (port_id >= 0 && port_id < 4) ? egress_port_managers[port_id] : nullptr;
    }
    
    IngressQueueManager* get_ingress_queue_manager(int port_id) {
        return port_router ? port_router->get_ingress_manager(port_id) : nullptr;
    }
    
    EgressQueueManager* get_egress_queue_manager(int port_id) {
        return port_router ? port_router->get_egress_manager(port_id) : nullptr;
    }
    
    PortRouter<4>* get_port_router() { return port_router; }
    
    // Internal signal access for debugging/tracing
    sc_signal<bool>& get_ingress_pm_to_qm_tvalid(int port) { return ingress_pm_to_qm_tvalid[port]; }
    sc_signal<sc_bv<AXIS_DATA_WIDTH>>& get_ingress_pm_to_qm_tdata(int port) { return ingress_pm_to_qm_tdata[port]; }
    sc_signal<sc_bv<AXIS_USER_WIDTH>>& get_ingress_pm_to_qm_tuser(int port) { return ingress_pm_to_qm_tuser[port]; }
    sc_signal<bool>& get_ingress_pm_to_qm_tlast(int port) { return ingress_pm_to_qm_tlast[port]; }
    sc_signal<bool>& get_ingress_pm_to_qm_tready(int port) { return ingress_pm_to_qm_tready[port]; }
    
    sc_signal<bool>& get_egress_qm_to_pm_tvalid(int port) { return egress_qm_to_pm_tvalid[port]; }
    sc_signal<sc_bv<AXIS_DATA_WIDTH>>& get_egress_qm_to_pm_tdata(int port) { return egress_qm_to_pm_tdata[port]; }
    sc_signal<sc_bv<AXIS_USER_WIDTH>>& get_egress_qm_to_pm_tuser(int port) { return egress_qm_to_pm_tuser[port]; }
    sc_signal<bool>& get_egress_qm_to_pm_tlast(int port) { return egress_qm_to_pm_tlast[port]; }
    sc_signal<bool>& get_egress_qm_to_pm_tready(int port) { return egress_qm_to_pm_tready[port]; }

private:
    // =============================================================================
    // Component Instances
    // =============================================================================
    
    // Port Managers (4 ingress + 4 egress)
    std::array<IngressPortManager*, 4> ingress_port_managers;
    std::array<EgressPortManager*, 4> egress_port_managers;
    
    // Central Port Router (contains 4 Ingress + 4 Egress Queue Managers)
    PortRouter<4>* port_router;
    
    // =============================================================================
    // Internal AXIS Signal Arrays
    // =============================================================================
    
    // Ingress PM → Ingress QM (via Port Router)
    std::array<sc_signal<bool>, 4> ingress_pm_to_qm_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> ingress_pm_to_qm_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> ingress_pm_to_qm_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> ingress_pm_to_qm_tuser;
    std::array<sc_signal<bool>, 4> ingress_pm_to_qm_tlast;
    std::array<sc_signal<bool>, 4> ingress_pm_to_qm_tready;
    
    // Egress QM → Egress PM (via Port Router)
    std::array<sc_signal<bool>, 4> egress_qm_to_pm_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> egress_qm_to_pm_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> egress_qm_to_pm_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> egress_qm_to_pm_tuser;
    std::array<sc_signal<bool>, 4> egress_qm_to_pm_tlast;
    std::array<sc_signal<bool>, 4> egress_qm_to_pm_tready;
    
    // AXI signals for Port Router
    sc_signal<bool> router_axi_master_valid;
    sc_signal<sc_bv<32>> router_axi_master_addr;
    sc_signal<sc_bv<32>> router_axi_master_data;
    sc_signal<bool> router_axi_master_ready;
    sc_signal<bool> router_axi_slave_valid;
    sc_signal<sc_bv<32>> router_axi_slave_addr;
    sc_signal<sc_bv<32>> router_axi_slave_data;
    sc_signal<bool> router_axi_slave_ready;
    
    // Ingress Port Manager AXI signals
    std::array<sc_signal<bool>, 4> ingress_pm_axi_master_valid;
    std::array<sc_signal<sc_bv<32>>, 4> ingress_pm_axi_master_addr;
    std::array<sc_signal<sc_bv<32>>, 4> ingress_pm_axi_master_data;
    std::array<sc_signal<bool>, 4> ingress_pm_axi_master_ready;
    std::array<sc_signal<bool>, 4> ingress_pm_axi_slave_valid;
    std::array<sc_signal<sc_bv<32>>, 4> ingress_pm_axi_slave_addr;
    std::array<sc_signal<sc_bv<32>>, 4> ingress_pm_axi_slave_data;
    std::array<sc_signal<bool>, 4> ingress_pm_axi_slave_ready;
    
    // Egress Port Manager AXI signals
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
    // Statistics and State
    // =============================================================================
    
    uint64_t total_packets_processed;
    uint64_t total_bytes_processed;
    
    // =============================================================================
    // SystemC Processes
    // =============================================================================
    
    void axi_configuration_process();
    void statistics_process();
    
    // =============================================================================
    // Helper Functions
    // =============================================================================
    
    void create_components();
    void connect_components();
    void initialize_system();
    void configure_round_robin_routing();
};

} // namespace switch_internal_p2p

#endif // COMPLETE_4PORT_SWITCH_H