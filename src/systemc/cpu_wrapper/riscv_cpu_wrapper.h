/*!
 * \file riscv_cpu_wrapper.h
 * \brief RISC-V CPU Wrapper for Switch Integration
 * \author Switch Development Team
 * \date August 2024
 */

#ifndef RISCV_CPU_WRAPPER_H
#define RISCV_CPU_WRAPPER_H

#include "systemc.h"
#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"
#include "tlm_utils/simple_initiator_socket.h"

// mariusmm RISC-V includes
#include "../../../external/riscv-tlm/inc/CPU.h"
#include "../../../external/riscv-tlm/inc/Memory.h"
#include "../../../external/riscv-tlm/inc/BusCtrl.h"
#include "../../../external/riscv-tlm/inc/Timer.h"
#include "../../../external/riscv-tlm/inc/Trace.h"

#include "../common/switch_types.h"

namespace switch_internal_p2p {

/**
 * @brief RISC-V CPU Wrapper for Switch Integration
 * 
 * This module wraps the mariusmm RISC-V CPU and provides AXIS interface
 * for integration with the switch fabric. It handles:
 * - AXIS packet reception from Port Router
 * - TLM transaction conversion
 * - Credit management (optimized for CPU characteristics)
 * - Memory-mapped switch control interface
 */
class RISCVCpuWrapper : public sc_module {

public:
    // =============================================================================
    // AXIS Interface (connects to Port Router)
    // =============================================================================
    
    // AXIS Input from Port Router (error packets, control packets)
    sc_in<bool> axis_in_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> axis_in_tdata;     // sc_bv로 변경 (Port Router 호환)
    sc_in<sc_bv<AXIS_DATA_WIDTH/8>> axis_in_tkeep;   // sc_bv로 변경 (Port Router 호환)
    sc_in<sc_bv<AXIS_USER_WIDTH>> axis_in_tuser;     // sc_bv로 변경 (Port Router 호환)
    sc_in<bool> axis_in_tlast;
    sc_out<bool> axis_in_tready;
    
    // AXIS Output to Port Router (control responses, statistics)
    sc_out<bool> axis_out_tvalid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> axis_out_tdata;   // sc_bv로 변경 (Port Router 호환)
    sc_out<sc_bv<AXIS_DATA_WIDTH/8>> axis_out_tkeep; // sc_bv로 변경 (Port Router 호환)
    sc_out<sc_bv<AXIS_USER_WIDTH>> axis_out_tuser;   // sc_bv로 변경 (Port Router 호환)
    sc_out<bool> axis_out_tlast;
    sc_in<bool> axis_out_tready;

    // =============================================================================
    // Control and Configuration
    // =============================================================================
    
    // Clock and Reset
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // AXI Interface for external configuration (simplified for prototype)
    sc_in<bool> axi_slave_valid;
    sc_in<sc_uint<32>> axi_slave_addr;
    sc_in<sc_uint<32>> axi_slave_data;
    sc_out<bool> axi_slave_ready;

    // =============================================================================
    // Constructor and Destructor
    // =============================================================================
    
    SC_CTOR(RISCVCpuWrapper);
    ~RISCVCpuWrapper();

    // =============================================================================
    // Public Methods for Testing
    // =============================================================================
    
    /**
     * @brief Get current credit count (for testing)
     */
    uint32_t get_current_credits() const { return current_credits; }
    
    /**
     * @brief Get packet processing statistics
     */
    uint32_t get_packets_processed() const { return packets_processed; }
    
    /**
     * @brief Check if CPU is ready to receive packets
     */
    bool is_ready_for_packets() const;

private:
    // =============================================================================
    // CPU Configuration (optimized for software processing)
    // =============================================================================
    
    static constexpr uint32_t CPU_QUEUE_SIZE = 16;          // Small queue for CPU
    static constexpr uint32_t CPU_CREDIT_WATERMARK = 8;     // 50% watermark
    static constexpr uint32_t CPU_MAX_BURST_SIZE = 4;       // Burst limit
    
    // On-chip low latency characteristics (static const instead of constexpr)
    static const sc_time CPU_PROCESSING_DELAY;
    static const sc_time CPU_MEMORY_ACCESS_TIME;

    // =============================================================================
    // Internal RISC-V CPU Components (mariusmm)
    // =============================================================================
    
    riscv_tlm::CPU* riscv_cpu;
    riscv_tlm::Memory* riscv_memory;
    riscv_tlm::BusCtrl* riscv_bus;
    riscv_tlm::peripherals::Timer* riscv_timer;
    riscv_tlm::peripherals::Trace* riscv_trace;

    // =============================================================================
    // Internal State and Buffers
    // =============================================================================
    
    // Credit management
    uint32_t current_credits;
    uint32_t max_credits;
    
    // Packet processing statistics
    uint32_t packets_processed;
    uint32_t packets_dropped;
    uint32_t total_bytes_processed;
    
    // AXIS packet buffer (small size for CPU)
    std::queue<PacketEntry> input_packet_queue;
    std::queue<PacketEntry> output_packet_queue;
    
    // Current packet assembly state
    bool packet_in_progress;
    std::vector<uint8_t> current_packet_data;
    InternalHeader current_header;

    // =============================================================================
    // SystemC Processes
    // =============================================================================
    
    /**
     * @brief Main AXIS input processing thread
     */
    void axis_input_process();
    
    /**
     * @brief Main AXIS output processing thread  
     */
    void axis_output_process();
    
    /**
     * @brief Credit management thread
     */
    void credit_management_process();
    
    /**
     * @brief AXI slave process for external configuration
     */
    void axi_slave_process();
    
    /**
     * @brief CPU packet processing thread (TLM transactions)
     */
    void cpu_processing_thread();

    // =============================================================================
    // Helper Methods
    // =============================================================================
    
    /**
     * @brief Initialize internal RISC-V CPU components
     */
    void create_riscv_components();
    
    /**
     * @brief Connect RISC-V CPU components
     */
    void connect_riscv_components();
    
    /**
     * @brief Convert AXIS packet to TLM transaction
     */
    void axis_to_tlm_conversion(const PacketEntry& packet);
    
    /**
     * @brief Process received packet and generate response
     */
    void process_received_packet(const PacketEntry& packet);
    
    /**
     * @brief Update credit count and request more if needed
     */
    void update_credits();
    
    /**
     * @brief Send credit return to source
     */
    void send_credit_return(uint8_t source_port, uint32_t credits);
};

} // namespace switch_internal_p2p

#endif // RISCV_CPU_WRAPPER_H