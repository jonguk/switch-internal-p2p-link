#!/usr/bin/env python3
"""
FSDB Tools Test Suite

FSDB 리더와 분석기의 기능을 테스트하는 코드입니다.
실제 FSDB 파일이 없어도 모의 데이터로 테스트할 수 있습니다.

Usage:
    python test_fsdb_tools.py
"""

import unittest
import os
import tempfile
from unittest.mock import Mock, patch, MagicMock
import sys

# 테스트 대상 모듈들
try:
    from fsdb_reader import FSDBReader, SignalInfo, TimeValue
    from fsdb_analyzer import FSDBAnalyzer, ProtocolEvent, BusTransaction
except ImportError as e:
    print(f"Import error: {e}")
    print("Make sure fsdb_reader.py and fsdb_analyzer.py are in the same directory")
    sys.exit(1)


class TestFSDBReader(unittest.TestCase):
    """FSDBReader 클래스 테스트"""
    
    def setUp(self):
        """테스트 설정"""
        # 모의 FSDB 파일 경로
        self.mock_fsdb_file = "test_simulation.fsdb"
        
        # pyfsdb 모의 객체 생성
        self.mock_fsdb = Mock()
        self.mock_fsdb.get_file_info.return_value = {
            'version': '1.0',
            'date': '2024-01-01'
        }
        self.mock_fsdb.get_time_info.return_value = {
            'start_time': 0,
            'end_time': 1000,
            'time_unit': 'ns'
        }
        
        # 모의 신호 리스트
        self.mock_signals = [
            {
                'name': 'clk',
                'full_path': 'top.clk',
                'width': 1,
                'type': 'wire'
            },
            {
                'name': 'reset',
                'full_path': 'top.reset',
                'width': 1,
                'type': 'wire'
            },
            {
                'name': 'data',
                'full_path': 'top.data',
                'width': 32,
                'type': 'reg'
            }
        ]
        
        self.mock_fsdb.get_signal_list.return_value = self.mock_signals
    
    @patch('fsdb_reader.pyfsdb')
    @patch('os.path.exists')
    def test_fsdb_reader_init(self, mock_exists, mock_pyfsdb):
        """FSDBReader 초기화 테스트"""
        mock_exists.return_value = True
        mock_pyfsdb.FsdbReader.return_value = self.mock_fsdb
        
        reader = FSDBReader(self.mock_fsdb_file)
        
        self.assertEqual(reader.fsdb_file, self.mock_fsdb_file)
        self.assertIsNotNone(reader.fsdb)
        mock_pyfsdb.FsdbReader.assert_called_once_with(self.mock_fsdb_file)
    
    @patch('fsdb_reader.pyfsdb')
    @patch('os.path.exists')
    def test_get_all_signals(self, mock_exists, mock_pyfsdb):
        """신호 리스트 가져오기 테스트"""
        mock_exists.return_value = True
        mock_pyfsdb.FsdbReader.return_value = self.mock_fsdb
        
        reader = FSDBReader(self.mock_fsdb_file)
        signals = reader.get_all_signals()
        
        self.assertEqual(len(signals), 3)
        self.assertEqual(signals[0].name, 'clk')
        self.assertEqual(signals[0].full_path, 'top.clk')
        self.assertEqual(signals[1].name, 'reset')
        self.assertEqual(signals[2].width, 32)
    
    @patch('fsdb_reader.pyfsdb')
    @patch('os.path.exists')
    def test_find_signals(self, mock_exists, mock_pyfsdb):
        """신호 검색 테스트"""
        mock_exists.return_value = True
        mock_pyfsdb.FsdbReader.return_value = self.mock_fsdb
        
        reader = FSDBReader(self.mock_fsdb_file)
        
        # 클럭 신호 찾기
        clk_signals = reader.find_signals("*clk*")
        self.assertEqual(len(clk_signals), 1)
        self.assertEqual(clk_signals[0].name, 'clk')
        
        # 모든 신호 찾기
        all_signals = reader.find_signals("*")
        self.assertEqual(len(all_signals), 3)
    
    @patch('fsdb_reader.pyfsdb')
    @patch('os.path.exists')
    def test_get_signal_data(self, mock_exists, mock_pyfsdb):
        """신호 데이터 가져오기 테스트"""
        mock_exists.return_value = True
        mock_pyfsdb.FsdbReader.return_value = self.mock_fsdb
        
        # 모의 신호 데이터
        mock_signal_data = [
            {'time': 0, 'value': '0'},
            {'time': 10, 'value': '1'},
            {'time': 20, 'value': '0'},
            {'time': 30, 'value': '1'}
        ]
        self.mock_fsdb.get_signal_data.return_value = mock_signal_data
        
        reader = FSDBReader(self.mock_fsdb_file)
        data = reader.get_signal_data("top.clk")
        
        self.assertEqual(len(data), 4)
        self.assertEqual(data[0].time, 0)
        self.assertEqual(data[0].value, '0')
        self.assertEqual(data[1].time, 10)
        self.assertEqual(data[1].value, '1')


