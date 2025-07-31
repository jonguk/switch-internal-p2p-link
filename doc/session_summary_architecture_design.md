# Session Summary: Architecture Design Phase

**세션 기간**: 2024년 (Architecture Design 세션)  
**주요 목표**: Switch Internal P2P Link 프로젝트의 전체 아키텍처 설계 완료  
**세션 상태**: ✅ **완료** (모듈별 상세 설계로 이관)

## 📋 **세션에서 완성된 주요 결과물**

### 1. **프로젝트 규칙 정의** (`project_rule.md`)
- **개발 프로세스**: data structure → operation flow 상의 → 모듈별 코딩
- **파일 구조**: 기능별 디렉토리, 계층적 common/ 구조
- **테스트 전략**: 3그룹 분류 (basic/functional/error)
- **문서 관리**: 자동 업데이트, TODO placeholder 규칙
- **하드웨어 모델링**: SystemC for HLS, 호환성 우선
- **우선순위**: 코드 > 문서 (불일치 시)

### 2. **전체 아키텍처 설계** (`doc/architecture_design.md`)
- **패킷 포맷**: 10바이트 헤더 + 2바이트 풋터 완성
- **크레딧 시스템**: 양방향 크레딧 기반 플로우 컨트롤
- **Port Manager**: Ingress(pass-through) + Egress(prefetch/arbitration)
- **Port Router**: 분산 큐 매니저, Entry ID 기반 메모리 관리
- **패킷 Stitching**: 6단계 Zero-Copy 메커니즘
- **AXIS Fabric**: `alexforencich/verilog-axis` 통합

### 3. **제3자 라이브러리 통합** (`third_party/verilog-axis/`)
- **Git Subtree**: `alexforencich/verilog-axis` 추가
- **AXIS Switch**: 포트간 메타데이터 전송용

## 🏗️ **완성된 핵심 아키텍처 컴포넌트**

### **패킷 포맷 (최종 확정)**
```
헤더 (10바이트): 목적지포트ID + 소스포트ID + 큐ID + 데이터길이 + 
                타임스탬프 + 사용가능한크레딧 + 트랜잭션ID + 
                Poisoned플래그 + Reserved + 헤더체크섬
풋터 (2바이트): CRC
```

### **크레딧 시스템 (양방향)**
- **Ingress**: Port Router 크레딧 → 헤더 필드 → 외부 전달
- **Egress**: 외부 크레딧 → 큐 masking → arbitration 제어
- **예약 기반**: Free Pool 예약으로 사전 메모리 확보
- **백프레셔**: 5단계 연쇄적 백프레셔 메커니즘

### **모듈 구조**
```
외부 ↔ Port Manager (Ingress/Egress) ↔ Port Router (분산 큐 매니저)
                                        ↕
                                   AXIS Fabric
                                 (메타데이터 전송)
```

### **Entry ID 시스템 (16비트)**
- **구조**: `[포트ID:5비트][노드인덱스:11비트]`
- **장점**: 소유권 자동 추적, 메모리 자동 반환
- **Zero-Copy**: 실제 데이터 복사 없이 포인터만 이동

## 🎯 **주요 설계 결정사항**

### **기술적 결정**
1. **AXIS Beat 크기**: 64/128/256/512 바이트 (빌드 타임)
2. **크레딧 단위**: AXIS 1 beat
3. **큐 ID 0**: 크레딧 차감 없는 플로우 컨트롤 전용
4. **디폴트 포트**: 포트 0, 펌웨어/에러 처리용
5. **엔디안**: 빌드 타임 파라미터 (Little/Big)

### **성능 최적화 결정**
1. **분산 아키텍처**: 포트별 독립 큐 매니저
2. **Prefetch 버퍼**: Egress latency 감소
3. **Reservation 시스템**: 메모리 부족 상황 사전 방지
4. **Starvation 방지**: 크레딧 할당 우선순위 시스템

### **에러 처리 전략**
1. **Critical Local Error**: 모든 큐 크레딧 0 + 펌웨어 알림
2. **Data Error**: Poisoned Flag + 에러 패킷 전달
3. **TLAST Error**: 예상치 못한 패킷 종료 감지
4. **타임아웃**: 백프레셔 지속 시 펌웨어 알림

## 📊 **파라미터 매트릭스 (검증 완료)**

| 포트 수 | 큐 수 | 포트ID | 큐ID | 헤더 크기 | Reserved |
|---------|-------|---------|------|-----------|----------|
| 4       | 24    | 2비트   | 5비트 | 11바이트  | 1비트    |
| 8       | 16    | 3비트   | 4비트 | 11바이트  | 0비트    |
| 16      | 32    | 4비트   | 5비트 | 12바이트  | 5비트    |
| 32      | 64    | 5비트   | 6비트 | 12바이트  | 2비트    |

## 🔄 **반복적 설계 개선 과정**

### **헤더 최적화**
- 초기: 12바이트 → 11바이트 → **최종 10바이트**
- 크레딧 필드: 16비트 → **8비트** (AXIS beat 단위 고려)
- Reserved 필드: 10비트 → **1-5비트** (파라미터별 최적화)

