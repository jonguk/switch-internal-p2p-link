# Switch Internal P2P Link - Architecture Design

## AXIS Protocol Signals

AXI4-Stream (AXIS) 프로토콜은 다음과 같은 시그널들로 구성됩니다:

### Required Signals (필수)
- **TVALID**: Master가 valid data/control information을 제공하고 있음을 나타냄
- **TREADY**: Slave가 data/control information을 받을 준비가 되었음을 나타냄
- **TDATA[n-1:0]**: Primary payload (데이터 버스)

### Handshake Protocol
- Data transfer occurs when **TVALID && TREADY == 1**
- Master must not wait for TREADY to assert TVALID
- Master must not deassert TVALID until handshake occurs
- Slave can assert/deassert TREADY at any time

## 프로젝트 아키텍처 개요

### 전체 구조
```
External Port 1 ←→ Port Manager 1 ←→ Port Router ←→ Port Manager 2 ←→ External Port 2
External Port 3 ←→ Port Manager 3 ←→ Port Router ←→ Port Manager 4 ←→ External Port 4
                                     ...
                    │                                    │
                    └── AXI Fabric (64-bit) ────────────┘
                              │
                        Management CPU
                       (Master/Slave Port)
```

### 모듈 구성
1. **Port Manager**: 외부 포트와 Port Router 간 인터페이스
   - AXIS 인터페이스: 데이터 플레인 통신
   - AXI Master/Slave: 설정 및 제어 인터페이스
2. **Port Router**: 중앙 라우팅 엔진, 모든 Port Manager들과 연결
   - 포트별 큐 매니져: AXI Master/Slave 인터페이스 포함
3. **AXI Fabric**: 64비트 AXI4 인터커넥트
   - 모든 Port Manager 및 큐 매니져 연결
   - Management CPU 전용 Master/Slave 포트 제공
4. **Management CPU**: 시스템 제어 및 관리
   - AXI Master: 모든 모듈 설정/제어 접근
   - AXI Slave: CPU 상태 및 인터럽트 처리
5. **스위치 포트 수**: 빌드 타임 파라미터로 결정

### 통신 채널

#### 데이터 플레인 (AXIS)
각 Port Manager와 Port Router 간:
- **단일 채널 (양방향)**: 모든 패킷을 통합 처리
  - AXIS Beat 크기: 64/128/256/512 bytes (빌드 타임 파라미터)
  - 목적지 포트의 큐 ID로 패킷 분류 및 처리

#### 제어 플레인 (AXI4)
AXI Fabric을 통한 메모리 매핑 통신:
- **AXI 버스 폭**: 64비트 (8바이트)
- **주소 공간**: 모듈별 고유 메모리 맵
- **액세스 타입**: 레지스터 읽기/쓰기, 상태 조회, 설정 변경
- **Management CPU**: 전체 시스템 제어 및 모니터링

### 빌드 타임 파라미터
- **스위치 포트 수**: 컴파일 시 결정되는 총 포트 개수
- **포트당 큐 수**: 각 포트가 가질 수 있는 최대 큐 개수
- **AXIS Beat 크기**: 64/128/256/512 바이트 중 선택
- **포트 ID 비트 수**: 스위치 포트 수에 따라 자동 계산
- **큐 ID 비트 수**: 포트당 큐 수에 따라 자동 계산
- **엔디안 설정**: Little Endian / Big Endian (컴파일 타임 선택)

### 파라미터별 비트 계산 공식
- **포트 ID 비트 수**: `ceil(log2(포트_수))`
- **큐 ID 비트 수**: `ceil(log2(큐_수))`  
- **헤더 크기**: `ceil((78 + 포트ID비트*2 + 큐ID비트) / 8)` 바이트
  - 고정 필드 78비트 = 데이터길이(13) + 타임스탬프(32) + 크레딧(16) + 트랜잭션ID(8) + Poisoned(1) + 체크섬(8)

### 다양한 파라미터 조합 예시
| 포트 수 | 큐 수 | 포트ID | 큐ID | 헤더 크기 | Reserved |
|---------|-------|---------|------|-----------|----------|
| 4       | 24    | 2비트   | 5비트 | 11바이트  | 1비트    |
| 8       | 16    | 3비트   | 4비트 | 11바이트  | 0비트    |
| 16      | 32    | 4비트   | 5비트 | 12바이트  | 5비트    |
| 32      | 64    | 5비트   | 6비트 | 12바이트  | 2비트    |

## **아키텍처 설계 완료** ✅

### **완성된 핵심 모듈들**
- ✅ 패킷 포맷 및 헤더 설계 (10바이트 헤더)
- ✅ 크레딧 시스템 및 백프레셔 메커니즘
- ✅ Port Manager 설계 (Ingress/Egress + AXI 인터페이스)
- ✅ Port Router 설계 (큐 매니져 + AXI 인터페이스)
- ✅ 패킷 Stitching Flow (6단계 프로세스)
- ✅ Entry ID 기반 메모리 관리
- ✅ AXIS Fabric 인터페이스 (데이터 플레인)
- ✅ AXI Fabric 인터페이스 (제어 플레인, 64비트)
- ✅ Management CPU 통합 설계

### **핵심 인터페이스**
- **AXIS Protocol**: TVALID, TREADY, TDATA, TLAST 신호 사용 (데이터 플레인)
- **AXI4 Protocol**: 64비트 메모리 매핑 인터페이스 (제어 플레인)
- **Port Manager ↔ Port Router**: AXIS P2P 연결 (데이터) + AXI 연결 (제어)
- **Port Manager ↔ 외부**: AXIS 인터페이스 (데이터만)
- **AXIS Fabric**: 포트간 메타데이터 전송 (10바이트)
- **AXI Fabric**: 64비트 제어/설정 버스, Management CPU 포함

## 라우팅 메커니즘

### 라우팅 정보 전달 방식
- **위치**: TDATA의 헤더 부분 (첫 번째 사이클)
- **목표**: 첫 번째 사이클에서 라우팅 셋업 완료
- **구조**: 목적지 포트 ID와 큐 ID를 포함한 라우팅 정보가 패킷의 첫 번째 TDATA에 포함



### AXIS 시그널 사용 계획
- **TVALID/TREADY**: 핸드셰이크 (필수)
- **TDATA**: 데이터 + 라우팅 헤더 (필수)  
- **TLAST**: 에러 검출 용도 (의도치 않은 에러 detect)
- **모든 제어 정보는 TDATA 헤더에 포함**: 패킷 경계, 라우팅 정보, 큐 ID 등

## 패킷 헤더 설계

AXIS 필수 신호만 사용하므로 모든 제어 정보를 TDATA 헤더에 포함합니다:

### 큐 기반 패킷 분류
- 각 포트는 내부적으로 **여러 개의 큐**를 가질 수 있음 (빌드 타임 파라미터)
- **큐 ID**로 어떤 큐에 패킷을 넣을지 결정 (빌드 타임 파라미터)
- **큐 ID 0**: Flow control 전용, 별도 저장 없이 바로 처리, 크레딧 차감 없음
- 큐별로 다른 처리 방식 또는 우선순위 적용 가능

