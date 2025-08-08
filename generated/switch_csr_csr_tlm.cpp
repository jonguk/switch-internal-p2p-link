#include "switch_csr_csr_tlm.h"

switch_csr_csr_tlm::switch_csr_csr_tlm(sc_module_name name) 
    : sc_module(name), target_socket("target_socket") {
    
    // TLM-2.0 콜백 등록
    target_socket.register_b_transport(this, &switch_csr_csr_tlm::b_transport);
    
    // 레지스터 초기화
    reset_all_registers();
    
    SC_REPORT_INFO(name, "CSR TLM model initialized");
}

void switch_csr_csr_tlm::b_transport(tlm::tlm_generic_payload& trans, sc_time& delay) {
    tlm::tlm_command cmd = trans.get_command();
    sc_dt::uint64 addr = trans.get_address();
    unsigned char* ptr = trans.get_data_ptr();
    unsigned int len = trans.get_data_length();
    
    // 주소 유효성 검사
    if (!is_valid_address(static_cast<uint32_t>(addr))) {
        trans.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
        return;
    }
    
    // 길이 검사 (32비트 접근만 지원)
    if (len != 4) {
        trans.set_response_status(tlm::TLM_BURST_ERROR_RESPONSE);
        return;
    }
    
    // 명령 처리
    if (cmd == tlm::TLM_READ_COMMAND) {
        uint32_t data = read_register_raw(static_cast<uint32_t>(addr));
        memcpy(ptr, &data, 4);
        trans.set_response_status(tlm::TLM_OK_RESPONSE);
    }
    else if (cmd == tlm::TLM_WRITE_COMMAND) {
        uint32_t data;
        memcpy(&data, ptr, 4);
        write_register_raw(static_cast<uint32_t>(addr), data);
        trans.set_response_status(tlm::TLM_OK_RESPONSE);
    }
    else {
        trans.set_response_status(tlm::TLM_COMMAND_ERROR_RESPONSE);
    }
    
    // 지연 시간 추가
    delay += sc_time(10, SC_NS);
}

uint32_t switch_csr_csr_tlm::read_register_raw(uint32_t address) {
    auto it = m_registers.find(address);
    return (it != m_registers.end()) ? it->second : 0;
}

void switch_csr_csr_tlm::write_register_raw(uint32_t address, uint32_t value) {
    m_registers[address] = value;
}

bool switch_csr_csr_tlm::is_valid_address(uint32_t address) {
    if (address == DEVICE_ID_REG_ADDR) return true;
    if (address == CONTROL_REG_ADDR) return true;
    if (address == STATUS_REG_ADDR) return true;
    if (address == INTERRUPT_ENABLE_REG_ADDR) return true;
    if (address == INTERRUPT_STATUS_REG_ADDR) return true;
    if (address >= PORT_CONFIG_REG_BASE && address <= 0x0000002C && (address - PORT_CONFIG_REG_BASE) % PORT_CONFIG_REG_STRIDE == 0) return true;
    if (address >= PORT_STATUS_REG_BASE && address <= 0x0000004C && (address - PORT_STATUS_REG_BASE) % PORT_STATUS_REG_STRIDE == 0) return true;
    if (address == QUEUE_CONFIG_REG_ADDR) return true;
    if (address == PERF_TOTAL_PACKETS_ADDR) return true;
    if (address == PERF_ERROR_COUNT_ADDR) return true;
    if (address == PERF_BANDWIDTH_ADDR) return true;
    if (address == DEBUG_CONTROL_REG_ADDR) return true;
    if (address == DEBUG_STATUS_REG_ADDR) return true;
    return false;
}

uint32_t switch_csr_csr_tlm::read_device_id_reg() {
    return read_register_raw(DEVICE_ID_REG_ADDR);
}

