# Switch Internal P2P Link - Top Architecture

## 개요 (Overview)

Switch Internal P2P Link는 포트 간 고성능 패킷 전달을 위한 내부 스위치 아키텍처입니다. 

### 핵심 설계 원칙
- **인터페이스 추상화**: 다양한 외부 프로토콜(PCIe, Ethernet, CXL 등)을 통일된 내부 포맷으로 추상화
- **고성능 적응형 버퍼링**: 채널 타입별 최적화된 SRAM Circular Buffer로 Bandwidth Mismatch 해결 및 Processing Latency Hiding
- **무손실 플로우 제어**: End-to-End 크레딧 기반 시스템으로 패킷 손실 완전 방지
- **백프레셔 없는 Ingress**: 크레딧 기반으로 무조건 수신 보장, 내부 백프레셔 제거
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
- **버퍼링 시스템**:
  - **채널 타입별 적응형 버퍼링**:
    - **가변 Payload 채널**: Header/Payload 분리형 SRAM Circular Buffer
      - Header Queue: Fixed entry size, 패킷 메타데이터 저장
      - Payload Queue: 가변 길이 패킷 데이터 저장
      - 포인터 연결: Header에 Payload 시작위치 및 크기 정보 저장
    - **고정 Payload 채널**: 단일 SRAM Circular Buffer (패킷 통째 저장)
      - Fixed size entry로 패킷 전체 저장
      - Header/Payload 분리 없이 단순 버퍼링
      - 메모리 접근 최적화 및 지연 시간 최소화
  - **Bandwidth Mismatch 해결**: 외부↔내부 스트리밍 속도 차이 흡수
  - **Processing Latency Hiding**: 포맷 변환 및 처리 지연 시간 숨김
  - **백프레셔 없는 수신**: 전송된 패킷은 무조건 버퍼링 (손실 방지)
- **크레딧 기반 플로우 제어**:
  - **외부 크레딧 관리**: 외부 Egressor가 크레딧만큼만 데이터 전송
  - **End-to-End 크레딧 순환**: 패킷이 최종 목적지 전달 시 크레딧 반환
  - **크레딧 적립**: 반환된 크레딧을 외부 Egressor에게 재적립
- **주요 기능**:
  - 외부 패킷 수신 및 프로토콜 처리
  - **채널 타입별 버퍼링**:
    - **가변 Payload 채널**: Header Queue + Payload Queue 분리 관리
      - Header Queue: Fixed size entry에 메타데이터 저장
      - Payload Queue: 가변 길이 패킷 데이터 버퍼링
      - 포인터 매핑: Header에 Payload 위치 및 크기 정보 연결
    - **고정 Payload 채널**: 패킷 통째 저장
      - Fixed size entry로 패킷 전체 버퍼링
      - Header/Payload 분리 처리 생략으로 성능 최적화
  - **Channel-Agnostic 전달**: 채널 구분 없이 Queue 번호 기반 전달
  - 패킷 헤더 분석 및 메타데이터 생성
  - AXIS Master로 Ingress Queue Manager에 패킷 전달
- **인터페이스**: AXIS Master (→ Ingress Queue Manager)

#### 1.2 Egress Port Manager  
- **역할**: 내부→외부 인터페이스 추상화
- **추상화 기능**:
  - 통일된 Internal 포맷 → 다양한 외부 프로토콜로 변환
  - 외부 프로토콜별 패킷 생성 및 포맷팅
  - 외부 인터페이스 특성에 맞는 타이밍 제어
  - 외부 인터페이스 에러 처리 및 복구
- **버퍼링 시스템**:
  - **Queue별 채널 타입 적응 버퍼링** (각 큐마다 최소 2패킷 저장):
    - **가변 Payload Queue**: Header/Payload 분리형 SRAM Circular Buffer
      - Header Queue: Fixed entry size, 패킷 메타데이터 및 우선순위 정보 저장
      - Payload Queue: 가변 길이 패킷 데이터 저장
      - 포인터 연결: Header에 Payload 시작위치 및 크기 정보 저장
    - **고정 Payload Queue**: 단일 SRAM Circular Buffer
      - Fixed size entry로 패킷 전체 저장
      - Header/Payload 분리 없이 단순 버퍼링
      - 성능 최적화 및 지연 시간 최소화
  - **다중 큐 지원**: 여러 우선순위 큐별 독립적 버퍼 관리
  - **Bandwidth Mismatch 해결**: 내부↔외부 스트리밍 속도 차이 흡수
  - **Processing Latency Hiding**: 포맷 변환 및 송신 처리 지연 시간 숨김
