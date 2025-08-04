# Switch Internal P2P Link - Top Architecture

## 개요 (Overview)

Switch Internal P2P Link는 포트 간 고성능 패킷 전달을 위한 내부 스위치 아키텍처입니다. 

### 핵심 설계 원칙
- **인터페이스 추상화**: 다양한 외부 프로토콜(PCIe, Ethernet, CXL 등)을 통일된 내부 포맷으로 추상화
- **고성능 적응형 버퍼링**: 채널 타입별 최적화된 SRAM Circular Buffer로 Bandwidth Mismatch 해결 및 Processing Latency Hiding
- **무손실 플로우 제어**: End-to-End 크레딧 기반 시스템으로 패킷 손실 완전 방지
- **백프레셔 없는 Ingress**: 크레딧 기반으로 무조건 수신 보장, 내부 백프레셔 제거
- **Bandwidth Saturation 최적화**: 수학적 크레딧 계산으로 최대 대역폭 활용률 달성
- **Queue별 우선순위 스케줄링**: 외부 Ingressor 크레딧과 우선순위 기반 정교한 QoS 제어
- **계층적 데이터 구조**: Port > Channel > Queue 3계층으로 유연한 트래픽 관리
- **Channel-Agnostic 처리**: 채널 구분 없이 Queue 번호 기반 단순화된 라우팅
- **계층적 제어**: System-level과 Port-level로 분리된 AXI Switch 구조
- **모듈성 및 확장성**: 포트별 독립적 관리와 쉬운 프로토콜 확장 지원
- **중앙 집중식 라우팅**: 효율적인 패킷 스위칭 및 성능 최적화

## 계층 구조 (Hierarchical Structure)

### 포트 계층 구조 (Port Hierarchy)
```
포트 (Port)
├── 채널 0 (Channel 0)
│   ├── 큐 0 (Queue 0)
│   ├── 큐 1 (Queue 1)
│   └── ...
├── 채널 1 (Channel 1)
│   ├── 큐 0 (Queue 0)
│   ├── 큐 1 (Queue 1)
│   └── ...
└── ...
```

### 채널 타입별 버퍼링 전략
- **가변 Payload 채널**: Header/Payload 분리형 Circular Buffer 사용
- **고정 Payload 채널**: 패킷 전체를 통째로 저장하는 단일 Circular Buffer 사용

### Queue 매핑 규칙
- **Channel-Agnostic 전달**: Port Manager와 Queue Manager는 채널을 구분하지 않음
- **Queue-to-Queue 매핑**: Ingress Port의 Queue N → Egress Port의 같은 Queue N으로 전달
- **Payload Type 인식**: 각 Queue가 Fixed/Variable Payload인지 구분하여 동작

## 주요 컴포넌트 (Main Components)

### 1. Port Manager
- **역할**: 외부 인터페이스 추상화 (Interface Abstraction)
  - 다양한 외부 프로토콜을 내부 통일된 형태로 변환
  - 외부 인터페이스의 복잡성을 내부 시스템으로부터 격리
  - 외부 인터페이스 변경 시 내부 시스템 영향 최소화
  - 확장 가능한 외부 인터페이스 지원
- **인스턴스화**: 각 포트마다 개별 인스턴스 생성
- **구성**: Ingress Port Manager + Egress Port Manager
- **연결**:
  - **데이터 경로**: Queue Manager와 AXIS 프로토콜로 연결 (패킷 전달)
  - **제어 경로**: Port-level AXI Switch에 AXI Master/Slave로 연결
- **AXI 인터페이스**:
  - **AXI Master**: 상태 보고, 에러 알림 송신
  - **AXI Slave**: 제어 명령 수신 (포트 설정, 인터페이스 제어)

#### 1.1 Ingress Port Manager
- **역할**: 외부→내부 인터페이스 추상화
- **추상화 기능**:
  - 다양한 외부 프로토콜 (PCIe, Ethernet, CXL 등) 수용
  - 외부 프로토콜별 패킷 파싱 및 검증
  - 외부 포맷 → 통일된 Internal 포맷 변환
  - 외부 인터페이스 특성을 내부로부터 숨김
- **단일 버퍼링 시스템**:
  - **단일 SRAM Circular Buffer**: 외부 데이터를 가공 없이 그대로 저장
    - 외부 프로토콜 데이터를 변환 없이 Raw 형태로 버퍼링
    - 가변 크기 패킷을 그대로 저장 (고정/가변 패킷 모두 수용)
    - 포맷 변환이나 분석 처리 없이 단순 저장
  - **Bandwidth Mismatch 해결**: 외부↔내부 스트리밍 속도 차이 흡수
  - **Processing Latency Hiding**: 내부 전송 지연 시간 숨김
  - **백프레셔 없는 수신**: 전송된 패킷은 무조건 버퍼링 (손실 방지)
- **크레딧 기반 플로우 제어**:
  - **외부 크레딧 관리**: 외부 Egressor가 크레딧만큼만 데이터 전송
  - **End-to-End 크레딧 순환**: 패킷이 최종 목적지 전달 시 크레딧 반환
  - **크레딧 적립**: 반환된 크레딧을 외부 Egressor에게 재적립

