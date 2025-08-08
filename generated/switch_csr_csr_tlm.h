#ifndef SWITCH_CSR_CSR_TLM_H
#define SWITCH_CSR_CSR_TLM_H

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_target_socket.h>
#include <map>
#include <iostream>
#include <iomanip>

using namespace sc_core;
using namespace tlm;

/**
 * Control and Status Registers for the internal P2P switch
 * 
 * SystemC TLM-2.0 기반 CSR 모델
 * SystemRDL에서 자동 생성됨
 */
class switch_csr_csr_tlm : public sc_module {
public:
    // TLM-2.0 타겟 소켓
    tlm_utils::simple_target_socket<switch_csr_csr_tlm> target_socket;
    
    // 생성자
    SC_HAS_PROCESS(switch_csr_csr_tlm);
    switch_csr_csr_tlm(sc_module_name name);
    
    // TLM-2.0 인터페이스
    virtual void b_transport(tlm::tlm_generic_payload& trans, sc_time& delay);
    
    // 레지스터 접근 함수들
    uint32_t read_device_id_reg();
    void write_device_id_reg(uint32_t value);
    uint32_t read_control_reg();
    void write_control_reg(uint32_t value);
    uint32_t read_status_reg();
    void write_status_reg(uint32_t value);
    uint32_t read_interrupt_enable_reg();
    void write_interrupt_enable_reg(uint32_t value);
    uint32_t read_interrupt_status_reg();
    void write_interrupt_status_reg(uint32_t value);
    uint32_t read_port_config_reg(unsigned int index);
    void write_port_config_reg(uint32_t value, unsigned int index);
    uint32_t read_port_status_reg(unsigned int index);
    void write_port_status_reg(uint32_t value, unsigned int index);
    uint32_t read_queue_config_reg();
    void write_queue_config_reg(uint32_t value);
    uint32_t read_perf_total_packets();
    void write_perf_total_packets(uint32_t value);
    uint32_t read_perf_error_count();
    void write_perf_error_count(uint32_t value);
    uint32_t read_perf_bandwidth();
    void write_perf_bandwidth(uint32_t value);
    uint32_t read_debug_control_reg();
    void write_debug_control_reg(uint32_t value);
    uint32_t read_debug_status_reg();
    void write_debug_status_reg(uint32_t value);