- **크레딧 기반 스케줄링 시스템**:
  - **외부 Ingressor 크레딧 관리**: 외부 Ingressor가 제공한 큐별 크레딧 추적
  - **우선순위 기반 큐 선택**: 크레딧이 유효한 큐들 중 최고 우선순위 큐 선택
  - **크레딧 차감 및 전송**: 전송 필요 크레딧 차감 후 해당 큐에서 패킷 추출
  - **Queue별 독립 스케줄링**: 각 큐의 circular buffer에서 패킷 개별 관리
- **크레딧 반환 시스템**:
  - **패킷 전송 완료 감지**: 외부로 패킷 송신 완료 시점 확인
  - **소스 포트 크레딧 반환**: 원래 패킷을 받았던 Ingress Port Manager로 크레딧 반환
  - **외부 크레딧 적립**: 반환된 크레딧을 해당 외부 Egressor에게 적립 통지
- **주요 기능**:
  - AXIS Slave로 Egress Queue Manager에서 패킷 수신
  - **Queue별 채널 타입 적응 처리**:
    - **가변 Payload Queue**: Header/Payload 분리 저장 및 재구성
      - Header Queue 관리: Fixed size entry에 메타데이터 및 우선순위 정보 저장
      - Payload Queue 관리: 가변 길이 패킷 데이터를 큐별로 버퍼링
      - 포인터 매핑: Header에 Payload 위치 및 크기 정보 연결
      - 패킷 재구성: Header 정보로 Payload 위치 확인 후 완전한 패킷 재구성
    - **고정 Payload Queue**: 패킷 통째 저장 및 추출
      - Fixed size entry로 패킷 전체 버퍼링
      - 단순 패킷 추출로 성능 최적화
  - **Channel-Agnostic 처리**: 채널 구분 없이 Queue 번호 기반 처리
  - **크레딧 기반 스케줄링**: 외부 Ingressor 크레딧과 우선순위 기반 큐 선택
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
- **역할**: 해당 포트로부터 들어오는 패킷 큐 관리
- **주요 기능**:
  - AXIS Slave로 Ingress Port Manager로부터 패킷 수신
  - **연속적 패킷 처리**: 버퍼에서 쉬지 않고 패킷을 빼내어 처리
  - 패킷 버퍼링 및 큐 관리
  - Routing & Switching Core로 패킷 전달
  - **무백프레셔 보장**: Ingress Port Manager로 백프레셔 신호 전송 금지
- **인터페이스**: 
  - AXIS Slave (← Ingress Port Manager) - 백프레셔 없음
  - Internal Bus (→ Routing & Switching Core)

##### 2.1.2 Egress Queue Manager  
- **역할**: 해당 포트로 나가는 패킷 큐 관리
- **주요 기능**:
  - Routing & Switching Core로부터 패킷 수신
  - 패킷 버퍼링 및 큐 관리
  - AXIS Master로 Egress Port Manager에 패킷 전달
  - 스케줄링 및 우선순위 처리
- **인터페이스**: 
  - Internal Bus (← Routing & Switching Core)
  - AXIS Master (→ Egress Port Manager)

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
- **크레딧 플로우**:
  1. **입력측**: 외부 Egressor → Ingress Port Manager (크레딧 소비)
  2. **패킷 처리**: Port Router를 통한 패킷 라우팅
  3. **출력측**: 외부 Ingressor → Egress Port Manager (큐별 크레딧 제공)
  4. **스케줄링**: Egress Port Manager가 크레딧 유효 큐 중 우선순위 선택
  5. **전송**: 선택된 큐에서 패킷 추출 및 외부 송신
  6. **크레딧 반환**: 소스 Ingress Port Manager로 크레딧 복원
  7. **크레딧 재적립**: 해당 외부 Egressor에게 크레딧 재할당

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
  - **크레딧 시스템 관리**: 크레딧 할당량 설정 및 모니터링
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
3. **Ingress 버퍼링**: 채널 타입별 적응형 저장 (무손실 보장)
   - **가변 Payload 채널**: Header Queue(메타데이터) + Payload Queue(패킷 데이터) 분리 저장
   - **고정 Payload 채널**: 패킷 전체를 통째로 버퍼링
4. **연속 처리**: Ingress Queue Manager가 채널 타입에 따른 패킷 처리
   - **가변 Payload**: Header/Payload 포인터 연결로 패킷 재구성
   - **고정 Payload**: 단순 패킷 추출로 최적화