- **주요 기능**:
  - 외부 패킷 수신 (프로토콜별 기본 처리만)
  - **Raw 데이터 버퍼링**: 외부 데이터를 가공 없이 Circular Buffer에 저장
    - 포맷 변환, 파싱, 분석 처리 없이 Raw 형태 그대로 저장
    - 가변 크기 패킷을 그대로 버퍼링 (고정/가변 패킷 모두 수용)
    - 채널 타입이나 패킷 타입 구분 없이 단순 저장
  - **Internal Header 생성 및 AXIS 전송**:
    - Circular Buffer에서 패킷 추출 시 Internal Header 생성
    - 내부 라우팅 및 버퍼링을 위한 메타데이터 포함 (채널 타입, 큐 번호, 패킷 타입 등)
    - AXIS.tuser 필드에 Internal Header 삽입
    - AXIS.tdata에는 Raw 데이터 그대로 전송
    - AXIS.tlast로 패킷 마지막 beat 표시 (burst 경계 구분)
  - **기본 패킷 정보 추출**: Internal Header 생성을 위한 최소한의 패킷 분석
  - AXIS Master로 Ingress Queue Manager에 패킷 전달
- **인터페이스**: AXIS Master (→ Ingress Queue Manager)

#### 1.2 Egress Port Manager  
- **역할**: 내부→외부 인터페이스 추상화
- **추상화 기능**:
  - 통일된 Internal 포맷 → 다양한 외부 프로토콜로 변환
  - 외부 프로토콜별 패킷 생성 및 포맷팅
  - 외부 인터페이스 특성에 맞는 타이밍 제어
  - 외부 인터페이스 에러 처리 및 복구
- **단일 버퍼링 시스템**:
  - **단일 SRAM Circular Buffer**: 모든 패킷을 통째로 저장
    - 받은 패킷을 크기에 상관없이 그대로 버퍼링
    - Header/Payload 분리 없이 단순 버퍼링
    - 성능 최적화 및 지연 시간 최소화
  - **Bandwidth Mismatch 해결**: 내부↔외부 스트리밍 속도 차이 흡수
  - **Processing Latency Hiding**: 포맷 변환 및 송신 처리 지연 시간 숨김
- **단순 패킷 송신 전용**:
  - **단순 패킷 송신**: Egress Queue Manager로부터 AXIS로 수신한 패킷을 외부로 송신
- **주요 기능**:
  - AXIS Slave로 Egress Queue Manager에서 패킷 수신
  - **단일 Circular Buffer 관리**: 모든 패킷을 통째로 저장
    - 받은 패킷을 크기에 상관없이 그대로 버퍼링
    - Header/Payload 분리 없이 단순 버퍼링으로 성능 최적화

  - **Channel-Agnostic 처리**: 채널 구분 없이 Queue 번호 기반 처리
  - Internal 포맷 → 외부 포맷 변환
  - 외부 프로토콜별 패킷 송신
- **인터페이스**: AXIS Slave (← Egress Queue Manager)

### 2. Port Router
- **역할**: 중앙 집중식 패킷 라우팅 엔진
- **위치**: 시스템 중앙에 단일 인스턴스
- **연결**: 모든 Port Manager와 연결
- **구성**: 각 포트별 Queue Manager로 구성

#### 2.1 Queue Manager (각 포트별)
- **역할**: 포트별 큐 관리 및 패킷 버퍼링
- **인스턴스화**: 각 포트마다 개별 Queue Manager 생성 (Port Manager와 Pair)
- **구성**: Ingress Queue Manager + Egress Queue Manager
- **Channel-Agnostic 동작**: 채널을 구분하지 않고 Queue 번호만으로 동작
- **Queue-to-Queue 매핑**: Ingress Port의 Queue N → Egress Port의 같은 Queue N으로 전달
- **연결**:
  - **데이터 경로**: Port Manager와 AXIS 프로토콜로 연결 (패킷 전달)
  - **제어 경로**: Port-level AXI Switch에 AXI Master/Slave로 연결
- **AXI 인터페이스**:
  - **AXI Master**: 큐 상태 보고, 임계값 알림 송신
  - **AXI Slave**: 제어 명령 수신 (큐 설정, 버퍼 제어, 스케줄링 정책)

##### 2.1.1 Ingress Queue Manager
- **역할**: 해당 포트로부터 들어오는 패킷의 Internal 포맷 변환 및 큐 관리
- **주요 기능**:
  - AXIS Slave로 Ingress Port Manager로부터 패킷 수신
    - AXIS.tuser에서 Internal Header 정보 추출 (채널 타입, 큐 번호, 패킷 타입 등)
    - AXIS.tdata에서 Raw 데이터 수신
  - **Internal Header 기반 포맷 변환**:
    - Internal Header 정보를 분석하여 채널 타입, 큐, 패킷 타입 판단
    - Raw 데이터를 Internal 포맷으로 변환
    - **통합 패킷 저장**: Header와 Payload 구분 없이 변환된 패킷을 통째로 큐에 저장
    - **큐별 독립 관리**: 각 큐마다 독립적인 버퍼에 패킷 저장
  - **패킷 내 크레딧 처리**: 
    - 외부 Egressor가 패킷에 포함시킨 크레딧 정보 추출
    - 큐별 Available Credit 공유 변수 증가 (Egress Queue Manager와 공유)
  - **연속적 패킷 처리**: 버퍼에서 쉬지 않고 패킷을 빼내어 처리
  - Routing & Switching Core로 패킷 전달
  - **무백프레셔 보장**: Ingress Port Manager로 백프레셔 신호 전송 금지