    // 필드별 접근 함수들
    uint32_t get_device_id_reg_device_id();
    void set_device_id_reg_device_id(uint32_t value);
    uint32_t get_device_id_reg_version();
    void set_device_id_reg_version(uint32_t value);
    uint32_t get_control_reg_enable();
    void set_control_reg_enable(uint32_t value);
    uint32_t get_control_reg_reset();
    void set_control_reg_reset(uint32_t value);
    uint32_t get_control_reg_debug_mode();
    void set_control_reg_debug_mode(uint32_t value);
    uint32_t get_control_reg_loopback();
    void set_control_reg_loopback(uint32_t value);
    uint32_t get_control_reg_port_count();
    void set_control_reg_port_count(uint32_t value);
    uint32_t get_control_reg_reserved();
    void set_control_reg_reserved(uint32_t value);
    uint32_t get_status_reg_ready();
    void set_status_reg_ready(uint32_t value);
    uint32_t get_status_reg_error();
    void set_status_reg_error(uint32_t value);
    uint32_t get_status_reg_active_ports();
    void set_status_reg_active_ports(uint32_t value);
    uint32_t get_status_reg_packet_count();
    void set_status_reg_packet_count(uint32_t value);
    uint32_t get_status_reg_reserved();
    void set_status_reg_reserved(uint32_t value);
    uint32_t get_interrupt_enable_reg_error_int_en();
    void set_interrupt_enable_reg_error_int_en(uint32_t value);
    uint32_t get_interrupt_enable_reg_ready_int_en();
    void set_interrupt_enable_reg_ready_int_en(uint32_t value);
    uint32_t get_interrupt_enable_reg_packet_int_en();
    void set_interrupt_enable_reg_packet_int_en(uint32_t value);
    uint32_t get_interrupt_enable_reg_reserved();
    void set_interrupt_enable_reg_reserved(uint32_t value);
    uint32_t get_interrupt_status_reg_error_int();
    void set_interrupt_status_reg_error_int(uint32_t value);
    uint32_t get_interrupt_status_reg_ready_int();
    void set_interrupt_status_reg_ready_int(uint32_t value);
    uint32_t get_interrupt_status_reg_packet_int();
    void set_interrupt_status_reg_packet_int(uint32_t value);
    uint32_t get_interrupt_status_reg_reserved();
    void set_interrupt_status_reg_reserved(uint32_t value);
    uint32_t get_port_config_reg_port_enable(unsigned int index);
    void set_port_config_reg_port_enable(uint32_t value, unsigned int index);
    uint32_t get_port_config_reg_port_priority(unsigned int index);
    void set_port_config_reg_port_priority(uint32_t value, unsigned int index);
    uint32_t get_port_config_reg_port_type(unsigned int index);
    void set_port_config_reg_port_type(uint32_t value, unsigned int index);
    uint32_t get_port_config_reg_flow_control(unsigned int index);
    void set_port_config_reg_flow_control(uint32_t value, unsigned int index);
    uint32_t get_port_config_reg_reserved(unsigned int index);
    void set_port_config_reg_reserved(uint32_t value, unsigned int index);
    uint32_t get_port_status_reg_port_active(unsigned int index);
    void set_port_status_reg_port_active(uint32_t value, unsigned int index);
    uint32_t get_port_status_reg_port_error(unsigned int index);
    void set_port_status_reg_port_error(uint32_t value, unsigned int index);
    uint32_t get_port_status_reg_link_up(unsigned int index);
    void set_port_status_reg_link_up(uint32_t value, unsigned int index);
    uint32_t get_port_status_reg_tx_busy(unsigned int index);
    void set_port_status_reg_tx_busy(uint32_t value, unsigned int index);
    uint32_t get_port_status_reg_rx_ready(unsigned int index);
    void set_port_status_reg_rx_ready(uint32_t value, unsigned int index);
    uint32_t get_port_status_reg_packet_count(unsigned int index);
    void set_port_status_reg_packet_count(uint32_t value, unsigned int index);
    uint32_t get_port_status_reg_reserved(unsigned int index);
    void set_port_status_reg_reserved(uint32_t value, unsigned int index);
    uint32_t get_queue_config_reg_queue_depth();
    void set_queue_config_reg_queue_depth(uint32_t value);
    uint32_t get_queue_config_reg_queue_count();
    void set_queue_config_reg_queue_count(uint32_t value);
    uint32_t get_queue_config_reg_buffer_size();
    void set_queue_config_reg_buffer_size(uint32_t value);
    uint32_t get_queue_config_reg_reserved();
    void set_queue_config_reg_reserved(uint32_t value);
    uint32_t get_perf_total_packets_total_packets();
    void set_perf_total_packets_total_packets(uint32_t value);
    uint32_t get_perf_error_count_error_count();
    void set_perf_error_count_error_count(uint32_t value);
    uint32_t get_perf_bandwidth_bandwidth_util();
    void set_perf_bandwidth_bandwidth_util(uint32_t value);
    uint32_t get_perf_bandwidth_reserved();
    void set_perf_bandwidth_reserved(uint32_t value);
    uint32_t get_debug_control_reg_trace_enable();
    void set_debug_control_reg_trace_enable(uint32_t value);
    uint32_t get_debug_control_reg_trace_port_sel();
    void set_debug_control_reg_trace_port_sel(uint32_t value);
    uint32_t get_debug_control_reg_breakpoint_en();
    void set_debug_control_reg_breakpoint_en(uint32_t value);
    uint32_t get_debug_control_reg_reserved();
    void set_debug_control_reg_reserved(uint32_t value);
    uint32_t get_debug_status_reg_trace_active();
    void set_debug_status_reg_trace_active(uint32_t value);
    uint32_t get_debug_status_reg_breakpoint_hit();
    void set_debug_status_reg_breakpoint_hit(uint32_t value);
    uint32_t get_debug_status_reg_trace_overflow();
    void set_debug_status_reg_trace_overflow(uint32_t value);
    uint32_t get_debug_status_reg_reserved();
    void set_debug_status_reg_reserved(uint32_t value);