5. **인터페이스 추상화**: 외부 프로토콜별 처리 및 파싱 (Processing Latency Hiding)
6. **포맷 변환**: 외부 포맷 → 통일된 Internal 포맷 변환 (추상화 완료)
7. **AXIS 전송**: Ingress Port Manager (AXIS Master) → Ingress Queue Manager (AXIS Slave, 백프레셔 없음)
8. **라우팅**: Routing & Switching Core가 목적지 분석 (내부 포맷 기반)
9. **스위칭**: Internal Bus를 통해 목적지 Egress Queue Manager로 패킷 전달
10. **큐잉**: Egress Queue Manager가 패킷 버퍼링 및 스케줄링
11. **AXIS 전송**: Egress Queue Manager (AXIS Master) → Egress Port Manager (AXIS Slave)
12. **Queue별 채널 타입 적응 버퍼링**: 채널 타입에 따른 버퍼링 (최소 2패킷)
    - **가변 Payload Queue**: Header/Payload Queue에 분리 저장
    - **고정 Payload Queue**: 패킷 전체를 통째로 저장
13. **크레딧 확인**: 외부 Ingressor가 제공한 큐별 크레딧 상태 확인
14. **우선순위 스케줄링**: 크레딧 유효한 큐들 중 최고 우선순위 큐 선택
    - **가변 Payload**: Header Queue 우선순위 정보 활용
    - **고정 Payload**: 패킷 내 우선순위 정보 활용
15. **크레딧 차감**: 선택된 큐의 전송 필요 크레딧 차감
16. **패킷 추출**: 채널 타입에 따른 패킷 추출
    - **가변 Payload**: Header 정보로 Payload 위치 확인 후 패킷 재구성
    - **고정 Payload**: 단순 패킷 추출
17. **포맷 변환**: Internal 포맷 → 목적지 외부 프로토콜 포맷 변환 (추상화 역변환)
18. **인터페이스 추상화**: 외부 프로토콜별 타이밍 및 제어 처리 (Processing Latency Hiding)
19. **외부 송신**: 목적지 외부 Ingressor로 패킷 송신 완료

#### 크레딧 반환 경로 (Credit Return Path)
20. **전송 완료 감지**: Egress Port Manager가 패킷 송신 완료 확인
21. **크레딧 반환**: 소스 Ingress Port Manager로 크레딧 반환 신호 전송
22. **크레딧 복원**: Credit Management System이 크레딧 풀에 크레딧 복원
23. **크레딧 적립**: 해당 외부 Egressor에게 사용 가능한 크레딧 적립 통지

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
- [ ] 🎯 우선순위 기반 큐 스케줄링 알고리즘 설계 (Header Queue 우선순위 활용)
- [ ] 🎯 크레딧 차감 및 패킷 재구성 메커니즘 설계
- [ ] 🎯 Credit Management System 아키텍처 설계 (분산 크레딧 관리)
- [ ] 🎯 End-to-End 크레딧 순환 메커니즘 설계 (입력-출력 크레딧 플로우)
- [ ] 🎯 외부 Egressor 크레딧 할당 및 관리 알고리즘 설계
- [ ] 🎯 SRAM Circular Buffer 아키텍처 설계 (Ingress/Egress Port Manager용)
- [ ] 🎯 무백프레셔 Ingress 시스템 설계 (연속 처리 보장)
- [ ] 🎯 Bandwidth Mismatch 해결 메커니즘 설계 (버퍼 크기, 임계값)
- [ ] 🎯 Processing Latency Hiding 전략 설계 (파이프라이닝, 버퍼링)
- [ ] 🎯 Circular Buffer 제어 로직 설계 (포인터 관리, 플로우 제어)
- [ ] 🎯 외부 인터페이스 추상화 레이어 설계 (PCIe, Ethernet, CXL 등)
- [ ] 🎯 Ingress Port Manager 프로토콜별 추상화 모듈 설계
- [ ] 🎯 Egress Port Manager 프로토콜별 추상화 모듈 설계
- [ ] 🎯 Internal 패킷 포맷 정의 (통일된 내부 표준)
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
- [ ] 🔍 우선순위 기반 스케줄링 공정성 테스트 (Header Queue 우선순위 정보 활용)
- [ ] 🔍 크레딧 차감 및 패킷 재구성 동기화 검증
- [ ] 🔍 Credit Management System 정확성 검증 (크레딧 누수 방지)
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