- **인터페이스**: 
  - AXIS Slave (← Ingress Port Manager) - 백프레셔 없음
  - Internal Bus (→ Routing & Switching Core)

##### 2.1.2 Egress Queue Manager  
- **역할**: 해당 포트로 나가는 패킷 큐 관리 및 크레딧 기반 스케줄링
- **주요 기능**:
  - Routing & Switching Core로부터 패킷 수신
  - **큐별 통합 패킷 버퍼링** (각 큐마다 최소 2패킷 저장):
    - **통합 패킷 관리**: Header와 Payload 구분 없이 패킷 전체를 큐별로 관리
    - **큐별 독립 버퍼**: 각 큐마다 독립적인 SRAM Circular Buffer
    - **우선순위 정보**: 패킷 내 우선순위 정보를 활용한 스케줄링
  - **크레딧 기반 스케줄링 시스템**:
    - **Available Credit 공유 변수 관리**: Ingress Queue Manager와 큐별 Available Credit 변수 공유
    - **우선순위 기반 큐 선택**: 크레딧이 유효한 큐들 중 최고 우선순위 큐 선택
    - **크레딧 차감 및 전송**: 전송 시 Available Credit 공유 변수 감소 후 해당 큐에서 패킷 추출
    - **Queue별 독립 스케줄링**: 각 큐의 circular buffer에서 패킷 개별 관리
  - **크레딧 반환 시스템**:
    - **AXIS 전송 완료 감지**: Egress Port Manager로 패킷 전송 완료 확인
    - **소스 포트 크레딧 반환**: 원래 패킷을 받았던 소스 포트의 Ingress Queue Manager로 크레딧 반환
  - AXIS Master로 Egress Port Manager에 패킷 전달
- **인터페이스**: 
  - Internal Bus (← Routing & Switching Core)
  - AXIS Master (→ Egress Port Manager)
  - Shared Variables (↔ Ingress Queue Manager, 큐별 Available Credit 공유)

### 3. AXI Switch (계층적 구조)
- **역할**: 패킷 제어를 위한 계층적 통신 구조
- **구성**: 2계층 AXI Switch 아키텍처

#### 3.1 Port-level AXI Switch (하위 계층)
- **위치**: 각 포트마다 개별 인스턴스
- **연결**: 
  - **상위**: System-level AXI Switch (양방향 AXI)
  - **하위**: Port Manager (AXI Master ← Switch → AXI Slave)
  - **하위**: Queue Manager (AXI Master ← Switch → AXI Slave)
- **주요 기능**:
  - 포트 내부 AXI Master/Slave 인터페이스 중재
  - 포트별 로컬 제어 명령 처리
  - 포트 상태 정보 수집 및 상위 보고
  - Master/Slave 방향에 따른 트래픽 라우팅

#### 3.2 System-level AXI Switch (상위 계층)
- **위치**: 시스템 중앙에 단일 인스턴스  
- **연결**: 
  - **상위**: CPU (AXI Master → Switch)
  - **하위**: 모든 Port-level AXI Switch들 (양방향 AXI)
- **주요 기능**:
  - 시스템 전체 AXI 트래픽 중재
  - CPU Master 명령을 각 포트로 라우팅
  - 포트별 Slave 응답을 CPU로 집계
  - 글로벌 시스템 상태 관리
  - 포트 간 협조 제어 (라우팅 테이블 동기화 등)

### 4. Credit Management System
- **역할**: End-to-End 크레딧 기반 플로우 제어 관리
- **위치**: 각 Port Manager와 연계된 분산 시스템
- **주요 기능**:
  - **크레딧 할당**: 각 외부 Egressor에 초기 크레딧 할당
  - **크레딧 소비 추적**: 패킷 수신 시 크레딧 차감
  - **크레딧 순환 관리**: 패킷 전송 완료 시 소스 포트로 크레딧 반환
  - **크레딧 적립 통지**: 외부 Egressor에게 사용 가능한 크레딧 통지

#### 4.1 Bandwidth Saturation을 위한 크레딧 계산
대역폭 포화를 달성하기 위한 최적 크레딧 수는 다음 수식으로 계산됩니다:

**기본 크레딧 계산 공식**:
```
Credits = ⌈(BW × RTT) / Packet_Size⌉ + Safety_Margin

where:
- BW: Link Bandwidth (bits/sec)
- RTT: Round-Trip Time (sec) = Processing_Latency + Network_Propagation_Delay
- Packet_Size: Average Packet Size (bits)
- Safety_Margin: Buffer 여유분 (packets)
```

**세부 계산 요소**:
```
RTT = T_ingress_proc + T_switch_core + T_egress_proc + T_network_prop

where:
- T_ingress_proc: Ingress Port Manager 처리 지연
- T_switch_core: Port Router 스위칭 지연  
- T_egress_proc: Egress Port Manager 처리 지연
- T_network_prop: 네트워크 전파 지연 (external)
```

**채널별 크레딧 최적화**:
```
가변 Payload 채널:
Credits_var = ⌈(BW × RTT) / Avg_Packet_Size⌉ + Header_Overhead + Safety_Margin

고정 Payload 채널:
Credits_fix = ⌈(BW × RTT) / Fixed_Packet_Size⌉ + Safety_Margin
```

