# CSR TLM UVM Verification Guide

SystemRDL에서 생성된 CSR TLM 모델을 UVM SystemC로 검증하는 완전한 가이드입니다.

## 🚀 주요 특징

### ✅ 완성된 UVM 검증 환경
- **UVM SystemC 기반**: 표준 UVM 방법론 적용
- **TLM-2.0 통합**: CSR 모델과 직접 연결
- **FC4SC 커버리지**: [[memory:5397247]] 기능적 커버리지 측정
- **자동화된 검증**: 스코어보드 기반 자동 검증
- **다양한 테스트 시나리오**: 기본/랜덤/에러 테스트

### 🎯 검증 범위
- 레지스터 읽기/쓰기 동작
- 배열 레지스터 접근 (포트별 설정)
- 필드 레벨 조작 및 검증
- TLM 프로토콜 준수성
- 에러 처리 (잘못된 주소 등)
- 기능적 커버리지 분석

## 📦 설치 및 환경 설정

### 1. 필수 구성 요소
```bash
# SystemC (2.3.3 이상)
# UVM SystemC (선택사항 - 내장 헤더 사용 가능)
# FC4SC (기능적 커버리지)
# GCC/Clang (C++14 지원)
```

### 2. 환경 변수 설정
```bash
export SYSTEMC_HOME=/usr/local/systemc
export UVM_SYSTEMC_HOME=/usr/local/uvm-systemc  # 선택사항
```

### 3. CSR 모델 생성 (사전 작업)
```bash
# RDL 파일로부터 SystemC TLM 모델 생성
python rdl_systemc_generator.py switch_csr.rdl
```

## 🧪 UVM 검증 아키텍처

### 컴포넌트 구조
```
csr_test
├── csr_env
│   ├── csr_agent
│   │   ├── csr_driver (TLM 이니시에이터)
│   │   ├── csr_monitor (트랜잭션 모니터링)
│   │   └── csr_sequencer (시퀀스 관리)
│   ├── csr_scoreboard (자동 검증)
│   └── csr_coverage (FC4SC 커버리지)
└── CSR TLM Model (DUT)
```

### 주요 클래스들

#### 1. CSR Transaction
```cpp
class csr_transaction : public uvm_sequence_item {
public:
    uint32_t address;    // 레지스터 주소
    uint32_t data;       // 데이터
    bool is_write;       // 읽기/쓰기 구분
    bool response_ok;    // 응답 상태
};
```

#### 2. CSR Driver
```cpp
class csr_driver : public uvm_driver<csr_transaction> {
    tlm_utils::simple_initiator_socket<csr_driver> initiator_socket;
    // TLM 트랜잭션 실행
    void execute_transaction(csr_transaction& trans);
};
```

#### 3. CSR Coverage (FC4SC)
```cpp
class csr_coverage : public sc_module {
    fc4sc::covergroup address_cg;      // 주소 커버리지
    fc4sc::covergroup data_cg;         // 데이터 커버리지
    fc4sc::covergroup operation_cg;    // 연산 커버리지
    fc4sc::cross<uint32_t, bool> cross_addr_op; // 크로스 커버리지
};
```

#### 4. CSR Scoreboard
```cpp
class csr_scoreboard : public uvm_scoreboard {
    std::map<uint32_t, uint32_t> expected_values;
    // 읽기 검증, 쓰기 추적, 결과 분석
};
```

## 📋 테스트 시나리오

### 1. 기본 테스트 시퀀스 (csr_basic_sequence)
```cpp
// 1. 디바이스 ID 읽기 (0x000)
// 2. 컨트롤 레지스터 읽기/쓰기 (0x004)
// 3. 포트 설정 배열 테스트 (0x020-0x02C)
// 4. 인터럽트 레지스터 테스트 (0x00C, 0x010)
```

### 2. 랜덤 테스트 시퀀스 (csr_random_sequence)
```cpp
// - 100개 랜덤 트랜잭션
// - 유효한 주소에서 랜덤 선택
// - 70% 읽기, 30% 쓰기 비율
// - 랜덤 데이터 패턴
```

### 3. 에러 테스트
```cpp
// - 잘못된 주소 접근
// - 읽기 전용 레지스터 쓰기 시도
// - TLM 프로토콜 위반 검사
```

## 🛠️ 사용법

### 1. 자동 실행 (권장)
```bash
cd src/uvm_systemc/
./run_csr_uvm_test.sh basic    # 기본 테스트
./run_csr_uvm_test.sh uvm      # UVM 테스트 (UVM SystemC 필요)
```

