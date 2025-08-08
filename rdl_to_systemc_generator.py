#!/usr/bin/env python3
"""
RDL to SystemC TLM Generator

SystemRDL 파일을 파싱하여 SystemC TLM 기반의 CSR 모델을 생성하는 도구입니다.
생성된 SystemC 모델은 TLM-2.0 소켓을 통해 레지스터 접근을 지원합니다.

Usage:
    python rdl_to_systemc_generator.py switch_csr.rdl
"""

import os
import sys
from typing import List, Dict, Any, Optional
from dataclasses import dataclass
import re
from pathlib import Path

try:
    import systemrdl
    from systemrdl import RDLCompiler, RDLWalker, WalkerAction
    from systemrdl.node import AddrmapNode, RegNode, FieldNode
    SYSTEMRDL_AVAILABLE = True
except ImportError:
    SYSTEMRDL_AVAILABLE = False
    print("Error: systemrdl-compiler not available. Install with: pip install systemrdl-compiler")


@dataclass
class FieldInfo:
    """레지스터 필드 정보"""
    name: str
    bit_range: str
    width: int
    access: str
    reset_value: int
    description: str
    onwrite: Optional[str] = None


@dataclass
class RegisterInfo:
    """레지스터 정보"""
    name: str
    address: int
    width: int
    description: str
    fields: List[FieldInfo]
    is_array: bool = False
    array_size: int = 1
    array_stride: int = 4


@dataclass
class AddrmapInfo:
    """주소 맵 정보"""
    name: str
    description: str
    registers: List[RegisterInfo]
    base_address: int = 0


class RDLWalkerImpl(RDLWalker):
    """SystemRDL AST를 순회하여 레지스터 정보를 추출하는 클래스"""
    
    def __init__(self):
        super().__init__()
        self.addrmap_info = None
        self.current_registers = []
    
    def enter_Addrmap(self, node: AddrmapNode) -> Optional[WalkerAction]:
        """주소 맵 노드 진입"""
        try:
            desc = ""
            if hasattr(node, 'get_property'):
                try:
                    desc = node.get_property('desc') or ""
                except:
                    desc = ""
            
            self.addrmap_info = AddrmapInfo(
                name=node.inst_name or "unnamed_addrmap",
                description=desc,
                registers=[]
            )
            print(f"Processing addrmap: {self.addrmap_info.name}")
            return WalkerAction.Continue
        except Exception as e:
            print(f"Error in enter_Addrmap: {e}")
            return WalkerAction.Continue
    
    def exit_Addrmap(self, node: AddrmapNode) -> None:
        """주소 맵 노드 종료"""
        if self.addrmap_info:
            self.addrmap_info.registers = self.current_registers.copy()
    
    def enter_Reg(self, node: RegNode) -> Optional[WalkerAction]:
        """레지스터 노드 진입"""
        try:
            # 레지스터 설명 추출
            desc = ""
            if hasattr(node, 'get_property'):
                try:
                    desc = node.get_property('desc') or ""
                except:
                    desc = ""
            
            # 레지스터 정보 추출
            reg_info = RegisterInfo(
                name=node.inst_name or "unnamed_reg",
                address=node.address,
                width=node.size * 8,  # bytes to bits
                description=desc,
                fields=[],
                is_array=node.is_array,
                array_size=node.array_dimensions[0] if node.is_array else 1,
                array_stride=node.array_stride if node.is_array else 4
            )
            
            print(f"Processing register: {reg_info.name} @ 0x{reg_info.address:08X}")
            
            # 필드 정보 추출
            for field_node in node.fields():
                field_info = self._extract_field_info(field_node)
                reg_info.fields.append(field_info)
            
            self.current_registers.append(reg_info)
            return WalkerAction.Continue
            
        except Exception as e:
            print(f"Error in enter_Reg: {e}")
            import traceback
            traceback.print_exc()
            return WalkerAction.Continue
    
    def _extract_field_info(self, field_node: FieldNode) -> FieldInfo:
        """필드 정보 추출"""
        try:
            # 비트 범위 계산
            msb = field_node.high
            lsb = field_node.low
            width = msb - lsb + 1
            bit_range = f"[{msb}:{lsb}]" if msb != lsb else f"[{lsb}]"
            
            # 접근 권한 결정
            sw_access = "rw"
            hw_access = "rw"
            if hasattr(field_node, 'get_property'):
                try:
                    sw_access = field_node.get_property('sw') or "rw"
                    hw_access = field_node.get_property('hw') or "rw"
                except:
                    pass
            access = f"sw={sw_access}, hw={hw_access}"
            
            # 리셋 값
            reset_value = 0
            if hasattr(field_node, 'get_property'):
                try:
                    reset_value = field_node.get_property('reset') or 0
                except:
                    reset_value = 0
            
            # onwrite 속성
            onwrite = None
            if hasattr(field_node, 'get_property'):
                try:
                    onwrite = field_node.get_property('onwrite')
                except:
                    onwrite = None
            
            # 설명
            desc = ""
            if hasattr(field_node, 'get_property'):
                try:
                    desc = field_node.get_property('desc') or ""
                except:
                    desc = ""
            
            field_info = FieldInfo(
                name=field_node.inst_name or "unnamed_field",
                bit_range=bit_range,
                width=width,
                access=access,
                reset_value=reset_value,
                description=desc,
                onwrite=onwrite
            )
            
            print(f"  Field: {field_info.name} {field_info.bit_range} = 0x{field_info.reset_value:X}")
            return field_info
            
        except Exception as e:
            print(f"Error extracting field info: {e}")
            import traceback
            traceback.print_exc()
            # 기본값 반환
            return FieldInfo(
                name="error_field",
                bit_range="[0:0]",
                width=1,
                access="rw",
                reset_value=0,
                description="Error extracting field"
            )


