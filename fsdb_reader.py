#!/usr/bin/env python3
"""
FSDB Reader Utility

이 모듈은 FSDB 파일을 읽고 분석하기 위한 유틸리티 클래스를 제공합니다.
SystemVerilog 시뮬레이션에서 생성된 FSDB 파일을 Python에서 쉽게 처리할 수 있도록 합니다.

Requirements:
    pip install pyfsdb

Usage:
    # 기본 사용법
    reader = FSDBReader("simulation.fsdb")
    reader.print_info()
    
    # 특정 신호 검색
    signals = reader.find_signals("*clk*")
    
    # 신호 값 읽기
    data = reader.get_signal_data("top.clk", start_time=0, end_time=1000)
    
    # 파형 분석
    reader.analyze_signal("top.reset")
"""

import os
import sys
from typing import List, Dict, Any, Optional, Tuple
import re
from dataclasses import dataclass

try:
    import pyfsdb
    PYFSDB_AVAILABLE = True
except ImportError:
    PYFSDB_AVAILABLE = False
    print("Warning: pyfsdb not installed. Please install with: pip install pyfsdb")


@dataclass
class SignalInfo:
    """신호 정보를 저장하는 데이터 클래스"""
    name: str
    full_path: str
    width: int
    signal_type: str
    

@dataclass
class TimeValue:
    """시간-값 쌍을 저장하는 데이터 클래스"""
    time: int
    value: Any


