#!/usr/bin/env python3
"""
FSDB Analyzer - Advanced Analysis and Visualization

이 모듈은 FSDB 파일의 고급 분석 및 시각화 기능을 제공합니다.
파형 데이터를 분석하고 다양한 형태로 시각화할 수 있습니다.

Requirements:
    pip install pyfsdb matplotlib pandas numpy

Usage:
    analyzer = FSDBAnalyzer("simulation.fsdb")
    analyzer.plot_signals(["top.clk", "top.reset"], start_time=0, end_time=1000)
    analyzer.find_protocol_violations("axi_", "ready", "valid")
"""

import os
import sys
from typing import List, Dict, Any, Optional, Tuple, Union
import re
from dataclasses import dataclass
from fsdb_reader import FSDBReader, SignalInfo, TimeValue

try:
    import matplotlib.pyplot as plt
    import matplotlib.patches as patches
    MATPLOTLIB_AVAILABLE = True
except ImportError:
    MATPLOTLIB_AVAILABLE = False
    print("Warning: matplotlib not available. Install with: pip install matplotlib")

try:
    import pandas as pd
    PANDAS_AVAILABLE = True
except ImportError:
    PANDAS_AVAILABLE = False
    print("Warning: pandas not available. Install with: pip install pandas")

try:
    import numpy as np
    NUMPY_AVAILABLE = True
except ImportError:
    NUMPY_AVAILABLE = False
    print("Warning: numpy not available. Install with: pip install numpy")


@dataclass
class ProtocolEvent:
    """프로토콜 이벤트 정보"""
    time: int
    event_type: str
    signal_name: str
    value: Any
    description: str


@dataclass
class BusTransaction:
    """버스 트랜잭션 정보"""
    start_time: int
    end_time: int
    transaction_type: str
    address: Optional[int]
    data: Optional[int]
    status: str