### 헤더 필드 구성
1. **목적지 포트 ID** (라우팅 정보, 빌드 타임 파라미터 기반 비트 수)
2. **소스 포트 ID** (출발지 정보, 빌드 타임 파라미터 기반 비트 수)  
3. **큐 ID** (목적지 포트 내부 큐 선택, 빌드 타임 파라미터 기반 비트 수)
4. **데이터 전송 길이** (13비트, 최대 4096바이트 + 헤더/풋터)
5. **타임스탬프** (32비트, 리셋 시점부터의 시간)
6. **사용가능한 크레딧** (8비트, AXIS 1 beat 단위)
7. **트랜잭션 ID** (8비트, 요청-응답 매칭용)
8. **Poisoned Flag** (1비트, 데이터 에러 표시)
9. **Reserved** (바이트 정렬을 위한 예약 필드)
10. **헤더 체크섬** (헤더 무결성 검증)

### 헤더 크기 계산 예시 (포트 4개, 큐 24개)

**파라미터 설정:**
- 스위치 포트 수: 4개 → 포트 ID: 2비트 (0~3)
- 포트당 큐 수: 24개 → 큐 ID: 5비트 (0~23, 2^5=32까지 지원)

**필드별 비트 크기:**
```
1. 목적지 포트 ID:  2비트
2. 소스 포트 ID:    2비트  
3. 큐 ID:           5비트
4. 데이터 전송 길이: 13비트 (최대 8192바이트)
5. 타임스탬프:      32비트
6. 사용가능한 크레딧:   8비트
7. 트랜잭션 ID:     8비트
8. Poisoned Flag:   1비트
9. 헤더 체크섬:     8비트 (CRC-8 가정)
10. Reserved:       ?비트 (바이트 정렬용)
─────────────────────────────
합계 (Reserved 제외): 79비트
```

**바이트 정렬 계산:**
- 현재 합계: 79비트
- 바이트 정렬: 80비트 (10바이트)
- **Reserved 필드: 1비트**

**최종 헤더 크기: 10바이트 (80비트)**

**헤더 레이아웃 (바이트 단위):**
```
Byte 0: [목적지(2bit) | 소스(2bit) | 큐ID(4bit)]
Byte 1: [큐ID(1bit) | 데이터길이(7bit)]
Byte 2: [데이터길이(6bit) | Poisoned(1bit) | Reserved(1bit)]
Byte 3-6: 타임스탬프 (32bit)
Byte 7: 사용가능한 크레딧 (8bit)  
Byte 8: 트랜잭션 ID (8bit)
Byte 9: 헤더 체크섬 (8bit)
```



### 패킷 포맷 (헤더 10바이트 + 풋터 2바이트 기준)
```
첫 번째 TDATA: [헤더(10B) | 데이터 시작...]     + TLAST=0
중간 TDATA:    [데이터 계속...]                + TLAST=0  
마지막 TDATA:  [데이터 끝 | 풋터(2B)]          + TLAST=1
```

**패킷 크기 제약:**
- **최소 패킷**: 헤더(10B) + 풋터(2B) = 12바이트
- **최대 패킷**: 8192바이트 (13비트 필드 최대값)
- **최대 데이터**: 8192 - 12 = 8180바이트

### 풋터 구성
- **CRC**: 전체 패킷(헤더 + 데이터)에 대한 오류 검출 코드 (2바이트)
- **Reserved**: 바이트 정렬을 위한 예약 필드 (필요시)
- **위치**: 마지막 TDATA의 끝 부분

## 크레딧 시스템 (Credit System)

### 크레딧 기본 개념
- **크레딧 단위**: AXIS 채널의 1 beat (64/128/256/512 바이트)
- **크레딧 필드**: 16비트로 최대 65,535 크레딧 표현 가능
- **용도**: 각 포트 간 플로우 컨트롤을 통한 백프레셔 방지

### 크레딧 할당 및 관리
- **Port Router 중심 관리**: 실제 큐가 있는 Port Router에서 크레딧 관리
  - Port Router가 Port Manager에게 큐별 크레딧 정보 제공
  - Port Manager는 크레딧 정보를 외부로 forwarding
- **크레딧 소모**: 데이터 패킷 전송 시 패킷 크기만큼 크레딧 차감
  - 소모량 = ceil(패킷_크기 / beat_크기)
  - 큐 0: 크레딧 소모 없음 (모든 방향에서)
- **크레딧 반환**: 수신 측에서 패킷 처리 완료 후 크레딧 반환
  - Port Router 내부에서 크레딧 관리
  - 업데이트된 크레딧 정보를 Port Manager에게 알림



### 크레딧 시스템 동작
1. **Ingress 방향 (외부 → 스위치)**:
   - **크레딧 제공**: Port Router가 Port Manager를 통해 외부에 크레딧 정보 전달
   - **외부 제어**: 외부 egressor가 받은 크레딧으로 전송량 자체 결정
   - **패킷 전송**: 외부가 크레딧 범위 내에서 패킷 전송
   - **크레딧 소모**: Port Router에서 패킷 크기만큼 크레딧 차감

2. **Egress 방향 (스위치 → 외부)**:
   - **크레딧 수신**: 외부에서 Port Manager로 크레딧 정보 전달
   - **큐 Masking**: 외부 크레딧이 부족한 큐는 arbitration에서 제외
   - **패킷 전송**: 크레딧이 있는 큐에서만 외부로 전송
   - **크레딧 소모**: 전송 시 해당 크기만큼 외부 크레딧 차감

3. **양방향 크레딧 관리**:
   - **독립적 관리**: Ingress/Egress 크레딧은 별도로 관리
   - **실시간 업데이트**: 크레딧 상태 변화를 즉시 반영

### 큐 ID 0 특별 처리 (Flow Control & 내부 처리)
- **크레딧 차감 없음**: 큐 ID 0 패킷은 크레딧을 소모하지 않음
- **내부 처리**: 수신한 모듈(Port Router/Port Manager)에서 직접 처리
  - 외부나 다른 포트로 전달하지 않음
  - 처리 후 소모하거나 필요시 다른 방향으로 재전송 가능
- **용도**: 크레딧 반환, 제어 메시지, 시스템 관리
- **Egress에서의 처리**: 
  - Port Manager의 egress 큐에 저장됨 (다른 큐와 동일)
  - Arbitration 참여하지만 선택 시 외부 전달 대신 내부 처리

### 백프레셔 메커니즘 (연쇄적 시스템 보호)

#### **1단계: Free Pool 고갈 상황**
**발생 조건**:
- 모든 포트의 ingress 큐에 패킷이 몰려서 메모리 풀 거의 소진
- `free_pool_available` 값이 임계치 이하로 떨어짐
- 특정 큐의 `min_ingress_queue_length` 만큼 추가 예약이 불가능한 상태

**포트별 Free Pool 계산 방법**:
```cpp
// 포트별 독립 메모리 풀 관리
struct PortMemoryPool {
    uint16_t total_nodes;           // 포트별 총 노드 수 (예: 80개)
    uint16_t allocated_nodes;       // 현재 할당된 노드 수 (패킷 데이터 있음)
    uint16_t reserved_nodes;        // 현재 예약된 노드 수 (패킷 대기 중)
    uint16_t free_pool_available;   // 사용 가능한 노드 수
};

#### **2단계: Ingress 큐 매니져 크레딧 생성 불가**

**부분 할당 전략 (Starvation 방지)**:
```cpp
// 큐별 할당 우선순위 계산 구조체
struct CreditAllocationRequest {
    uint8_t  queue_id;
    uint8_t  target_credit;               // 필요한 크레딧 수
    uint32_t last_allocated_timestamp;    // 마지막 할당 시각
    uint8_t  consecutive_failures;        // 연속 할당 실패 횟수
};