void switch_csr_csr_tlm::write_device_id_reg(uint32_t value) {
    write_register_raw(DEVICE_ID_REG_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_control_reg() {
    return read_register_raw(CONTROL_REG_ADDR);
}

void switch_csr_csr_tlm::write_control_reg(uint32_t value) {
    write_register_raw(CONTROL_REG_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_status_reg() {
    return read_register_raw(STATUS_REG_ADDR);
}

void switch_csr_csr_tlm::write_status_reg(uint32_t value) {
    write_register_raw(STATUS_REG_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_interrupt_enable_reg() {
    return read_register_raw(INTERRUPT_ENABLE_REG_ADDR);
}

void switch_csr_csr_tlm::write_interrupt_enable_reg(uint32_t value) {
    write_register_raw(INTERRUPT_ENABLE_REG_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_interrupt_status_reg() {
    return read_register_raw(INTERRUPT_STATUS_REG_ADDR);
}

void switch_csr_csr_tlm::write_interrupt_status_reg(uint32_t value) {
    write_register_raw(INTERRUPT_STATUS_REG_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_port_config_reg(unsigned int index) {
    if (index >= PORT_CONFIG_REG_SIZE) return 0;
    uint32_t addr = PORT_CONFIG_REG_BASE + index * PORT_CONFIG_REG_STRIDE;
    return read_register_raw(addr);
}

void switch_csr_csr_tlm::write_port_config_reg(uint32_t value, unsigned int index) {
    if (index >= PORT_CONFIG_REG_SIZE) return;
    uint32_t addr = PORT_CONFIG_REG_BASE + index * PORT_CONFIG_REG_STRIDE;
    write_register_raw(addr, value);
}

uint32_t switch_csr_csr_tlm::read_port_status_reg(unsigned int index) {
    if (index >= PORT_STATUS_REG_SIZE) return 0;
    uint32_t addr = PORT_STATUS_REG_BASE + index * PORT_STATUS_REG_STRIDE;
    return read_register_raw(addr);
}

void switch_csr_csr_tlm::write_port_status_reg(uint32_t value, unsigned int index) {
    if (index >= PORT_STATUS_REG_SIZE) return;
    uint32_t addr = PORT_STATUS_REG_BASE + index * PORT_STATUS_REG_STRIDE;
    write_register_raw(addr, value);
}

uint32_t switch_csr_csr_tlm::read_queue_config_reg() {
    return read_register_raw(QUEUE_CONFIG_REG_ADDR);
}

void switch_csr_csr_tlm::write_queue_config_reg(uint32_t value) {
    write_register_raw(QUEUE_CONFIG_REG_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_perf_total_packets() {
    return read_register_raw(PERF_TOTAL_PACKETS_ADDR);
}

void switch_csr_csr_tlm::write_perf_total_packets(uint32_t value) {
    write_register_raw(PERF_TOTAL_PACKETS_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_perf_error_count() {
    return read_register_raw(PERF_ERROR_COUNT_ADDR);
}

void switch_csr_csr_tlm::write_perf_error_count(uint32_t value) {
    write_register_raw(PERF_ERROR_COUNT_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_perf_bandwidth() {
    return read_register_raw(PERF_BANDWIDTH_ADDR);
}

void switch_csr_csr_tlm::write_perf_bandwidth(uint32_t value) {
    write_register_raw(PERF_BANDWIDTH_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_debug_control_reg() {
    return read_register_raw(DEBUG_CONTROL_REG_ADDR);
}

void switch_csr_csr_tlm::write_debug_control_reg(uint32_t value) {
    write_register_raw(DEBUG_CONTROL_REG_ADDR, value);
}

uint32_t switch_csr_csr_tlm::read_debug_status_reg() {
    return read_register_raw(DEBUG_STATUS_REG_ADDR);
}

void switch_csr_csr_tlm::write_debug_status_reg(uint32_t value) {
    write_register_raw(DEBUG_STATUS_REG_ADDR, value);
}

uint32_t switch_csr_csr_tlm::get_device_id_reg_device_id() {
    uint32_t reg_val = read_device_id_reg();
    return (reg_val >> DEVICE_ID_REG_DEVICE_ID_SHIFT) & DEVICE_ID_REG_DEVICE_ID_MASK;
}

void switch_csr_csr_tlm::set_device_id_reg_device_id(uint32_t value) {
    uint32_t reg_val = read_device_id_reg();
    reg_val &= ~(DEVICE_ID_REG_DEVICE_ID_MASK << DEVICE_ID_REG_DEVICE_ID_SHIFT);
    reg_val |= ((value & DEVICE_ID_REG_DEVICE_ID_MASK) << DEVICE_ID_REG_DEVICE_ID_SHIFT);
    write_device_id_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_device_id_reg_version() {
    uint32_t reg_val = read_device_id_reg();
    return (reg_val >> DEVICE_ID_REG_VERSION_SHIFT) & DEVICE_ID_REG_VERSION_MASK;
}

void switch_csr_csr_tlm::set_device_id_reg_version(uint32_t value) {
    uint32_t reg_val = read_device_id_reg();
    reg_val &= ~(DEVICE_ID_REG_VERSION_MASK << DEVICE_ID_REG_VERSION_SHIFT);
    reg_val |= ((value & DEVICE_ID_REG_VERSION_MASK) << DEVICE_ID_REG_VERSION_SHIFT);
    write_device_id_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_control_reg_enable() {
    uint32_t reg_val = read_control_reg();
    return (reg_val >> CONTROL_REG_ENABLE_SHIFT) & CONTROL_REG_ENABLE_MASK;
}

void switch_csr_csr_tlm::set_control_reg_enable(uint32_t value) {
    uint32_t reg_val = read_control_reg();
    reg_val &= ~(CONTROL_REG_ENABLE_MASK << CONTROL_REG_ENABLE_SHIFT);
    reg_val |= ((value & CONTROL_REG_ENABLE_MASK) << CONTROL_REG_ENABLE_SHIFT);
    write_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_control_reg_reset() {
    uint32_t reg_val = read_control_reg();
    return (reg_val >> CONTROL_REG_RESET_SHIFT) & CONTROL_REG_RESET_MASK;
}

void switch_csr_csr_tlm::set_control_reg_reset(uint32_t value) {
    uint32_t reg_val = read_control_reg();
    reg_val &= ~(CONTROL_REG_RESET_MASK << CONTROL_REG_RESET_SHIFT);
    reg_val |= ((value & CONTROL_REG_RESET_MASK) << CONTROL_REG_RESET_SHIFT);
    write_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_control_reg_debug_mode() {
    uint32_t reg_val = read_control_reg();
    return (reg_val >> CONTROL_REG_DEBUG_MODE_SHIFT) & CONTROL_REG_DEBUG_MODE_MASK;
}

void switch_csr_csr_tlm::set_control_reg_debug_mode(uint32_t value) {
    uint32_t reg_val = read_control_reg();
    reg_val &= ~(CONTROL_REG_DEBUG_MODE_MASK << CONTROL_REG_DEBUG_MODE_SHIFT);
    reg_val |= ((value & CONTROL_REG_DEBUG_MODE_MASK) << CONTROL_REG_DEBUG_MODE_SHIFT);
    write_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_control_reg_loopback() {
    uint32_t reg_val = read_control_reg();
    return (reg_val >> CONTROL_REG_LOOPBACK_SHIFT) & CONTROL_REG_LOOPBACK_MASK;
}

void switch_csr_csr_tlm::set_control_reg_loopback(uint32_t value) {
    uint32_t reg_val = read_control_reg();
    reg_val &= ~(CONTROL_REG_LOOPBACK_MASK << CONTROL_REG_LOOPBACK_SHIFT);
    reg_val |= ((value & CONTROL_REG_LOOPBACK_MASK) << CONTROL_REG_LOOPBACK_SHIFT);
    write_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_control_reg_port_count() {
    uint32_t reg_val = read_control_reg();
    return (reg_val >> CONTROL_REG_PORT_COUNT_SHIFT) & CONTROL_REG_PORT_COUNT_MASK;
}

void switch_csr_csr_tlm::set_control_reg_port_count(uint32_t value) {
    uint32_t reg_val = read_control_reg();
    reg_val &= ~(CONTROL_REG_PORT_COUNT_MASK << CONTROL_REG_PORT_COUNT_SHIFT);
    reg_val |= ((value & CONTROL_REG_PORT_COUNT_MASK) << CONTROL_REG_PORT_COUNT_SHIFT);
    write_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_control_reg_reserved() {
    uint32_t reg_val = read_control_reg();
    return (reg_val >> CONTROL_REG_RESERVED_SHIFT) & CONTROL_REG_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_control_reg_reserved(uint32_t value) {
    uint32_t reg_val = read_control_reg();
    reg_val &= ~(CONTROL_REG_RESERVED_MASK << CONTROL_REG_RESERVED_SHIFT);
    reg_val |= ((value & CONTROL_REG_RESERVED_MASK) << CONTROL_REG_RESERVED_SHIFT);
    write_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_status_reg_ready() {
    uint32_t reg_val = read_status_reg();
    return (reg_val >> STATUS_REG_READY_SHIFT) & STATUS_REG_READY_MASK;
}

void switch_csr_csr_tlm::set_status_reg_ready(uint32_t value) {
    uint32_t reg_val = read_status_reg();
    reg_val &= ~(STATUS_REG_READY_MASK << STATUS_REG_READY_SHIFT);
    reg_val |= ((value & STATUS_REG_READY_MASK) << STATUS_REG_READY_SHIFT);
    write_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_status_reg_error() {
    uint32_t reg_val = read_status_reg();
    return (reg_val >> STATUS_REG_ERROR_SHIFT) & STATUS_REG_ERROR_MASK;
}

void switch_csr_csr_tlm::set_status_reg_error(uint32_t value) {
    uint32_t reg_val = read_status_reg();
    reg_val &= ~(STATUS_REG_ERROR_MASK << STATUS_REG_ERROR_SHIFT);
    reg_val |= ((value & STATUS_REG_ERROR_MASK) << STATUS_REG_ERROR_SHIFT);
    write_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_status_reg_active_ports() {
    uint32_t reg_val = read_status_reg();
    return (reg_val >> STATUS_REG_ACTIVE_PORTS_SHIFT) & STATUS_REG_ACTIVE_PORTS_MASK;
}

void switch_csr_csr_tlm::set_status_reg_active_ports(uint32_t value) {
    uint32_t reg_val = read_status_reg();
    reg_val &= ~(STATUS_REG_ACTIVE_PORTS_MASK << STATUS_REG_ACTIVE_PORTS_SHIFT);
    reg_val |= ((value & STATUS_REG_ACTIVE_PORTS_MASK) << STATUS_REG_ACTIVE_PORTS_SHIFT);
    write_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_status_reg_packet_count() {
    uint32_t reg_val = read_status_reg();
    return (reg_val >> STATUS_REG_PACKET_COUNT_SHIFT) & STATUS_REG_PACKET_COUNT_MASK;
}

void switch_csr_csr_tlm::set_status_reg_packet_count(uint32_t value) {
    uint32_t reg_val = read_status_reg();
    reg_val &= ~(STATUS_REG_PACKET_COUNT_MASK << STATUS_REG_PACKET_COUNT_SHIFT);
    reg_val |= ((value & STATUS_REG_PACKET_COUNT_MASK) << STATUS_REG_PACKET_COUNT_SHIFT);
    write_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_status_reg_reserved() {
    uint32_t reg_val = read_status_reg();
    return (reg_val >> STATUS_REG_RESERVED_SHIFT) & STATUS_REG_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_status_reg_reserved(uint32_t value) {
    uint32_t reg_val = read_status_reg();
    reg_val &= ~(STATUS_REG_RESERVED_MASK << STATUS_REG_RESERVED_SHIFT);
    reg_val |= ((value & STATUS_REG_RESERVED_MASK) << STATUS_REG_RESERVED_SHIFT);
    write_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_interrupt_enable_reg_error_int_en() {
    uint32_t reg_val = read_interrupt_enable_reg();
    return (reg_val >> INTERRUPT_ENABLE_REG_ERROR_INT_EN_SHIFT) & INTERRUPT_ENABLE_REG_ERROR_INT_EN_MASK;
}

void switch_csr_csr_tlm::set_interrupt_enable_reg_error_int_en(uint32_t value) {
    uint32_t reg_val = read_interrupt_enable_reg();
    reg_val &= ~(INTERRUPT_ENABLE_REG_ERROR_INT_EN_MASK << INTERRUPT_ENABLE_REG_ERROR_INT_EN_SHIFT);
    reg_val |= ((value & INTERRUPT_ENABLE_REG_ERROR_INT_EN_MASK) << INTERRUPT_ENABLE_REG_ERROR_INT_EN_SHIFT);
    write_interrupt_enable_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_interrupt_enable_reg_ready_int_en() {
    uint32_t reg_val = read_interrupt_enable_reg();
    return (reg_val >> INTERRUPT_ENABLE_REG_READY_INT_EN_SHIFT) & INTERRUPT_ENABLE_REG_READY_INT_EN_MASK;
}

void switch_csr_csr_tlm::set_interrupt_enable_reg_ready_int_en(uint32_t value) {
    uint32_t reg_val = read_interrupt_enable_reg();
    reg_val &= ~(INTERRUPT_ENABLE_REG_READY_INT_EN_MASK << INTERRUPT_ENABLE_REG_READY_INT_EN_SHIFT);
    reg_val |= ((value & INTERRUPT_ENABLE_REG_READY_INT_EN_MASK) << INTERRUPT_ENABLE_REG_READY_INT_EN_SHIFT);
    write_interrupt_enable_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_interrupt_enable_reg_packet_int_en() {
    uint32_t reg_val = read_interrupt_enable_reg();
    return (reg_val >> INTERRUPT_ENABLE_REG_PACKET_INT_EN_SHIFT) & INTERRUPT_ENABLE_REG_PACKET_INT_EN_MASK;
}

void switch_csr_csr_tlm::set_interrupt_enable_reg_packet_int_en(uint32_t value) {
    uint32_t reg_val = read_interrupt_enable_reg();
    reg_val &= ~(INTERRUPT_ENABLE_REG_PACKET_INT_EN_MASK << INTERRUPT_ENABLE_REG_PACKET_INT_EN_SHIFT);
    reg_val |= ((value & INTERRUPT_ENABLE_REG_PACKET_INT_EN_MASK) << INTERRUPT_ENABLE_REG_PACKET_INT_EN_SHIFT);
    write_interrupt_enable_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_interrupt_enable_reg_reserved() {
    uint32_t reg_val = read_interrupt_enable_reg();
    return (reg_val >> INTERRUPT_ENABLE_REG_RESERVED_SHIFT) & INTERRUPT_ENABLE_REG_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_interrupt_enable_reg_reserved(uint32_t value) {
    uint32_t reg_val = read_interrupt_enable_reg();
    reg_val &= ~(INTERRUPT_ENABLE_REG_RESERVED_MASK << INTERRUPT_ENABLE_REG_RESERVED_SHIFT);
    reg_val |= ((value & INTERRUPT_ENABLE_REG_RESERVED_MASK) << INTERRUPT_ENABLE_REG_RESERVED_SHIFT);
    write_interrupt_enable_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_interrupt_status_reg_error_int() {
    uint32_t reg_val = read_interrupt_status_reg();
    return (reg_val >> INTERRUPT_STATUS_REG_ERROR_INT_SHIFT) & INTERRUPT_STATUS_REG_ERROR_INT_MASK;
}

void switch_csr_csr_tlm::set_interrupt_status_reg_error_int(uint32_t value) {
    uint32_t reg_val = read_interrupt_status_reg();
    reg_val &= ~(INTERRUPT_STATUS_REG_ERROR_INT_MASK << INTERRUPT_STATUS_REG_ERROR_INT_SHIFT);
    reg_val |= ((value & INTERRUPT_STATUS_REG_ERROR_INT_MASK) << INTERRUPT_STATUS_REG_ERROR_INT_SHIFT);
    write_interrupt_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_interrupt_status_reg_ready_int() {
    uint32_t reg_val = read_interrupt_status_reg();
    return (reg_val >> INTERRUPT_STATUS_REG_READY_INT_SHIFT) & INTERRUPT_STATUS_REG_READY_INT_MASK;
}

void switch_csr_csr_tlm::set_interrupt_status_reg_ready_int(uint32_t value) {
    uint32_t reg_val = read_interrupt_status_reg();
    reg_val &= ~(INTERRUPT_STATUS_REG_READY_INT_MASK << INTERRUPT_STATUS_REG_READY_INT_SHIFT);
    reg_val |= ((value & INTERRUPT_STATUS_REG_READY_INT_MASK) << INTERRUPT_STATUS_REG_READY_INT_SHIFT);
    write_interrupt_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_interrupt_status_reg_packet_int() {
    uint32_t reg_val = read_interrupt_status_reg();
    return (reg_val >> INTERRUPT_STATUS_REG_PACKET_INT_SHIFT) & INTERRUPT_STATUS_REG_PACKET_INT_MASK;
}

void switch_csr_csr_tlm::set_interrupt_status_reg_packet_int(uint32_t value) {
    uint32_t reg_val = read_interrupt_status_reg();
    reg_val &= ~(INTERRUPT_STATUS_REG_PACKET_INT_MASK << INTERRUPT_STATUS_REG_PACKET_INT_SHIFT);
    reg_val |= ((value & INTERRUPT_STATUS_REG_PACKET_INT_MASK) << INTERRUPT_STATUS_REG_PACKET_INT_SHIFT);
    write_interrupt_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_interrupt_status_reg_reserved() {
    uint32_t reg_val = read_interrupt_status_reg();
    return (reg_val >> INTERRUPT_STATUS_REG_RESERVED_SHIFT) & INTERRUPT_STATUS_REG_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_interrupt_status_reg_reserved(uint32_t value) {
    uint32_t reg_val = read_interrupt_status_reg();
    reg_val &= ~(INTERRUPT_STATUS_REG_RESERVED_MASK << INTERRUPT_STATUS_REG_RESERVED_SHIFT);
    reg_val |= ((value & INTERRUPT_STATUS_REG_RESERVED_MASK) << INTERRUPT_STATUS_REG_RESERVED_SHIFT);
    write_interrupt_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_port_config_reg_port_enable(unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    return (reg_val >> PORT_CONFIG_REG_PORT_ENABLE_SHIFT) & PORT_CONFIG_REG_PORT_ENABLE_MASK;
}

void switch_csr_csr_tlm::set_port_config_reg_port_enable(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    reg_val &= ~(PORT_CONFIG_REG_PORT_ENABLE_MASK << PORT_CONFIG_REG_PORT_ENABLE_SHIFT);
    reg_val |= ((value & PORT_CONFIG_REG_PORT_ENABLE_MASK) << PORT_CONFIG_REG_PORT_ENABLE_SHIFT);
    write_port_config_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_config_reg_port_priority(unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    return (reg_val >> PORT_CONFIG_REG_PORT_PRIORITY_SHIFT) & PORT_CONFIG_REG_PORT_PRIORITY_MASK;
}

void switch_csr_csr_tlm::set_port_config_reg_port_priority(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    reg_val &= ~(PORT_CONFIG_REG_PORT_PRIORITY_MASK << PORT_CONFIG_REG_PORT_PRIORITY_SHIFT);
    reg_val |= ((value & PORT_CONFIG_REG_PORT_PRIORITY_MASK) << PORT_CONFIG_REG_PORT_PRIORITY_SHIFT);
    write_port_config_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_config_reg_port_type(unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    return (reg_val >> PORT_CONFIG_REG_PORT_TYPE_SHIFT) & PORT_CONFIG_REG_PORT_TYPE_MASK;
}

void switch_csr_csr_tlm::set_port_config_reg_port_type(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    reg_val &= ~(PORT_CONFIG_REG_PORT_TYPE_MASK << PORT_CONFIG_REG_PORT_TYPE_SHIFT);
    reg_val |= ((value & PORT_CONFIG_REG_PORT_TYPE_MASK) << PORT_CONFIG_REG_PORT_TYPE_SHIFT);
    write_port_config_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_config_reg_flow_control(unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    return (reg_val >> PORT_CONFIG_REG_FLOW_CONTROL_SHIFT) & PORT_CONFIG_REG_FLOW_CONTROL_MASK;
}

void switch_csr_csr_tlm::set_port_config_reg_flow_control(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    reg_val &= ~(PORT_CONFIG_REG_FLOW_CONTROL_MASK << PORT_CONFIG_REG_FLOW_CONTROL_SHIFT);
    reg_val |= ((value & PORT_CONFIG_REG_FLOW_CONTROL_MASK) << PORT_CONFIG_REG_FLOW_CONTROL_SHIFT);
    write_port_config_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_config_reg_reserved(unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    return (reg_val >> PORT_CONFIG_REG_RESERVED_SHIFT) & PORT_CONFIG_REG_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_port_config_reg_reserved(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_config_reg(index);
    reg_val &= ~(PORT_CONFIG_REG_RESERVED_MASK << PORT_CONFIG_REG_RESERVED_SHIFT);
    reg_val |= ((value & PORT_CONFIG_REG_RESERVED_MASK) << PORT_CONFIG_REG_RESERVED_SHIFT);
    write_port_config_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_status_reg_port_active(unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    return (reg_val >> PORT_STATUS_REG_PORT_ACTIVE_SHIFT) & PORT_STATUS_REG_PORT_ACTIVE_MASK;
}

void switch_csr_csr_tlm::set_port_status_reg_port_active(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    reg_val &= ~(PORT_STATUS_REG_PORT_ACTIVE_MASK << PORT_STATUS_REG_PORT_ACTIVE_SHIFT);
    reg_val |= ((value & PORT_STATUS_REG_PORT_ACTIVE_MASK) << PORT_STATUS_REG_PORT_ACTIVE_SHIFT);
    write_port_status_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_status_reg_port_error(unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    return (reg_val >> PORT_STATUS_REG_PORT_ERROR_SHIFT) & PORT_STATUS_REG_PORT_ERROR_MASK;
}

void switch_csr_csr_tlm::set_port_status_reg_port_error(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    reg_val &= ~(PORT_STATUS_REG_PORT_ERROR_MASK << PORT_STATUS_REG_PORT_ERROR_SHIFT);
    reg_val |= ((value & PORT_STATUS_REG_PORT_ERROR_MASK) << PORT_STATUS_REG_PORT_ERROR_SHIFT);
    write_port_status_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_status_reg_link_up(unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    return (reg_val >> PORT_STATUS_REG_LINK_UP_SHIFT) & PORT_STATUS_REG_LINK_UP_MASK;
}

void switch_csr_csr_tlm::set_port_status_reg_link_up(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    reg_val &= ~(PORT_STATUS_REG_LINK_UP_MASK << PORT_STATUS_REG_LINK_UP_SHIFT);
    reg_val |= ((value & PORT_STATUS_REG_LINK_UP_MASK) << PORT_STATUS_REG_LINK_UP_SHIFT);
    write_port_status_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_status_reg_tx_busy(unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    return (reg_val >> PORT_STATUS_REG_TX_BUSY_SHIFT) & PORT_STATUS_REG_TX_BUSY_MASK;
}

void switch_csr_csr_tlm::set_port_status_reg_tx_busy(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    reg_val &= ~(PORT_STATUS_REG_TX_BUSY_MASK << PORT_STATUS_REG_TX_BUSY_SHIFT);
    reg_val |= ((value & PORT_STATUS_REG_TX_BUSY_MASK) << PORT_STATUS_REG_TX_BUSY_SHIFT);
    write_port_status_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_status_reg_rx_ready(unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    return (reg_val >> PORT_STATUS_REG_RX_READY_SHIFT) & PORT_STATUS_REG_RX_READY_MASK;
}

void switch_csr_csr_tlm::set_port_status_reg_rx_ready(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    reg_val &= ~(PORT_STATUS_REG_RX_READY_MASK << PORT_STATUS_REG_RX_READY_SHIFT);
    reg_val |= ((value & PORT_STATUS_REG_RX_READY_MASK) << PORT_STATUS_REG_RX_READY_SHIFT);
    write_port_status_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_status_reg_packet_count(unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    return (reg_val >> PORT_STATUS_REG_PACKET_COUNT_SHIFT) & PORT_STATUS_REG_PACKET_COUNT_MASK;
}

void switch_csr_csr_tlm::set_port_status_reg_packet_count(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    reg_val &= ~(PORT_STATUS_REG_PACKET_COUNT_MASK << PORT_STATUS_REG_PACKET_COUNT_SHIFT);
    reg_val |= ((value & PORT_STATUS_REG_PACKET_COUNT_MASK) << PORT_STATUS_REG_PACKET_COUNT_SHIFT);
    write_port_status_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_port_status_reg_reserved(unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    return (reg_val >> PORT_STATUS_REG_RESERVED_SHIFT) & PORT_STATUS_REG_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_port_status_reg_reserved(uint32_t value, unsigned int index) {
    uint32_t reg_val = read_port_status_reg(index);
    reg_val &= ~(PORT_STATUS_REG_RESERVED_MASK << PORT_STATUS_REG_RESERVED_SHIFT);
    reg_val |= ((value & PORT_STATUS_REG_RESERVED_MASK) << PORT_STATUS_REG_RESERVED_SHIFT);
    write_port_status_reg(reg_val, index);
}

uint32_t switch_csr_csr_tlm::get_queue_config_reg_queue_depth() {
    uint32_t reg_val = read_queue_config_reg();
    return (reg_val >> QUEUE_CONFIG_REG_QUEUE_DEPTH_SHIFT) & QUEUE_CONFIG_REG_QUEUE_DEPTH_MASK;
}

void switch_csr_csr_tlm::set_queue_config_reg_queue_depth(uint32_t value) {
    uint32_t reg_val = read_queue_config_reg();
    reg_val &= ~(QUEUE_CONFIG_REG_QUEUE_DEPTH_MASK << QUEUE_CONFIG_REG_QUEUE_DEPTH_SHIFT);
    reg_val |= ((value & QUEUE_CONFIG_REG_QUEUE_DEPTH_MASK) << QUEUE_CONFIG_REG_QUEUE_DEPTH_SHIFT);
    write_queue_config_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_queue_config_reg_queue_count() {
    uint32_t reg_val = read_queue_config_reg();
    return (reg_val >> QUEUE_CONFIG_REG_QUEUE_COUNT_SHIFT) & QUEUE_CONFIG_REG_QUEUE_COUNT_MASK;
}

void switch_csr_csr_tlm::set_queue_config_reg_queue_count(uint32_t value) {
    uint32_t reg_val = read_queue_config_reg();
    reg_val &= ~(QUEUE_CONFIG_REG_QUEUE_COUNT_MASK << QUEUE_CONFIG_REG_QUEUE_COUNT_SHIFT);
    reg_val |= ((value & QUEUE_CONFIG_REG_QUEUE_COUNT_MASK) << QUEUE_CONFIG_REG_QUEUE_COUNT_SHIFT);
    write_queue_config_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_queue_config_reg_buffer_size() {
    uint32_t reg_val = read_queue_config_reg();
    return (reg_val >> QUEUE_CONFIG_REG_BUFFER_SIZE_SHIFT) & QUEUE_CONFIG_REG_BUFFER_SIZE_MASK;
}

void switch_csr_csr_tlm::set_queue_config_reg_buffer_size(uint32_t value) {
    uint32_t reg_val = read_queue_config_reg();
    reg_val &= ~(QUEUE_CONFIG_REG_BUFFER_SIZE_MASK << QUEUE_CONFIG_REG_BUFFER_SIZE_SHIFT);
    reg_val |= ((value & QUEUE_CONFIG_REG_BUFFER_SIZE_MASK) << QUEUE_CONFIG_REG_BUFFER_SIZE_SHIFT);
    write_queue_config_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_queue_config_reg_reserved() {
    uint32_t reg_val = read_queue_config_reg();
    return (reg_val >> QUEUE_CONFIG_REG_RESERVED_SHIFT) & QUEUE_CONFIG_REG_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_queue_config_reg_reserved(uint32_t value) {
    uint32_t reg_val = read_queue_config_reg();
    reg_val &= ~(QUEUE_CONFIG_REG_RESERVED_MASK << QUEUE_CONFIG_REG_RESERVED_SHIFT);
    reg_val |= ((value & QUEUE_CONFIG_REG_RESERVED_MASK) << QUEUE_CONFIG_REG_RESERVED_SHIFT);
    write_queue_config_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_perf_total_packets_total_packets() {
    uint32_t reg_val = read_perf_total_packets();
    return (reg_val >> PERF_TOTAL_PACKETS_TOTAL_PACKETS_SHIFT) & PERF_TOTAL_PACKETS_TOTAL_PACKETS_MASK;
}

void switch_csr_csr_tlm::set_perf_total_packets_total_packets(uint32_t value) {
    uint32_t reg_val = read_perf_total_packets();
    reg_val &= ~(PERF_TOTAL_PACKETS_TOTAL_PACKETS_MASK << PERF_TOTAL_PACKETS_TOTAL_PACKETS_SHIFT);
    reg_val |= ((value & PERF_TOTAL_PACKETS_TOTAL_PACKETS_MASK) << PERF_TOTAL_PACKETS_TOTAL_PACKETS_SHIFT);
    write_perf_total_packets(reg_val);
}

uint32_t switch_csr_csr_tlm::get_perf_error_count_error_count() {
    uint32_t reg_val = read_perf_error_count();
    return (reg_val >> PERF_ERROR_COUNT_ERROR_COUNT_SHIFT) & PERF_ERROR_COUNT_ERROR_COUNT_MASK;
}

void switch_csr_csr_tlm::set_perf_error_count_error_count(uint32_t value) {
    uint32_t reg_val = read_perf_error_count();
    reg_val &= ~(PERF_ERROR_COUNT_ERROR_COUNT_MASK << PERF_ERROR_COUNT_ERROR_COUNT_SHIFT);
    reg_val |= ((value & PERF_ERROR_COUNT_ERROR_COUNT_MASK) << PERF_ERROR_COUNT_ERROR_COUNT_SHIFT);
    write_perf_error_count(reg_val);
}

uint32_t switch_csr_csr_tlm::get_perf_bandwidth_bandwidth_util() {
    uint32_t reg_val = read_perf_bandwidth();
    return (reg_val >> PERF_BANDWIDTH_BANDWIDTH_UTIL_SHIFT) & PERF_BANDWIDTH_BANDWIDTH_UTIL_MASK;
}

void switch_csr_csr_tlm::set_perf_bandwidth_bandwidth_util(uint32_t value) {
    uint32_t reg_val = read_perf_bandwidth();
    reg_val &= ~(PERF_BANDWIDTH_BANDWIDTH_UTIL_MASK << PERF_BANDWIDTH_BANDWIDTH_UTIL_SHIFT);
    reg_val |= ((value & PERF_BANDWIDTH_BANDWIDTH_UTIL_MASK) << PERF_BANDWIDTH_BANDWIDTH_UTIL_SHIFT);
    write_perf_bandwidth(reg_val);
}

uint32_t switch_csr_csr_tlm::get_perf_bandwidth_reserved() {
    uint32_t reg_val = read_perf_bandwidth();
    return (reg_val >> PERF_BANDWIDTH_RESERVED_SHIFT) & PERF_BANDWIDTH_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_perf_bandwidth_reserved(uint32_t value) {
    uint32_t reg_val = read_perf_bandwidth();
    reg_val &= ~(PERF_BANDWIDTH_RESERVED_MASK << PERF_BANDWIDTH_RESERVED_SHIFT);
    reg_val |= ((value & PERF_BANDWIDTH_RESERVED_MASK) << PERF_BANDWIDTH_RESERVED_SHIFT);
    write_perf_bandwidth(reg_val);
}

uint32_t switch_csr_csr_tlm::get_debug_control_reg_trace_enable() {
    uint32_t reg_val = read_debug_control_reg();
    return (reg_val >> DEBUG_CONTROL_REG_TRACE_ENABLE_SHIFT) & DEBUG_CONTROL_REG_TRACE_ENABLE_MASK;
}

void switch_csr_csr_tlm::set_debug_control_reg_trace_enable(uint32_t value) {
    uint32_t reg_val = read_debug_control_reg();
    reg_val &= ~(DEBUG_CONTROL_REG_TRACE_ENABLE_MASK << DEBUG_CONTROL_REG_TRACE_ENABLE_SHIFT);
    reg_val |= ((value & DEBUG_CONTROL_REG_TRACE_ENABLE_MASK) << DEBUG_CONTROL_REG_TRACE_ENABLE_SHIFT);
    write_debug_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_debug_control_reg_trace_port_sel() {
    uint32_t reg_val = read_debug_control_reg();
    return (reg_val >> DEBUG_CONTROL_REG_TRACE_PORT_SEL_SHIFT) & DEBUG_CONTROL_REG_TRACE_PORT_SEL_MASK;
}

void switch_csr_csr_tlm::set_debug_control_reg_trace_port_sel(uint32_t value) {
    uint32_t reg_val = read_debug_control_reg();
    reg_val &= ~(DEBUG_CONTROL_REG_TRACE_PORT_SEL_MASK << DEBUG_CONTROL_REG_TRACE_PORT_SEL_SHIFT);
    reg_val |= ((value & DEBUG_CONTROL_REG_TRACE_PORT_SEL_MASK) << DEBUG_CONTROL_REG_TRACE_PORT_SEL_SHIFT);
    write_debug_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_debug_control_reg_breakpoint_en() {
    uint32_t reg_val = read_debug_control_reg();
    return (reg_val >> DEBUG_CONTROL_REG_BREAKPOINT_EN_SHIFT) & DEBUG_CONTROL_REG_BREAKPOINT_EN_MASK;
}

void switch_csr_csr_tlm::set_debug_control_reg_breakpoint_en(uint32_t value) {
    uint32_t reg_val = read_debug_control_reg();
    reg_val &= ~(DEBUG_CONTROL_REG_BREAKPOINT_EN_MASK << DEBUG_CONTROL_REG_BREAKPOINT_EN_SHIFT);
    reg_val |= ((value & DEBUG_CONTROL_REG_BREAKPOINT_EN_MASK) << DEBUG_CONTROL_REG_BREAKPOINT_EN_SHIFT);
    write_debug_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_debug_control_reg_reserved() {
    uint32_t reg_val = read_debug_control_reg();
    return (reg_val >> DEBUG_CONTROL_REG_RESERVED_SHIFT) & DEBUG_CONTROL_REG_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_debug_control_reg_reserved(uint32_t value) {
    uint32_t reg_val = read_debug_control_reg();
    reg_val &= ~(DEBUG_CONTROL_REG_RESERVED_MASK << DEBUG_CONTROL_REG_RESERVED_SHIFT);
    reg_val |= ((value & DEBUG_CONTROL_REG_RESERVED_MASK) << DEBUG_CONTROL_REG_RESERVED_SHIFT);
    write_debug_control_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_debug_status_reg_trace_active() {
    uint32_t reg_val = read_debug_status_reg();
    return (reg_val >> DEBUG_STATUS_REG_TRACE_ACTIVE_SHIFT) & DEBUG_STATUS_REG_TRACE_ACTIVE_MASK;
}

void switch_csr_csr_tlm::set_debug_status_reg_trace_active(uint32_t value) {
    uint32_t reg_val = read_debug_status_reg();
    reg_val &= ~(DEBUG_STATUS_REG_TRACE_ACTIVE_MASK << DEBUG_STATUS_REG_TRACE_ACTIVE_SHIFT);
    reg_val |= ((value & DEBUG_STATUS_REG_TRACE_ACTIVE_MASK) << DEBUG_STATUS_REG_TRACE_ACTIVE_SHIFT);
    write_debug_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_debug_status_reg_breakpoint_hit() {
    uint32_t reg_val = read_debug_status_reg();
    return (reg_val >> DEBUG_STATUS_REG_BREAKPOINT_HIT_SHIFT) & DEBUG_STATUS_REG_BREAKPOINT_HIT_MASK;
}

void switch_csr_csr_tlm::set_debug_status_reg_breakpoint_hit(uint32_t value) {
    uint32_t reg_val = read_debug_status_reg();
    reg_val &= ~(DEBUG_STATUS_REG_BREAKPOINT_HIT_MASK << DEBUG_STATUS_REG_BREAKPOINT_HIT_SHIFT);
    reg_val |= ((value & DEBUG_STATUS_REG_BREAKPOINT_HIT_MASK) << DEBUG_STATUS_REG_BREAKPOINT_HIT_SHIFT);
    write_debug_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_debug_status_reg_trace_overflow() {
    uint32_t reg_val = read_debug_status_reg();
    return (reg_val >> DEBUG_STATUS_REG_TRACE_OVERFLOW_SHIFT) & DEBUG_STATUS_REG_TRACE_OVERFLOW_MASK;
}

void switch_csr_csr_tlm::set_debug_status_reg_trace_overflow(uint32_t value) {
    uint32_t reg_val = read_debug_status_reg();
    reg_val &= ~(DEBUG_STATUS_REG_TRACE_OVERFLOW_MASK << DEBUG_STATUS_REG_TRACE_OVERFLOW_SHIFT);
    reg_val |= ((value & DEBUG_STATUS_REG_TRACE_OVERFLOW_MASK) << DEBUG_STATUS_REG_TRACE_OVERFLOW_SHIFT);
    write_debug_status_reg(reg_val);
}

uint32_t switch_csr_csr_tlm::get_debug_status_reg_reserved() {
    uint32_t reg_val = read_debug_status_reg();
    return (reg_val >> DEBUG_STATUS_REG_RESERVED_SHIFT) & DEBUG_STATUS_REG_RESERVED_MASK;
}

void switch_csr_csr_tlm::set_debug_status_reg_reserved(uint32_t value) {
    uint32_t reg_val = read_debug_status_reg();
    reg_val &= ~(DEBUG_STATUS_REG_RESERVED_MASK << DEBUG_STATUS_REG_RESERVED_SHIFT);
    reg_val |= ((value & DEBUG_STATUS_REG_RESERVED_MASK) << DEBUG_STATUS_REG_RESERVED_SHIFT);
    write_debug_status_reg(reg_val);
}

void switch_csr_csr_tlm::reset_all_registers() {
    write_device_id_reg(0x01001234);
    write_control_reg(0x00000040);
    write_status_reg(0x00000000);
    write_interrupt_enable_reg(0x00000000);
    write_interrupt_status_reg(0x00000000);
    for (unsigned int i = 0; i < PORT_CONFIG_REG_SIZE; i++) {
        write_port_config_reg(0x00000051, i);
    }
    for (unsigned int i = 0; i < PORT_STATUS_REG_SIZE; i++) {
        write_port_status_reg(0x00000010, i);
    }
    write_queue_config_reg(0x00001046);
    write_perf_total_packets(0x00000000);
    write_perf_error_count(0x00000000);
    write_perf_bandwidth(0x00000000);
    write_debug_control_reg(0x00000000);
    write_debug_status_reg(0x00000000);
}

void switch_csr_csr_tlm::print_registers() {
    std::cout << "\n=== switch_csr CSR Registers ===" << std::endl;
    std::cout << std::hex << std::setfill('0');

    std::cout << "\ndevice_id_reg:" << std::endl;
    std::cout << "  0x" << std::setw(8) << DEVICE_ID_REG_ADDR 
              << ": 0x" << std::setw(8) << read_device_id_reg() 
              << " - Device identification and version information" << std::endl;
    std::cout << "\ncontrol_reg:" << std::endl;
    std::cout << "  0x" << std::setw(8) << CONTROL_REG_ADDR 
              << ": 0x" << std::setw(8) << read_control_reg() 
              << " - Global control settings" << std::endl;
    std::cout << "\nstatus_reg:" << std::endl;
    std::cout << "  0x" << std::setw(8) << STATUS_REG_ADDR 
              << ": 0x" << std::setw(8) << read_status_reg() 
              << " - Global status information" << std::endl;
    std::cout << "\ninterrupt_enable_reg:" << std::endl;
    std::cout << "  0x" << std::setw(8) << INTERRUPT_ENABLE_REG_ADDR 
              << ": 0x" << std::setw(8) << read_interrupt_enable_reg() 
              << " - Interrupt enable control" << std::endl;
    std::cout << "\ninterrupt_status_reg:" << std::endl;
    std::cout << "  0x" << std::setw(8) << INTERRUPT_STATUS_REG_ADDR 
              << ": 0x" << std::setw(8) << read_interrupt_status_reg() 
              << " - Interrupt status (write 1 to clear)" << std::endl;
    std::cout << "\nport_config_reg (Array[4]):" << std::endl;
    for (unsigned int i = 0; i < PORT_CONFIG_REG_SIZE; i++) {
        uint32_t addr = PORT_CONFIG_REG_BASE + i * PORT_CONFIG_REG_STRIDE;
        uint32_t value = read_port_config_reg(i);
        std::cout << "  [" << std::dec << i << std::hex << "] 0x" << std::setw(8) << addr 
                  << ": 0x" << std::setw(8) << value << " - Individual port configuration" << std::endl;
    }
    std::cout << "\nport_status_reg (Array[4]):" << std::endl;
    for (unsigned int i = 0; i < PORT_STATUS_REG_SIZE; i++) {
        uint32_t addr = PORT_STATUS_REG_BASE + i * PORT_STATUS_REG_STRIDE;
        uint32_t value = read_port_status_reg(i);
        std::cout << "  [" << std::dec << i << std::hex << "] 0x" << std::setw(8) << addr 
                  << ": 0x" << std::setw(8) << value << " - Individual port status" << std::endl;
    }
    std::cout << "\nqueue_config_reg:" << std::endl;
    std::cout << "  0x" << std::setw(8) << QUEUE_CONFIG_REG_ADDR 
              << ": 0x" << std::setw(8) << read_queue_config_reg() 
              << " - Queue manager settings" << std::endl;
    std::cout << "\nperf_total_packets:" << std::endl;
    std::cout << "  0x" << std::setw(8) << PERF_TOTAL_PACKETS_ADDR 
              << ": 0x" << std::setw(8) << read_perf_total_packets() 
              << " - Various performance counters" << std::endl;
    std::cout << "\nperf_error_count:" << std::endl;
    std::cout << "  0x" << std::setw(8) << PERF_ERROR_COUNT_ADDR 
              << ": 0x" << std::setw(8) << read_perf_error_count() 
              << " - Total error count" << std::endl;
    std::cout << "\nperf_bandwidth:" << std::endl;
    std::cout << "  0x" << std::setw(8) << PERF_BANDWIDTH_ADDR 
              << ": 0x" << std::setw(8) << read_perf_bandwidth() 
              << " - Bandwidth utilization" << std::endl;
    std::cout << "\ndebug_control_reg:" << std::endl;
    std::cout << "  0x" << std::setw(8) << DEBUG_CONTROL_REG_ADDR 
              << ": 0x" << std::setw(8) << read_debug_control_reg() 
              << " - Debug control settings" << std::endl;
    std::cout << "\ndebug_status_reg:" << std::endl;
    std::cout << "  0x" << std::setw(8) << DEBUG_STATUS_REG_ADDR 
              << ": 0x" << std::setw(8) << read_debug_status_reg() 
              << " - Debug status information" << std::endl;
    std::cout << std::dec << std::endl;
}
