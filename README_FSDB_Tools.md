# FSDB Tools - Python FSDB File Analysis Suite

SystemVerilog 시뮬레이션에서 생성된 FSDB 파일을 Python에서 분석하고 시각화하기 위한 종합 도구 모음입니다.

## 🚀 주요 기능

### 📊 FSDB 파일 읽기 및 분석
- FSDB 파일에서 신호 정보 추출
- 시간 범위별 신호 값 변화 추적
- 와일드카드 패턴을 이용한 신호 검색
- 신호 통계 및 분석 리포트 생성

### 🔍 고급 분석 기능
- **클럭 분석**: 주파수, 듀티 사이클, 지터 측정
- **상태 머신 분석**: 상태 전환 추적 및 통계
- **프로토콜 검증**: AXI, AHB, APB 버스 프로토콜 분석
- **글리치 검출**: 짧은 펄스 및 신호 이상 감지
- **핸드셰이크 분석**: valid/ready 신호 쌍 검증

### 📈 시각화 및 리포팅
- 파형 플롯 생성 (디지털/아날로그 신호 지원)
- 타이밍 다이어그램 자동 생성
- HTML 커버리지 리포트
- CSV/pandas DataFrame 데이터 내보내기

## 📦 설치 방법

### 1. 가상 환경 생성 및 활성화
```bash
python3 -m venv venv_fsdb
source venv_fsdb/bin/activate  # Linux/macOS
# 또는
venv_fsdb\Scripts\activate     # Windows
```

### 2. 필수 패키지 설치
```bash
pip install -r requirements_fsdb.txt
```

### 3. pyfsdb 설치 확인
```bash
python -c "import pyfsdb; print('pyfsdb 설치 완료!')"
```

## 🛠️ 사용법

### 기본 사용법

```python
from fsdb_reader import FSDBReader

# FSDB 파일 열기
with FSDBReader("simulation.fsdb") as reader:
    # 파일 정보 출력
    reader.print_info()
    
    # 클럭 신호 찾기
    clk_signals = reader.find_signals("*clk*")
    
    # 신호 데이터 읽기
    clk_data = reader.get_signal_data("top.clk", 0, 1000)
    
    # 신호 분석
    reader.analyze_signal("top.clk")
```

### 고급 분석

```python
from fsdb_analyzer import FSDBAnalyzer

with FSDBAnalyzer("simulation.fsdb") as analyzer:
    # 파형 시각화
    analyzer.plot_signals(["top.clk", "top.reset"], output_file="waveform.png")
    
    # AXI 프로토콜 분석
    analyzer.analyze_bus_protocol("axi_m_", "axi")
    
    # 상태 머신 분석
    analyzer.analyze_state_machine("top.fsm.state")
    
    # 타이밍 다이어그램 생성
    analyzer.generate_timing_diagram(
        ["top.clk", "top.reset", "top.valid", "top.ready"],
        start_time=0, end_time=500,
        output_file="timing.png"
    )
```

### 명령행 도구

```bash
# 기본 분석
python fsdb_reader.py simulation.fsdb

# 고급 분석 및 시각화
python fsdb_analyzer.py simulation.fsdb
```

## 📁 파일 구조

```
fsdb_tools/
├── fsdb_reader.py          # 기본 FSDB 읽기 클래스
├── fsdb_analyzer.py        # 고급 분석 및 시각화
├── test_fsdb_tools.py      # 테스트 스위트
├── requirements_fsdb.txt   # 패키지 의존성
├── fsdb_tools_examples.md  # 상세 사용 예제
└── README_FSDB_Tools.md    # 이 파일
```

## 🧪 테스트 실행

```bash
# 전체 테스트 실행
python test_fsdb_tools.py

# pytest 사용 (선택사항)
pip install pytest
pytest test_fsdb_tools.py -v
```

## 📋 API 레퍼런스

### FSDBReader 클래스

| 메서드 | 설명 |
|--------|------|
| `print_info()` | FSDB 파일 기본 정보 출력 |
| `get_all_signals()` | 모든 신호 정보 반환 |
| `find_signals(pattern)` | 패턴 매칭으로 신호 검색 |
| `get_signal_data(path, start, end)` | 특정 신호 데이터 추출 |
| `analyze_signal(path)` | 신호 통계 분석 |
| `export_to_csv(signals, filename)` | CSV 파일로 내보내기 |

### FSDBAnalyzer 클래스

| 메서드 | 설명 |
|--------|------|
| `plot_signals(paths, output_file)` | 파형 플롯 생성 |
| `analyze_bus_protocol(prefix, type)` | 버스 프로토콜 분석 |
| `analyze_state_machine(path)` | 상태 머신 분석 |
| `find_glitches(path, min_duration)` | 글리치 검출 |
| `generate_timing_diagram(paths, file)` | 타이밍 다이어그램 생성 |
| `export_to_dataframe(paths)` | pandas DataFrame 변환 |

## 🔧 고급 설정

### 환경 변수
```bash
export FSDB_CACHE_SIZE=1000      # 신호 캐시 크기
export FSDB_TIME_UNIT=ns         # 기본 시간 단위
export FSDB_PLOT_DPI=300         # 플롯 해상도
```

### 커스터마이징 예제
```python
# 커스텀 분석 함수
def analyze_custom_protocol(analyzer, bus_prefix):
    signals = analyzer.find_signals(f"{bus_prefix}*")
    # 커스텀 분석 로직
    return analysis_results

# 사용
with FSDBAnalyzer("sim.fsdb") as analyzer:
    results = analyze_custom_protocol(analyzer, "my_bus_")
```

## 🐛 문제 해결

### 일반적인 문제들

1. **pyfsdb 설치 실패**
   ```bash
   # 시스템 패키지 관리자 사용
   brew install pyfsdb  # macOS
   sudo apt-get install python3-pyfsdb  # Ubuntu
   ```

2. **matplotlib 백엔드 오류**
   ```python
   import matplotlib
   matplotlib.use('Agg')  # GUI 없는 환경에서
   ```

3. **메모리 부족**
   ```python
   # 시간 범위를 제한하여 분석
   analyzer.analyze_signal("signal", start_time=0, end_time=10000)
   ```

## 📝 라이선스

이 프로젝트는 MIT 라이선스를 따릅니다.

## 🤝 기여하기

1. 이슈 리포트: 버그나 개선 사항을 GitHub Issues에 등록
2. 풀 리퀘스트: 코드 개선이나 새 기능 추가
3. 문서 개선: README나 예제 코드 개선

## 📚 참고 자료

- [pyfsdb 공식 문서](https://pypi.org/project/pyfsdb/)
- [SystemVerilog FSDB 형식 가이드](https://www.synopsys.com/verification/debug/fsdb.html)
- [matplotlib 시각화 가이드](https://matplotlib.org/stable/tutorials/index.html)
- [pandas 데이터 분석 가이드](https://pandas.pydata.org/docs/user_guide/index.html)

## 📞 지원

질문이나 도움이 필요하시면:
- GitHub Issues 생성
- 이메일 문의
- 팀 채팅방 참여

---

**Happy Debugging! 🚀**
