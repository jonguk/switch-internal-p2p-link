#ifndef INGRESS_PORT_MANAGER_H
#define INGRESS_PORT_MANAGER_H

#include <systemc.h>
#include <queue>
#include <vector>
#include "../common/switch_types.h"

namespace switch_internal_p2p {

// =============================================================================
// Ingress Port Manager
// =============================================================================

SC_MODULE(IngressPortManager) {
public:
    // =============================================================================
    // Ports and Signals
    // =============================================================================
    
    // Clock and Reset
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // External Interface (from external Egressor)
    sc_in<bool> ext_valid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_in<bool> ext_last;
    sc_out<bool> ext_ready;
    
    // AXIS Master Interface (to Ingress Queue Manager)
    sc_out<bool> axis_tvalid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_out<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_out<bool> axis_tlast;
    sc_in<bool> axis_tready;
    
    // AXI Interface (to Port-level AXI Switch)
    sc_out<bool> axi_master_valid;
    sc_out<sc_bv<32>> axi_master_addr;
    sc_out<sc_bv<32>> axi_master_data;
    sc_in<bool> axi_master_ready;
    
    sc_in<bool> axi_slave_valid;
    sc_in<sc_bv<32>> axi_slave_addr;
    sc_in<sc_bv<32>> axi_slave_data;
    sc_out<bool> axi_slave_ready;
    
    // Credit Return Interface (from Egress Queue Manager) - simplified
    sc_in<bool> credit_return_valid;
    sc_out<bool> credit_return_ready;
    
    // =============================================================================
    // Constructor and Destructor
    // =============================================================================
    
    SC_CTOR(IngressPortManager) : 
        port_id(0),
        total_credits_available(0),
        packets_received(0),
        packets_forwarded(0) {
        
        // Initialize circular buffer
        circular_buffer.resize(BUFFER_SIZE);
        buffer_head = 0;
        buffer_tail = 0;
        buffer_count = 0;
        
        // Register processes
        SC_CTHREAD(external_receive_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(internal_transmit_process, clk.pos());
        reset_signal_is(rst_n, false);
        
        SC_CTHREAD(credit_management_process, clk.pos());
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
    
    uint64_t get_packets_received() const { return packets_received; }
    uint64_t get_packets_forwarded() const { return packets_forwarded; }
    uint32_t get_buffer_utilization() const { return buffer_count; }
    uint16_t get_available_credits() const { return total_credits_available; }

private:
    // =============================================================================
    // Internal Types and Constants
    // =============================================================================
    
    static const size_t BUFFER_SIZE = 1024;  // Circular buffer size
    static const size_t MAX_PACKET_BUFFER = MAX_PACKET_SIZE;
    
    struct RawPacketEntry {
        std::vector<uint8_t> data;
        uint32_t timestamp;
        bool valid;
        
        RawPacketEntry() : timestamp(0), valid(false) {}
    };
    
    // =============================================================================
    // Member Variables
    // =============================================================================
    
    // Configuration
    uint8_t port_id;
    
    // Raw Data Circular Buffer (no processing, just raw storage)
    std::vector<RawPacketEntry> circular_buffer;
    size_t buffer_head;
    size_t buffer_tail;
    size_t buffer_count;
    
    // Credit Management
    uint16_t total_credits_available;
    
    // Statistics
    uint64_t packets_received;
    uint64_t packets_forwarded;
    
    // Error Statistics (4번: 에러 처리)
    struct ErrorStats {
        uint64_t crc_errors;               // CRC 검증 실패
        uint64_t size_mismatch_errors;     // 패킷 크기 불일치
        uint64_t invalid_size_errors;      // 유효하지 않은 전체 크기
        uint64_t invalid_queue_errors;     // 유효하지 않은 큐 ID
        uint64_t total_dropped_packets;    // 총 드롭된 패킷 수
        
        ErrorStats() : crc_errors(0), size_mismatch_errors(0), 
                      invalid_size_errors(0), invalid_queue_errors(0),
                      total_dropped_packets(0) {}
    } error_stats;
    
    // Temporary packet assembly
    std::vector<uint8_t> current_packet_buffer;
    bool packet_in_progress;
    
    // =============================================================================
    // Process Declarations
    // =============================================================================
    
    void external_receive_process();        // Receive from external interface
    void internal_transmit_process();       // Transmit to internal AXIS
    void credit_management_process();       // Handle credit returns
    void axi_slave_process();               // Handle AXI slave interface
    
    // =============================================================================
    // Helper Functions
    // =============================================================================
    
    bool is_buffer_full() const;
    bool is_buffer_empty() const;
    void store_raw_packet(const std::vector<uint8_t>& packet_data);
    bool retrieve_raw_packet(std::vector<uint8_t>& packet_data);
    InternalHeader generate_internal_header(const std::vector<uint8_t>& packet_data);
    void extract_credit_info(const std::vector<uint8_t>& packet_data, uint8_t& credits);
    void send_axis_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header);
};

} // namespace switch_internal_p2p

#endif // INGRESS_PORT_MANAGER_H