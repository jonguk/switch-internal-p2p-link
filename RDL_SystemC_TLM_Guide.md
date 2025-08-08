# SystemRDL to SystemC TLM Generator 가이드

SystemRDL 파일로부터 SystemC TLM-2.0 기반의 CSR (Control and Status Register) 모델을 자동 생성하는 도구입니다.

## 🚀 주요 기능

### ✅ 완성된 기능들
- **RDL 파일 파싱**: SystemRDL 표준 문법 지원
- **레지스터 맵 추출**: 주소, 필드, 초기값, 접근 권한 등
- **배열 레지스터 지원**: 포트별 설정 등 반복되는 레지스터 처리
- **SystemC TLM-2.0 생성**: 표준 TLM 소켓 인터페이스
- **자동 접근 함수**: 레지스터별, 필드별 읽기/쓰기 함수
- **테스트벤치 생성**: 완전한 검증 환경 제공

## 📦 설치 및 설정

### 1. Python 환경 준비
```bash
# 가상 환경 생성 (이미 있다면 건너뛰기)
python3 -m venv venv_fsdb
source venv_fsdb/bin/activate

# SystemRDL 컴파일러 설치
pip install systemrdl-compiler
```

### 2. SystemC 설치 (필요시)
```bash
# Ubuntu/Debian
sudo apt-get install systemc-dev

# macOS (Homebrew)
brew install systemc

# 또는 소스에서 컴파일
# https://github.com/accellera-official/systemc 참고
```

## 📝 RDL 파일 작성

### 기본 구조
```systemrdl
addrmap my_csr {
    name = "My CSR Block";
    desc = "Control and Status Registers";
    
    default regwidth = 32;
    default accesswidth = 32;
    
    // 단일 레지스터
    reg {
        name = "Control Register";
        desc = "Main control register";
        
        field {
            name = "ENABLE";
            desc = "Enable bit";
            sw = rw; hw = r;
            reset = 0;
        } enable[0:0];
        
        field {
            name = "MODE";
            desc = "Operation mode";
            sw = rw; hw = r;
            reset = 1;
        } mode[2:1];
        
    } control_reg @ 0x000;
    
    // 배열 레지스터
    reg {
        name = "Port Config";
        desc = "Per-port configuration";
        
        field {
            name = "PORT_EN";
            desc = "Port enable";
            sw = rw; hw = r;
            reset = 1;
        } port_en[0:0];
        
    } port_config[4] @ 0x100 += 0x4;
};
```

### 지원되는 필드 속성
- `sw`: 소프트웨어 접근 권한 (r, w, rw, na)
- `hw`: 하드웨어 접근 권한 (r, w, rw, na)
- `reset`: 초기값
- `onwrite`: 쓰기 동작 (woclr, woset 등)
- `desc`: 설명

## 🛠️ 사용법

### 1. SystemC TLM 모델 생성
```bash
# 기본 사용법
python rdl_systemc_generator.py switch_csr.rdl

# 출력 디렉토리 지정
python rdl_systemc_generator.py switch_csr.rdl ./output

# 생성되는 파일들
# - <addrmap_name>_csr_tlm.h    # 헤더 파일
# - <addrmap_name>_csr_tlm.cpp  # 구현 파일
```

### 2. SystemC 모델 컴파일
```bash
cd generated/

# Makefile 사용 (SystemC 경로 설정 필요)
export SYSTEMC_HOME=/usr/local/systemc
make

# 또는 직접 컴파일
g++ -std=c++14 -I$SYSTEMC_HOME/include \
    switch_csr_csr_tlm.cpp test_csr_tlm.cpp \
    -L$SYSTEMC_HOME/lib-linux64 -lsystemc -o test_csr_tlm
```

### 3. 테스트 실행
```bash
# 기본 테스트 실행
make run

# VCD 파일 생성하여 실행
make run-vcd

# 생성된 VCD 파일을 GTKWave로 확인
gtkwave csr_test.vcd
```

## 🔧 생성된 API 사용법

### TLM 소켓 연결
```cpp
#include "switch_csr_csr_tlm.h"

// CSR 모델 생성
switch_csr_csr_tlm csr_model("csr");

// TLM 이니시에이터와 연결
master.initiator_socket.bind(csr_model.target_socket);
```

### 레지스터 접근
```cpp
// 단일 레지스터 읽기/쓰기
uint32_t ctrl_val = csr_model.read_control_reg();
csr_model.write_control_reg(0x01);

// 배열 레지스터 접근
uint32_t port0_config = csr_model.read_port_config_reg(0);
csr_model.write_port_config_reg(0x51, 1);

// 필드별 접근
uint32_t enable_bit = csr_model.get_control_reg_enable();
csr_model.set_control_reg_enable(1);

// 배열 레지스터의 필드 접근
uint32_t port0_enable = csr_model.get_port_config_reg_port_enable(0);
csr_model.set_port_config_reg_port_enable(1, 0);
```