### **크레딧 시스템 진화**
- Phase 1: 단순 크레딧 → Phase 2: 양방향 크레딧
- Phase 3: 예약 기반 → **Phase 4: Starvation 방지**

### **메모리 관리 진화**
- Phase 1: 중앙집중 → Phase 2: 포트별 분산
- Phase 3: Entry ID 도입 → **Phase 4: 자동 소유권 추적**

## 📁 **현재 프로젝트 구조**

```
switch-internal-p2p-link/
├── project_rule.md                    # 프로젝트 개발 규칙
├── doc/
│   ├── architecture_design.md         # 전체 아키텍처 설계 (완료)
│   └── session_summary_architecture_design.md  # 이 문서
└── third_party/
    └── verilog-axis/                  # AXIS Fabric 라이브러리
        ├── rtl/axis_switch.v          # 메타데이터 라우팅용
        └── ...
```

## 🚀 **다음 세션들을 위한 모듈별 작업 계획**

### **우선순위 높음 (🎯 즉시 시작 가능)**
1. **Port Manager 모듈** (새 세션)
   - Ingress: 크레딧 포워딩 로직
   - Egress: Prefetch 버퍼 + Arbitration
   - 외부 인터페이스 상세 설계

2. **Port Router 모듈** (새 세션)
   - Ingress Queue Manager: 예약 기반 크레딧 시스템
   - Egress Queue Manager: 링크드 리스트 + 메타데이터 처리
   - Entry Pool Manager: Global Entry ID 관리

### **우선순위 중간 (🔧 모듈 완료 후)**
3. **에러 처리 시스템** (새 세션)
   - Critical Local Error 플로우
   - Poisoned Flag 메커니즘
   - 타임아웃 및 백프레셔 감지

4. **성능 최적화** (새 세션)
   - 파이프라인 설계 (사이클 레벨)
   - Prefetch 버퍼 크기 최적화
   - 동시 처리 성능 분석

### **우선순위 낮음 (📋 시스템 통합 단계)**
5. **시스템 통합** (새 세션)
   - 초기화 시퀀스
   - 설정 인터페이스 (레지스터 맵)
   - 디버깅 및 진단 기능

6. **HLS 구현** (새 세션)
   - SystemC 모델링 가이드라인
   - HLS 합성 제약사항
   - 최적화 고려사항

## 💾 **새 세션 시작 시 필수 참조사항**

### **프로젝트 컨텍스트 복원**
1. `project_rule.md` 읽기 → 개발 규칙 숙지
2. `doc/architecture_design.md` 스캔 → 전체 아키텍처 파악
3. 이 문서의 "주요 설계 결정사항" 섹션 확인

### **메모리 업데이트 필요사항**
- 스위치 프로젝트 메모리에 **Entry ID 시스템** 추가
- **분산 Port Router 아키텍처** 메모리 업데이트
- **6단계 패킷 Stitching Flow** 메모리 추가

### **개발 순서 (각 모듈 세션별)**
1. **인터페이스 정의** → SystemC 구조체
2. **동작 시퀀스** → 상태 머신/플로우
3. **데이터 구조** → 메모리 관리
4. **에러 처리** → 예외 상황 대응
5. **테스트 케이스** → 3그룹 분류

## ⚠️ **주의사항 (다음 세션들을 위해)**

### **설계 제약사항**
- **HLS 호환성**: SystemC만 사용, 복잡한 포인터 연산 지양
- **빌드 타임 파라미터**: 런타임 변경 불가
- **메모리 제약**: 포트별 독립 풀, 크로스 포트 접근 최소화

### **일관성 유지**
- **명명 규칙**: `ManagerName_ComponentName` (예: `PortManager_Ingress`)
- **비트 폭**: 모든 크기는 빌드 파라미터 기반 계산
- **에러 코드**: 표준화된 에러 처리 패턴 사용

### **성능 고려사항**
- **Zero-Copy**: 실제 데이터 복사 최소화
- **파이프라인**: 각 단계별 병렬 처리 가능하도록 설계
- **백프레셔**: 연쇄적 백프레셔 메커니즘 고려

---

## 📞 **세션 재개/참조 가이드**

### **이 세션 재개 시**
1. 이 문서의 "다음 세션들을 위한 모듈별 작업 계획" 확인
2. TODO 리스트에서 우선순위 높은 항목 선택
3. `doc/architecture_design.md`의 해당 섹션 상세화

### **새 모듈 세션 시작 시**
1. 이 문서 전체 읽기 (10분 내 컨텍스트 파악 가능)
2. 해당 모듈의 아키텍처 설계 문서 생성
3. 인터페이스 정의부터 시작

### **전체 프로젝트 현황 파악 시**
- `project_rule.md` → 개발 규칙
- `doc/architecture_design.md` → 전체 아키텍처
- 이 문서 → 세션 요약 및 다음 단계

---

**이 세션은 전체 아키텍처 설계를 성공적으로 완료했습니다!** ✅  
**다음 세션에서 각 모듈의 상세 설계를 진행해주세요.** 🚀 