class SystemCTLMGenerator:
    """SystemC TLM CSR 모델 생성기"""
    
    def __init__(self, addrmap_info: AddrmapInfo):
        self.addrmap_info = addrmap_info
        self.class_name = f"{addrmap_info.name}_tlm"
        
    def generate_header(self) -> str:
        """헤더 파일 생성"""
        header_content = f'''#ifndef {self.class_name.upper()}_H
#define {self.class_name.upper()}_H

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_target_socket.h>
#include <map>
#include <string>

using namespace sc_core;
using namespace tlm;

/**
 * {self.addrmap_info.description}
 * 
 * SystemC TLM-2.0 기반 CSR 모델
 * RDL 파일로부터 자동 생성됨
 */
class {self.class_name} : public sc_module {{
public:
    // TLM-2.0 타겟 소켓
    tlm_utils::simple_target_socket<{self.class_name}> target_socket;
    
    // 생성자
    {self.class_name}(sc_module_name name);
    
    // TLM-2.0 인터페이스 구현
    virtual void b_transport(tlm::tlm_generic_payload& trans, sc_time& delay);
    virtual bool get_direct_mem_ptr(tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data);
    virtual unsigned int transport_dbg(tlm::tlm_generic_payload& trans);
    
    // 레지스터 접근 함수들
'''
        
        # 각 레지스터에 대한 접근 함수 선언
        for reg in self.addrmap_info.registers:
            if reg.is_array:
                header_content += f"    uint32_t read_{reg.name}(int index = 0);\n"
                header_content += f"    void write_{reg.name}(uint32_t value, int index = 0);\n"
            else:
                header_content += f"    uint32_t read_{reg.name}();\n"
                header_content += f"    void write_{reg.name}(uint32_t value);\n"
        
        header_content += f'''
    // 필드별 접근 함수들
'''
        
        # 필드별 접근 함수 선언
        for reg in self.addrmap_info.registers:
            for field in reg.fields:
                if reg.is_array:
                    header_content += f"    uint32_t get_{reg.name}_{field.name}(int index = 0);\n"
                    header_content += f"    void set_{reg.name}_{field.name}(uint32_t value, int index = 0);\n"
                else:
                    header_content += f"    uint32_t get_{reg.name}_{field.name}();\n"
                    header_content += f"    void set_{reg.name}_{field.name}(uint32_t value);\n"
        
        header_content += f'''
    // 레지스터 맵 정보 출력
    void print_register_map();
    
    // 콜백 함수들 (하드웨어 로직에서 오버라이드 가능)
'''
        
        # 콜백 함수 선언
        for reg in self.addrmap_info.registers:
            header_content += f"    virtual void on_{reg.name}_write(uint32_t old_val, uint32_t new_val"
            if reg.is_array:
                header_content += ", int index"
            header_content += ") {{}}\n"
            
            header_content += f"    virtual void on_{reg.name}_read(uint32_t value"
            if reg.is_array:
                header_content += ", int index"
            header_content += ") {{}}\n"
        
        header_content += f'''
private:
    // 레지스터 저장소
    std::map<uint32_t, uint32_t> registers;
    
    // 내부 함수들
    uint32_t read_register(uint32_t address);
    void write_register(uint32_t address, uint32_t value);
    bool is_valid_address(uint32_t address);
    
    // 레지스터 주소 상수들
'''
        
        # 레지스터 주소 상수 정의
        for reg in self.addrmap_info.registers:
            if reg.is_array:
                header_content += f"    static const uint32_t {reg.name.upper()}_BASE = 0x{reg.address:08X};\n"
                header_content += f"    static const uint32_t {reg.name.upper()}_STRIDE = 0x{reg.array_stride:08X};\n"
                header_content += f"    static const uint32_t {reg.name.upper()}_COUNT = {reg.array_size};\n"
            else:
                header_content += f"    static const uint32_t {reg.name.upper()}_ADDR = 0x{reg.address:08X};\n"
        
        header_content += f'''
    // 필드 마스크 및 시프트 상수들
'''
        
        # 필드 마스크 상수 정의
        for reg in self.addrmap_info.registers:
            for field in reg.fields:
                mask = (1 << field.width) - 1
                shift = int(field.bit_range.split(':')[-1].strip('[]'))
                header_content += f"    static const uint32_t {reg.name.upper()}_{field.name.upper()}_MASK = 0x{mask:08X};\n"
                header_content += f"    static const uint32_t {reg.name.upper()}_{field.name.upper()}_SHIFT = {shift};\n"
        
        header_content += f'''
}};

#endif // {self.class_name.upper()}_H
'''
        
        return header_content
    
    def generate_implementation(self) -> str:
        """구현 파일 생성"""
        impl_content = f'''#include "{self.class_name}.h"
#include <iostream>
#include <iomanip>

{self.class_name}::{self.class_name}(sc_module_name name) 
    : sc_module(name), target_socket("target_socket") {{
    
    // TLM-2.0 콜백 등록
    target_socket.register_b_transport(this, &{self.class_name}::b_transport);
    target_socket.register_get_direct_mem_ptr(this, &{self.class_name}::get_direct_mem_ptr);
    target_socket.register_transport_dbg(this, &{self.class_name}::transport_dbg);
    
    // 레지스터 초기화
'''
        
        # 레지스터 초기값 설정
        for reg in self.addrmap_info.registers:
            if reg.is_array:
                impl_content += f"    for (int i = 0; i < {reg.array_size}; i++) {{\n"
                impl_content += f"        registers[{reg.name.upper()}_BASE + i * {reg.name.upper()}_STRIDE] = "
                # 초기값 계산 (모든 필드의 리셋 값 조합)
                reset_val = 0
                for field in reg.fields:
                    shift = int(field.bit_range.split(':')[-1].strip('[]'))
                    reset_val |= (field.reset_value << shift)
                impl_content += f"0x{reset_val:08X};\n"
                impl_content += "    }\n"
            else:
                reset_val = 0
                for field in reg.fields:
                    shift = int(field.bit_range.split(':')[-1].strip('[]'))
                    reset_val |= (field.reset_value << shift)
                impl_content += f"    registers[{reg.name.upper()}_ADDR] = 0x{reset_val:08X};\n"
        
        impl_content += f'''
    std::cout << "CSR Model '{self.addrmap_info.name}' initialized" << std::endl;
}}

void {self.class_name}::b_transport(tlm::tlm_generic_payload& trans, sc_time& delay) {{
    tlm::tlm_command cmd = trans.get_command();
    sc_dt::uint64 addr = trans.get_address();
    unsigned char* ptr = trans.get_data_ptr();
    unsigned int len = trans.get_data_length();
    
    if (!is_valid_address(addr)) {{
        trans.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
        return;
    }}
    
    if (len != 4) {{
        trans.set_response_status(tlm::TLM_BURST_ERROR_RESPONSE);
        return;
    }}
    
    if (cmd == tlm::TLM_READ_COMMAND) {{
        uint32_t data = read_register(addr);
        memcpy(ptr, &data, 4);
        trans.set_response_status(tlm::TLM_OK_RESPONSE);
    }}
    else if (cmd == tlm::TLM_WRITE_COMMAND) {{
        uint32_t data;
        memcpy(&data, ptr, 4);
        write_register(addr, data);
        trans.set_response_status(tlm::TLM_OK_RESPONSE);
    }}
    else {{
        trans.set_response_status(tlm::TLM_COMMAND_ERROR_RESPONSE);
    }}
    
    // 지연 시간 추가 (실제 하드웨어 지연 시뮬레이션)
    delay += sc_time(10, SC_NS);
}}

bool {self.class_name}::get_direct_mem_ptr(tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data) {{
    // DMI 지원하지 않음
    return false;
}}

unsigned int {self.class_name}::transport_dbg(tlm::tlm_generic_payload& trans) {{
    // 디버그 전송은 일반 전송과 동일하게 처리
    sc_time delay = SC_ZERO_TIME;
    b_transport(trans, delay);
    return trans.get_data_length();
}}

uint32_t {self.class_name}::read_register(uint32_t address) {{
    auto it = registers.find(address);
    if (it != registers.end()) {{
        return it->second;
    }}
    return 0;
}}

void {self.class_name}::write_register(uint32_t address, uint32_t value) {{
    uint32_t old_value = read_register(address);
    registers[address] = value;
    
    // 콜백 함수 호출
'''
        
        # 각 레지스터에 대한 콜백 호출 코드
        for reg in self.addrmap_info.registers:
            if reg.is_array:
                impl_content += f"    if (address >= {reg.name.upper()}_BASE && address < {reg.name.upper()}_BASE + {reg.name.upper()}_COUNT * {reg.name.upper()}_STRIDE) {{\n"
                impl_content += f"        int index = (address - {reg.name.upper()}_BASE) / {reg.name.upper()}_STRIDE;\n"
                impl_content += f"        on_{reg.name}_write(old_value, value, index);\n"
                impl_content += "    }\n"
            else:
                impl_content += f"    if (address == {reg.name.upper()}_ADDR) {{\n"
                impl_content += f"        on_{reg.name}_write(old_value, value);\n"
                impl_content += "    }\n"
        
        impl_content += f'''
}}

bool {self.class_name}::is_valid_address(uint32_t address) {{
'''
        
        # 유효한 주소 체크
        for reg in self.addrmap_info.registers:
            if reg.is_array:
                impl_content += f"    if (address >= {reg.name.upper()}_BASE && address < {reg.name.upper()}_BASE + {reg.name.upper()}_COUNT * {reg.name.upper()}_STRIDE) return true;\n"
            else:
                impl_content += f"    if (address == {reg.name.upper()}_ADDR) return true;\n"
        
        impl_content += "    return false;\n}\n\n"
        
        # 레지스터별 접근 함수들 구현
        for reg in self.addrmap_info.registers:
            if reg.is_array:
                # 배열 레지스터 읽기
                impl_content += f'''uint32_t {self.class_name}::read_{reg.name}(int index) {{
    if (index < 0 || index >= {reg.name.upper()}_COUNT) return 0;
    uint32_t addr = {reg.name.upper()}_BASE + index * {reg.name.upper()}_STRIDE;
    uint32_t value = read_register(addr);
    on_{reg.name}_read(value, index);
    return value;
}}

'''
                # 배열 레지스터 쓰기
                impl_content += f'''void {self.class_name}::write_{reg.name}(uint32_t value, int index) {{
    if (index < 0 || index >= {reg.name.upper()}_COUNT) return;
    uint32_t addr = {reg.name.upper()}_BASE + index * {reg.name.upper()}_STRIDE;
    write_register(addr, value);
}}

'''
            else:
                # 단일 레지스터 읽기
                impl_content += f'''uint32_t {self.class_name}::read_{reg.name}() {{
    uint32_t value = read_register({reg.name.upper()}_ADDR);
    on_{reg.name}_read(value);
    return value;
}}

'''
                # 단일 레지스터 쓰기
                impl_content += f'''void {self.class_name}::write_{reg.name}(uint32_t value) {{
    write_register({reg.name.upper()}_ADDR, value);
}}

'''
        
        # 필드별 접근 함수들 구현
        for reg in self.addrmap_info.registers:
            for field in reg.fields:
                if reg.is_array:
                    # 배열 레지스터의 필드 읽기
                    impl_content += f'''uint32_t {self.class_name}::get_{reg.name}_{field.name}(int index) {{
    uint32_t reg_val = read_{reg.name}(index);
    return (reg_val >> {reg.name.upper()}_{field.name.upper()}_SHIFT) & {reg.name.upper()}_{field.name.upper()}_MASK;
}}

'''
                    # 배열 레지스터의 필드 쓰기
                    impl_content += f'''void {self.class_name}::set_{reg.name}_{field.name}(uint32_t value, int index) {{
    uint32_t reg_val = read_{reg.name}(index);
    reg_val &= ~({reg.name.upper()}_{field.name.upper()}_MASK << {reg.name.upper()}_{field.name.upper()}_SHIFT);
    reg_val |= ((value & {reg.name.upper()}_{field.name.upper()}_MASK) << {reg.name.upper()}_{field.name.upper()}_SHIFT);
    write_{reg.name}(reg_val, index);
}}

'''
                else:
                    # 단일 레지스터의 필드 읽기
                    impl_content += f'''uint32_t {self.class_name}::get_{reg.name}_{field.name}() {{
    uint32_t reg_val = read_{reg.name}();
    return (reg_val >> {reg.name.upper()}_{field.name.upper()}_SHIFT) & {reg.name.upper()}_{field.name.upper()}_MASK;
}}

'''
                    # 단일 레지스터의 필드 쓰기
                    impl_content += f'''void {self.class_name}::set_{reg.name}_{field.name}(uint32_t value) {{
    uint32_t reg_val = read_{reg.name}();
    reg_val &= ~({reg.name.upper()}_{field.name.upper()}_MASK << {reg.name.upper()}_{field.name.upper()}_SHIFT);
    reg_val |= ((value & {reg.name.upper()}_{field.name.upper()}_MASK) << {reg.name.upper()}_{field.name.upper()}_SHIFT);
    write_{reg.name}(reg_val);
}}

'''
        
        # 레지스터 맵 출력 함수
        impl_content += f'''void {self.class_name}::print_register_map() {{
    std::cout << "\\n=== {self.addrmap_info.name} Register Map ===" << std::endl;
    std::cout << "{self.addrmap_info.description}" << std::endl;
    std::cout << std::hex << std::setfill('0');
    
'''
        
        for reg in self.addrmap_info.registers:
            if reg.is_array:
                impl_content += f'''    std::cout << "\\n{reg.name} (Array, {reg.array_size} entries):" << std::endl;
    for (int i = 0; i < {reg.array_size}; i++) {{
        uint32_t addr = {reg.name.upper()}_BASE + i * {reg.name.upper()}_STRIDE;
        uint32_t value = read_register(addr);
        std::cout << "  [" << std::dec << i << std::hex << "] 0x" << std::setw(8) << addr 
                  << ": 0x" << std::setw(8) << value << " - {reg.description}" << std::endl;
    }}
'''
            else:
                impl_content += f'''    std::cout << "\\n{reg.name}:" << std::endl;
    std::cout << "  0x" << std::setw(8) << {reg.name.upper()}_ADDR 
              << ": 0x" << std::setw(8) << read_register({reg.name.upper()}_ADDR) 
              << " - {reg.description}" << std::endl;
'''
        
        impl_content += '''
    std::cout << std::dec << std::endl;
}
'''
        
        return impl_content


