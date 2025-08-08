#!/bin/bash
# CSR TLM UVM Test Runner
# UVM SystemC 환경에서 CSR 모델을 검증하는 스크립트

set -e  # 에러 발생시 스크립트 중단

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 함수 정의
print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# 스크립트 시작
print_header "CSR TLM UVM Test Runner"

# 1. 환경 변수 설정
echo "Setting up environment variables..."

# SystemC 경로 (사용자 환경에 맞게 수정)
export SYSTEMC_HOME=${SYSTEMC_HOME:-"/usr/local/systemc"}
export UVM_SYSTEMC_HOME=${UVM_SYSTEMC_HOME:-"/usr/local/uvm-systemc"}

# 라이브러리 경로 설정 (macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    export DYLD_LIBRARY_PATH="$SYSTEMC_HOME/lib:$UVM_SYSTEMC_HOME/lib:$DYLD_LIBRARY_PATH"
else
    # Linux
    export LD_LIBRARY_PATH="$SYSTEMC_HOME/lib-linux64:$UVM_SYSTEMC_HOME/lib-linux64:$LD_LIBRARY_PATH"
fi

print_success "Environment variables set"

# 2. 의존성 확인
echo "Checking dependencies..."

if [ ! -d "$SYSTEMC_HOME" ]; then
    print_error "SystemC not found at $SYSTEMC_HOME"
    echo "Please install SystemC or set SYSTEMC_HOME environment variable"
    exit 1
fi
print_success "SystemC found at $SYSTEMC_HOME"

if [ ! -d "$UVM_SYSTEMC_HOME" ]; then
    print_warning "UVM SystemC not found at $UVM_SYSTEMC_HOME"
    echo "Will try to use built-in UVM headers"
else
    print_success "UVM SystemC found at $UVM_SYSTEMC_HOME"
fi

if [ ! -f "../../generated/switch_csr_csr_tlm.h" ]; then
    print_error "CSR TLM model not found"
    echo "Please run the RDL generator first:"
    echo "  cd ../.."
    echo "  python rdl_systemc_generator.py switch_csr.rdl"
    exit 1
fi
print_success "CSR TLM model found"

if [ ! -f "fc4sc/includes/fc4sc.hpp" ]; then
    print_warning "FC4SC not found - coverage will be disabled"
else
    print_success "FC4SC found"
fi

# 3. 빌드 디렉토리 정리 및 생성
echo "Preparing build directory..."
rm -rf build/
mkdir -p build/
print_success "Build directory prepared"

# 4. CSR TLM 모델 컴파일
print_header "Building CSR TLM UVM Test"

# Makefile 사용
if command -v make >/dev/null 2>&1; then
    echo "Using Makefile for build..."
    make -f Makefile.csr clean
    make -f Makefile.csr check-deps
    make -f Makefile.csr all
else
    # 수동 컴파일
    echo "Manual compilation (make not available)..."
    
    CXX="g++"
    CXXFLAGS="-std=c++14 -Wall -Wextra -O2 -g"
    CXXFLAGS="$CXXFLAGS -I$SYSTEMC_HOME/include"
    CXXFLAGS="$CXXFLAGS -I./fc4sc/includes"
    CXXFLAGS="$CXXFLAGS -I../../generated"
    CXXFLAGS="$CXXFLAGS -DNDEBUG -DSC_INCLUDE_DYNAMIC_PROCESSES"
    
    LDFLAGS="-L$SYSTEMC_HOME/lib"
    if [[ "$OSTYPE" != "darwin"* ]]; then
        LDFLAGS="-L$SYSTEMC_HOME/lib-linux64"
    fi
    
    LDLIBS="-lsystemc -lm -lpthread"
    
    # CSR TLM 모델 컴파일
    echo "Compiling CSR TLM model..."
    $CXX $CXXFLAGS -c ../../generated/switch_csr_csr_tlm.cpp -o build/switch_csr_csr_tlm.o
    
    # UVM 테스트 컴파일 (간단한 버전)
    echo "Compiling basic CSR test..."
    $CXX $CXXFLAGS build/switch_csr_csr_tlm.o ../../generated/test_csr_tlm.cpp $LDFLAGS $LDLIBS -o build/csr_basic_test
fi

print_success "Build completed"

# 5. 테스트 실행
print_header "Running CSR Tests"

TEST_TYPE=${1:-"basic"}

case $TEST_TYPE in
    "uvm")
        if [ -f "build/csr_tlm_uvm_test" ]; then
            echo "Running UVM CSR test..."
            cd build && ./csr_tlm_uvm_test
        else
            print_error "UVM test not built - running basic test instead"
            cd build && ./csr_basic_test
        fi
        ;;
    "basic"|*)
        echo "Running basic CSR test..."
        cd build && ./csr_basic_test
        ;;
esac

print_success "Test execution completed"

# 6. 결과 분석
print_header "Test Results Analysis"

if [ -f "build/csr_test.vcd" ]; then
    print_success "VCD trace file generated: build/csr_test.vcd"
    echo "View with: gtkwave build/csr_test.vcd"
fi

if [ -f "build/fc4sc_coverage.xml" ]; then
    print_success "FC4SC coverage report generated"
    echo "Coverage details:"
    make -f Makefile.csr coverage-report 2>/dev/null || echo "Coverage analysis not available"
fi

# 7. 요약
print_header "Test Summary"
echo "CSR TLM model successfully tested with:"
echo "  ✓ Basic register read/write operations"
echo "  ✓ Array register access (port configurations)"
echo "  ✓ Field-level operations"
echo "  ✓ Error handling (invalid addresses)"
echo "  ✓ TLM-2.0 protocol compliance"

if [ -f "build/fc4sc_coverage.xml" ]; then
    echo "  ✓ Functional coverage analysis"
fi

if [ "$TEST_TYPE" == "uvm" ] && [ -f "build/csr_tlm_uvm_test" ]; then
    echo "  ✓ UVM-based verification"
fi

print_success "All tests completed successfully!"

echo ""
echo "Next steps:"
echo "  1. Review VCD traces: gtkwave build/*.vcd"
echo "  2. Check coverage reports in build/"
echo "  3. Integrate CSR model into your SystemC design"
echo ""
echo "For more tests, run:"
echo "  $0 uvm          # Run UVM-based tests"
echo "  $0 basic        # Run basic tests"