class TestFSDBAnalyzer(unittest.TestCase):
    """FSDBAnalyzer 클래스 테스트"""
    
    def setUp(self):
        """테스트 설정"""
        self.mock_fsdb_file = "test_simulation.fsdb"
        
        # 모의 클럭 데이터 (50% 듀티 사이클)
        self.mock_clock_data = [
            TimeValue(0, '0'),
            TimeValue(10, '1'),
            TimeValue(20, '0'),
            TimeValue(30, '1'),
            TimeValue(40, '0'),
            TimeValue(50, '1')
        ]
        
        # 모의 상태 머신 데이터
        self.mock_state_data = [
            TimeValue(0, 'IDLE'),
            TimeValue(15, 'START'),
            TimeValue(25, 'DATA'),
            TimeValue(45, 'DONE'),
            TimeValue(55, 'IDLE')
        ]
    
    @patch('fsdb_analyzer.FSDBReader.__init__')
    def test_analyzer_init(self, mock_init):
        """FSDBAnalyzer 초기화 테스트"""
        mock_init.return_value = None
        
        analyzer = FSDBAnalyzer(self.mock_fsdb_file)
        
        self.assertEqual(analyzer.protocol_events, [])
        self.assertEqual(analyzer.bus_transactions, [])
    
    def test_is_clock_signal(self):
        """클럭 신호 판단 테스트"""
        with patch('fsdb_analyzer.FSDBReader.__init__'):
            analyzer = FSDBAnalyzer(self.mock_fsdb_file)
            
            # 클럭 신호 테스트
            is_clock = analyzer._is_clock_signal(self.mock_clock_data)
            self.assertTrue(is_clock)
            
            # 비클럭 신호 테스트
            non_clock_data = [
                TimeValue(0, 'IDLE'),
                TimeValue(10, 'START'),
                TimeValue(20, 'DATA')
            ]
            is_clock = analyzer._is_clock_signal(non_clock_data)
            self.assertFalse(is_clock)
    
    def test_find_state_machine_transitions(self):
        """상태 머신 전환 찾기 테스트"""
        with patch('fsdb_analyzer.FSDBReader.__init__'):
            analyzer = FSDBAnalyzer(self.mock_fsdb_file)
            
            # get_signal_data 메서드를 모의로 대체
            analyzer.get_signal_data = Mock(return_value=self.mock_state_data)
            
            transitions = analyzer.find_state_machine_transitions("test.state")
            
            # 예상 전환: IDLE->START, START->DATA, DATA->DONE, DONE->IDLE
            self.assertEqual(len(transitions), 4)
            self.assertEqual(transitions[0], (15, 'IDLE', 'START'))
            self.assertEqual(transitions[1], (25, 'START', 'DATA'))
            self.assertEqual(transitions[2], (45, 'DATA', 'DONE'))
            self.assertEqual(transitions[3], (55, 'DONE', 'IDLE'))
    
    def test_find_glitches(self):
        """글리치 찾기 테스트"""
        with patch('fsdb_analyzer.FSDBReader.__init__'):
            analyzer = FSDBAnalyzer(self.mock_fsdb_file)
            
            # 글리치가 있는 신호 데이터
            glitch_data = [
                TimeValue(0, '0'),
                TimeValue(5, '1'),   # 글리치 시작
                TimeValue(6, '0'),   # 글리치 끝 (1ns 지속)
                TimeValue(10, '1'),
                TimeValue(20, '0')
            ]
            
            analyzer.get_signal_data = Mock(return_value=glitch_data)
            
            glitches = analyzer.find_glitches("test.signal", min_duration=2)
            
            # 1ns 글리치가 감지되어야 함
            self.assertEqual(len(glitches), 1)
            self.assertEqual(glitches[0], (5, 6))