#### **3단계: 외부 Egressor가 크레딧을 못 받음**

Port Router의 Ingress 큐 매니져가 크레딧을 할당하지 못한 큐들은 외부로 0 크레딧이 전송되어 외부 egressor가 자체적으로 백프레셔를 수행한다.

#### **5단계: 시스템 전체 백프레셔 (연쇄 보호 효과)**

시스템 전체적으로 메모리 풀 고갈 시 자동으로 부하를 조절하며, 포트별 독립적인 백프레셔 제어를 통해 연쇄 차단을 방지한다. Starvation 방지 메커니즘으로 공정성을 보장하고 점진적으로 시스템이 안정화된다.

- **예외**: 큐 ID 0 패킷은 크레딧과 무관하게 항상 전송 가능

### 크레딧 시스템

크레딧은 AXIS 1 beat 단위로 관리되며, 패킷 전송 시 ceil(패킷크기/beat크기) 만큼 소모된다. 큐 ID 0 패킷은 크레딧 소모 없이 처리된다.

### 패킷 처리 방식
- **첫 번째 사이클**: 헤더 정보로 라우팅 결정, 큐 ID 확인, 패킷 길이 확인, 32비트 타임스탬프 기록
- **중간 사이클**: 순수 데이터만 전송, 전송된 바이트 수 카운팅
- **마지막 사이클**: 데이터 마무리 + 풋터(CRC) 전송  
- **패킷 경계**: 헤더의 데이터 전송 길이 정보(헤더+데이터+풋터)로 예상 종료 지점 계산
- **크레딧 관리**: 8비트 사용가능한 크레딧 정보 처리 (AXIS 1 beat 단위)
- **큐 ID 0 특별 처리**: 크레딧 차감 없이 처리, egress에서는 내부 처리 후 소모
- **에러 검출**: 
  - TLAST=1이 예상 지점이 아닌 곳에서 발생 시 → 에러 검출
  - 예상 지점에서 TLAST=0인 경우 → 에러 검출
  - 헤더 체크섬 불일치 → 헤더 에러 검출
  - 풋터 CRC 불일치 → 패킷 데이터 에러 검출

## 모듈 상세 설계 ✅

### Port Manager 모듈 상세 설계

#### 인터페이스 구성
- **외부 인터페이스**: AXIS 프로토콜 (데이터 플레인만)
  - 외부 → Port Manager (수신)
  - Port Manager → 외부 (송신)
- **내부 데이터 인터페이스**: AXIS 프로토콜 (Port Router와 연결)
  - Port Manager → Port Router (송신)
  - Port Router → Port Manager (수신)
- **내부 제어 인터페이스**: AXI4 프로토콜 (64비트)
  - AXI Master: Port Router QM 설정 조회 및 제어
  - AXI Slave: Management CPU의 모니터링 및 제어 접근

#### 내부 구조 및 핵심 역할
- **Ingress**: Port Router에서 받은 크레딧을 단순히 외부로 포워딩
  - 외부에서 수신한 패킷을 Port Router로 바로 전달
  - Port Router 크레딧 정보를 헤더 필드로 외부에 전달
  - **실제 큐 없음**: 단순 pass-through 역할
- **Egress**: 외부에서 받은 크레딧을 다른 정보들과 함께 고려하여 외부로 전송순서 결정
  - Port Router로부터 큐별로 패킷을 미리 가져와서 저장 (prefetch)
  - 외부 크레딧 + 큐 상태 + 우선순위 등을 종합하여 arbitration
  - 크레딧이 부족한 큐는 전송에서 제외 (masking)
- **AXI 제어 인터페이스**:
  - **AXI Master**: Port Router QM의 큐 상태, 크레딧 정보 주기적 조회
  - **AXI Slave**: Management CPU가 통계, 에러 상태, 설정 조회
- **역할 분리**: 
  - **Ingress**: 단순 포워딩 (AXIS 데이터 + AXI 모니터링)
  - **Egress**: 복합적 판단 후 전송 제어 (AXIS 데이터 + AXI 제어)

#### 패킷 처리 플로우
1. **수신 방향 (Ingress)**:
   ```
   외부 Egressor ←(크레딧)← Port Manager ←(패킷)→ Port Router
   ```
   - **크레딧 포워딩**: Port Router 크레딧 정보를 헤더 필드로 외부에 전달
   - **외부 플로우 컨트롤**: 외부 egressor가 수신한 크레딧으로 전송량 자체 제어
   - **패킷 전달**: 외부에서 수신한 패킷을 Port Router로 바로 전달
   - **큐 분류**: Port Router에서 패킷의 큐 ID를 확인하여 해당 큐에 저장

2. **송신 방향 (Egress)**:
   ```
   외부 →(크레딧)→ Port Manager (Arbitration + 큐 masking) → 외부 AXIS
   ```
   - **외부 크레딧 수신**: 외부에서 전달받은 크레딧 정보 저장
   - **Prefetch**: Port Router로부터 큐별로 패킷을 미리 가져와서 저장
   - **크레딧 기반 Arbitration**: 외부 크레딧이 있는 큐만 선택 대상에 포함
   - **큐 Masking**: 크레딧 부족한 큐는 arbitration에서 제외
   - **지연시간 최적화**: 미리 prefetch해둔 데이터로 arbitration 후 즉시 전송

#### Ingress 상세 구조
- **Pass-through 인터페이스**: Port Manager에는 큐 없음
  - 외부 → Port Manager → Port Router 단순 전달
  - **패킷 검증**: 헤더 체크섬, 기본 포맷 검증만 수행
  - **에러 처리**: 헤더 에러 시 Critical Local Error 발생
- **크레딧 포워딩**: Port Router 크레딧을 외부로 전달
  - Port Router로부터 큐별 크레딧 정보 수신
  - **헤더 필드**: egress 패킷의 "사용가능한 크레딧" 필드로 외부에 전달
  - **외부 제어**: 외부 egressor가 크레딧을 보고 자체적으로 전송량 조절
- **실시간 크레딧 관리**: Port Router와 지속적인 크레딧 정보 교환

#### Egress 상세 구조
- **큐별 메모리 슬롯**: Circular Queue로 동작 (큐 0~N)
  - 각 큐마다 독립적인 circular queue
  - **깊이**: arbitration latency + Port Router→Port Manager 데이터 전송 latency를 숨길 크기
  - **Prefetch**: Port Router에서 미리 패킷들을 가져와 저장
- **헤더 정보**: Prefetch된 패킷의 헤더 정보로 arbitration 판단
- **큐 ID별 처리 방식**:
  - **큐 ID 0**: Port Manager 내부에서 직접 처리 (외부 전달 없음)
    - Flow control, 제어 메시지 등
    - 처리 후 소모하거나 필요시 다른 방향으로 재전송 가능
  - **큐 ID 1~N**: 외부로 전달
    - 일반 데이터 패킷
    - 외부 크레딧 고려하여 전송
- **외부 크레딧 기반 제어**:
  - **크레딧 수신**: 외부에서 전달받은 크레딧 정보 저장 및 관리
  - **큐 Masking**: 외부 크레딧이 부족한 큐는 arbitration에서 제외
  - **동적 제어**: 크레딧 상태에 따라 실시간으로 전송 가능 큐 변경