class FSDBAnalyzer(FSDBReader):
    """FSDB 파일의 고급 분석 기능을 제공하는 클래스"""
    
    def __init__(self, fsdb_file: str):
        super().__init__(fsdb_file)
        self.protocol_events = []
        self.bus_transactions = []
    
    def plot_signals(self, signal_paths: List[str], start_time: int = 0, 
                    end_time: Optional[int] = None, output_file: Optional[str] = None):
        """
        신호들을 시간에 따라 플롯
        
        Args:
            signal_paths: 플롯할 신호 경로들
            start_time: 시작 시간
            end_time: 종료 시간
            output_file: 출력 파일명 (None이면 화면에 표시)
        """
        if not MATPLOTLIB_AVAILABLE:
            print("matplotlib is not available. Cannot plot signals.")
            return
        
        fig, axes = plt.subplots(len(signal_paths), 1, figsize=(12, 2*len(signal_paths)))
        if len(signal_paths) == 1:
            axes = [axes]
        
        for i, signal_path in enumerate(signal_paths):
            data = self.get_signal_data(signal_path, start_time, end_time)
            
            if not data:
                axes[i].text(0.5, 0.5, f"No data for {signal_path}", 
                           transform=axes[i].transAxes, ha='center')
                continue
            
            times = [tv.time for tv in data]
            values = []
            
            # 값을 숫자로 변환 시도
            for tv in data:
                try:
                    if isinstance(tv.value, str):
                        if tv.value in ['X', 'Z']:
                            values.append(float('nan'))
                        elif tv.value.startswith('0x'):
                            values.append(int(tv.value, 16))
                        elif tv.value.isdigit():
                            values.append(int(tv.value))
                        else:
                            values.append(float('nan'))
                    else:
                        values.append(float(tv.value))
                except:
                    values.append(float('nan'))
            
            # 디지털 신호인지 확인
            unique_vals = set(v for v in values if not (isinstance(v, float) and v != v))
            is_digital = unique_vals.issubset({0, 1, 0.0, 1.0})
            
            if is_digital:
                # 디지털 신호는 스텝 플롯으로
                axes[i].step(times, values, where='post', linewidth=2)
                axes[i].set_ylim(-0.5, 1.5)
                axes[i].set_yticks([0, 1])
                axes[i].set_yticklabels(['0', '1'])
            else:
                # 아날로그 신호는 일반 플롯으로
                axes[i].plot(times, values, linewidth=1)
            
            axes[i].set_title(signal_path)
            axes[i].grid(True, alpha=0.3)
            axes[i].set_ylabel('Value')
            
            if i == len(signal_paths) - 1:
                axes[i].set_xlabel('Time')
        
        plt.tight_layout()
        
        if output_file:
            plt.savefig(output_file, dpi=300, bbox_inches='tight')
            print(f"Plot saved to {output_file}")
        else:
            plt.show()
    
    def analyze_bus_protocol(self, bus_prefix: str, protocol_type: str = "axi"):
        """
        버스 프로토콜 분석
        
        Args:
            bus_prefix: 버스 신호 접두사 (예: "axi_m_", "ahb_")
            protocol_type: 프로토콜 타입 ("axi", "ahb", "apb")
        """
        if protocol_type.lower() == "axi":
            self._analyze_axi_protocol(bus_prefix)
        elif protocol_type.lower() == "ahb":
            self._analyze_ahb_protocol(bus_prefix)
        elif protocol_type.lower() == "apb":
            self._analyze_apb_protocol(bus_prefix)
        else:
            print(f"Unsupported protocol type: {protocol_type}")
    
    def _analyze_axi_protocol(self, bus_prefix: str):
        """AXI 프로토콜 분석"""
        # AXI 신호들 찾기
        axi_signals = self.find_signals(f"{bus_prefix}*")
        
        # Write Address Channel
        awvalid_signals = [s for s in axi_signals if 'awvalid' in s.name.lower()]
        awready_signals = [s for s in axi_signals if 'awready' in s.name.lower()]
        
        # Write Data Channel  
        wvalid_signals = [s for s in axi_signals if 'wvalid' in s.name.lower()]
        wready_signals = [s for s in axi_signals if 'wready' in s.name.lower()]
        
        # Read Address Channel
        arvalid_signals = [s for s in axi_signals if 'arvalid' in s.name.lower()]
        arready_signals = [s for s in axi_signals if 'arready' in s.name.lower()]
        
        print(f"AXI Protocol Analysis for {bus_prefix}")
        print("-" * 50)
        print(f"Found AXI signals: {len(axi_signals)}")
        print(f"  Write Address Channel: {len(awvalid_signals)} valid, {len(awready_signals)} ready")
        print(f"  Write Data Channel: {len(wvalid_signals)} valid, {len(wready_signals)} ready")
        print(f"  Read Address Channel: {len(arvalid_signals)} valid, {len(arready_signals)} ready")
        
        # 핸드셰이크 위반 검사
        self._check_handshake_violations(awvalid_signals, awready_signals, "AW Channel")
        self._check_handshake_violations(wvalid_signals, wready_signals, "W Channel")
        self._check_handshake_violations(arvalid_signals, arready_signals, "AR Channel")
    
    def _check_handshake_violations(self, valid_signals: List[SignalInfo], 
                                  ready_signals: List[SignalInfo], channel_name: str):
        """핸드셰이크 프로토콜 위반 검사"""
        if not valid_signals or not ready_signals:
            return
        
        violations = []
        
        for valid_sig in valid_signals:
            # 매칭되는 ready 신호 찾기
            ready_sig = None
            for r_sig in ready_signals:
                if valid_sig.name.replace('valid', '') == r_sig.name.replace('ready', ''):
                    ready_sig = r_sig
                    break
            
            if not ready_sig:
                continue
            
            valid_data = self.get_signal_data(valid_sig.full_path)
            ready_data = self.get_signal_data(ready_sig.full_path)
            
            # 위반 검사 로직 (간단한 예)
            valid_high_times = [tv.time for tv in valid_data if str(tv.value) == '1']
            ready_low_times = [tv.time for tv in ready_data if str(tv.value) == '0']
            
            # valid가 high인데 ready가 low인 상황이 너무 오래 지속되는지 확인
            for v_time in valid_high_times:
                concurrent_ready_low = [r_time for r_time in ready_low_times 
                                      if abs(r_time - v_time) < 10]  # 10 time unit 내
                if concurrent_ready_low:
                    violations.append(f"Potential deadlock at time {v_time}")
        
        if violations:
            print(f"\n{channel_name} Violations:")
            for violation in violations[:5]:  # 처음 5개만 출력
                print(f"  {violation}")
    
    def find_state_machine_transitions(self, state_signal_path: str) -> List[Tuple[int, str, str]]:
        """
        상태 머신의 상태 전환 찾기
        
        Args:
            state_signal_path: 상태 신호 경로
            
        Returns:
            (시간, 이전상태, 현재상태) 튜플의 리스트
        """
        data = self.get_signal_data(state_signal_path)
        transitions = []
        
        if len(data) < 2:
            return transitions
        
        prev_state = str(data[0].value)
        
        for i in range(1, len(data)):
            curr_state = str(data[i].value)
            if curr_state != prev_state:
                transitions.append((data[i].time, prev_state, curr_state))
                prev_state = curr_state
        
        return transitions
    
    def analyze_state_machine(self, state_signal_path: str):
        """상태 머신 분석"""
        transitions = self.find_state_machine_transitions(state_signal_path)
        
        print(f"State Machine Analysis: {state_signal_path}")
        print("-" * 50)
        print(f"Total Transitions: {len(transitions)}")
        
        if not transitions:
            print("No state transitions found")
            return
        
        # 상태별 통계
        state_counts = {}
        state_durations = {}
        
        for i, (time, prev_state, curr_state) in enumerate(transitions):
            state_counts[curr_state] = state_counts.get(curr_state, 0) + 1
            
            if i > 0:
                duration = time - transitions[i-1][0]
                if prev_state not in state_durations:
                    state_durations[prev_state] = []
                state_durations[prev_state].append(duration)
        
        print("\nState Statistics:")
        for state, count in sorted(state_counts.items()):
            avg_duration = 0
            if state in state_durations:
                avg_duration = sum(state_durations[state]) / len(state_durations[state])
            print(f"  {state}: {count} transitions, avg duration: {avg_duration:.2f}")
        
        print("\nFirst 10 Transitions:")
        for i, (time, prev_state, curr_state) in enumerate(transitions[:10]):
            print(f"  {time}: {prev_state} -> {curr_state}")
    
    def generate_timing_diagram(self, signal_paths: List[str], start_time: int = 0, 
                              end_time: Optional[int] = None, output_file: str = "timing_diagram.png"):
        """
        타이밍 다이어그램 생성
        
        Args:
            signal_paths: 다이어그램에 포함할 신호들
            start_time: 시작 시간
            end_time: 종료 시간
            output_file: 출력 파일명
        """
        if not MATPLOTLIB_AVAILABLE:
            print("matplotlib is not available. Cannot generate timing diagram.")
            return
        
        fig, ax = plt.subplots(figsize=(15, len(signal_paths) * 1.5))
        
        y_positions = range(len(signal_paths))
        colors = plt.cm.Set3(range(len(signal_paths)))
        
        for i, signal_path in enumerate(signal_paths):
            data = self.get_signal_data(signal_path, start_time, end_time)
            
            if not data:
                continue
            
            y = len(signal_paths) - 1 - i  # 위에서부터 그리기
            
            # 신호 파형 그리기
            prev_time = data[0].time
            prev_value = str(data[0].value)
            
            for j in range(1, len(data)):
                curr_time = data[j].time
                curr_value = str(data[j].value)
                
                # 이전 값 유지하는 선
                if prev_value in ['0', '1']:
                    level = 0.2 if prev_value == '0' else 0.8
                    ax.plot([prev_time, curr_time], [y + level, y + level], 
                           color=colors[i], linewidth=2)
                
                # 전환 선 (수직선)
                if prev_value != curr_value and prev_value in ['0', '1'] and curr_value in ['0', '1']:
                    prev_level = 0.2 if prev_value == '0' else 0.8
                    curr_level = 0.2 if curr_value == '0' else 0.8
                    ax.plot([curr_time, curr_time], [y + prev_level, y + curr_level], 
                           color=colors[i], linewidth=2)
                
                prev_time = curr_time
                prev_value = curr_value
        
        # 축 설정
        ax.set_yticks(range(len(signal_paths)))
        ax.set_yticklabels([path.split('.')[-1] for path in reversed(signal_paths)])
        ax.set_xlabel('Time')
        ax.set_title('Timing Diagram')
        ax.grid(True, alpha=0.3)
        
        # 시간 범위 설정
        if end_time:
            ax.set_xlim(start_time, end_time)
        
        plt.tight_layout()
        plt.savefig(output_file, dpi=300, bbox_inches='tight')
        print(f"Timing diagram saved to {output_file}")
    
    def export_to_dataframe(self, signal_paths: List[str], start_time: int = 0, 
                           end_time: Optional[int] = None) -> Optional[object]:
        """
        신호 데이터를 pandas DataFrame으로 내보내기
        
        Args:
            signal_paths: 내보낼 신호 경로들
            start_time: 시작 시간
            end_time: 종료 시간
            
        Returns:
            pandas DataFrame 또는 None
        """
        if not PANDAS_AVAILABLE:
            print("pandas is not available. Cannot create DataFrame.")
            return None
        
        # 모든 신호의 데이터 수집
        all_data = {}
        all_times = set()
        
        for signal_path in signal_paths:
            data = self.get_signal_data(signal_path, start_time, end_time)
            signal_data = {tv.time: tv.value for tv in data}
            all_data[signal_path] = signal_data
            all_times.update(signal_data.keys())
        
        # DataFrame 생성
        df_data = []
        for time in sorted(all_times):
            row = {'Time': time}
            for signal_path in signal_paths:
                value = all_data[signal_path].get(time, None)
                row[signal_path] = value
            df_data.append(row)
        
        df = pd.DataFrame(df_data)
        return df
    
    def find_glitches(self, signal_path: str, min_duration: int = 1) -> List[Tuple[int, int]]:
        """
        신호에서 글리치(짧은 펄스) 찾기
        
        Args:
            signal_path: 분석할 신호 경로
            min_duration: 최소 지속 시간
            
        Returns:
            (시작시간, 종료시간) 튜플의 리스트
        """
        data = self.get_signal_data(signal_path)
        glitches = []
        
        if len(data) < 3:
            return glitches
        
        for i in range(1, len(data) - 1):
            prev_val = str(data[i-1].value)
            curr_val = str(data[i].value)
            next_val = str(data[i+1].value)
            
            # 글리치 패턴: 0-1-0 또는 1-0-1
            if ((prev_val == '0' and curr_val == '1' and next_val == '0') or
                (prev_val == '1' and curr_val == '0' and next_val == '1')):
                
                duration = data[i+1].time - data[i].time
                if duration <= min_duration:
                    glitches.append((data[i].time, data[i+1].time))
        
        return glitches
    
    def generate_coverage_report(self, signal_patterns: List[str], output_file: str = "coverage_report.html"):
        """
        커버리지 리포트 생성
        
        Args:
            signal_patterns: 분석할 신호 패턴들
            output_file: 출력 HTML 파일명
        """
        html_content = """
        <!DOCTYPE html>
        <html>
        <head>
            <title>FSDB Coverage Report</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 20px; }
                table { border-collapse: collapse; width: 100%; }
                th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                th { background-color: #f2f2f2; }
                .high-coverage { background-color: #d4edda; }
                .medium-coverage { background-color: #fff3cd; }
                .low-coverage { background-color: #f8d7da; }
            </style>
        </head>
        <body>
            <h1>FSDB Coverage Report</h1>
            <p>Generated from: {}</p>
            <table>
                <tr>
                    <th>Signal Pattern</th>
                    <th>Signals Found</th>
                    <th>Transitions</th>
                    <th>Coverage</th>
                </tr>
        """.format(self.fsdb_file)
        
        for pattern in signal_patterns:
            signals = self.find_signals(pattern)
            total_transitions = 0
            
            for signal in signals[:10]:  # 처음 10개 신호만 분석
                data = self.get_signal_data(signal.full_path)
                total_transitions += len(data)
            
            # 간단한 커버리지 계산 (실제로는 더 복잡한 로직 필요)
            coverage = min(100, (total_transitions / 100) * 10)  # 예시 계산
            
            coverage_class = "low-coverage"
            if coverage >= 80:
                coverage_class = "high-coverage"
            elif coverage >= 50:
                coverage_class = "medium-coverage"
            
            html_content += f"""
                <tr class="{coverage_class}">
                    <td>{pattern}</td>
                    <td>{len(signals)}</td>
                    <td>{total_transitions}</td>
                    <td>{coverage:.1f}%</td>
                </tr>
            """
        
        html_content += """
            </table>
        </body>
        </html>
        """
        
        with open(output_file, 'w') as f:
            f.write(html_content)
        
        print(f"Coverage report saved to {output_file}")