**실제 적용 예시**:

**예시 1**: 1Gbps 링크, 1500B 평균 패킷, 10μs RTT
```
Credits = ⌈(1×10⁹ × 10×10⁻⁶) / (1500×8)⌉ + 2
        = ⌈10,000 / 12,000⌉ + 2  
        = 1 + 2 = 3 packets
→ 최소 3개 크레딧으로 1Gbps 대역폭 포화 달성
```

**예시 2**: 10Gbps 링크, 9000B Jumbo 패킷, 5μs RTT  
```
Credits = ⌈(10×10⁹ × 5×10⁻⁶) / (9000×8)⌉ + 3
        = ⌈50,000 / 72,000⌉ + 3
        = 1 + 3 = 4 packets  
→ 최소 4개 크레딧으로 10Gbps 대역폭 포화 달성
```

**예시 3**: 100Gbps 링크, 64B 최소 패킷, 1μs RTT
```
Credits = ⌈(100×10⁹ × 1×10⁻⁶) / (64×8)⌉ + 5
        = ⌈100,000 / 512⌉ + 5
        = 196 + 5 = 201 packets
→ 최소 201개 크레딧으로 100Gbps 대역폭 포화 달성 (작은 패킷)
```

**성능 최적화 가이드라인**:
- **고대역폭 + 작은 패킷**: 많은 크레딧 필요 (예시 3)
- **저대역폭 + 큰 패킷**: 적은 크레딧으로 충분 (예시 1)  
- **RTT 증가**: 비례적으로 크레딧 증가 필요
- **Safety Margin**: 트래픽 변동성에 따라 10-50% 추가 권장

**동적 크레딧 조정 예시**:
```
초기 설정: 10Gbps, 1500B 평균, 추정 RTT=8μs
Initial_Credits = ⌈(10×10⁹ × 8×10⁻⁶) / (1500×8)⌉ + 3 = 7 packets

실측 RTT=12μs 감지 시:
Adjusted_Credits = ⌈(10×10⁹ × 12×10⁻⁶) / (1500×8)⌉ + 3 = 11 packets

→ 동적으로 크레딧 4개 추가하여 성능 최적화 유지
```
- **크레딧 플로우**:
  1. **입력측**: 외부 Egressor → Ingress Port Manager (크레딧 소비)
  2. **패킷 내 크레딧**: 외부 Egressor가 패킷에 크레딧 정보 포함하여 전송
  3. **패킷 처리**: Port Router를 통한 패킷 라우팅
  4. **크레딧 추출**: Ingress Queue Manager가 패킷에서 크레딧 정보 추출
  5. **크레딧 증가**: Available Credit 공유 변수 증가 (Egress Queue Manager와 공유)
  6. **스케줄링**: Egress Queue Manager가 Available Credit 변수 확인 후 크레딧 유효 큐 중 우선순위 선택
  7. **크레딧 감소**: 선택된 큐의 Available Credit 공유 변수 감소
  8. **전송**: 선택된 큐에서 패킷 추출 및 AXIS 전송
  9. **크레딧 반환**: Egress Queue Manager → 소스 포트의 Ingress Queue Manager로 크레딧 복원
  10. **크레딧 재적립**: 해당 외부 Egressor에게 크레딧 재할당

### 5. CPU (Control Processing Unit)
- **역할**: 시스템 전체의 최상위 제어 및 관리
- **위치**: 시스템 외부 또는 별도 제어 모듈
- **연결**: System-level AXI Switch에 AXI Master/Slave로 연결
- **AXI 인터페이스**:
  - **AXI Master**: 제어 명령 송신 (레지스터 쓰기, 설정 변경)
  - **AXI Slave**: 상태 정보 수신 (모니터링 데이터, 에러 보고)
- **주요 기능**:
  - 글로벌 시스템 설정 및 정책 관리
  - 라우팅 테이블 초기화 및 업데이트
  - **크레딧 시스템 관리**:
    - 크레딧 할당량 설정 및 모니터링
    - Bandwidth Saturation 크레딧 계산 및 최적화
    - 채널별 크레딧 파라미터 조정 (가변/고정 Payload)
    - RTT 측정 및 동적 크레딧 조정 알고리즘
  - 시스템 전체 성능 모니터링 및 최적화
  - 에러 상황 처리 및 시스템 복구
  - 외부 관리 시스템과의 인터페이스

## 시스템 구조 (System Architecture)