class FSDBReader:
    """FSDB 파일을 읽고 분석하는 메인 클래스"""
    
    def __init__(self, fsdb_file: str):
        """
        FSDB 파일을 열고 초기화
        
        Args:
            fsdb_file: FSDB 파일 경로
        """
        if not PYFSDB_AVAILABLE:
            raise ImportError("pyfsdb is not available. Please install with: pip install pyfsdb")
            
        if not os.path.exists(fsdb_file):
            raise FileNotFoundError(f"FSDB file not found: {fsdb_file}")
            
        self.fsdb_file = fsdb_file
        self.fsdb = None
        self._signals_cache = None
        
        try:
            self.fsdb = pyfsdb.FsdbReader(fsdb_file)
            print(f"Successfully opened FSDB file: {fsdb_file}")
        except Exception as e:
            raise RuntimeError(f"Failed to open FSDB file: {e}")
    
    def __enter__(self):
        """Context manager entry"""
        return self
        
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit"""
        self.close()
    
    def close(self):
        """FSDB 파일 닫기"""
        if self.fsdb:
            self.fsdb.close()
            self.fsdb = None
    
    def print_info(self):
        """FSDB 파일의 기본 정보 출력"""
        if not self.fsdb:
            print("FSDB file is not open")
            return
            
        print(f"FSDB File: {self.fsdb_file}")
        print("-" * 50)
        
        try:
            # 기본 정보
            info = self.fsdb.get_file_info()
            print(f"Version: {info.get('version', 'Unknown')}")
            print(f"Date: {info.get('date', 'Unknown')}")
            
            # 시뮬레이션 시간 범위
            time_info = self.fsdb.get_time_info()
            print(f"Start Time: {time_info.get('start_time', 0)}")
            print(f"End Time: {time_info.get('end_time', 0)}")
            print(f"Time Unit: {time_info.get('time_unit', 'Unknown')}")
            
            # 신호 개수
            signals = self.get_all_signals()
            print(f"Total Signals: {len(signals)}")
            
        except Exception as e:
            print(f"Error getting file info: {e}")
    
    def get_all_signals(self) -> List[SignalInfo]:
        """모든 신호 정보를 가져오기"""
        if self._signals_cache:
            return self._signals_cache
            
        if not self.fsdb:
            return []
            
        try:
            signals = []
            signal_list = self.fsdb.get_signal_list()
            
            for sig in signal_list:
                signal_info = SignalInfo(
                    name=sig.get('name', ''),
                    full_path=sig.get('full_path', ''),
                    width=sig.get('width', 1),
                    signal_type=sig.get('type', 'wire')
                )
                signals.append(signal_info)
            
            self._signals_cache = signals
            return signals
            
        except Exception as e:
            print(f"Error getting signals: {e}")
            return []
    
    def find_signals(self, pattern: str) -> List[SignalInfo]:
        """
        패턴에 맞는 신호들을 찾기
        
        Args:
            pattern: 검색할 패턴 (와일드카드 * 사용 가능)
            
        Returns:
            매칭되는 신호들의 리스트
        """
        signals = self.get_all_signals()
        
        # 와일드카드를 정규표현식으로 변환
        regex_pattern = pattern.replace('*', '.*').replace('?', '.')
        regex = re.compile(regex_pattern, re.IGNORECASE)
        
        matched_signals = []
        for signal in signals:
            if regex.search(signal.full_path) or regex.search(signal.name):
                matched_signals.append(signal)
        
        return matched_signals
    
    def print_signals(self, pattern: str = "*"):
        """신호들을 패턴에 따라 출력"""
        signals = self.find_signals(pattern)
        
        print(f"Signals matching '{pattern}':")
        print("-" * 80)
        print(f"{'Name':<30} {'Width':<8} {'Type':<10} {'Full Path'}")
        print("-" * 80)
        
        for signal in signals[:50]:  # 처음 50개만 출력
            print(f"{signal.name:<30} {signal.width:<8} {signal.signal_type:<10} {signal.full_path}")
        
        if len(signals) > 50:
            print(f"... and {len(signals) - 50} more signals")
    
    def get_signal_data(self, signal_path: str, start_time: int = 0, 
                       end_time: Optional[int] = None) -> List[TimeValue]:
        """
        특정 신호의 데이터를 가져오기
        
        Args:
            signal_path: 신호의 전체 경로
            start_time: 시작 시간
            end_time: 종료 시간 (None이면 끝까지)
            
        Returns:
            시간-값 쌍의 리스트
        """
        if not self.fsdb:
            return []
            
        try:
            data = []
            signal_data = self.fsdb.get_signal_data(signal_path, start_time, end_time)
            
            for time_val in signal_data:
                tv = TimeValue(
                    time=time_val.get('time', 0),
                    value=time_val.get('value', 'X')
                )
                data.append(tv)
            
            return data
            
        except Exception as e:
            print(f"Error getting signal data for '{signal_path}': {e}")
            return []
    
    def analyze_signal(self, signal_path: str, start_time: int = 0, 
                      end_time: Optional[int] = None):
        """
        신호 분석 및 통계 출력
        
        Args:
            signal_path: 분석할 신호 경로
            start_time: 시작 시간
            end_time: 종료 시간
        """
        data = self.get_signal_data(signal_path, start_time, end_time)
        
        if not data:
            print(f"No data found for signal: {signal_path}")
            return
        
        print(f"Signal Analysis: {signal_path}")
        print("-" * 50)
        print(f"Total Transitions: {len(data)}")
        print(f"Time Range: {data[0].time} - {data[-1].time}")
        
        # 값 분포 계산
        value_counts = {}
        for tv in data:
            val_str = str(tv.value)
            value_counts[val_str] = value_counts.get(val_str, 0) + 1
        
        print("\nValue Distribution:")
        for value, count in sorted(value_counts.items()):
            percentage = (count / len(data)) * 100
            print(f"  {value}: {count} ({percentage:.1f}%)")
        
        # 클럭 신호인 경우 주기 분석
        if self._is_clock_signal(data):
            self._analyze_clock(data, signal_path)
    
    def _is_clock_signal(self, data: List[TimeValue]) -> bool:
        """클럭 신호인지 판단"""
        if len(data) < 4:
            return False
            
        # 0과 1 값만 있고, 규칙적으로 토글되는지 확인
        values = [str(tv.value) for tv in data[:10]]
        unique_values = set(values)
        
        return unique_values.issubset({'0', '1'}) and len(unique_values) == 2
    
    def _analyze_clock(self, data: List[TimeValue], signal_name: str):
        """클럭 신호 분석"""
        print(f"\nClock Analysis for {signal_name}:")
        
        rising_edges = []
        falling_edges = []
        
        for i in range(1, len(data)):
            prev_val = str(data[i-1].value)
            curr_val = str(data[i].value)
            
            if prev_val == '0' and curr_val == '1':
                rising_edges.append(data[i].time)
            elif prev_val == '1' and curr_val == '0':
                falling_edges.append(data[i].time)
        
        if len(rising_edges) >= 2:
            periods = [rising_edges[i+1] - rising_edges[i] for i in range(len(rising_edges)-1)]
            avg_period = sum(periods) / len(periods)
            frequency = 1.0 / avg_period if avg_period > 0 else 0
            
            print(f"  Rising Edges: {len(rising_edges)}")
            print(f"  Average Period: {avg_period:.2f}")
            print(f"  Frequency: {frequency:.6f} Hz")
    
    def export_to_csv(self, signal_paths: List[str], csv_file: str, 
                     start_time: int = 0, end_time: Optional[int] = None):
        """
        신호 데이터를 CSV 파일로 내보내기
        
        Args:
            signal_paths: 내보낼 신호 경로들
            csv_file: 출력 CSV 파일명
            start_time: 시작 시간
            end_time: 종료 시간
        """
        import csv
        
        # 모든 신호의 데이터 수집
        all_data = {}
        all_times = set()
        
        for signal_path in signal_paths:
            data = self.get_signal_data(signal_path, start_time, end_time)
            signal_data = {tv.time: tv.value for tv in data}
            all_data[signal_path] = signal_data
            all_times.update(signal_data.keys())
        
        # 시간순 정렬
        sorted_times = sorted(all_times)
        
        # CSV 파일 작성
        with open(csv_file, 'w', newline='') as f:
            writer = csv.writer(f)
            
            # 헤더 작성
            header = ['Time'] + signal_paths
            writer.writerow(header)
            
            # 데이터 작성
            for time in sorted_times:
                row = [time]
                for signal_path in signal_paths:
                    value = all_data[signal_path].get(time, 'X')
                    row.append(value)
                writer.writerow(row)
        
        print(f"Data exported to {csv_file}")


def main():
    """메인 함수 - 사용 예제"""
    if len(sys.argv) < 2:
        print("Usage: python fsdb_reader.py <fsdb_file>")
        print("Example: python fsdb_reader.py simulation.fsdb")
        return
    
    fsdb_file = sys.argv[1]
    
    try:
        with FSDBReader(fsdb_file) as reader:
            # 기본 정보 출력
            reader.print_info()
            print()
            
            # 클럭 신호 찾기
            print("Clock signals:")
            clk_signals = reader.find_signals("*clk*")
            for sig in clk_signals[:5]:
                print(f"  {sig.full_path}")
            print()
            
            # 리셋 신호 찾기
            print("Reset signals:")
            rst_signals = reader.find_signals("*rst*")
            for sig in rst_signals[:5]:
                print(f"  {sig.full_path}")
            print()
            
            # 첫 번째 클럭 신호 분석
            if clk_signals:
                reader.analyze_signal(clk_signals[0].full_path)
                
    except Exception as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    main()