- **슬롯 가용성 통신**: 헤더의 **크레딧 필드**로 Port Router에게 빈 슬롯 알림
  - Port Router는 이 정보로 다음 패킷 전송 여부 결정

#### 초기화 및 크레딧 설정
- **초기 크레딧 설정**: 버퍼를 소유한 쪽이 **큐 ID 0 플로우 컨트롤 패킷**으로 상대방에게 초기 크레딧 전송
- **포트 번호**: 전원 인가 시부터 로컬 포트 번호 할당됨
- **글로벌 포트 매핑**: Port Router의 룩업 테이블로 글로벌 포트 ID → 로컬 포트 ID 변환

#### 에러 처리 메커니즘
- **Critical Local Error**: 헤더 에러, TLAST 에러, 큐 오버플로우
  - 큐 0 제외한 모든 큐의 크레딧을 0으로 설정 (새 패킷 차단)
  - **포트 0 (디폴트 포트)**를 통해 펌웨어에게 에러 보고
  - 펌웨어 지시까지 대기
- **데이터 에러 (CRC 불일치)**: 
  - **Poisoned Flag** 설정하여 egress로 전송
  - Ingress에 플로우 컨트롤로 에러 사실 전달
- **에러 패킷 생성**: 출처가 명확한 에러는 소스 포트로 에러 패킷 반환
- **디폴트 포트 (포트 0)**: 내부 CPU/펌웨어 연결, 관리 및 에러 처리 전용

#### 백프레셔 및 타임아웃
- **백프레셔 조건**: TREADY==0 또는 allocated_credit < consumed_credit (단위: beats)
- **타임아웃 모니터링**: 타임스탬프 기반으로 장시간 백프레셔 감지
- **펌웨어 알림**: 타임아웃 시 디폴트 포트로 알림 전송

#### 기타 설계 원칙
- **멀티캐스트/브로드캐스트**: 펌웨어에서 처리
- **클럭 도메인**: 각 Port Manager와 Port Router 분리
- **존재하지 않는 포트**: 글로벌 포트 매핑에 없으면 디폴트 포트로 전달



### Port Router 모듈 상세 설계

#### 핵심 아키텍처
- **포트별 링크드 리스트 큐 매니져**: 각 포트마다 독립적인 큐 매니져 모듈
- **포트별 엔트리 풀 분리**: 각 포트가 자신의 패킷 노드 풀을 소유 및 관리
- **AXIS Fabric 기반 통신**: 포트간 패킷 메타데이터 전송을 위한 내부 패브릭
- **분산 라우팅**: 각 포트의 큐 매니져가 독립적으로 라우팅 결정

#### 내부 구조
- **포트별 링크드 리스트 큐 매니져**:
  - **AXIS P2P 연결**: 해당 Port Manager와 AXIS 인터페이스로 직접 연결 (데이터 플레인)
  - **AXIS Fabric 연결**: 다른 포트의 큐 매니져들과 AXIS Fabric으로 연결 (메타데이터)
  - **AXI 제어 연결**: AXI Master/Slave로 제어 플레인 참여
  - **독립 동작**: 각 포트의 ingress/egress 큐를 독립적으로 관리
- **포트별 엔트리 풀**:
  - **소유권 분리**: 각 포트가 자신의 PacketNode 풀을 소유
  - **Ingress 할당**: 자신의 풀에서 노드 할당하여 패킷 저장
  - **Egress 혼재**: 다른 포트에서 전송된 노드들이 혼재 (소유권은 원래 포트)
  - **Prefetch 반환**: Port Manager로 prefetch된 노드는 원래 풀로 반환
- **AXIS Fabric**:
  - **메타데이터 전송**: 패킷 데이터가 아닌 PacketNode 메타데이터만 전송
  - **Stitching 지원**: 소스 포트→목적지 포트로 노드 메타데이터 이동
  - **효율적 라우팅**: 실제 패킷 데이터 복사 없이 포인터만 이동

### 포트별 큐 매니져 구조

#### Ingress Queue Manager (포트별)
- **역할**: Port Manager로부터 패킷 수신 → 목적지 Egress Queue로 라우팅
- **메모리 관리**: 자신의 포트 메모리 풀에서 PacketNode 할당
- **Entry ID 생성**: (포트ID << 11) | 노드인덱스로 글로벌 유일성 보장
- **포트 변환**: 글로벌 포트 ID → 로컬 포트 ID 룩업 테이블 사용
- **라우팅 결정**: 로컬/원격 목적지에 따라 AXIS Fabric 또는 직접 전달
- **에러 처리**: 메모리 풀 고갈, 잘못된 목적지 등 Critical Local Error 처리
- **AXI 인터페이스**:
  - **AXI Slave**: Port Manager 및 Management CPU의 크레딧 상태 조회 제공
  - **AXI Master**: 에러 발생 시 Management CPU에 인터럽트 전송

#### Egress Queue Manager (포트별)
- **역할**: AXIS Fabric으로부터 메타데이터 수신 → 큐 ID별 분류 및 관리
- **메타데이터 수신**: 다른 포트의 Ingress QM으로부터 10바이트 메타데이터 수신
- **큐 구조**: 큐 ID별 링크드 리스트로 메타데이터 저장 (FIFO 순서)
- **큐 분류**: 수신한 큐 ID 검증 → 유효하지 않으면 큐 0(디폴트)로 처리
- **Prefetch 지원**: Port Manager 요청 시 실제 PacketNode 데이터 제공
- **데이터 접근**: Entry ID로 원래 포트의 메모리 풀에서 실제 패킷 데이터 조회
- **메모리 반환**: 전송 완료 후 Entry ID 디코딩으로 소스 포트 풀에 자동 반환
- **큐 관리**: 큐별 패킷 수, 총 바이트 수, 타임스탬프 등 통계 정보 관리
- **에러 처리**: 큐 오버플로우, 잘못된 큐 ID 등 상황 대응
- **AXI 인터페이스**:
  - **AXI Slave**: Port Manager 및 Management CPU의 큐 상태, 통계 조회 제공
  - **AXI Master**: 백프레셔, 큐 오버플로우 시 Management CPU에 상태 보고

### 전체 패킷 Stitching Flow

#### 패킷 이동 전체 경로
```
외부 → Port A PM Ingress → Port A Ingress QM → AXIS Fabric → Port B Egress QM → Port B PM Egress → 외부
         (패킷 수신)        (메모리 할당)    (메타데이터)   (큐 분류)        (Prefetch)     (전송)
```

#### 상세 Stitching 과정

##### 1단계: 패킷 수신 및 메모리 할당 (Port A Ingress QM)
- **패킷 수신**: Port Manager로부터 AXIS 프로토콜로 패킷 수신
- **헤더 파싱**: 목적지 포트 ID, 큐 ID, 패킷 크기, 타임스탬프 추출
- **메모리 할당**: 자신의 포트 메모리 풀에서 PacketNode 할당
- **Entry ID 생성**: `(포트ID << 11) | 노드인덱스`로 글로벌 유일성 보장
- **패킷 저장**: 전체 패킷 데이터를 PacketNode에 저장

##### 2단계: 목적지 결정 및 라우팅 준비 (Port A Ingress QM)
- **포트 변환**: 글로벌 포트 ID → 로컬 포트 ID 룩업 테이블 조회
- **라우팅 결정**: 
  - 자기 자신(루프백): 직접 자신의 Egress QM으로 전달
  - 다른 포트: AXIS Fabric을 통해 메타데이터 전송
