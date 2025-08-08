# UVM SystemC Ingress Port Manager Verification

이 디렉토리는 **UVM SystemC**를 사용하여 `IngressPortManager`를 체계적으로 검증하는 환경을 제공합니다.

## 🎯 목표

- **체계적 검증**: UVM 방법론을 사용한 구조화된 테스트 환경
- **재사용성**: 모듈화된 Agent, Sequence, Scoreboard 구조
- **완전성**: 다양한 시나리오와 코너 케이스 커버리지
- **자동화**: 자동화된 패킷 검증 및 결과 분석

## 📁 디렉토리 구조

```
src/uvm_systemc/
├── common/
│   └── uvm_types.h              # UVM 트랜잭션 타입 및 설정
├── agents/
│   ├── external_agent.h         # External Interface UVM Agent
│   └── axis_agent.h             # AXIS Interface UVM Agent
├── sequences/
│   ├── external_sequences.h     # External Interface 시퀀스들
│   └── axis_sequences.h         # AXIS Interface 시퀀스들
├── scoreboards/
│   └── ingress_pm_scoreboard.h  # 패킷 검증용 Scoreboard
├── testbench/
│   └── ingress_pm_testbench.h   # 메인 테스트벤치 환경
├── tests/
│   ├── ingress_pm_tests.h       # UVM 테스트 케이스들
│   └── test_main.cpp            # 메인 실행 파일
├── Makefile                     # 빌드 스크립트
└── README.md                    # 이 파일
```

## 🏗️ UVM 아키텍처

### 1. **UVM Agents**
- **External Agent**: 외부에서 들어오는 패킷을 생성/모니터링
- **AXIS Agent**: AXIS 인터페이스의 ready 신호 제어 및 모니터링

### 2. **UVM Sequences**
- **Single Packet**: 기본 단일 패킷 테스트
- **Multiple Packets**: 여러 패킷 연속 전송
- **Burst Packets**: 백투백 패킷 버스트
- **Mixed Types**: DATA/CONTROL/CREDIT 패킷 혼합
- **Stress Test**: 고부하 스트레스 테스트

### 3. **UVM Scoreboard**
- **자동 검증**: 입력 패킷과 출력 패킷 자동 비교
- **통계 수집**: 패킷 처리 통계 및 성능 메트릭
- **오류 감지**: 데이터 무결성 및 프로토콜 위반 검출

## 🚀 사용법

### 1. **환경 설정**

```bash
# SystemC 설치 경로 설정
export SYSTEMC_HOME=/usr/local/systemc-2.3.3

# UVM-SystemC 설치 경로 설정  
export UVM_SYSTEMC_HOME=/usr/local/uvm-systemc-1.0-beta4

# 환경 확인
make check-env
```

### 2. **빌드**

```bash
# 전체 빌드
make all

# 또는 개별 테스트 빌드 및 실행
make basic
```

### 3. **테스트 실행**

```bash
# 기본 기능 테스트
make basic

# 다중 패킷 테스트
make multiple

# 백프레셔 테스트
make backpressure

# 혼합 패킷 타입 테스트
make mixed

# 스트레스 테스트
make stress

# 모든 테스트 실행
make test-all
```

### 4. **고급 실행 옵션**

```bash
# 높은 상세도로 실행
make test-verbose

# 디버그 모드 실행
make test-debug

# 파형 생성과 함께 실행
make waves
```

## 📊 테스트 케이스

### 1. **Basic Test** (`basic_test`)
- **목적**: 기본 단일 패킷 처리 검증
- **시나리오**: 64바이트 패킷 1개 전송
- **검증**: 패킷 무결성, AXIS 핸드셰이크

### 2. **Multiple Packets Test** (`multiple_packets_test`)
- **목적**: 여러 패킷 연속 처리 능력 검증
- **시나리오**: 10개 패킷, 크기 32-128바이트 랜덤
- **검증**: 패킷 순서, 데이터 무결성

### 3. **Backpressure Test** (`backpressure_test`)
- **목적**: AXIS 백프레셔 처리 능력 검증
- **시나리오**: 느린 AXIS ready + 버스트 패킷
- **검증**: 백프레셔 하에서 데이터 손실 없음

### 4. **Mixed Types Test** (`mixed_types_test`)
- **목적**: 다양한 패킷 타입 처리 검증
- **시나리오**: DATA/CONTROL/CREDIT 패킷 혼합
- **검증**: 패킷 타입별 올바른 처리

### 5. **Stress Test** (`stress_test`)
- **목적**: 고부하 상황에서의 안정성 검증
- **시나리오**: 50개 패킷, 랜덤 버스트, 랜덤 백프레셔
- **검증**: 높은 처리율에서 데이터 무결성

## 🔍 검증 포인트

### 1. **기능적 검증**
- ✅ 패킷 데이터 무결성
- ✅ AXIS 프로토콜 준수
- ✅ 패킷 헤더 처리
- ✅ 패킷 타입별 처리

### 2. **성능 검증**
- ✅ 처리량 (Throughput)
- ✅ 지연시간 (Latency)
- ✅ 백프레셔 처리
- ✅ 버퍼 활용률

### 3. **에러 처리**
- ✅ 잘못된 패킷 처리
- ✅ 오버플로우 상황 처리
- ✅ 프로토콜 위반 감지

## 📈 결과 분석

### 1. **자동 리포트**
각 테스트 실행 후 자동으로 생성되는 리포트:
- 패킷 송수신 통계
- 매치/미스매치 결과
- 성능 메트릭

### 2. **파형 분석**
```bash
make waves  # VCD 파형 생성
gtkwave build/*.vcd  # 파형 뷰어로 분석
```

### 3. **로그 분석**
```bash
# 상세 로그 확인
make test-verbose 2>&1 | tee test_results.log

# 에러만 필터링
grep "ERROR\|FATAL" test_results.log
```

## 🛠️ 커스터마이징

### 1. **새로운 시퀀스 추가**
```cpp
// sequences/custom_sequences.h
class custom_sequence : public external_base_sequence {
    // 커스텀 시퀀스 구현
};
```

### 2. **테스트 케이스 확장**
```cpp
// tests/custom_tests.h  
class custom_test : public ingress_pm_base_test {
    // 커스텀 테스트 구현
};
```

### 3. **설정 변경**
```cpp
// 테스트별 설정 오버라이드
virtual void configure_test() override {
    cfg->num_packets = 100;
    cfg->max_delay_cycles = 10;
    // 기타 설정...
}
```

## 🐛 트러블슈팅

### 1. **컴파일 에러**
```bash
# 환경 변수 확인
echo $SYSTEMC_HOME
echo $UVM_SYSTEMC_HOME

# 의존성 확인
make check-env
```

### 2. **실행 에러**
```bash
# 라이브러리 경로 확인
ldd build/uvm_ingress_pm_test

# 권한 확인
chmod +x build/uvm_ingress_pm_test
```

### 3. **테스트 실패**
```bash
# 디버그 모드로 실행
make test-debug

# 파형으로 분석
make waves
gtkwave build/*.vcd
```

## 📚 참고 자료

- [UVM-SystemC User Guide](https://www.accellera.org/downloads/standards/systemc)
- [SystemC Documentation](https://systemc.org/resources/documentation/)
- [UVM Methodology](https://www.chipverify.com/uvm/uvm-tutorial)

## 🤝 기여

새로운 테스트 케이스나 개선사항은 언제든 환영합니다:

1. 새로운 시퀀스/테스트 추가
2. 커버리지 향상
3. 성능 최적화
4. 문서 개선

---

**UVM SystemC로 더 체계적이고 강력한 검증을 경험해보세요!** 🚀