def parse_rdl_file(rdl_file: str) -> Optional[AddrmapInfo]:
    """RDL 파일을 파싱하여 주소 맵 정보 추출"""
    if not SYSTEMRDL_AVAILABLE:
        print("SystemRDL compiler not available")
        return None
    
    if not os.path.exists(rdl_file):
        print(f"RDL file not found: {rdl_file}")
        return None
    
    try:
        # SystemRDL 컴파일러 생성
        rdlc = RDLCompiler()
        
        # RDL 파일 컴파일
        rdlc.compile_file(rdl_file)
        root = rdlc.elaborate()
        
        # Walker 생성 및 실행
        walker = RDLWalkerImpl()
        walker.walk(root)
        
        return walker.addrmap_info
        
    except Exception as e:
        print(f"Error parsing RDL file: {e}")
        import traceback
        traceback.print_exc()
        return None


def generate_systemc_tlm_model(rdl_file: str, output_dir: str = ".") -> bool:
    """RDL 파일로부터 SystemC TLM 모델 생성"""
    print(f"Parsing RDL file: {rdl_file}")
    
    # RDL 파일 파싱
    addrmap_info = parse_rdl_file(rdl_file)
    if not addrmap_info:
        return False
    
    print(f"Found addrmap: {addrmap_info.name}")
    print(f"Registers: {len(addrmap_info.registers)}")
    
    # SystemC 생성기 생성
    generator = SystemCTLMGenerator(addrmap_info)
    
    # 출력 디렉토리 생성
    os.makedirs(output_dir, exist_ok=True)
    
    # 헤더 파일 생성
    header_file = os.path.join(output_dir, f"{generator.class_name}.h")
    with open(header_file, 'w') as f:
        f.write(generator.generate_header())
    print(f"Generated header: {header_file}")
    
    # 구현 파일 생성
    impl_file = os.path.join(output_dir, f"{generator.class_name}.cpp")
    with open(impl_file, 'w') as f:
        f.write(generator.generate_implementation())
    print(f"Generated implementation: {impl_file}")
    
    return True


def main():
    """메인 함수"""
    if len(sys.argv) < 2:
        print("Usage: python rdl_to_systemc_generator.py <rdl_file> [output_dir]")
        print("Example: python rdl_to_systemc_generator.py switch_csr.rdl ./generated")
        return 1
    
    rdl_file = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else "./generated"
    
    if generate_systemc_tlm_model(rdl_file, output_dir):
        print("SystemC TLM model generation completed successfully!")
        return 0
    else:
        print("Failed to generate SystemC TLM model")
        return 1


if __name__ == "__main__":
    sys.exit(main())