- **에러 처리**: 잘못된 목적지는 디폴트 포트(0)로 리다이렉트

##### 3단계: 메타데이터 전송 (AXIS Fabric)
- **메타데이터 생성**: 10바이트 MetadataPacket 구성
  ```cpp
  struct MetadataPacket {
      uint16_t entry_id;       // Entry ID (소스 포트 + 노드 인덱스)
      uint16_t packet_size;    // 패킷 크기
      uint8_t  queue_id;       // 목적지 큐 ID
      uint8_t  dest_port;      // 목적지 로컬 포트 ID
      uint32_t timestamp;      // 수신 타임스탬프
  };
  ```
- **AXIS 전송**: `axis_switch`를 통해 목적지 포트로 라우팅
- **프레임 완전성**: TLAST=1로 10바이트 메타데이터 완전 전송 보장

##### 4단계: 메타데이터 수신 및 큐 분류 (Port B Egress QM)
- **메타데이터 수신**: AXIS Fabric으로부터 10바이트 메타데이터 수신
- **큐 ID 검증**: 유효한 큐 ID인지 확인 (범위: 0 ~ NUM_QUEUES_PER_PORT-1)
- **큐 분류**: 검증된 큐 ID의 링크드 리스트에 메타데이터 삽입
- **FIFO 관리**: 큐별로 FIFO 순서로 메타데이터 저장
- **통계 업데이트**: 큐별 패킷 수, 총 바이트 수 등 통계 정보 갱신

##### 5단계: Prefetch 및 데이터 제공 (Port B Egress QM)
- **Prefetch 요청**: Port Manager로부터 특정 큐의 패킷 요청 수신
- **큐에서 제거**: 해당 큐의 링크드 리스트에서 첫 번째 메타데이터 제거
- **실제 데이터 조회**: Entry ID로 소스 포트 메모리 풀에서 PacketNode 조회
- **데이터 제공**: 실제 PacketNode를 Port Manager에게 전달

##### 6단계: 외부 전송 및 메모리 반환 (Port B PM Egress)
- **외부 전송**: PacketNode 데이터를 외부로 AXIS 전송
- **Entry ID 디코딩**: 전송 완료 후 Entry ID에서 소스 포트 추출
- **자동 메모리 반환**: 소스 포트(Port A)의 메모리 풀에 PacketNode 반환
- **리소스 해제**: 크레딧 반환 및 관련 리소스 정리

#### Stitching의 핵심 특징

##### Zero-Copy 메커니즘
- **패킷 데이터 복사 없음**: 실제 패킷은 소스 포트 메모리에 그대로 유지
- **메타데이터만 이동**: 10바이트 메타데이터만 AXIS Fabric으로 전송
- **포인터 기반 접근**: Entry ID로 원본 데이터 위치 추적

##### 분산 메모리 관리
- **포트별 독립 풀**: 각 포트가 자신의 PacketNode 풀 소유
- **크로스 포트 접근**: Entry ID로 다른 포트 메모리에 안전하게 접근
- **자동 반환**: Entry ID 디코딩으로 원래 풀에 자동 반환

##### 확장성 및 성능
- **병렬 처리**: 모든 포트가 독립적으로 동시 처리 가능
- **AXIS Switch 활용**: 검증된 오픈소스로 안정적인 메타데이터 라우팅
- **에러 격리**: 포트별 독립성으로 에러 전파 방지

#### Ingress Queue의 핵심 특징

##### 메모리 관리
- **로컬 풀 사용**: 자신의 포트 메모리 풀에서만 PacketNode 할당
- **Entry ID 생성**: (포트ID << 11) | 노드인덱스로 글로벌 유일성 보장
- **크레딧 예약**: 할당된 노드는 크레딧 시스템에 의해 미리 예약됨

##### 에러 처리
- **메모리 풀 고갈**: Critical Local Error 발생
- **잘못된 목적지**: 디폴트 포트(0)로 리다이렉트  
- **헤더 에러**: 체크섬 검증 실패 시 Critical Local Error
- **TLAST 에러**: 예상과 다른 위치에서 TLAST 발생 시 에러

##### 성능 최적화
- **파이프라인 처리**: 헤더 파싱과 동시에 메모리 할당 준비
- **병렬 룩업**: 목적지 조회와 동시에 패킷 데이터 저장
- **백프레셔 지원**: 메모리 부족 시 Port Manager에 TREADY=0 신호

#### 분산 큐 관리 방식
- **포트별 독립성**: 각 포트의 큐 매니져가 자율적으로 동작  
- **글로벌 Entry ID**: 스위치 전체에서 유일한 노드 식별자
- **통합 정보 관리**: Entry ID 하나로 소스 포트와 노드 인덱스 모두 식별
- **효율적 이동**: 패킷 데이터 복사 없이 메타데이터만 이동
- **간편한 디버깅**: Entry ID로 노드 생성부터 해제까지 추적 가능
- **메모리 최적화**: 중복 필드 제거로 최소 메모리 사용
- **크레딧 관리**: 각 포트의 큐 매니져가 독립적으로 크레딧 계산

#### 글로벌→로컬 포트 룩업 테이블
- **테이블 크기**: 고정 크기 메모리
  - **엔트리 수**: 2^12 = 4096개 (12비트 글로벌 포트 ID 지원)
  - **엔트리 크기**: 로컬 포트 ID 비트 수 (빌드 타임 파라미터)
- **메모리 계산**: 
  - 총 메모리 = 4096 × 로컬포트ID비트 수
  - 예시: 32포트 스위치 → 4096 × 5비트 = 20,480비트 = 2.5KB
- **검색 방식**: 직접 배열 인덱싱 (O(1) 접근)
  - 글로벌 포트 ID를 배열 인덱스로 사용
  - lookup_table[global_port_id] = local_port_id

#### 룩업 테이블 관리
- **초기화**: 모든 엔트리를 디폴트 포트(포트 0)로 설정
- **매핑 업데이트**: 펌웨어에서 글로벌↔로컬 포트 매핑 설정
- **존재하지 않는 포트**: 매핑되지 않은 글로벌 포트는 디폴트 포트로 라우팅
- **실시간 변경**: 런타임에 매핑 테이블 업데이트 가능

#### 메모리 크기 예시 (빌드 파라미터별)
| 로컬 포트 수 | 로컬 포트 ID | 엔트리 크기 | 총 메모리 크기 |
|-------------|-------------|------------|-------------|
| 4개         | 2비트       | 2비트      | 1KB         |
| 8개         | 3비트       | 3비트      | 1.5KB       |
| 16개        | 4비트       | 4비트      | 2KB         |
| 32개        | 5비트       | 5비트      | 2.5KB       |

#### 링크드 리스트 구조 및 메모리 관리

##### 노드 구조 (양방향 링크드 리스트)
```systemc
struct PacketNode {
    // 링크 포인터
    PacketNode* next;
    PacketNode* prev;
    
    // 글로벌 엔트리 식별자
    uint16_t entry_id;           // 글로벌 엔트리 ID (상위 비트: 소스 포트 ID, 하위 비트: 노드 인덱스)
    
    // 패킷 메타데이터
    uint16_t packet_size;        // 패킷 크기 (바이트)
    uint8_t  queue_id;           // 큐 ID
    uint8_t  dest_port;          // 목적지 로컬 포트 ID
    uint32_t timestamp;          // 수신 타임스탬프
    
    // 패킷 데이터 포인터
    uint8_t* packet_data;        // 실제 패킷 데이터 주소
};
```

