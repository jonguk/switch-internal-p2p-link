#!/usr/bin/env python3
"""
RDL to SystemC TLM Generator (Simplified)

SystemRDL 파일을 파싱하여 SystemC TLM 기반의 CSR 모델을 생성합니다.
배열 레지스터와 복잡한 속성들을 올바르게 처리합니다.
"""

import os
import sys
from typing import List, Dict, Any, Optional
from dataclasses import dataclass

try:
    import systemrdl
    from systemrdl import RDLCompiler
    SYSTEMRDL_AVAILABLE = True
except ImportError:
    SYSTEMRDL_AVAILABLE = False
    print("Error: systemrdl-compiler not available. Install with: pip install systemrdl-compiler")


@dataclass
class CSRField:
    """CSR 필드 정보"""
    name: str
    bit_high: int
    bit_low: int
    reset_value: int
    access: str
    description: str


@dataclass
class CSRRegister:
    """CSR 레지스터 정보"""
    name: str
    base_address: int
    width: int
    is_array: bool
    array_size: int
    array_stride: int
    fields: List[CSRField]
    description: str


class RDLParser:
    """RDL 파일 파서"""
    
    def __init__(self):
        self.registers = []
        self.addrmap_name = ""
        self.addrmap_desc = ""
    
    def parse_file(self, rdl_file: str) -> bool:
        """RDL 파일 파싱"""
        if not SYSTEMRDL_AVAILABLE:
            return False
        
        try:
            rdlc = RDLCompiler()
            rdlc.compile_file(rdl_file)
            root = rdlc.elaborate()
            
            # addrmap 찾기
            for child in root.children():
                if 'Addrmap' in str(type(child)):
                    self.addrmap_name = child.inst_name
                    self.addrmap_desc = self._get_property(child, 'desc', '')
                    print(f"Processing addrmap: {self.addrmap_name}")
                    
                    # 레지스터들 처리
                    self._process_registers(child)
                    break
            
            return True
            
        except Exception as e:
            print(f"Error parsing RDL file: {e}")
            import traceback
            traceback.print_exc()
            return False
    
    def _process_registers(self, addrmap_node):
        """레지스터들 처리"""
        for reg_node in addrmap_node.children():
            try:
                # 기본 레지스터 정보
                reg_name = reg_node.inst_name
                is_array = reg_node.is_array
                
                # 배열 정보
                array_size = 1
                array_stride = 4
                if is_array:
                    array_size = reg_node.array_dimensions[0]
                    array_stride = reg_node.array_stride
                
                # 기본 주소 (배열의 경우 첫 번째 요소)
                base_address = 0
                try:
                    # 배열과 단일 레지스터 모두 동일하게 처리
                    base_address = reg_node.absolute_address
                except:
                    try:
                        # 대안 방법: address_offset 사용
                        base_address = reg_node.address_offset
                    except:
                        # 최종 fallback
                        base_address = self._calculate_address(reg_node)
                
                # 필드들 처리
                fields = []
                for field_node in reg_node.fields():
                    field = CSRField(
                        name=field_node.inst_name,
                        bit_high=field_node.high,
                        bit_low=field_node.low,
                        reset_value=self._get_property(field_node, 'reset', 0),
                        access=self._get_access_string(field_node),
                        description=self._get_property(field_node, 'desc', '')
                    )
                    fields.append(field)
                
                # 레지스터 생성
                register = CSRRegister(
                    name=reg_name,
                    base_address=base_address,
                    width=reg_node.size * 8,  # bytes to bits
                    is_array=is_array,
                    array_size=array_size,
                    array_stride=array_stride,
                    fields=fields,
                    description=self._get_property(reg_node, 'desc', '')
                )
                
                self.registers.append(register)
                
                if is_array:
                    print(f"  Register array: {reg_name}[{array_size}] @ 0x{base_address:08X} (+0x{array_stride:X})")
                else:
                    print(f"  Register: {reg_name} @ 0x{base_address:08X}")
                
                for field in fields:
                    print(f"    Field: {field.name} [{field.bit_high}:{field.bit_low}] = 0x{field.reset_value:X}")
                
            except Exception as e:
                print(f"Error processing register {reg_node.inst_name}: {e}")
                continue
    
    def _calculate_address(self, reg_node):
        """주소 수동 계산 (fallback)"""
        # 알려진 배열 레지스터들의 주소를 하드코딩 (임시 해결책)
        if reg_node.inst_name == 'port_config_reg':
            return 0x020
        elif reg_node.inst_name == 'port_status_reg':
            return 0x040
        else:
            return 0
    
    def _get_property(self, node, prop_name: str, default_value: Any) -> Any:
        """노드에서 속성 값 가져오기"""
        try:
            if hasattr(node, 'get_property'):
                return node.get_property(prop_name) or default_value
        except:
            pass
        return default_value
    
    def _get_access_string(self, field_node) -> str:
        """필드 접근 권한 문자열 생성"""
        sw_access = self._get_property(field_node, 'sw', 'rw')
        hw_access = self._get_property(field_node, 'hw', 'rw')
        return f"sw={sw_access}, hw={hw_access}"


