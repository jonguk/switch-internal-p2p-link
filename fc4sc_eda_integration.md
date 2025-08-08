# FC4SC EDA 도구 연동 방법

## 1. UCIS 리포트 생성
```cpp
// FC4SC에서 UCIS 파일 생성
fc4sc::global_coverage_db::get_instance()->print_ucis("coverage.ucis");
```

## 2. EDA 도구에서 읽기

### VCS (Synopsys)
```bash
# FC4SC UCIS 파일을 VCS에서 로드
vcs -ucis coverage.ucis -gui

# DVE에서 커버리지 분석
dve -ucis coverage.ucis
```

### Questa (Mentor/Siemens)
```bash
# FC4SC UCIS를 Questa로 변환
ucis2cov -format questa coverage.ucis coverage.ucdb

# QuestaSim에서 커버리지 뷰어 실행
vsim -coverage -viewcov coverage.ucdb
```

### Vivado (AMD/Xilinx)
```bash
# FC4SC 커버리지를 Vivado 형식으로 변환
ucis2vivado coverage.ucis coverage.xml

# Vivado에서 커버리지 분석
vivado -mode gui -source load_coverage.tcl
```

## 3. 커버리지 병합
```bash
# 여러 테스트의 FC4SC 커버리지 병합
ucis merge -out merged_coverage.ucis \
    test1_coverage.ucis \
    test2_coverage.ucis \
    test3_coverage.ucis
```

## 4. 커버리지 리포트 생성
```bash
# HTML 리포트 생성
ucis report -format html -out coverage_report.html merged_coverage.ucis

# 텍스트 리포트 생성
ucis report -format text -out coverage_report.txt merged_coverage.ucis

# Excel 리포트 생성
ucis report -format excel -out coverage_report.xlsx merged_coverage.ucis
```

## 5. CI/CD 파이프라인 통합
```yaml
# Jenkins/GitHub Actions 예시
- name: Run FC4SC Coverage Test
  run: |
    make test-fc4sc-coverage
    
- name: Generate Coverage Report
  run: |
    ucis report -format html -out coverage_report.html coverage.ucis
    
- name: Upload Coverage Report
  uses: actions/upload-artifact@v2
  with:
    name: coverage-report
    path: coverage_report.html

- name: Check Coverage Threshold
  run: |
    coverage_pct=$(ucis report -format text coverage.ucis | grep "Overall" | awk '{print $3}')
    if [ "$coverage_pct" -lt "90" ]; then
      echo "❌ Coverage $coverage_pct% is below threshold (90%)"
      exit 1
    else
      echo "✅ Coverage $coverage_pct% meets threshold"
    fi
```

## 6. 커버리지 트렌드 분석
```python
# Python 스크립트로 커버리지 트렌드 분석
import xml.etree.ElementTree as ET
import matplotlib.pyplot as plt

def analyze_coverage_trend():
    # FC4SC XML 리포트 파싱
    tree = ET.parse('coverage_report.xml')
    root = tree.getroot()
    
    coverage_data = []
    for test in root.findall('.//test'):
        coverage = float(test.get('coverage'))
        timestamp = test.get('timestamp')
        coverage_data.append((timestamp, coverage))
    
    # 커버리지 트렌드 그래프 생성
    plt.plot([x[0] for x in coverage_data], [x[1] for x in coverage_data])
    plt.title('FC4SC Coverage Trend')
    plt.xlabel('Test Run')
    plt.ylabel('Coverage %')
    plt.savefig('coverage_trend.png')
```