##### 글로벌 Entry ID 비트 할당
- **16비트 Entry ID 구조**:
  - **상위 5비트 (15:11)**: Source Port ID (최대 32포트 지원)
  - **하위 11비트 (10:0)**: 포트 내 노드 인덱스 (최대 2048개/포트)
- **Source Port 추출**: `source_port = (entry_id >> 11) & 0x1F`
- **노드 인덱스 추출**: `node_index = entry_id & 0x7FF`
- **Entry ID 생성**: `entry_id = (source_port_id << 11) | node_index`

##### 포트별 분리된 메모리 풀 관리
- **포트별 독립 노드 풀**: 각 포트가 자신만의 PacketNode 풀을 소유
- **풀 크기 계산** (포트당):
  
  **Ingress 노드 수** (해당 포트의 크레딧 예약):
  - 계산: (큐/포트) × (최소 패킷 할당/큐)
  - 자신의 포트로 들어오는 외부 트래픽을 위한 보장
  - 예시: 24큐, 최소 2패킷/큐 → 24 × 2 = 48개/포트
  
  **Egress 여유분** (다른 포트에서 받을 수 있는 노드):
  - 다른 포트들에서 전송된 노드들을 위한 여유 공간
  - 실제 노드는 원래 포트 소유이지만 일시적으로 보관
  - 예시: 포트당 추가 32개 여유분
  
- **총 포트별 풀 크기**: Ingress 예약 + Egress 여유분 + 버퍼링 여유분
- **소유권 추적**: `entry_id` 상위 비트로 소스 포트 자동 식별 (source_port 필드 불필요)
- **Free List**: 각 포트별로 사용 가능한 노드들의 링크드 리스트
- **할당/해제**: O(1) 시간 복잡도, Entry ID 기반 소유권 관리
##### 큐별 포인터 관리 구조체
```systemc
struct QueueDescriptor {
    PacketNode* head;            // 큐의 첫 번째 노드
    PacketNode* tail;            // 큐의 마지막 노드  
    uint16_t    count;           // 큐 내 패킷 수
    uint16_t    total_bytes;     // 큐 내 총 바이트 수
    uint8_t     available_credit; // 남은 크레딧
};
```

##### 메모리 레이아웃 최적화
- **노드 풀**: 연속된 메모리 블록에 모든 노드 배치
- **패킷 데이터**: 별도 메모리 풀에서 가변 크기 할당
- **캐시 친화적**: 자주 접근하는 head/tail 포인터를 가까운 위치에 배치

##### 포트별 메모리 크기 계산 예시 (24큐/포트, 최소 2패킷/큐, 여유분 32개/포트)
| 스위치 구성 | 포트별 Ingress | 포트별 Egress 여유 | 포트별 기본 | 포트별 여유분 포함 | 포트별 메모리 | 총 메모리 |
|-------------|--------------|------------------|-----------|-----------------|-------------|---------|
| 4포트, 24큐 | 48개 | 32개 | 80개 | 160개 (2배) | 4.4KB | 17.6KB |
| 8포트, 24큐 | 48개 | 32개 | 80개 | 160개 (2배) | 4.4KB | 35.2KB |
| 16포트, 24큐 | 48개 | 32개 | 80개 | 160개 (2배) | 4.4KB | 70.4KB |
| 32포트, 24큐 | 48개 | 32개 | 80개 | 160개 (2배) | 4.4KB | 140.8KB |

**계산 상세** (포트별):
- **Ingress 예약**: 24큐 × 2패킷 = 48개/포트
- **Egress 여유분**: 32개/포트 (다른 포트 노드 임시 보관)
- **PacketNode 크기**: 28바이트 (entry_id로 source_port 통합)
- **포트별 풀**: 독립적으로 관리, Entry ID로 소유권 추적
- **총 메모리**: 포트 수 × 포트별 메모리
- **추가 메모리**: 패킷 데이터 풀 512KB~2MB

**Entry ID 기반 이점**:
- **글로벌 추적**: 스위치 전체에서 노드 식별 가능
- **통합 식별**: 소스 포트와 노드 인덱스를 하나의 필드로 관리
- **메모리 효율**: 별도 source_port 필드 불필요 (1바이트 절약)
- **디버깅 지원**: Entry ID로 노드 추적 및 디버깅 용이

### AXIS Switch 기반 포트간 통신 설계

#### 선정된 오픈소스: axis_switch (alexforencich/verilog-axis)
- **프로젝트**: https://github.com/alexforencich/verilog-axis  
- **라이센스**: MIT (상용 사용 가능)
- **검증 상태**: 817 stars, 248 forks로 널리 검증됨
- **테스트**: 완전한 cocotb 테스트벤치 포함

#### 모듈 사양 및 특징
- **기능**: Frame-aware AXI stream switch
- **구조**: Parametrizable 데이터 폭 및 포트 수
- **처리 방식**: 패킷(Frame) 단위 완전 전송 보장
- **성능**: 가벼운 구조로 고성능 달성
- **확장성**: `axis_switch_wrap.py`로 원하는 포트 수 자동 생성

#### 핵심 AXI Stream 신호 (SystemC 인터페이스)
```cpp
// AXI Stream 인터페이스 구조체 (SystemC)
struct AxisInterface {
    uint80_t  tdata;    // 데이터 (80비트 = 10바이트)
    uint10_t  tkeep;    // 바이트 유효 신호 (10비트)
    bool      tvalid;   // 데이터 유효
    bool      tready;   // 준비 완료
    bool      tlast;    // 프레임 끝
    uint5_t   tdest;    // 목적지 포트 (5비트, 32포트 지원)
};

// 포트별 AXIS 인터페이스 배열
AxisInterface s_axis[PORTS];  // 입력 인터페이스
AxisInterface m_axis[PORTS];  // 출력 인터페이스
```

#### 주요 파라미터 설정
| 파라미터 | 값 | 설명 |
|----------|-----|------|
| `PORTS` | 포트 수 | Port Router의 포트 수와 동일 |
| `DATA_WIDTH` | 80 | 메타데이터 크기 (10바이트 × 8비트) |
| `KEEP_WIDTH` | 10 | 바이트 유효 신호 폭 |
| `DEST_WIDTH` | 5 | 목적지 포트 ID 폭 (32포트 지원) |
| `LAST_ENABLE` | 1 | 프레임 끝 신호 활성화 |
| `DEST_ENABLE` | 1 | 목적지 기반 라우팅 활성화 |

#### 우리 프로젝트 적용 설계

##### 메타데이터 패킷 구조 (SystemC)
```cpp
// 10바이트 메타데이터 구조체 (80비트)
struct MetadataPacket {
    uint16_t entry_id;     // Entry ID (소스 포트 + 노드 인덱스)
    uint16_t packet_size;  // 패킷 크기
    uint8_t  queue_id;     // 큐 ID
    uint8_t  dest_port;    // 목적지 로컬 포트 ID
    uint32_t timestamp;    // 타임스탬프
};
```

##### 포트간 연결 구조
```
Port 0 Queue Manager ←→ axis_switch ←→ Port 1 Queue Manager
Port 1 Queue Manager ←→     │      ←→ Port 2 Queue Manager  
Port 2 Queue Manager ←→     │      ←→ Port 3 Queue Manager
           ...               │              ...
Port N Queue Manager ←→     └      ←→ Port 0 Queue Manager
```