### 데이터 플로우 구조 (Data Flow Architecture)
<!-- DONT_TOUCH_START -->
```
        External            External              External    
        Interfaces          Interfaces            Interfaces  
             ↕                   ↕                     ↕         
    ┌─────────────────┐ ┌─────────────────┐   ┌─────────────────┐
    │   Port Manager  │ │   Port Manager  │   │   Port Manager  │
    │     (Port 0)    │ │     (Port 1)    │   │     (Port N)    │
    │┌───────┬───────┐│ │┌───────┬───────┐│...│┌───────┬───────┐│
    ││Ingress│Egress ││ ││Ingress│Egress ││   ││Ingress│Egress ││
    ││Port   │Port   ││ ││Port   │Port   ││   ││Port   │Port   ││
    ││Manager│Manager││ ││Manager│Manager││   ││Manager│Manager││
    │└───┬───┴───┬───┘│ │└───┬───┴───┬───┘│   │└───┬───┴───┬───┘│
    └────┼───────┼────┘ └────┼───────┼────┘   └────┼───────┼────┘
         ↓ AXIS  ↑           ↓ AXIS  ↑             ↓ AXIS  ↑
 ┌───────┴───────┴───────────┴───────┴─────────────┴───────┴───────┐
 │                          Port Router                            │
 │  ┌─────────────────┐ ┌─────────────────┐   ┌─────────────────┐  │
 │  │  Queue Manager  │ │  Queue Manager  │   │  Queue Manager  │  │
 │  │    (Port 0)     │ │    (Port 1)     │   │    (Port N)     │  │
 │  │┌───────┬───────┐│ │┌───────┬───────┐│   │┌───────┬───────┐│  │
 │  ││Ingress│Egress ││ ││Ingress│Egress ││...││Ingress│Egress ││  │
 │  ││Queue  │Queue  ││ ││Queue  │Queue  ││   ││Queue  │Queue  ││  │
 │  ││Manager│Manager││ ││Manager│Manager││   ││Manager│Manager││  │
 │  │└───────┴───────┘│ │└───────┴───────┘│   │└───────┴───────┘│  │
 │  └──────┬───┬──────┘ └──────┬───┬──────┘   └──────┬───┬──────┘  │
 │         │   └───────────────┼───┼───────...───────┘   │         │
 │         │           Routing & Switching Core          │         │
 │         └───────────────────┼───┼───────...───────────┘         │
 └─────────────────────────────────────────────────────────────────┘
```
<!-- DONT_TOUCH_END -->

### 제어 플로우 구조 (Control Flow Architecture)
<!-- DONT_TOUCH_START -->
```
                              ┌─────────┐
                              │   CPU   │
                              └─M─────S─┘
                                │ AXI ↑ 
                                ↓     │
           ┌────────────────────S─────M───────...────────────┐
           │             System-level AXI Switch             │
           └──M───S──────────────M───S────────...─────M───S──┘
              │AXI↑              │AXI↑                │AXI↑
              ↓   │              ↓   │                ↓   │
 ┌────────────S───M───┐ ┌────────S───M───────┐   ┌────S───M───────────┐
 │ Port-level AXI     │ │ Port-level AXI     │...│ Port-level AXI     │
 │ Switch (Port 0)    │ │ Switch (Port 1)    │   │ Switch (Port N)    │
 └──M───S──────M───S──┘ └──M───S──────M───S──┘   └──M───S──────M───S──┘
    │AXI↑      │AXI↑       │AXI↑      │AXI↑         │AXI↑      │AXI↑
    ↓   │      ↓   │       ↓   │      ↓   │         ↓   │      ↓   │
 ┌──S───M──┐┌──S───M──┐ ┌──S───M──┐┌──S───M──┐   ┌──S───M──┐┌──S───M──┐
 │Port Mgr ││Queue Mgr│ │Port Mgr ││Queue Mgr│...│Port Mgr ││Queue Mgr│
 │ (Port 0)││ (Port 0)│ │ (Port 1)││ (Port 1)│   │ (Port N)││ (Port N)│
 └─────────┘└─────────┘ └─────────┘└─────────┘   └─────────┘└─────────┘
```                                                
<!-- DONT_TOUCH_END -->

#### 계층별 제어 기능 및 AXI 방향

**[상위 계층 - System-level AXI Switch]**
- CPU Master → 각 포트로 제어 명령 라우팅
- 포트별 Slave 응답 ← CPU로 상태 집계
- 포트 간 협조 제어 (글로벌 라우팅 테이블)
- 전체 시스템 상태 모니터링 및 성능 밸런싱

**[하위 계층 - Port-level AXI Switch]**  
- Port Manager/Queue Manager Master → 상위로 상태 보고
- Port Manager/Queue Manager Slave ← 상위에서 제어 명령 수신
- 포트 내부 Master/Slave 트래픽 중재
- 로컬 에러 처리 및 자동 복구

**[AXI 트래픽 플로우]**
- **제어 명령**: CPU Master → System Switch → Port Switch → Manager Slave
- **상태 보고**: Manager Master → Port Switch → System Switch → CPU Slave

## 데이터 플로우 (Data Flow)

### 패킷 전송 플로우 (데이터 경로 + 크레딧 순환)

#### 데이터 전송 경로 (Data Path)
1. **크레딧 확인**: 외부 Egressor가 사용 가능한 크레딧 확인
2. **외부 수신**: Ingress Port Manager가 외부 프로토콜로 패킷 수신 (크레딧 소비)
3. **Raw 데이터 버퍼링**: 외부 데이터를 가공 없이 Circular Buffer에 저장 (무손실 보장)
   - 포맷 변환, 파싱, 분석 없이 Raw 형태 그대로 버퍼링
   - 가변 크기 패킷을 그대로 저장 (고정/가변 패킷 모두 수용)
   - 채널 타입이나 패킷 타입 구분 없이 단순 저장
4. **기본 패킷 정보 추출**: Internal Header 생성을 위한 최소한의 패킷 분석
5. **Internal Header 생성**: Circular Buffer에서 패킷 추출 시 내부 라우팅/버퍼링용 메타데이터 생성
   - 채널 타입, 큐 번호, 패킷 타입 등 포함