### TLM 트랜잭션 직접 사용
```cpp
// TLM 읽기
tlm::tlm_generic_payload trans;
uint32_t data;
sc_time delay = SC_ZERO_TIME;

trans.set_command(tlm::TLM_READ_COMMAND);
trans.set_address(0x004);  // control_reg 주소
trans.set_data_ptr(reinterpret_cast<unsigned char*>(&data));
trans.set_data_length(4);

csr_model.target_socket->b_transport(trans, delay);
```

## 📊 생성된 코드 구조

### 헤더 파일 (.h)
```cpp
class switch_csr_csr_tlm : public sc_module {
public:
    // TLM 소켓
    tlm_utils::simple_target_socket<switch_csr_csr_tlm> target_socket;
    
    // 생성자
    switch_csr_csr_tlm(sc_module_name name);
    
    // TLM 인터페이스
    virtual void b_transport(tlm::tlm_generic_payload& trans, sc_time& delay);
    
    // 레지스터 접근 함수들
    uint32_t read_control_reg();
    void write_control_reg(uint32_t value);
    
    // 필드 접근 함수들
    uint32_t get_control_reg_enable();
    void set_control_reg_enable(uint32_t value);
    
    // 유틸리티 함수들
    void print_registers();
    void reset_all_registers();
    
private:
    std::map<uint32_t, uint32_t> m_registers;
    // 주소 상수들
    static const uint32_t CONTROL_REG_ADDR = 0x00000004;
    // 필드 마스크들
    static const uint32_t CONTROL_REG_ENABLE_MASK = 0x00000001;
};
```

### 구현 파일 (.cpp)
- TLM-2.0 b_transport 구현
- 주소 유효성 검사
- 레지스터 읽기/쓰기 로직
- 필드 마스킹 및 시프트 연산
- 초기값 설정

## 🧪 테스트 시나리오

생성된 테스트벤치는 다음을 검증합니다:

1. **기본 레지스터 접근**: 읽기/쓰기 동작
2. **초기값 확인**: RDL에서 정의한 reset 값
3. **배열 레지스터**: 인덱스별 접근
4. **필드 조작**: 비트 필드 설정/읽기
5. **에러 처리**: 잘못된 주소 접근
6. **TLM 프로토콜**: 올바른 응답 상태

## 📈 고급 사용법

### 커스텀 동작 추가
```cpp
// CSR 모델을 상속하여 커스텀 동작 구현
class my_custom_csr : public switch_csr_csr_tlm {
public:
    my_custom_csr(sc_module_name name) : switch_csr_csr_tlm(name) {}
    
    // 레지스터 쓰기 시 추가 동작
    void write_control_reg(uint32_t value) override {
        switch_csr_csr_tlm::write_control_reg(value);
        
        // enable 비트가 설정되면 추가 동작
        if (get_control_reg_enable()) {
            SC_REPORT_INFO("CSR", "System enabled!");
            // 추가 하드웨어 로직...
        }
    }
};
```

### 인터럽트 처리
```cpp
// 인터럽트 신호 추가
class csr_with_interrupts : public switch_csr_csr_tlm {
public:
    sc_out<bool> interrupt_out;
    
    csr_with_interrupts(sc_module_name name) 
        : switch_csr_csr_tlm(name), interrupt_out("interrupt_out") {}
    
    void write_interrupt_status_reg(uint32_t value) override {
        switch_csr_csr_tlm::write_interrupt_status_reg(value);
        
        // 인터럽트 상태와 enable 확인
        uint32_t status = read_interrupt_status_reg();
        uint32_t enable = read_interrupt_enable_reg();
        
        interrupt_out.write((status & enable) != 0);
    }
};
```

## 🐛 문제 해결

### 일반적인 문제들

1. **SystemC 헤더 찾을 수 없음**
   ```bash
   export SYSTEMC_HOME=/path/to/systemc
   ```

2. **TLM 라이브러리 링크 오류**
   ```bash
   # SystemC 2.3.3 이상 사용 확인
   # TLM 2.0이 포함된 버전 필요
   ```

3. **RDL 파싱 오류**
   ```bash
   # SystemRDL 문법 확인
   # 필드 범위 겹침 확인
   # 주소 충돌 확인
   ```

## 📚 참고 자료

- [SystemRDL 표준](https://www.accellera.org/downloads/standards/systemrdl)
- [SystemC TLM-2.0 가이드](https://www.doulos.com/knowhow/systemc/tlm-20/)
- [SystemC 공식 문서](https://systemc.org/)

## 🤝 기여하기

1. 새로운 RDL 속성 지원
2. 더 많은 테스트 케이스 추가
3. 성능 최적화
4. 문서 개선

---

**Happy Hardware Modeling! 🚀**
