
# FSDB Tools 사용 예제

## 기본 사용법

```python
from fsdb_reader import FSDBReader
from fsdb_analyzer import FSDBAnalyzer

# 1. 기본 FSDB 파일 읽기
with FSDBReader("simulation.fsdb") as reader:
    # 파일 정보 출력
    reader.print_info()
    
    # 클럭 신호 찾기
    clk_signals = reader.find_signals("*clk*")
    print(f"Found {len(clk_signals)} clock signals")
    
    # 특정 신호 데이터 읽기
    if clk_signals:
        clk_data = reader.get_signal_data(clk_signals[0].full_path, 0, 1000)
        print(f"Clock has {len(clk_data)} transitions")

# 2. 고급 분석 기능
with FSDBAnalyzer("simulation.fsdb") as analyzer:
    # 파형 시각화
    analyzer.plot_signals(["top.clk", "top.reset"], 0, 1000, "waveform.png")
    
    # 버스 프로토콜 분석
    analyzer.analyze_bus_protocol("axi_m_", "axi")
    
    # 상태 머신 분석
    analyzer.analyze_state_machine("top.fsm.state")
    
    # 타이밍 다이어그램 생성
    analyzer.generate_timing_diagram(
        ["top.clk", "top.reset", "top.valid", "top.ready"],
        0, 500, "timing.png"
    )
    
    # CSV로 내보내기
    analyzer.export_to_csv(
        ["top.clk", "top.data"], 
        "signals.csv", 0, 1000
    )
    
    # pandas DataFrame으로 변환
    df = analyzer.export_to_dataframe(["top.clk", "top.data"])
    if df is not None:
        print(df.head())
    
    # 글리치 찾기
    glitches = analyzer.find_glitches("top.clk", min_duration=1)
    print(f"Found {len(glitches)} glitches")
    
    # 커버리지 리포트 생성
    analyzer.generate_coverage_report(
        ["*clk*", "*valid*", "*ready*"], 
        "coverage.html"
    )
```

## 명령행 사용법

```bash
# 가상 환경 활성화
source venv_fsdb/bin/activate

# 기본 분석
python fsdb_reader.py simulation.fsdb

# 고급 분석
python fsdb_analyzer.py simulation.fsdb

# 테스트 실행
python test_fsdb_tools.py
```

## 필요한 패키지

```bash
pip install pyfsdb matplotlib pandas numpy
```

## 주요 기능

1. **FSDB 파일 읽기**: 신호 정보, 시간 범위, 값 변화 추적
2. **신호 검색**: 와일드카드 패턴으로 신호 찾기
3. **파형 분석**: 클럭 주파수, 상태 전환, 글리치 검출
4. **프로토콜 분석**: AXI, AHB, APB 버스 프로토콜 검증
5. **시각화**: 타이밍 다이어그램, 파형 플롯 생성
6. **데이터 내보내기**: CSV, pandas DataFrame 지원
7. **커버리지 분석**: HTML 리포트 생성