7. **AXIS 전송**: Ingress Port Manager (AXIS Master) → Ingress Queue Manager (AXIS Slave, 백프레셔 없음)
   - AXIS.tuser에 Internal Header 삽입 (채널 타입, 큐 번호, 패킷 타입 등)
   - AXIS.tdata에 Raw 데이터 그대로 전송
   - AXIS.tlast로 패킷 마지막 beat 표시 (burst 경계 구분)
8. **Internal Header 분석**: Ingress Queue Manager가 AXIS.tuser에서 Internal Header 정보 추출
9. **패킷 내 크레딧 처리**: 외부 Egressor가 패킷에 포함시킨 크레딧 정보 추출 및 Available Credit 공유 변수 증가
10. **포맷 변환 및 저장**: Internal Header 기반으로 Raw 데이터를 Internal 포맷으로 변환
    - **통합 패킷 저장**: Header와 Payload 구분 없이 변환된 패킷을 통째로 큐에 저장
11. **라우팅**: Routing & Switching Core가 목적지 분석 (내부 포맷 기반)
12. **스위칭**: Internal Bus를 통해 목적지 Egress Queue Manager로 패킷 전달
13. **큐잉**: Egress Queue Manager가 패킷 버퍼링 및 스케줄링
14. **큐별 통합 패킷 버퍼링**: Egress Queue Manager에서 큐별 통합 관리 (최소 2패킷)
    - **통합 패킷 관리**: Header와 Payload 구분 없이 패킷 전체를 큐별로 저장
15. **크레딧 확인**: Egress Queue Manager가 Ingress Queue Manager와 공유하는 Available Credit 변수 확인
16. **우선순위 스케줄링**: Egress Queue Manager가 크레딧 유효한 큐들 중 최고 우선순위 큐 선택
    - **패킷 내 우선순위 정보**: 저장된 패킷의 우선순위 정보를 활용한 스케줄링
17. **크레딧 차감**: 선택된 큐의 Available Credit 공유 변수 감소
18. **패킷 추출**: 선택된 큐에서 통합 저장된 패킷 추출
19. **AXIS 전송**: Egress Queue Manager (AXIS Master) → Egress Port Manager (AXIS Slave)
20. **단일 버퍼링**: Egress Port Manager에서 단일 Circular Buffer에 패킷 저장
21. **포맷 변환**: Internal 포맷 → 목적지 외부 프로토콜 포맷 변환 (추상화 역변환)
22. **인터페이스 추상화**: 외부 프로토콜별 타이밍 및 제어 처리 (Processing Latency Hiding)
23. **외부 송신**: 목적지 외부 Egressor로 패킷 송신 완료

#### 크레딧 반환 경로 (Credit Return Path)
24. **AXIS 전송 완료 감지**: Egress Queue Manager가 Egress Port Manager로 패킷 전송 완료 확인
25. **크레딧 반환**: Egress Queue Manager가 소스 포트의 Ingress Queue Manager로 크레딧 반환 신호 전송
26. **크레딧 복원**: Credit Management System이 크레딧 풀에 크레딧 복원
27. **크레딧 적립**: 해당 외부 Egressor에게 사용 가능한 크레딧 적립 통지

### 제어 플로우 (제어 경로)
- **CPU**: 전체 시스템의 최상위 제어 엔티티
  - System-level AXI Switch를 통한 시스템 전체 제어
  - 글로벌 정책 설정 및 관리
  - 시스템 전체 성능 모니터링

- **System-level AXI Switch (상위 계층)**:
  - CPU와 각 포트 간 제어 명령 중재 및 라우팅
  - 포트 간 협조가 필요한 글로벌 제어 (라우팅 테이블 동기화)
  - 전체 시스템 상태 집계 및 관리
  - 포트 간 성능 밸런싱 제어

- **Port-level AXI Switch (하위 계층)**:
  - 포트별 독립적 제어 도메인 관리
  - Port Manager ↔ Queue Manager 간 중재
  - 로컬 포트 상태 모니터링 및 상위 보고
  - 포트별 에러 처리 및 자동 복구

- **Port Manager**: 
  - **AXI Master**: 포트 상태, 에러 상황을 Port-level AXI Switch로 보고
  - **AXI Slave**: CPU로부터 포트 설정, 인터페이스 제어 명령 수신
  - 외부 인터페이스 설정 관리 및 상태 모니터링

- **Queue Manager**: 
  - **AXI Master**: 큐 상태, 임계값 초과 등을 Port-level AXI Switch로 보고
  - **AXI Slave**: CPU로부터 큐 설정, 버퍼 제어, 스케줄링 정책 명령 수신
  - 버퍼 관리 및 플로우 제어 파라미터 조정

- **Routing & Switching Core**: 
  - 라우팅 테이블 관리 (로컬 + 글로벌)
  - 패킷 스위칭 정책 제어
  - 성능 최적화 알고리즘 실행

## TODO

