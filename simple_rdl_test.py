#!/usr/bin/env python3
"""
Simple RDL Test - SystemRDL API 직접 테스트
"""

import systemrdl
from systemrdl import RDLCompiler

def test_rdl_parsing():
    """RDL 파일 파싱 테스트"""
    rdlc = RDLCompiler()
    
    try:
        rdlc.compile_file('switch_csr.rdl')
        root = rdlc.elaborate()
        
        print(f"Root node: {root}")
        print(f"Root type: {type(root)}")
        print(f"Root children: {list(root.children())}")
        
        # 첫 번째 addrmap 찾기
        for child in root.children():
            print(f"Child: {child}, type: {type(child)}")
            if hasattr(child, 'inst_name'):
                print(f"  Name: {child.inst_name}")
            if hasattr(child, 'address'):
                print(f"  Address: 0x{child.address:08X}")
            
            # addrmap인 경우 레지스터들 탐색
            if 'Addrmap' in str(type(child)):
                print(f"  Found addrmap: {child.inst_name}")
                for reg in child.children():
                    addr = reg.absolute_address if hasattr(reg, 'absolute_address') else 0
                    print(f"    Register: {reg.inst_name} @ 0x{addr:08X}")
                    
                    # 필드들 탐색
                    if hasattr(reg, 'fields'):
                        for field in reg.fields():
                            print(f"      Field: {field.inst_name} [{field.high}:{field.low}]")
        
        return True
        
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    test_rdl_parsing()