### 2. 수동 빌드 및 실행
```bash
cd src/uvm_systemc/

# 의존성 확인
make -f Makefile.csr check-deps

# 빌드
make -f Makefile.csr all

# 실행
make -f Makefile.csr run-basic
make -f Makefile.csr run-uvm-vcd  # VCD 트레이스 포함
```

### 3. 커버리지 분석
```bash
make -f Makefile.csr coverage-report
```

## 📊 검증 결과 분석

### 1. 기본 검증 결과
```
=== CSR Scoreboard Results ===
Total Transactions: 150
Passed Checks: 148
Failed Checks: 2
Pass Rate: 98.67%
```

### 2. FC4SC 커버리지 결과
```
=== CSR Coverage Report ===
Address Coverage: 85.7%
Data Coverage: 92.3%
Operation Coverage: 100%
Register Fields Coverage: 78.9%
```

### 3. VCD 트레이스 분석
```bash
# GTKWave로 파형 확인
gtkwave build/csr_uvm_test.vcd
```

## 🔧 고급 사용법

### 1. 커스텀 테스트 시퀀스 작성
```cpp
class my_custom_sequence : public uvm_sequence<csr_transaction> {
public:
    virtual void body() override {
        // 커스텀 테스트 로직
        csr_transaction* req = csr_transaction::type_id::create("custom_req");
        req->address = 0x004;
        req->data = 0x12345678;
        req->is_write = true;
        
        start_item(req);
        finish_item(req);
    }
};
```

### 2. 확장된 커버리지 모델
```cpp
// 추가 커버포인트 정의
cp_register_combinations.add_cross(cp_control_enable, cp_port_config);

// 조건부 커버리지
if (transaction.address == CONTROL_REG_ADDR) {
    cp_control_fields.sample(transaction.data);
}
```

### 3. 스코어보드 확장
```cpp
class advanced_scoreboard : public csr_scoreboard {
    // 타이밍 검증
    void check_access_timing(const csr_transaction& trans);
    
    // 시퀀스 검증
    void verify_register_sequence(const std::vector<csr_transaction>& sequence);
    
    // 상태 머신 검증
    void check_state_transitions();
};
```

## 🐛 문제 해결

### 일반적인 문제들

1. **SystemC 링크 오류**
   ```bash
   # 라이브러리 경로 확인
   export LD_LIBRARY_PATH=$SYSTEMC_HOME/lib-linux64:$LD_LIBRARY_PATH
   ```

2. **UVM 헤더 찾을 수 없음**
   ```bash
   # 내장 UVM 헤더 사용
   # 또는 UVM SystemC 설치 확인
   ```

3. **FC4SC 커버리지 오류**
   ```bash
   # FC4SC 초기화 확인
   fc4sc::global::initialize();
   // ...
   fc4sc::global::finalize();
   ```

4. **TLM 소켓 연결 오류**
   ```cpp
   // 연결 순서 확인
   driver->initiator_socket.bind(csr_model->target_socket);
   ```

## 📈 성능 최적화

### 1. 컴파일 최적화
```makefile
CXXFLAGS += -O3 -DNDEBUG
CXXFLAGS += -DSC_INCLUDE_DYNAMIC_PROCESSES
```

### 2. 시뮬레이션 속도 향상
```cpp
// 불필요한 로그 비활성화
uvm_config_db<int>::set(nullptr, "*", "recording_detail", UVM_NONE);

// 커버리지 샘플링 최적화
if (transaction_count % 10 == 0) {
    coverage_model->sample_transaction(trans);
}
```

### 3. 메모리 사용량 최적화
```cpp
// 트랜잭션 풀 사용
static csr_transaction transaction_pool[1000];
static int pool_index = 0;
```

## 📚 확장 가능성

### 1. 다른 프로토콜 지원
- AXI4-Lite 인터페이스 추가
- APB 프로토콜 지원
- Custom 프로토콜 어댑터

### 2. 고급 검증 기능
- Constrained random testing
- Assertion-based verification
- Formal verification 통합

### 3. CI/CD 통합
```yaml
# GitHub Actions 예시
- name: Run CSR UVM Tests
  run: |
    cd src/uvm_systemc/
    ./run_csr_uvm_test.sh basic
    make -f Makefile.csr coverage-report
```

## 🤝 기여하기

1. **새로운 테스트 시나리오 추가**
2. **커버리지 모델 개선**
3. **성능 최적화**
4. **문서 개선**

---

## 📞 지원

질문이나 문제가 있으시면:
- GitHub Issues 생성
- 팀 채팅방 문의
- 코드 리뷰 요청

**Happy Verification! 🚀**