class TestSignalInfo(unittest.TestCase):
    """SignalInfo 데이터 클래스 테스트"""
    
    def test_signal_info_creation(self):
        """SignalInfo 생성 테스트"""
        signal = SignalInfo(
            name="test_signal",
            full_path="top.module.test_signal",
            width=8,
            signal_type="reg"
        )
        
        self.assertEqual(signal.name, "test_signal")
        self.assertEqual(signal.full_path, "top.module.test_signal")
        self.assertEqual(signal.width, 8)
        self.assertEqual(signal.signal_type, "reg")


class TestTimeValue(unittest.TestCase):
    """TimeValue 데이터 클래스 테스트"""
    
    def test_time_value_creation(self):
        """TimeValue 생성 테스트"""
        tv = TimeValue(time=100, value="0xFF")
        
        self.assertEqual(tv.time, 100)
        self.assertEqual(tv.value, "0xFF")


class MockFSDBIntegrationTest(unittest.TestCase):
    """모의 FSDB 파일을 사용한 통합 테스트"""
    
    def setUp(self):
        """통합 테스트 설정"""
        self.temp_dir = tempfile.mkdtemp()
        self.mock_fsdb_file = os.path.join(self.temp_dir, "test.fsdb")
        
        # 빈 파일 생성
        with open(self.mock_fsdb_file, 'w') as f:
            f.write("mock fsdb content")
    
    def tearDown(self):
        """테스트 정리"""
        if os.path.exists(self.mock_fsdb_file):
            os.remove(self.mock_fsdb_file)
        os.rmdir(self.temp_dir)
    
    @patch('fsdb_reader.PYFSDB_AVAILABLE', False)
    def test_pyfsdb_not_available(self):
        """pyfsdb가 없을 때의 동작 테스트"""
        with self.assertRaises(ImportError):
            FSDBReader(self.mock_fsdb_file)
    
    def test_file_not_found(self):
        """파일이 없을 때의 동작 테스트"""
        with patch('fsdb_reader.PYFSDB_AVAILABLE', True):
            with self.assertRaises(FileNotFoundError):
                FSDBReader("nonexistent.fsdb")


def create_example_usage():
    """사용 예제 생성"""
    example_code = '''
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
'''
    
    with open("fsdb_tools_examples.md", "w", encoding='utf-8') as f:
        f.write(example_code)
    
    print("사용 예제가 fsdb_tools_examples.md 파일에 저장되었습니다.")


def run_all_tests():
    """모든 테스트 실행"""
    # 테스트 스위트 생성
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()
    
    # 테스트 클래스들 추가
    suite.addTests(loader.loadTestsFromTestCase(TestFSDBReader))
    suite.addTests(loader.loadTestsFromTestCase(TestFSDBAnalyzer))
    suite.addTests(loader.loadTestsFromTestCase(TestSignalInfo))
    suite.addTests(loader.loadTestsFromTestCase(TestTimeValue))
    suite.addTests(loader.loadTestsFromTestCase(MockFSDBIntegrationTest))
    
    # 테스트 실행
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    
    # 결과 출력
    if result.wasSuccessful():
        print("\n✅ 모든 테스트가 성공했습니다!")
    else:
        print(f"\n❌ {len(result.failures)} 실패, {len(result.errors)} 에러")
        
    return result.wasSuccessful()


if __name__ == "__main__":
    print("FSDB Tools Test Suite")
    print("=" * 50)
    
    # 테스트 실행
    success = run_all_tests()
    
    # 사용 예제 생성
    print("\n" + "=" * 50)
    create_example_usage()
    
    sys.exit(0 if success else 1)