### 다음 단계 (🎯)
- [ ] 🎯 Port > Channel > Queue 계층 구조 상세 설계
- [ ] 🎯 채널 타입 정의 및 분류 시스템 설계 (가변/고정 Payload)  
- [ ] 🎯 채널 타입별 적응형 버퍼링 시스템 설계
- [ ] 🎯 가변 Payload 채널: Header/Payload 분리형 Circular Buffer 아키텍처
- [ ] 🎯 고정 Payload 채널: 단일 Circular Buffer 아키텍처 (패킷 통째 저장)
- [ ] 🎯 Header Queue 구조 설계 (Fixed entry size, 메타데이터 스키마)
- [ ] 🎯 Payload Queue 구조 설계 (가변 길이 데이터, 메모리 최적화)
- [ ] 🎯 Header-Payload 포인터 매핑 메커니즘 설계 (시작위치, 크기 정보)
- [ ] 🎯 패킷 재구성 알고리즘 설계 (Header 기반 Payload 연결)
- [ ] 🎯 Channel-Agnostic Queue 매핑 시스템 설계 (Queue N → Queue N)
- [ ] 🎯 외부 Ingressor 크레딧 관리 시스템 설계 (큐별 크레딧 추적)
- [ ] 🎯 Ingress Port Manager → Egress Queue Manager CSR Write 인터페이스 설계
- [ ] 🎯 우선순위 기반 큐 스케줄링 알고리즘 설계 (Header Queue 우선순위 활용)
- [ ] 🎯 크레딧 차감 및 패킷 재구성 메커니즘 설계 (Egress Queue Manager)
- [ ] 🎯 Credit Management System 아키텍처 설계 (분산 크레딧 관리)
- [ ] 🎯 Bandwidth Saturation 크레딧 계산 알고리즘 구현
- [ ] 🎯 RTT 측정 시스템 설계 (Processing + Network 지연)
- [ ] 🎯 동적 크레딧 조정 메커니즘 설계 (실시간 최적화)
- [ ] 🎯 채널별 크레딧 최적화 알고리즘 (가변/고정 Payload)
- [ ] 🎯 End-to-End 크레딧 순환 메커니즘 설계 (입력-출력 크레딧 플로우)
- [ ] 🎯 외부 Egressor 크레딧 할당 및 관리 알고리즘 설계
- [ ] 🎯 Egress Queue Manager 크레딧 반환 시스템 설계 (AXIS 전송 완료 감지)
- [ ] 🎯 Egress Port Manager 단일 Circular Buffer 설계 (단순 버퍼링)
- [ ] 🎯 SRAM Circular Buffer 아키텍처 설계 (Ingress/Egress Port Manager용)
- [ ] 🎯 무백프레셔 Ingress 시스템 설계 (연속 처리 보장)
- [ ] 🎯 Bandwidth Mismatch 해결 메커니즘 설계 (버퍼 크기, 임계값)
- [ ] 🎯 Processing Latency Hiding 전략 설계 (파이프라이닝, 버퍼링)
- [ ] 🎯 Circular Buffer 제어 로직 설계 (포인터 관리, 플로우 제어)
- [ ] 🎯 외부 인터페이스 추상화 레이어 설계 (PCIe, Ethernet, CXL 등)
- [ ] 🎯 Ingress Port Manager 프로토콜별 추상화 모듈 설계
- [ ] 🎯 Egress Port Manager 프로토콜별 추상화 모듈 설계
- [ ] 🎯 Internal 패킷 포맷 정의 (통일된 내부 표준)
- [ ] 🎯 Internal Header 구조 설계 (채널 타입, 큐 번호, 패킷 타입, 메타데이터)
- [ ] 🎯 AXIS.tuser 필드 정의 및 Internal Header 매핑 규칙
- [ ] 🎯 AXIS.tlast 기반 burst 경계 처리 메커니즘 설계
- [ ] 🎯 Ingress Port Manager Raw 데이터 버퍼링 시스템 설계 (가공 없는 저장)
- [ ] 🎯 Ingress Queue Manager Internal Header 분석 및 포맷 변환 시스템 설계
- [ ] 🎯 채널 타입별 분산 저장 메커니즘 설계 (1개 또는 여러 개 entry)
- [ ] 🎯 외부↔내부 포맷 변환 규칙 및 매핑 테이블 설계
- [ ] 🎯 Ingress/Egress Port Manager AXIS 인터페이스 상세 정의
- [ ] 🎯 Ingress Queue Manager 큐 구조 및 AXIS 인터페이스 설계
- [ ] 🎯 Egress Queue Manager 큐 구조 및 AXIS 인터페이스 설계
- [ ] 🎯 System-level AXI Switch 아키텍처 및 중재 로직 설계
- [ ] 🎯 Port-level AXI Switch 아키텍처 및 로컬 중재 로직 설계
- [ ] 🎯 계층적 AXI Switch 간 통신 프로토콜 정의
- [ ] 🎯 CPU 인터페이스 및 시스템 제어 API 설계
- [ ] 🎯 Port Manager/Queue Manager AXI Master/Slave 인터페이스 정의
- [ ] 🎯 Routing & Switching Core 알고리즘 설계

