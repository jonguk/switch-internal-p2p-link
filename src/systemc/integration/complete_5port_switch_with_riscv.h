#ifndef COMPLETE_5PORT_SWITCH_WITH_RISCV_H
#define COMPLETE_5PORT_SWITCH_WITH_RISCV_H

#include <systemc.h>
#include <array>
#include "../common/switch_types.h"
#include "../port_manager/ingress_port_manager.h"
#include "../port_manager/egress_port_manager.h"
#include "../queue_manager/ingress_queue_manager.h"
#include "../queue_manager/egress_queue_manager.h"
#include "../router/port_router.h"
#include "../cpu_wrapper/riscv_cpu_wrapper.h"

namespace switch_internal_p2p {

// =============================================================================
// Complete 5-Port Switch with RISC-V CPU Port
// 4 Regular Ports + 1 RISC-V CPU Port (Port 4) for Error Handling & Control
// =============================================================================

SC_MODULE(Complete5PortSwitchWithRISCV) {
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
    
    // =============================================================================
    // Constructor and Destructor
    // =============================================================================
    
    SC_CTOR(Complete5PortSwitchWithRISCV) :
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
        SC_THREAD(statistics_process);
        SC_THREAD(error_monitoring_process);
        
        std::cout << "[Complete5PortSwitchWithRISCV] Created complete 5-port switch with RISC-V CPU" << std::endl;
    }
    
    ~Complete5PortSwitchWithRISCV() {
        // Clean up components
        cleanup();
        std::cout << "[Complete5PortSwitchWithRISCV] Destroyed complete 5-port switch" << std::endl;
    }

    // =============================================================================
    // Public Access Methods for Testing
    // =============================================================================
    
    /**
     * @brief Get current packet processing statistics
     */
    uint32_t get_total_packets_processed() const { return total_packets_processed; }
    uint32_t get_total_error_packets() const { return total_error_packets; }
    uint64_t get_total_bytes_processed() const { return total_bytes_processed; }
    
    /**
     * @brief Get CPU statistics and status
     */
    uint32_t get_cpu_packets_processed() const;
    uint32_t get_cpu_credits() const;
    bool is_cpu_ready() const;
    
    /**
     * @brief Get Port Router for testing access (PUBLIC for testing only)
     */
    PortRouter<5>* get_port_router() const { return port_router; }
    
    /**
     * @brief CPU Configuration Methods (simplified for testing)
     */
    void cpu_write_config(uint32_t addr, uint32_t data);
    uint32_t cpu_read_stats(uint32_t addr);
    
    /**
     * @brief Error forwarding control
     */
    void enable_error_forwarding(bool enable) { error_forwarding_enabled = enable; }
    void add_error_condition(uint8_t error_type);

private:
    // =============================================================================
    // Configuration Constants
    // =============================================================================
    
    static constexpr int NUM_REGULAR_PORTS = 4;
    static constexpr int CPU_PORT_ID = 0;    // CPU 포트를 0번으로 변경
    static constexpr int TOTAL_PORTS = 5;    // 5포트로 복원 (CPU 0번 + 실제 포트 1-4번)

    // =============================================================================
    // Internal Components (Simplified Architecture)
    // =============================================================================
    
    // RISC-V CPU Port (for Port 4)
    RISCVCpuWrapper* riscv_cpu_port;
    
    // Port Router (5 ports total: 4 regular + 1 CPU)
    // Port Router includes internal Queue Managers
    PortRouter<TOTAL_PORTS>* port_router;

    // =============================================================================
    // Internal Signal Arrays
    // =============================================================================
    
    // Port Router AXI Interface (REQUIRED for binding)
    sc_signal<bool> router_axi_master_valid;
    sc_signal<sc_bv<32>> router_axi_master_addr;
    sc_signal<sc_bv<32>> router_axi_master_data;
    sc_signal<bool> router_axi_master_ready;
    
    sc_signal<bool> router_axi_slave_valid;
    sc_signal<sc_bv<32>> router_axi_slave_addr;
    sc_signal<sc_bv<32>> router_axi_slave_data;
    sc_signal<bool> router_axi_slave_ready;
    
    // RISC-V CPU AXI Interface (REQUIRED for binding - slave only)
    sc_signal<bool> cpu_axi_slave_valid;
    sc_signal<sc_uint<32>> cpu_axi_slave_addr;
    sc_signal<sc_uint<32>> cpu_axi_slave_data;
    sc_signal<bool> cpu_axi_slave_ready;
    
    // RISC-V CPU AXIS Interface (REQUIRED for binding - compatible with Port Router)
    sc_signal<bool> cpu_axis_in_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> cpu_axis_in_tdata;    // sc_bv로 변경 (Port Router 호환)
    sc_signal<sc_bv<AXIS_DATA_WIDTH/8>> cpu_axis_in_tkeep;  // sc_bv로 변경 (Port Router 호환)
    sc_signal<sc_bv<AXIS_USER_WIDTH>> cpu_axis_in_tuser;    // sc_bv로 변경 (Port Router 호환)
    sc_signal<bool> cpu_axis_in_tlast;
    sc_signal<bool> cpu_axis_in_tready;
    
    sc_signal<bool> cpu_axis_out_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> cpu_axis_out_tdata;   // sc_bv로 변경 (Port Router 호환)
    sc_signal<sc_bv<AXIS_DATA_WIDTH/8>> cpu_axis_out_tkeep; // sc_bv로 변경 (Port Router 호환)
    sc_signal<sc_bv<AXIS_USER_WIDTH>> cpu_axis_out_tuser;   // sc_bv로 변경 (Port Router 호환)
    sc_signal<bool> cpu_axis_out_tlast;
    sc_signal<bool> cpu_axis_out_tready;

    // =============================================================================
    // Statistics and Configuration
    // =============================================================================
    
    uint32_t total_error_packets;
    uint32_t total_packets_processed;
    uint64_t total_bytes_processed;
    
    bool error_forwarding_enabled;
    std::vector<uint8_t> error_conditions;

    // =============================================================================
    // Internal Methods
    // =============================================================================
    
    /**
     * @brief Create all component instances
     */
    void create_components();
    
    /**
     * @brief Connect all components together
     */
    void connect_components();
    
    /**
     * @brief Initialize system configuration
     */
    void initialize_system();
    
    /**
     * @brief Clean up all components
     */
    void cleanup();
    
    /**
     * @brief Connect RISC-V CPU port
     */
    void connect_cpu_port();

    // =============================================================================
    // SystemC Processes
    // =============================================================================
    
    /**
     * @brief Statistics collection process
     */
    void statistics_process();
    
    /**
     * @brief Error monitoring and forwarding process
     */
    void error_monitoring_process();
    
    // =============================================================================
    // Helper Methods
    // =============================================================================
    
    /**
     * @brief Forward error packet to CPU
     */
    void forward_error_packet_to_cpu(const PacketEntry& error_packet, uint8_t error_type);
    
    /**
     * @brief Handle CPU configuration requests
     */
    void handle_cpu_config(uint32_t addr, uint32_t data);
};

} // namespace switch_internal_p2p

#endif // COMPLETE_5PORT_SWITCH_WITH_RISCV_H