def main():
    """메인 함수 - 사용 예제"""
    if len(sys.argv) < 2:
        print("Usage: python fsdb_analyzer.py <fsdb_file>")
        return
    
    fsdb_file = sys.argv[1]
    
    try:
        with FSDBAnalyzer(fsdb_file) as analyzer:
            # 기본 정보
            analyzer.print_info()
            
            # 클럭 신호 찾기 및 분석
            clk_signals = analyzer.find_signals("*clk*")
            if clk_signals:
                print(f"\nAnalyzing clock: {clk_signals[0].full_path}")
                analyzer.analyze_signal(clk_signals[0].full_path)
            
            # 상태 머신 분석 (예시)
            state_signals = analyzer.find_signals("*state*")
            if state_signals:
                print(f"\nAnalyzing state machine: {state_signals[0].full_path}")
                analyzer.analyze_state_machine(state_signals[0].full_path)
            
            # 타이밍 다이어그램 생성
            if len(clk_signals) > 0:
                important_signals = [clk_signals[0].full_path]
                rst_signals = analyzer.find_signals("*rst*")
                if rst_signals:
                    important_signals.append(rst_signals[0].full_path)
                
                analyzer.generate_timing_diagram(important_signals, 0, 1000)
            
            # 커버리지 리포트 생성
            analyzer.generate_coverage_report(["*clk*", "*rst*", "*valid*", "*ready*"])
            
    except Exception as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    main()