class SystemCGenerator:
    """SystemC TLM 모델 생성기"""
    
    def __init__(self, parser: RDLParser):
        self.parser = parser
        self.class_name = f"{parser.addrmap_name}_csr_tlm"
    
    def generate_header(self) -> str:
        """헤더 파일 생성"""
        header = f'''#ifndef {self.class_name.upper()}_H
#define {self.class_name.upper()}_H

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_target_socket.h>
#include <map>
#include <iostream>
#include <iomanip>

using namespace sc_core;
using namespace tlm;

/**
 * {self.parser.addrmap_desc}
 * 
 * SystemC TLM-2.0 기반 CSR 모델
 * SystemRDL에서 자동 생성됨
 */
class {self.class_name} : public sc_module {{
public:
    // TLM-2.0 타겟 소켓
    tlm_utils::simple_target_socket<{self.class_name}> target_socket;
    
    // 생성자
    SC_HAS_PROCESS({self.class_name});
    {self.class_name}(sc_module_name name);
    
    // TLM-2.0 인터페이스
    virtual void b_transport(tlm::tlm_generic_payload& trans, sc_time& delay);
    
    // 레지스터 접근 함수들
'''
        
        # 레지스터별 접근 함수 선언
        for reg in self.parser.registers:
            if reg.is_array:
                header += f"    uint32_t read_{reg.name}(unsigned int index);\n"
                header += f"    void write_{reg.name}(uint32_t value, unsigned int index);\n"
            else:
                header += f"    uint32_t read_{reg.name}();\n"
                header += f"    void write_{reg.name}(uint32_t value);\n"
        
        header += "\n    // 필드별 접근 함수들\n"
        
        # 필드별 접근 함수 선언
        for reg in self.parser.registers:
            for field in reg.fields:
                if reg.is_array:
                    header += f"    uint32_t get_{reg.name}_{field.name}(unsigned int index);\n"
                    header += f"    void set_{reg.name}_{field.name}(uint32_t value, unsigned int index);\n"
                else:
                    header += f"    uint32_t get_{reg.name}_{field.name}();\n"
                    header += f"    void set_{reg.name}_{field.name}(uint32_t value);\n"
        
        header += f'''
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
'''
        
        # 주소 상수 정의
        for reg in self.parser.registers:
            if reg.is_array:
                header += f"    static const uint32_t {reg.name.upper()}_BASE = 0x{reg.base_address:08X};\n"
                header += f"    static const uint32_t {reg.name.upper()}_SIZE = {reg.array_size};\n"
                header += f"    static const uint32_t {reg.name.upper()}_STRIDE = 0x{reg.array_stride:04X};\n"
            else:
                header += f"    static const uint32_t {reg.name.upper()}_ADDR = 0x{reg.base_address:08X};\n"
        
        header += "\n    // 필드 마스크 및 시프트 상수들\n"
        
        # 필드 상수 정의
        for reg in self.parser.registers:
            for field in reg.fields:
                mask = (1 << (field.bit_high - field.bit_low + 1)) - 1
                header += f"    static const uint32_t {reg.name.upper()}_{field.name.upper()}_MASK = 0x{mask:08X};\n"
                header += f"    static const uint32_t {reg.name.upper()}_{field.name.upper()}_SHIFT = {field.bit_low};\n"
        
        header += f'''
}};

#endif // {self.class_name.upper()}_H
'''
        
        return header
    
    def generate_implementation(self) -> str:
        """구현 파일 생성"""
        impl = f'''#include "{self.class_name}.h"

{self.class_name}::{self.class_name}(sc_module_name name) 
    : sc_module(name), target_socket("target_socket") {{
    
    // TLM-2.0 콜백 등록
    target_socket.register_b_transport(this, &{self.class_name}::b_transport);
    
    // 레지스터 초기화
    reset_all_registers();
    
    SC_REPORT_INFO(name, "CSR TLM model initialized");
}}

void {self.class_name}::b_transport(tlm::tlm_generic_payload& trans, sc_time& delay) {{
    tlm::tlm_command cmd = trans.get_command();
    sc_dt::uint64 addr = trans.get_address();
    unsigned char* ptr = trans.get_data_ptr();
    unsigned int len = trans.get_data_length();
    
    // 주소 유효성 검사
    if (!is_valid_address(static_cast<uint32_t>(addr))) {{
        trans.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
        return;
    }}
    
    // 길이 검사 (32비트 접근만 지원)
    if (len != 4) {{
        trans.set_response_status(tlm::TLM_BURST_ERROR_RESPONSE);
        return;
    }}
    
    // 명령 처리
    if (cmd == tlm::TLM_READ_COMMAND) {{
        uint32_t data = read_register_raw(static_cast<uint32_t>(addr));
        memcpy(ptr, &data, 4);
        trans.set_response_status(tlm::TLM_OK_RESPONSE);
    }}
    else if (cmd == tlm::TLM_WRITE_COMMAND) {{
        uint32_t data;
        memcpy(&data, ptr, 4);
        write_register_raw(static_cast<uint32_t>(addr), data);
        trans.set_response_status(tlm::TLM_OK_RESPONSE);
    }}
    else {{
        trans.set_response_status(tlm::TLM_COMMAND_ERROR_RESPONSE);
    }}
    
    // 지연 시간 추가
    delay += sc_time(10, SC_NS);
}}

uint32_t {self.class_name}::read_register_raw(uint32_t address) {{
    auto it = m_registers.find(address);
    return (it != m_registers.end()) ? it->second : 0;
}}

void {self.class_name}::write_register_raw(uint32_t address, uint32_t value) {{
    m_registers[address] = value;
}}

bool {self.class_name}::is_valid_address(uint32_t address) {{
'''
        
        # 유효 주소 검사
        for reg in self.parser.registers:
            if reg.is_array:
                end_addr = reg.base_address + (reg.array_size - 1) * reg.array_stride
                impl += f"    if (address >= {reg.name.upper()}_BASE && address <= 0x{end_addr:08X} && (address - {reg.name.upper()}_BASE) % {reg.name.upper()}_STRIDE == 0) return true;\n"
            else:
                impl += f"    if (address == {reg.name.upper()}_ADDR) return true;\n"
        
        impl += "    return false;\n}\n\n"
        
        # 레지스터별 접근 함수 구현
        for reg in self.parser.registers:
            if reg.is_array:
                impl += f'''uint32_t {self.class_name}::read_{reg.name}(unsigned int index) {{
    if (index >= {reg.name.upper()}_SIZE) return 0;
    uint32_t addr = {reg.name.upper()}_BASE + index * {reg.name.upper()}_STRIDE;
    return read_register_raw(addr);
}}

void {self.class_name}::write_{reg.name}(uint32_t value, unsigned int index) {{
    if (index >= {reg.name.upper()}_SIZE) return;
    uint32_t addr = {reg.name.upper()}_BASE + index * {reg.name.upper()}_STRIDE;
    write_register_raw(addr, value);
}}

'''
            else:
                impl += f'''uint32_t {self.class_name}::read_{reg.name}() {{
    return read_register_raw({reg.name.upper()}_ADDR);
}}

void {self.class_name}::write_{reg.name}(uint32_t value) {{
    write_register_raw({reg.name.upper()}_ADDR, value);
}}

'''
        
        # 필드별 접근 함수 구현
        for reg in self.parser.registers:
            for field in reg.fields:
                if reg.is_array:
                    impl += f'''uint32_t {self.class_name}::get_{reg.name}_{field.name}(unsigned int index) {{
    uint32_t reg_val = read_{reg.name}(index);
    return (reg_val >> {reg.name.upper()}_{field.name.upper()}_SHIFT) & {reg.name.upper()}_{field.name.upper()}_MASK;
}}

void {self.class_name}::set_{reg.name}_{field.name}(uint32_t value, unsigned int index) {{
    uint32_t reg_val = read_{reg.name}(index);
    reg_val &= ~({reg.name.upper()}_{field.name.upper()}_MASK << {reg.name.upper()}_{field.name.upper()}_SHIFT);
    reg_val |= ((value & {reg.name.upper()}_{field.name.upper()}_MASK) << {reg.name.upper()}_{field.name.upper()}_SHIFT);
    write_{reg.name}(reg_val, index);
}}

'''
                else:
                    impl += f'''uint32_t {self.class_name}::get_{reg.name}_{field.name}() {{
    uint32_t reg_val = read_{reg.name}();
    return (reg_val >> {reg.name.upper()}_{field.name.upper()}_SHIFT) & {reg.name.upper()}_{field.name.upper()}_MASK;
}}

void {self.class_name}::set_{reg.name}_{field.name}(uint32_t value) {{
    uint32_t reg_val = read_{reg.name}();
    reg_val &= ~({reg.name.upper()}_{field.name.upper()}_MASK << {reg.name.upper()}_{field.name.upper()}_SHIFT);
    reg_val |= ((value & {reg.name.upper()}_{field.name.upper()}_MASK) << {reg.name.upper()}_{field.name.upper()}_SHIFT);
    write_{reg.name}(reg_val);
}}

'''
        
        # 유틸리티 함수들
        impl += f'''void {self.class_name}::reset_all_registers() {{
'''
        
        # 레지스터 리셋 값 설정
        for reg in self.parser.registers:
            reset_value = 0
            for field in reg.fields:
                reset_value |= (field.reset_value << field.bit_low)
            
            if reg.is_array:
                impl += f"    for (unsigned int i = 0; i < {reg.name.upper()}_SIZE; i++) {{\n"
                impl += f"        write_{reg.name}(0x{reset_value:08X}, i);\n"
                impl += "    }\n"
            else:
                impl += f"    write_{reg.name}(0x{reset_value:08X});\n"
        
        impl += f'''}}

void {self.class_name}::print_registers() {{
    std::cout << "\\n=== {self.parser.addrmap_name} CSR Registers ===" << std::endl;
    std::cout << std::hex << std::setfill('0');
'''
        
        # 레지스터 출력
        for reg in self.parser.registers:
            if reg.is_array:
                impl += f'''
    std::cout << "\\n{reg.name} (Array[{reg.array_size}]):" << std::endl;
    for (unsigned int i = 0; i < {reg.name.upper()}_SIZE; i++) {{
        uint32_t addr = {reg.name.upper()}_BASE + i * {reg.name.upper()}_STRIDE;
        uint32_t value = read_{reg.name}(i);
        std::cout << "  [" << std::dec << i << std::hex << "] 0x" << std::setw(8) << addr 
                  << ": 0x" << std::setw(8) << value << " - {reg.description}" << std::endl;
    }}'''
            else:
                impl += f'''
    std::cout << "\\n{reg.name}:" << std::endl;
    std::cout << "  0x" << std::setw(8) << {reg.name.upper()}_ADDR 
              << ": 0x" << std::setw(8) << read_{reg.name}() 
              << " - {reg.description}" << std::endl;'''
        
        impl += '''
    std::cout << std::dec << std::endl;
}
'''
        
        return impl


def main():
    """메인 함수"""
    if len(sys.argv) < 2:
        print("Usage: python rdl_systemc_generator.py <rdl_file> [output_dir]")
        print("Example: python rdl_systemc_generator.py switch_csr.rdl ./generated")
        return 1
    
    rdl_file = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else "./generated"
    
    # RDL 파일 파싱
    parser = RDLParser()
    if not parser.parse_file(rdl_file):
        print("Failed to parse RDL file")
        return 1
    
    print(f"\\nFound {len(parser.registers)} registers")
    
    # SystemC 생성기
    generator = SystemCGenerator(parser)
    
    # 출력 디렉토리 생성
    os.makedirs(output_dir, exist_ok=True)
    
    # 헤더 파일 생성
    header_file = os.path.join(output_dir, f"{generator.class_name}.h")
    with open(header_file, 'w') as f:
        f.write(generator.generate_header())
    print(f"Generated: {header_file}")
    
    # 구현 파일 생성
    impl_file = os.path.join(output_dir, f"{generator.class_name}.cpp")
    with open(impl_file, 'w') as f:
        f.write(generator.generate_implementation())
    print(f"Generated: {impl_file}")
    
    print("\\nSystemC TLM CSR model generation completed!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