### 검증 단계 (🔍)
- [ ] 🔍 Port > Channel > Queue 계층 구조 동작 검증
- [ ] 🔍 채널 타입 분류 시스템 정확성 검증 (가변/고정 Payload 구분)
- [ ] 🔍 채널 타입별 적응형 버퍼링 성능 테스트
- [ ] 🔍 가변 Payload 채널: Header/Payload 분리형 버퍼 동작 검증
- [ ] 🔍 고정 Payload 채널: 단일 버퍼 성능 최적화 검증
- [ ] 🔍 Header Queue Fixed entry 관리 정확성 검증 (메타데이터 저장)
- [ ] 🔍 Payload Queue 가변 길이 데이터 관리 검증 (메모리 효율성)
- [ ] 🔍 Header-Payload 포인터 매핑 무결성 테스트 (위치, 크기 정확성)
- [ ] 🔍 패킷 재구성 알고리즘 정확성 검증 (데이터 일치성)
- [ ] 🔍 Channel-Agnostic Queue 매핑 정확성 검증 (Queue N → Queue N)
- [ ] 🔍 외부 Ingressor 크레딧 관리 정확성 검증 (큐별 크레딧 추적)
- [ ] 🔍 Ingress Port Manager → Egress Queue Manager CSR Write 인터페이스 검증
- [ ] 🔍 우선순위 기반 스케줄링 공정성 테스트 (Header Queue 우선순위 정보 활용)
- [ ] 🔍 크레딧 차감 및 패킷 재구성 동기화 검증 (Egress Queue Manager)
- [ ] 🔍 Egress Queue Manager 크레딧 반환 시스템 정확성 검증
- [ ] 🔍 Egress Port Manager 단일 Circular Buffer 성능 검증
- [ ] 🔍 Credit Management System 정확성 검증 (크레딧 누수 방지)
- [ ] 🔍 Bandwidth Saturation 크레딧 계산 정확성 검증
- [ ] 🔍 RTT 측정 정밀도 및 실시간 업데이트 성능 테스트
- [ ] 🔍 동적 크레딧 조정 알고리즘 효과성 검증 (대역폭 활용률)
- [ ] 🔍 채널별 크레딧 최적화 성능 비교 (가변 vs 고정 Payload)
- [ ] 🔍 크레딧 부족/과잉 상황에서의 시스템 동작 검증
- [ ] 🔍 End-to-End 크레딧 순환 무결성 테스트 (입력-출력 크레딧 매칭)
- [ ] 🔍 무백프레셔 Ingress 동작 검증 (연속 수신 보장)
- [ ] 🔍 크레딧 기반 플로우 제어 성능 측정 (처리량, 공정성)
- [ ] 🔍 크레딧 반환 지연 시간 분석 및 최적화
- [ ] 🔍 SRAM Circular Buffer 성능 검증 (처리량, 레이턴시, 전력소모)
- [ ] 🔍 Bandwidth Mismatch 해결 효과성 측정 (다양한 속도 조건)
- [ ] 🔍 Processing Latency Hiding 효과 분석 (레이턴시 감소 정도)
- [ ] 🔍 Circular Buffer 오버플로우/언더플로우 방지 메커니즘 검증
- [ ] 🔍 SRAM 접근 패턴 최적화 및 충돌 회피 검증
- [ ] 🔍 외부 인터페이스 추상화 효과성 검증 (프로토콜 독립성)
- [ ] 🔍 다중 외부 프로토콜 지원 호환성 테스트
- [ ] 🔍 외부↔내부 포맷 변환 정확성 및 성능 검증
- [ ] 🔍 Internal Header 생성 및 AXIS.tuser 매핑 정확성 검증
- [ ] 🔍 AXIS.tlast 기반 burst 경계 처리 정확성 테스트
- [ ] 🔍 Internal Header 정보 무결성 검증 (채널 타입, 큐 번호, 패킷 타입)
- [ ] 🔍 Ingress Port Manager Raw 데이터 버퍼링 정확성 검증 (가공 없는 저장)
- [ ] 🔍 Ingress Queue Manager Internal Header 분석 정확성 검증
- [ ] 🔍 채널 타입별 포맷 변환 및 분산 저장 정확성 테스트
- [ ] 🔍 Raw 데이터 → Internal 포맷 변환 무결성 검증
- [ ] 🔍 Circular Buffer에서 Internal Header 생성 타이밍 검증
- [ ] 🔍 인터페이스 변경 시 내부 시스템 영향 최소화 검증
- [ ] 🔍 외부 인터페이스 프로토콜 사양 (PCIe, Ethernet, CXL, AXI Stream 등)
- [ ] 🔍 AXIS 인터페이스 타이밍 및 핸드셰이크 메커니즘
- [ ] 🔍 계층적 AXI Switch 성능 및 레이턴시 분석
- [ ] 🔍 System-level vs Port-level 제어 도메인 분리 검증
- [ ] 🔍 CPU 제어 경로 성능 및 확장성 분석
- [ ] 🔍 AXI Master/Slave 인터페이스 프로토콜 준수성
- [ ] 🔍 큐 버퍼링 전략 (Queue Manager 버퍼 크기, FIFO/우선순위 큐 구조)
- [ ] 🔍 플로우 제어 메커니즘 (백프레셔, 크레딧 기반, 큐 임계값 등)
- [ ] 🔍 포맷 변환 로직 (헤더 추가/제거, 메타데이터 처리)
- [ ] 🔍 스케줄링 정책 (Egress Queue Manager의 우선순위, QoS 등)
- [ ] 🔍 제어 레지스터 맵 정의 (AXI 레지스터 주소 공간)

### 구현 단계
- [ ] SystemC 모델링을 위한 클래스 구조 설계
- [ ] HLS 합성을 위한 제약사항 분석
- [ ] 성능 요구사항 및 최적화 전략
- [ ] 에러 처리 및 복구 메커니즘

---

*문서 생성일: 2024년*
*최종 수정일: 2024년*