    // 유틸리티 함수들
    void print_registers();
    void reset_all_registers();
    
private:
    // 레지스터 저장소
    std::map<uint32_t, uint32_t> m_registers;
    
    // 내부 함수들
    uint32_t read_register_raw(uint32_t address);
    void write_register_raw(uint32_t address, uint32_t value);
    bool is_valid_address(uint32_t address);
    
    // 레지스터 주소 상수들
    static const uint32_t DEVICE_ID_REG_ADDR = 0x00000000;
    static const uint32_t CONTROL_REG_ADDR = 0x00000004;
    static const uint32_t STATUS_REG_ADDR = 0x00000008;
    static const uint32_t INTERRUPT_ENABLE_REG_ADDR = 0x0000000C;
    static const uint32_t INTERRUPT_STATUS_REG_ADDR = 0x00000010;
    static const uint32_t PORT_CONFIG_REG_BASE = 0x00000020;
    static const uint32_t PORT_CONFIG_REG_SIZE = 4;
    static const uint32_t PORT_CONFIG_REG_STRIDE = 0x0004;
    static const uint32_t PORT_STATUS_REG_BASE = 0x00000040;
    static const uint32_t PORT_STATUS_REG_SIZE = 4;
    static const uint32_t PORT_STATUS_REG_STRIDE = 0x0004;
    static const uint32_t QUEUE_CONFIG_REG_ADDR = 0x00000060;
    static const uint32_t PERF_TOTAL_PACKETS_ADDR = 0x00000080;
    static const uint32_t PERF_ERROR_COUNT_ADDR = 0x00000084;
    static const uint32_t PERF_BANDWIDTH_ADDR = 0x00000088;
    static const uint32_t DEBUG_CONTROL_REG_ADDR = 0x00000100;
    static const uint32_t DEBUG_STATUS_REG_ADDR = 0x00000104;

