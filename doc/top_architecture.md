# Switch Internal P2P Link - Top Architecture

## 개요 (Overview)

Switch Internal P2P Link는 포트 간 고성능 패킷 전달을 위한 내부 스위치 아키텍처입니다. 
중앙 집중식 라우팅 구조를 통해 효율적인 패킷 스위칭을 제공합니다.

## 주요 컴포넌트 (Main Components)

### 1. Port Manager
- **역할**: 스위치 내부와 외부 간의 인터페이스 역할
- **인스턴스화**: 각 포트마다 개별 인스턴스 생성
- **구성**: Ingress Handler + Egress Handler
- **연결**:
  - **데이터 경로**: Queue Manager와 AXIS 프로토콜로 연결 (패킷 전달)
  - **제어 경로**: Port-level AXI Switch에 AXI Master/Slave로 연결
- **AXI 인터페이스**:
  - **AXI Master**: 상태 보고, 에러 알림 송신
  - **AXI Slave**: 제어 명령 수신 (포트 설정, 인터페이스 제어)

#### 1.1 Ingress Handler
- **역할**: 외부에서 스위치로 들어오는 패킷 처리
- **주요 기능**:
  - 외부 패킷 수신
  - 외부 포맷 → Internal 포맷 변환
  - AXIS Master로 Ingress Queue Manager에 패킷 전달
  - 입력 버퍼링 및 플로우 제어
- **인터페이스**: AXIS Master (→ Ingress Queue Manager)

#### 1.2 Egress Handler  
- **역할**: 스위치에서 외부로 나가는 패킷 처리
- **주요 기능**:
  - AXIS Slave로 Egress Queue Manager에서 패킷 수신
  - Internal 포맷 → 외부 포맷 변환
  - 외부로 패킷 송신
  - 출력 버퍼링 및 플로우 제어
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
- **연결**:
  - **데이터 경로**: Port Manager와 AXIS 프로토콜로 연결 (패킷 전달)
  - **제어 경로**: Port-level AXI Switch에 AXI Master/Slave로 연결
- **AXI 인터페이스**:
  - **AXI Master**: 큐 상태 보고, 임계값 알림 송신
  - **AXI Slave**: 제어 명령 수신 (큐 설정, 버퍼 제어, 스케줄링 정책)

##### 2.1.1 Ingress Queue Manager
- **역할**: 해당 포트로부터 들어오는 패킷 큐 관리
- **주요 기능**:
  - AXIS Slave로 Ingress Handler로부터 패킷 수신
  - 패킷 버퍼링 및 큐 관리
  - Routing & Switching Core로 패킷 전달
  - 백프레셔 및 플로우 제어
- **인터페이스**: 
  - AXIS Slave (← Ingress Handler)
  - Internal Bus (→ Routing & Switching Core)

##### 2.1.2 Egress Queue Manager  
- **역할**: 해당 포트로 나가는 패킷 큐 관리
- **주요 기능**:
  - Routing & Switching Core로부터 패킷 수신
  - 패킷 버퍼링 및 큐 관리
  - AXIS Master로 Egress Handler에 패킷 전달
  - 스케줄링 및 우선순위 처리
- **인터페이스**: 
  - Internal Bus (← Routing & Switching Core)
  - AXIS Master (→ Egress Handler)

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

### 4. CPU (Control Processing Unit)
- **역할**: 시스템 전체의 최상위 제어 및 관리
- **위치**: 시스템 외부 또는 별도 제어 모듈
- **연결**: System-level AXI Switch에 AXI Master/Slave로 연결
- **AXI 인터페이스**:
  - **AXI Master**: 제어 명령 송신 (레지스터 쓰기, 설정 변경)
  - **AXI Slave**: 상태 정보 수신 (모니터링 데이터, 에러 보고)
- **주요 기능**:
  - 글로벌 시스템 설정 및 정책 관리
  - 라우팅 테이블 초기화 및 업데이트
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
    ││Handler│Handler││ ││Handler│Handler││   ││Handler│Handler││
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

### 패킷 전송 플로우 (데이터 경로)
1. **수신**: Ingress Handler가 외부에서 패킷 수신
2. **변환**: Ingress Handler가 외부 포맷 → Internal 포맷 변환
3. **AXIS 전송**: Ingress Handler (AXIS Master) → Ingress Queue Manager (AXIS Slave)
4. **버퍼링**: Ingress Queue Manager가 패킷 버퍼링 및 큐 관리
5. **라우팅**: Routing & Switching Core가 목적지 분석
6. **스위칭**: Internal Bus를 통해 목적지 Egress Queue Manager로 패킷 전달
7. **큐잉**: Egress Queue Manager가 패킷 버퍼링 및 스케줄링
8. **AXIS 전송**: Egress Queue Manager (AXIS Master) → Egress Handler (AXIS Slave)
9. **변환**: Egress Handler가 Internal 포맷 → 외부 포맷 변환
10. **송신**: Egress Handler가 외부로 패킷 송신

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
- [ ] 🎯 Ingress Handler AXIS 인터페이스 상세 정의
- [ ] 🎯 Egress Handler AXIS 인터페이스 상세 정의
- [ ] 🎯 Ingress Queue Manager 큐 구조 및 AXIS 인터페이스 설계
- [ ] 🎯 Egress Queue Manager 큐 구조 및 AXIS 인터페이스 설계
- [ ] 🎯 System-level AXI Switch 아키텍처 및 중재 로직 설계
- [ ] 🎯 Port-level AXI Switch 아키텍처 및 로컬 중재 로직 설계
- [ ] 🎯 계층적 AXI Switch 간 통신 프로토콜 정의
- [ ] 🎯 CPU 인터페이스 및 시스템 제어 API 설계
- [ ] 🎯 Port Manager/Queue Manager AXI Master/Slave 인터페이스 정의
- [ ] 🎯 Routing & Switching Core 알고리즘 설계
- [ ] 🎯 Internal 패킷 포맷 정의 (외부↔내부 변환 기준)

### 검증 단계 (🔍)
- [ ] 🔍 외부 인터페이스 프로토콜 사양 (AXI Stream 등)
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