##### 라우팅 방식
- **목적지 기반**: `s_axis_tdest`로 목적지 포트 지정
- **프레임 단위**: `s_axis_tlast`로 메타데이터 패킷 완전성 보장
- **백프레셔**: `s_axis_tready`로 수신 측 흐름 제어
- **병렬 처리**: 모든 포트가 동시에 송신/수신 가능

#### 성능 및 장점
- **제로 개발 비용**: 검증된 오픈소스 직접 활용
- **높은 신뢰성**: 수백 개 프로젝트에서 검증된 모듈
- **최적화된 성능**: Frame-aware 처리로 메타데이터 전송에 최적
- **확장성**: 포트 수 증가 시 파라미터 변경만으로 대응
- **유지보수**: 잘 문서화된 코드와 테스트벤치

#### 통합 고려사항
- **클럭 도메인**: Port Router와 동일한 클럭 사용
- **리셋 처리**: 전역 리셋 신호와 연동  
- **에러 처리**: `tuser` 신호로 에러 상태 전파 가능
- **디버깅**: AXI Stream 표준 신호로 쉬운 디버깅

## AXI Fabric 기반 제어 플레인 설계

### AXI4 인터커넥트 아키텍처

#### 전체 연결 구조
```
┌──────────────────────────────────────────────────────────────────┐
│                      AXI Fabric (64-bit)                        │
├──────────────┬───────────────┬───────────────┬───────────────────┤
│              │               │               │                   │
│ Management   │  Port Manager │ Port Manager  │     Port Router   │
│     CPU      │      0        │      1        │   Queue Managers  │
│              │               │               │                   │
│ ┌──────────┐ │ ┌───────────┐ │ ┌───────────┐ │ ┌───────────────┐ │
│ │AXI Master│◄┼►│AXI Master │ │ │AXI Master │ │ │   Port 0 QM   │ │
│ │AXI Slave │ │ │AXI Slave  │ │ │AXI Slave  │ │ │  AXI Master   │ │
│ └──────────┘ │ └───────────┘ │ └───────────┘ │ │  AXI Slave    │ │
│              │               │               │ └───────────────┘ │
│              │               │               │ ┌───────────────┐ │
│              │               │               │ │   Port 1 QM   │ │
│              │               │               │ │  AXI Master   │ │
│              │               │               │ │  AXI Slave    │ │
│              │               │               │ └───────────────┘ │
│              │               │               │       ...         │
└──────────────┴───────────────┴───────────────┴───────────────────┘
```

#### AXI 포트 구성 및 주소 매핑

##### Master 포트 구성
| Master ID | 모듈 | 역할 | 액세스 대상 |
|-----------|------|------|-------------|
| 0 | Management CPU | 시스템 제어 | 모든 Slave 모듈 |
| 1~N | Port Manager | 설정 조회 | 자신의 Port Router QM |
| N+1~2N | Port Router QM | 상태 보고 | Management CPU, 다른 QM |

##### Slave 포트 구성 및 주소 맵
| Slave ID | 모듈 | 기본 주소 | 크기 | 주요 레지스터 |
|----------|------|-----------|------|---------------|
| 0 | Management CPU | 0x0000_0000 | 4KB | 인터럽트, CPU 상태 |
| 1~N | Port Manager | 0x0001_0000 + (포트*0x1000) | 4KB | 크레딧, 통계, 제어 |
| N+1~2N | Port Router QM | 0x0010_0000 + (포트*0x1000) | 4KB | 큐 상태, 메모리 풀, 설정 |

#### AXI4 신호 사양

##### AXI4 인터페이스 구조체 (SystemC)
```cpp
// AXI4 Write Address Channel
struct AXI4_AW {
    uint32_t awaddr;     // 주소
    uint8_t  awlen;      // Burst length - 1
    uint8_t  awsize;     // Burst size (2^n bytes)
    uint2_t  awburst;    // Burst type
    uint4_t  awid;       // Master ID
    bool     awvalid;    // Address valid
    bool     awready;    // Address ready
};

// AXI4 Write Data Channel  
struct AXI4_W {
    uint64_t wdata;      // Write data (64-bit)
    uint8_t  wstrb;      // Write strobes
    bool     wlast;      // Last transfer
    bool     wvalid;     // Data valid
    bool     wready;     // Data ready
};

// AXI4 Write Response Channel
struct AXI4_B {
    uint4_t  bid;        // Master ID
    uint2_t  bresp;      // Write response
    bool     bvalid;     // Response valid
    bool     bready;     // Response ready
};

// AXI4 Read Address Channel
struct AXI4_AR {
    uint32_t araddr;     // 주소
    uint8_t  arlen;      // Burst length - 1
    uint8_t  arsize;     // Burst size
    uint2_t  arburst;    // Burst type
    uint4_t  arid;       // Master ID
    bool     arvalid;    // Address valid
    bool     arready;    // Address ready
};

// AXI4 Read Data Channel
struct AXI4_R {
    uint64_t rdata;      // Read data (64-bit)
    uint2_t  rresp;      // Read response
    bool     rlast;      // Last transfer
    uint4_t  rid;        // Master ID
    bool     rvalid;     // Data valid
    bool     rready;     // Data ready
};
```

### 주요 AXI 액세스 패턴

#### Management CPU의 모니터링 액세스
- **포트별 통계 수집**: 순차적으로 모든 Port Manager/QM의 통계 레지스터 읽기
- **에러 상태 점검**: 각 모듈의 에러 레지스터 조회
- **크레딧 상태 모니터링**: 실시간 크레딧 레벨 추적
- **성능 카운터**: 처리량, 지연시간, 드롭율 등 수집

#### Port Manager의 제어 액세스  
- **QM 설정 조회**: 자신의 Port Router QM 설정 확인
- **크레딧 상태 확인**: Egress 큐별 크레딧 현황 조회
- **에러 보고**: Critical Local Error 발생 시 Management CPU에 인터럽트

#### Port Router QM의 상태 보고
- **큐 상태 업데이트**: 큐별 패킷 수, 바이트 수 실시간 갱신
- **메모리 풀 현황**: Free pool 상태 주기적 보고
- **백프레셔 상태**: 크레딧 고갈 상황 즉시 알림

### AXI Fabric 성능 특성

#### 대역폭 분석
- **64비트 버스**: 8바이트/사이클 최대 전송량
- **제어 트래픽**: 주로 32비트 레지스터 액세스 (4바이트)
- **버스트 액세스**: 통계 수집 시 연속 레지스터 읽기 최적화
- **동시 액세스**: 다중 Master의 병렬 액세스 지원

#### 지연시간 요구사항
- **실시간 제어**: 에러 보고, 인터럽트 처리 (< 10 사이클)
- **일반 모니터링**: 통계 수집, 상태 조회 (< 100 사이클)  
- **설정 변경**: 초기화, 재구성 (지연시간 무관)

### AXI Fabric 통합 고려사항
- **클럭 도메인**: 전체 시스템 단일 클럭 또는 클럭 도메인 크로싱 지원
- **리셋 처리**: AXI 표준 리셋 시퀀스 준수
- **에러 처리**: AXI RESP 신호로 에러 상태 전파
- **디버깅**: AXI 트랜잭션 모니터링 및 디버그 인터페이스

### 포트별 링크드 리스트 큐 매니져 구조 (Top-Down 설계)