    // 필드 마스크 및 시프트 상수들
    static const uint32_t DEVICE_ID_REG_DEVICE_ID_MASK = 0x0000FFFF;
    static const uint32_t DEVICE_ID_REG_DEVICE_ID_SHIFT = 0;
    static const uint32_t DEVICE_ID_REG_VERSION_MASK = 0x0000FFFF;
    static const uint32_t DEVICE_ID_REG_VERSION_SHIFT = 16;
    static const uint32_t CONTROL_REG_ENABLE_MASK = 0x00000001;
    static const uint32_t CONTROL_REG_ENABLE_SHIFT = 0;
    static const uint32_t CONTROL_REG_RESET_MASK = 0x00000001;
    static const uint32_t CONTROL_REG_RESET_SHIFT = 1;
    static const uint32_t CONTROL_REG_DEBUG_MODE_MASK = 0x00000001;
    static const uint32_t CONTROL_REG_DEBUG_MODE_SHIFT = 2;
    static const uint32_t CONTROL_REG_LOOPBACK_MASK = 0x00000001;
    static const uint32_t CONTROL_REG_LOOPBACK_SHIFT = 3;
    static const uint32_t CONTROL_REG_PORT_COUNT_MASK = 0x0000000F;
    static const uint32_t CONTROL_REG_PORT_COUNT_SHIFT = 4;
    static const uint32_t CONTROL_REG_RESERVED_MASK = 0x00FFFFFF;
    static const uint32_t CONTROL_REG_RESERVED_SHIFT = 8;
    static const uint32_t STATUS_REG_READY_MASK = 0x00000001;
    static const uint32_t STATUS_REG_READY_SHIFT = 0;
    static const uint32_t STATUS_REG_ERROR_MASK = 0x00000001;
    static const uint32_t STATUS_REG_ERROR_SHIFT = 1;
    static const uint32_t STATUS_REG_ACTIVE_PORTS_MASK = 0x0000000F;
    static const uint32_t STATUS_REG_ACTIVE_PORTS_SHIFT = 4;
    static const uint32_t STATUS_REG_PACKET_COUNT_MASK = 0x0000FFFF;
    static const uint32_t STATUS_REG_PACKET_COUNT_SHIFT = 8;
    static const uint32_t STATUS_REG_RESERVED_MASK = 0x000000FF;
    static const uint32_t STATUS_REG_RESERVED_SHIFT = 24;
    static const uint32_t INTERRUPT_ENABLE_REG_ERROR_INT_EN_MASK = 0x00000001;
    static const uint32_t INTERRUPT_ENABLE_REG_ERROR_INT_EN_SHIFT = 0;
    static const uint32_t INTERRUPT_ENABLE_REG_READY_INT_EN_MASK = 0x00000001;
    static const uint32_t INTERRUPT_ENABLE_REG_READY_INT_EN_SHIFT = 1;
    static const uint32_t INTERRUPT_ENABLE_REG_PACKET_INT_EN_MASK = 0x00000001;
    static const uint32_t INTERRUPT_ENABLE_REG_PACKET_INT_EN_SHIFT = 2;
    static const uint32_t INTERRUPT_ENABLE_REG_RESERVED_MASK = 0x1FFFFFFF;
    static const uint32_t INTERRUPT_ENABLE_REG_RESERVED_SHIFT = 3;
    static const uint32_t INTERRUPT_STATUS_REG_ERROR_INT_MASK = 0x00000001;
    static const uint32_t INTERRUPT_STATUS_REG_ERROR_INT_SHIFT = 0;
    static const uint32_t INTERRUPT_STATUS_REG_READY_INT_MASK = 0x00000001;
    static const uint32_t INTERRUPT_STATUS_REG_READY_INT_SHIFT = 1;
    static const uint32_t INTERRUPT_STATUS_REG_PACKET_INT_MASK = 0x00000001;
    static const uint32_t INTERRUPT_STATUS_REG_PACKET_INT_SHIFT = 2;
    static const uint32_t INTERRUPT_STATUS_REG_RESERVED_MASK = 0x1FFFFFFF;
    static const uint32_t INTERRUPT_STATUS_REG_RESERVED_SHIFT = 3;
    static const uint32_t PORT_CONFIG_REG_PORT_ENABLE_MASK = 0x00000001;
    static const uint32_t PORT_CONFIG_REG_PORT_ENABLE_SHIFT = 0;
    static const uint32_t PORT_CONFIG_REG_PORT_PRIORITY_MASK = 0x00000007;
    static const uint32_t PORT_CONFIG_REG_PORT_PRIORITY_SHIFT = 1;
    static const uint32_t PORT_CONFIG_REG_PORT_TYPE_MASK = 0x00000003;
    static const uint32_t PORT_CONFIG_REG_PORT_TYPE_SHIFT = 4;
    static const uint32_t PORT_CONFIG_REG_FLOW_CONTROL_MASK = 0x00000001;
    static const uint32_t PORT_CONFIG_REG_FLOW_CONTROL_SHIFT = 6;
    static const uint32_t PORT_CONFIG_REG_RESERVED_MASK = 0x01FFFFFF;
    static const uint32_t PORT_CONFIG_REG_RESERVED_SHIFT = 7;
    static const uint32_t PORT_STATUS_REG_PORT_ACTIVE_MASK = 0x00000001;
    static const uint32_t PORT_STATUS_REG_PORT_ACTIVE_SHIFT = 0;
    static const uint32_t PORT_STATUS_REG_PORT_ERROR_MASK = 0x00000001;
    static const uint32_t PORT_STATUS_REG_PORT_ERROR_SHIFT = 1;
    static const uint32_t PORT_STATUS_REG_LINK_UP_MASK = 0x00000001;
    static const uint32_t PORT_STATUS_REG_LINK_UP_SHIFT = 2;
    static const uint32_t PORT_STATUS_REG_TX_BUSY_MASK = 0x00000001;
    static const uint32_t PORT_STATUS_REG_TX_BUSY_SHIFT = 3;
    static const uint32_t PORT_STATUS_REG_RX_READY_MASK = 0x00000001;
    static const uint32_t PORT_STATUS_REG_RX_READY_SHIFT = 4;
    static const uint32_t PORT_STATUS_REG_PACKET_COUNT_MASK = 0x000000FF;
    static const uint32_t PORT_STATUS_REG_PACKET_COUNT_SHIFT = 8;
    static const uint32_t PORT_STATUS_REG_RESERVED_MASK = 0x0000FFFF;
    static const uint32_t PORT_STATUS_REG_RESERVED_SHIFT = 16;
    static const uint32_t QUEUE_CONFIG_REG_QUEUE_DEPTH_MASK = 0x0000000F;
    static const uint32_t QUEUE_CONFIG_REG_QUEUE_DEPTH_SHIFT = 0;
    static const uint32_t QUEUE_CONFIG_REG_QUEUE_COUNT_MASK = 0x0000000F;
    static const uint32_t QUEUE_CONFIG_REG_QUEUE_COUNT_SHIFT = 4;
    static const uint32_t QUEUE_CONFIG_REG_BUFFER_SIZE_MASK = 0x000000FF;
    static const uint32_t QUEUE_CONFIG_REG_BUFFER_SIZE_SHIFT = 8;
    static const uint32_t QUEUE_CONFIG_REG_RESERVED_MASK = 0x0000FFFF;
    static const uint32_t QUEUE_CONFIG_REG_RESERVED_SHIFT = 16;
    static const uint32_t PERF_TOTAL_PACKETS_TOTAL_PACKETS_MASK = 0xFFFFFFFF;
    static const uint32_t PERF_TOTAL_PACKETS_TOTAL_PACKETS_SHIFT = 0;
    static const uint32_t PERF_ERROR_COUNT_ERROR_COUNT_MASK = 0xFFFFFFFF;
    static const uint32_t PERF_ERROR_COUNT_ERROR_COUNT_SHIFT = 0;
    static const uint32_t PERF_BANDWIDTH_BANDWIDTH_UTIL_MASK = 0x000000FF;
    static const uint32_t PERF_BANDWIDTH_BANDWIDTH_UTIL_SHIFT = 0;
    static const uint32_t PERF_BANDWIDTH_RESERVED_MASK = 0x00FFFFFF;
    static const uint32_t PERF_BANDWIDTH_RESERVED_SHIFT = 8;
    static const uint32_t DEBUG_CONTROL_REG_TRACE_ENABLE_MASK = 0x00000001;
    static const uint32_t DEBUG_CONTROL_REG_TRACE_ENABLE_SHIFT = 0;
    static const uint32_t DEBUG_CONTROL_REG_TRACE_PORT_SEL_MASK = 0x00000007;
    static const uint32_t DEBUG_CONTROL_REG_TRACE_PORT_SEL_SHIFT = 1;
    static const uint32_t DEBUG_CONTROL_REG_BREAKPOINT_EN_MASK = 0x00000001;
    static const uint32_t DEBUG_CONTROL_REG_BREAKPOINT_EN_SHIFT = 4;
    static const uint32_t DEBUG_CONTROL_REG_RESERVED_MASK = 0x07FFFFFF;
    static const uint32_t DEBUG_CONTROL_REG_RESERVED_SHIFT = 5;
    static const uint32_t DEBUG_STATUS_REG_TRACE_ACTIVE_MASK = 0x00000001;
    static const uint32_t DEBUG_STATUS_REG_TRACE_ACTIVE_SHIFT = 0;
    static const uint32_t DEBUG_STATUS_REG_BREAKPOINT_HIT_MASK = 0x00000001;
    static const uint32_t DEBUG_STATUS_REG_BREAKPOINT_HIT_SHIFT = 1;
    static const uint32_t DEBUG_STATUS_REG_TRACE_OVERFLOW_MASK = 0x00000001;
    static const uint32_t DEBUG_STATUS_REG_TRACE_OVERFLOW_SHIFT = 2;
    static const uint32_t DEBUG_STATUS_REG_RESERVED_MASK = 0x1FFFFFFF;
    static const uint32_t DEBUG_STATUS_REG_RESERVED_SHIFT = 3;

};

#endif // SWITCH_CSR_CSR_TLM_H