#### 전체 아키텍처 블록 다이어그램
```
┌─────────────────────────────────────────────────────────────────┐
│                   Port Queue Manager (Per Port)                 │
├─────────────────────┬───────────────────┬───────────────────────┤
│   External I/F      │   Internal Core   │    Fabric I/F         │
│                     │                   │                       │
│ ┌─────────────────┐ │ ┌───────────────┐ │ ┌───────────────────┐ │
│ │                 │ │ │               │ │ │                   │ │
│ │  Port Manager   │ │ │   Ingress     │ │ │   AXIS Switch     │ │
│ │   P2P Interface │◄┼►│Queue Manager  │◄┼►│   Interface       │ │
│ │                 │ │ │               │ │ │  (Metadata I/O)   │ │
│ │  - AXIS Ingress │ │ │ - 큐 할당     │ │ │                   │ │
│ │  - AXIS Egress  │ │ │ - 크레딧 예약 │ │ │ - 10바이트 메타   │ │
│ │  - AXI M/S      │ │ │ - Entry Pool  │ │ │ - 목적지 라우팅   │ │
│ │  - 제어 인터페이스│ │ │ - AXI Slave   │ │ │                   │ │
│ └─────────────────┘ │ └───────────────┘ │ └───────────────────┘ │
│                     │                   │                       │
│                     │ ┌───────────────┐ │                       │
│                     │ │               │ │                       │
│                     │ │   Egress      │ │                       │
│                     │ │Queue Manager  │ │                       │
│                     │ │               │ │                       │
│                     │ │ - 큐 ID 분류  │ │                       │
│                     │ │ - Prefetch    │ │                       │
│                     │ │ - Masking     │ │                       │
│                     │ │ - AXI Master  │ │                       │
│                     │ └───────┬───────┘ │                       │
│                     │         │         │                       │
├─────────────────────┼─────────┼─────────┼───────────────────────┤
│   Shared Resources  │         │         │    AXI Fabric I/F     │
│                     │         ▼         │                       │
│ ┌─────────────────┐ │ ┌───────────────┐ │ ┌───────────────────┐ │
│ │  Global Lookup  │ │ │   Entry Pool  │ │ │  AXI Fabric       │ │
│ │     Table       │◄┼►│   Manager     │ │ │  Connection       │ │
│ │                 │ │ │               │ │ │                   │ │
│ │ - 글로벌→로컬   │ │ │ - 포트별 풀   │ │ │ - 64비트 버스     │ │
│ │ - 4096 엔트리   │ │ │ - Entry ID    │ │ │ - Management CPU  │ │
│ │ - O(1) 룩업     │ │ │ - 소유권 추적 │ │ │ - 제어/모니터링   │ │
│ └─────────────────┘ │ └───────────────┘ │ └───────────────────┘ │
└─────────────────────┴───────────────────┴───────────────────────┘
```

#### 주요 컴포넌트 역할 정의

##### 1. **Port Manager P2P Interface**
- **역할**: 해당 포트의 Port Manager와 직접 통신
- **기능**: 
  - 외부 패킷 수신 (Ingress AXIS)  
  - 내부 패킷 송신 (Egress AXIS)
  - 크레딧 정보 교환
- **특징**: 포트별 독립 인터페이스

##### 2. **Ingress Queue Manager** 
- **역할**: 외부에서 들어오는 패킷의 큐 관리
- **기능**:
  - 패킷 수신 → Entry Pool에서 노드 할당
  - 큐별 크레딧 예약 관리  
  - 글로벌 룩업 테이블 조회
  - AXIS Switch로 메타데이터 전송
- **특징**: Pass-through + 크레딧 포워딩 역할

##### 3. **Egress Queue Manager**
- **역할**: 다른 포트에서 오는 패킷의 큐 관리  
- **기능**:
  - AXIS Switch에서 메타데이터 수신
  - 큐 ID별 패킷 분류 및 저장
  - Port Manager로 prefetch 수행
  - 외부 크레딧 기반 큐 masking
- **특징**: 복잡한 큐 관리 + arbitration

##### 4. **AXIS Switch Interface**
- **역할**: 포트간 메타데이터 교환 인터페이스
- **기능**:
  - 10바이트 메타데이터 송수신
  - 목적지 포트 기반 라우팅
  - 프레임 단위 완전성 보장
- **특징**: alexforencich/verilog-axis 활용

##### 5. **Global Lookup Table** (공유 자원)
- **역할**: 글로벌 포트 ID → 로컬 포트 ID 변환
- **기능**: 
  - 4096개 엔트리 (12비트 글로벌 ID)
  - O(1) 직접 인덱싱 접근
  - 모든 포트에서 공유 접근
- **특징**: 읽기 전용, 펌웨어에서 설정

##### 6. **Entry Pool Manager**  
- **역할**: 포트별 PacketNode 메모리 풀 관리
- **기능**:
  - 포트별 독립 풀 (4.4KB/포트)
  - Entry ID 기반 소유권 추적
  - 노드 할당/해제 (O(1))
- **특징**: 포트별 분리, 소유권 자동 관리

#### 데이터 플로우 개요
```
1. 외부 패킷 수신:
   Port Manager → Ingress Queue Manager → Entry Pool 할당 → Lookup Table 조회
   → AXIS Switch → 목적지 Egress Queue Manager → 큐 ID별 분류

2. 내부 패킷 처리:  
   Egress Queue Manager → prefetch → Port Manager → 외부 전송 → Entry Pool 반환
```





### **TODO**: 추후 작업

#### **성능 최적화**
- [ ] Prefetch 버퍼 크기 최적화 (arbitration + transfer latency)
- [ ] 파이프라인 설계 (사이클 레벨)
- [ ] 동시 처리 성능 분석

#### **에러 처리 시스템**
- [ ] Critical Local Error 처리 완성
- [ ] Poisoned Flag 메커니즘 구현
- [ ] 타임아웃 및 백프레셔 감지

#### **시스템 통합**
- [ ] 초기화 시퀀스 정의
- [ ] 설정 인터페이스 (레지스터 맵)
- [ ] 디버깅 및 진단 기능
- [ ] Entry ID 기반 디버깅 시스템
- [ ] 성능 카운터 및 상태 모니터링
- [ ] AXI Fabric 구성 및 주소 맵 완성
- [ ] Management CPU 인터페이스 상세 설계
- [ ] AXI 인터럽트 시스템 구현

#### **추가 기능**
- [ ] 파라미터 조합 제약사항 (성능, 리소스 고려)
- [ ] 권장 파라미터 조합 및 가이드라인
- [ ] Egress Circular queue 깊이 최적화 (latency 기반)
- [ ] Flush/Reset 플로우 컨트롤 패킷 정의
- [ ] 펌웨어 업데이트 인터페이스
- [ ] 룩업 테이블 업데이트 인터페이스 (펌웨어 연동)
- [ ] 멀티캐스트/브로드캐스트 지원 (펌웨어 연동)
- [ ] 클럭 도메인 크로싱 처리
- [ ] AXI4 프로토콜 준수성 검증
- [ ] AXI 성능 최적화 (버스트 액세스, 아웃스탠딩 트랜잭션)
- [ ] Management CPU 소프트웨어 API 설계
- [ ] AXI 보안 고려사항 (액세스 권한, 보호)

#### **HLS 관련**
- [ ] SystemC 모델링 가이드라인
- [ ] HLS 합성 제약사항

---
*이 문서는 아키텍처 설계 과정에서 지속적으로 업데이트됩니다.*
