# =============================================================================
# UVM SystemC Ingress Port Manager Verification Makefile
# =============================================================================

# Compiler and tools
CXX = g++
SYSTEMC_HOME ?= /opt/homebrew/systemc-main
UVM_SYSTEMC_HOME ?= /opt/homebrew/uvm-systemc

# Directories
SRCDIR = .
BUILDDIR = build
TESTDIR = tests
TBDIR = testbench
AGENTDIR = agents
SEQDIR = sequences
SBDIR = scoreboards
COMMONDIR = common

# SystemC DUT source
DUT_SRCDIR = ../systemc/port_manager
DUT_COMMON = ../systemc/common

# Include paths
INCLUDES = -I$(SYSTEMC_HOME)/include \
           -I$(UVM_SYSTEMC_HOME)/include \
           -I$(SRCDIR) \
           -I$(DUT_SRCDIR) \
           -I$(DUT_COMMON)

# Library paths
LIBDIRS = -L$(SYSTEMC_HOME)/lib \
          -L$(UVM_SYSTEMC_HOME)/lib-macosarm64

# Libraries (UVM-SystemC successfully installed)
LIBS = -lsystemc -luvm-systemc -lpthread

# Compiler flags
CXXFLAGS = -std=c++17 -Wall -Wextra -O2 -g \
           -DSC_INCLUDE_DYNAMIC_PROCESSES \
           -DUVM_IMPLEMENTATION \
           $(INCLUDES)

# Linker flags
LDFLAGS = $(LIBDIRS) -Wl,-rpath,$(SYSTEMC_HOME)/lib -Wl,-rpath,$(UVM_SYSTEMC_HOME)/lib-macosarm64 $(LIBS)

# Source files
DUT_SOURCES = $(DUT_SRCDIR)/ingress_port_manager.cpp
TEST_SOURCES = $(TESTDIR)/simple_uvm_test_fixed.cpp
SYSTEMC_ONLY_SOURCES = $(TESTDIR)/simple_systemc_only.cpp
UVM_COMPLETE_SOURCES = $(TESTDIR)/simple_uvm_complete.cpp
UVM_BASIC_SOURCES = $(TESTDIR)/simple_uvm_basic.cpp
INGRESS_PM_UVM_SOURCES = $(TESTDIR)/ingress_pm_uvm_test.cpp
INGRESS_PM_SIMPLE_SOURCES = $(TESTDIR)/ingress_pm_simple_uvm.cpp
INGRESS_PM_SYSTEMC_SOURCES = $(TESTDIR)/ingress_pm_systemc_test.cpp
INGRESS_PM_UVM_COMPLETE_SOURCES = $(TESTDIR)/ingress_pm_uvm_complete.cpp
INGRESS_PM_UVM_SIMPLE_SOURCES = $(TESTDIR)/ingress_pm_uvm_simple.cpp
INGRESS_PM_UVM_STYLE_SOURCES = $(TESTDIR)/ingress_pm_uvm_style.cpp
INGRESS_PM_COVERAGE_SOURCES = $(TESTDIR)/ingress_pm_coverage_test.cpp
INGRESS_PM_FC4SC_SOURCES = $(TESTDIR)/ingress_pm_fc4sc_test.cpp

# Header dependencies
HEADERS = $(DUT_SRCDIR)/ingress_port_manager.h \
          $(DUT_COMMON)/switch_types.h

# Target executable
TARGET = $(BUILDDIR)/uvm_ingress_pm_test
SYSTEMC_TARGET = $(BUILDDIR)/systemc_basic_test
UVM_COMPLETE_TARGET = $(BUILDDIR)/uvm_complete_test
UVM_BASIC_TARGET = $(BUILDDIR)/uvm_basic_test
INGRESS_PM_UVM_TARGET = $(BUILDDIR)/ingress_pm_uvm_test
INGRESS_PM_SIMPLE_TARGET = $(BUILDDIR)/ingress_pm_simple_test
INGRESS_PM_SYSTEMC_TARGET = $(BUILDDIR)/ingress_pm_systemc_test
INGRESS_PM_UVM_COMPLETE_TARGET = $(BUILDDIR)/ingress_pm_uvm_complete_test
INGRESS_PM_UVM_SIMPLE_TARGET = $(BUILDDIR)/ingress_pm_uvm_simple_test
INGRESS_PM_UVM_STYLE_TARGET = $(BUILDDIR)/ingress_pm_uvm_style_test
INGRESS_PM_COVERAGE_TARGET = $(BUILDDIR)/ingress_pm_coverage_test
INGRESS_PM_FC4SC_TARGET = $(BUILDDIR)/ingress_pm_fc4sc_test
INGRESS_PM_REAL_FC4SC_TARGET = $(BUILDDIR)/ingress_pm_real_fc4sc_test

# Default target
all: $(TARGET)

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Build main target
$(TARGET): $(BUILDDIR) $(DUT_SOURCES) $(TEST_SOURCES) $(HEADERS)
	@echo "=== Building UVM SystemC Ingress Port Manager Test ==="
	$(CXX) $(CXXFLAGS) -o $@ $(TEST_SOURCES) $(LDFLAGS)
	@echo "=== Build Complete: $@ ==="

# Build SystemC only target (no UVM dependencies)
$(SYSTEMC_TARGET): $(BUILDDIR) $(SYSTEMC_ONLY_SOURCES)
	@echo "=== Building Pure SystemC Basic Test ==="
	$(CXX) -std=c++17 -Wall -Wextra -O2 -g \
	       -I$(SYSTEMC_HOME)/include \
	       -L$(SYSTEMC_HOME)/lib \
	       -Wl,-rpath,$(SYSTEMC_HOME)/lib \
	       -lsystemc \
	       -o $@ $(SYSTEMC_ONLY_SOURCES)
	@echo "=== Build Complete: $@ ==="

# Build UVM + DUT complete test
$(UVM_COMPLETE_TARGET): $(BUILDDIR) $(UVM_COMPLETE_SOURCES)
	@echo "=== Building UVM + DUT Complete Test ==="
	$(CXX) $(CXXFLAGS) -I$(TESTDIR) -o $@ $(UVM_COMPLETE_SOURCES) $(LDFLAGS)
	@echo "=== Build Complete: $@ ==="

# Build UVM basic test (no DUT, just UVM components)
$(UVM_BASIC_TARGET): $(BUILDDIR) $(UVM_BASIC_SOURCES)
	@echo "=== Building UVM Basic Test ==="
	$(CXX) $(CXXFLAGS) -I$(TESTDIR) -o $@ $(UVM_BASIC_SOURCES) $(LDFLAGS)
	@echo "=== Build Complete: $@ ==="

# Build Ingress Port Manager UVM test (with real DUT)
$(INGRESS_PM_UVM_TARGET): $(BUILDDIR) $(INGRESS_PM_UVM_SOURCES) $(DUT_SOURCES) $(HEADERS)
	@echo "=== Building Ingress Port Manager UVM Test ==="
	$(CXX) $(CXXFLAGS) -I$(TESTDIR) -o $@ $(INGRESS_PM_UVM_SOURCES) $(DUT_SOURCES) $(LDFLAGS)
	@echo "=== Build Complete: $@ ==="

# Build Ingress Port Manager Simple UVM test (simplified version)
$(INGRESS_PM_SIMPLE_TARGET): $(BUILDDIR) $(INGRESS_PM_SIMPLE_SOURCES) $(DUT_SOURCES) $(HEADERS)
	@echo "=== Building Ingress Port Manager Simple UVM Test ==="
	$(CXX) $(CXXFLAGS) -I$(TESTDIR) -o $@ $(INGRESS_PM_SIMPLE_SOURCES) $(DUT_SOURCES) $(LDFLAGS)
	@echo "=== Build Complete: $@ ==="

# Build Ingress Port Manager Pure SystemC test (no UVM)
$(INGRESS_PM_SYSTEMC_TARGET): $(BUILDDIR) $(INGRESS_PM_SYSTEMC_SOURCES) $(DUT_SOURCES) $(HEADERS)
	@echo "=== Building Ingress Port Manager Pure SystemC Test ==="
	$(CXX) -std=c++17 -Wall -Wextra -O2 -g \
	       -I$(SYSTEMC_HOME)/include \
	       -L$(SYSTEMC_HOME)/lib \
	       -Wl,-rpath,$(SYSTEMC_HOME)/lib \
	       -lsystemc \
	       -I$(TESTDIR) \
	       -o $@ $(INGRESS_PM_SYSTEMC_SOURCES) $(DUT_SOURCES)
	@echo "=== Build Complete: $@ ==="

# Build Ingress Port Manager UVM Complete test (full UVM integration)
$(INGRESS_PM_UVM_COMPLETE_TARGET): $(BUILDDIR) $(INGRESS_PM_UVM_COMPLETE_SOURCES) $(DUT_SOURCES) $(HEADERS)
	@echo "=== Building Ingress Port Manager UVM Complete Test ==="
	$(CXX) $(CXXFLAGS) -I$(TESTDIR) -o $@ $(INGRESS_PM_UVM_COMPLETE_SOURCES) $(DUT_SOURCES) $(LDFLAGS)
	@echo "=== Build Complete: $@ ==="

# Build Ingress Port Manager UVM Simple test (working UVM integration)
$(INGRESS_PM_UVM_SIMPLE_TARGET): $(BUILDDIR) $(INGRESS_PM_UVM_SIMPLE_SOURCES) $(DUT_SOURCES) $(HEADERS)
	@echo "=== Building Ingress Port Manager UVM Simple Test ==="
	$(CXX) $(CXXFLAGS) -I$(TESTDIR) -o $@ $(INGRESS_PM_UVM_SIMPLE_SOURCES) $(DUT_SOURCES) $(LDFLAGS)
	@echo "=== Build Complete: $@ ==="

# Build Ingress Port Manager UVM Style test (UVM methodology without UVM library)
$(INGRESS_PM_UVM_STYLE_TARGET): $(BUILDDIR) $(INGRESS_PM_UVM_STYLE_SOURCES) $(DUT_SOURCES) $(HEADERS)
	@echo "=== Building Ingress Port Manager UVM Style Test ==="
	$(CXX) $(CXXFLAGS) \
	       -I$(SYSTEMC_HOME)/include \
	       -L$(SYSTEMC_HOME)/lib \
	       -Wl,-rpath,$(SYSTEMC_HOME)/lib \
	       -lsystemc \
	       -I$(TESTDIR) \
	       -o $@ $(INGRESS_PM_UVM_STYLE_SOURCES) $(DUT_SOURCES)
	@echo "=== Build Complete: $@ ==="

# Build Ingress Port Manager Coverage test (Coverage-driven verification)
$(INGRESS_PM_COVERAGE_TARGET): $(BUILDDIR) $(INGRESS_PM_COVERAGE_SOURCES) $(DUT_SOURCES) $(HEADERS)
	@echo "=== Building Ingress Port Manager Coverage Test ==="
	$(CXX) $(CXXFLAGS) \
	       -I$(SYSTEMC_HOME)/include \
	       -L$(SYSTEMC_HOME)/lib \
	       -Wl,-rpath,$(SYSTEMC_HOME)/lib \
	       -lsystemc \
	       -I$(TESTDIR) \
	       -o $@ $(INGRESS_PM_COVERAGE_SOURCES) $(DUT_SOURCES)
	@echo "=== Build Complete: $@ ==="

# Build Ingress Port Manager FC4SC test (FC4SC-based coverage verification)
$(INGRESS_PM_FC4SC_TARGET): $(BUILDDIR) $(INGRESS_PM_FC4SC_SOURCES) $(DUT_SOURCES) $(HEADERS)
	@echo "=== Building Ingress Port Manager FC4SC Test ==="
	$(CXX) $(CXXFLAGS) \
	       -I$(SYSTEMC_HOME)/include \
	       -L$(SYSTEMC_HOME)/lib \
	       -Wl,-rpath,$(SYSTEMC_HOME)/lib \
	       -lsystemc \
	       -I$(TESTDIR) \
	       -I../fc4sc/includes \
	       -o $@ $(INGRESS_PM_FC4SC_SOURCES) $(DUT_SOURCES)
	@echo "=== Build Complete: $@ ==="

$(INGRESS_PM_REAL_FC4SC_TARGET): $(BUILDDIR) $(TESTDIR)/ingress_pm_real_fc4sc_test.cpp $(DUT_SOURCES) $(HEADERS)
	@echo "=== Building Ingress Port Manager Real FC4SC Test ==="
	$(CXX) $(CXXFLAGS) \
	       -I$(SYSTEMC_HOME)/include \
	       -L$(SYSTEMC_HOME)/lib \
	       -Wl,-rpath,$(SYSTEMC_HOME)/lib \
	       -lsystemc \
	       -I$(TESTDIR) \
	       -I./fc4sc/includes \
	       -o $@ $(TESTDIR)/ingress_pm_real_fc4sc_test.cpp $(DUT_SOURCES)
	@echo "=== Real FC4SC Build Complete: $@ ==="

# Individual test targets
test: $(TARGET)
	@echo "=== Running UVM SystemC Test ==="
	cd $(BUILDDIR) && ./uvm_ingress_pm_test

test-systemc: $(SYSTEMC_TARGET)
	@echo "=== Running Pure SystemC Test ==="
	cd $(BUILDDIR) && ./systemc_basic_test

test-complete: $(UVM_COMPLETE_TARGET)
	@echo "=== Running UVM + DUT Complete Test ==="
	cd $(BUILDDIR) && ./uvm_complete_test

test-basic: $(UVM_BASIC_TARGET)
	@echo "=== Running UVM Basic Test ==="
	cd $(BUILDDIR) && ./uvm_basic_test

test-ingress-pm: $(INGRESS_PM_UVM_TARGET)
	@echo "=== Running Ingress Port Manager UVM Test ==="
	cd $(BUILDDIR) && ./ingress_pm_uvm_test

test-ingress-pm-simple: $(INGRESS_PM_SIMPLE_TARGET)
	@echo "=== Running Ingress Port Manager Simple UVM Test ==="
	cd $(BUILDDIR) && ./ingress_pm_simple_test

test-ingress-pm-systemc: $(INGRESS_PM_SYSTEMC_TARGET)
	@echo "=== Running Ingress Port Manager Pure SystemC Test ==="
	cd $(BUILDDIR) && ./ingress_pm_systemc_test

test-ingress-pm-uvm-complete: $(INGRESS_PM_UVM_COMPLETE_TARGET)
	@echo "=== Running Ingress Port Manager UVM Complete Test ==="
	cd $(BUILDDIR) && ./ingress_pm_uvm_complete_test

test-ingress-pm-uvm-simple: $(INGRESS_PM_UVM_SIMPLE_TARGET)
	@echo "=== Running Ingress Port Manager UVM Simple Test ==="
	cd $(BUILDDIR) && ./ingress_pm_uvm_simple_test

test-ingress-pm-uvm-style: $(INGRESS_PM_UVM_STYLE_TARGET)
	@echo "=== Running Ingress Port Manager UVM Style Test ==="
	cd $(BUILDDIR) && ./ingress_pm_uvm_style_test

test-ingress-pm-coverage: $(INGRESS_PM_COVERAGE_TARGET)
	@echo "=== Running Ingress Port Manager Coverage Test ==="
	cd $(BUILDDIR) && ./ingress_pm_coverage_test
	@echo "Coverage report generated: build/coverage_report.html"

test-ingress-pm-fc4sc: $(INGRESS_PM_FC4SC_TARGET)
	@echo "=== Running Ingress Port Manager FC4SC Test ==="
	cd $(BUILDDIR) && ./ingress_pm_fc4sc_test
	@echo "FC4SC coverage report generated: build/fc4sc_coverage_report.xml"

test-ingress-pm-real-fc4sc: $(INGRESS_PM_REAL_FC4SC_TARGET)
	@echo "=== Running Ingress Port Manager Real FC4SC Test ==="
	cd $(BUILDDIR) && ./ingress_pm_real_fc4sc_test
	@echo "Real FC4SC coverage report generated: build/real_fc4sc_coverage_report.xml"

trace: $(TARGET)
	@echo "=== Running Test with VCD Trace ==="
	cd $(BUILDDIR) && ./uvm_ingress_pm_test +trace
	@echo "VCD file generated: $(BUILDDIR)/uvm_ingress_pm_test.vcd"

# Generate waveforms 
waves: trace

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR)
	@echo "=== Build artifacts cleaned ==="

# Help target
help:
	@echo "UVM SystemC Ingress Port Manager Verification Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  all           - Build the test executable"
	@echo "  basic         - Run basic functionality test"
	@echo "  multiple      - Run multiple packets test"
	@echo "  backpressure  - Run backpressure test"
	@echo "  mixed         - Run mixed packet types test"
	@echo "  stress        - Run stress test"
	@echo "  test-all      - Run all tests in sequence"
	@echo "  test-verbose  - Run with high verbosity"
	@echo "  test-debug    - Run with debug verbosity"
	@echo "  waves         - Run with waveform generation"
	@echo "  clean         - Clean build artifacts"
	@echo "  help          - Show this help"
	@echo ""
	@echo "Environment Variables:"
	@echo "  SYSTEMC_HOME      - Path to SystemC installation"
	@echo "  UVM_SYSTEMC_HOME  - Path to UVM-SystemC installation"
	@echo ""
	@echo "Examples:"
	@echo "  make basic                    # Run basic test"
	@echo "  make stress                   # Run stress test"
	@echo "  make test-all                 # Run all tests"
	@echo "  make waves                    # Generate waveforms"

# Check environment
check-env:
	@echo "=== Environment Check ==="
	@echo "SYSTEMC_HOME: $(SYSTEMC_HOME)"
	@echo "UVM_SYSTEMC_HOME: $(UVM_SYSTEMC_HOME)"
	@if [ ! -d "$(SYSTEMC_HOME)" ]; then \
		echo "ERROR: SystemC not found at $(SYSTEMC_HOME)"; \
		exit 1; \
	fi
	@if [ ! -d "$(UVM_SYSTEMC_HOME)" ]; then \
		echo "ERROR: UVM-SystemC not found at $(UVM_SYSTEMC_HOME)"; \
		exit 1; \
	fi
	@echo "Environment OK"

# Install dependencies (Ubuntu/Debian example)
install-deps:
	@echo "=== Installing Dependencies ==="
	@echo "Note: This is an example for Ubuntu/Debian systems"
	@echo "You may need to adjust for your system"
	sudo apt-get update
	sudo apt-get install -y build-essential cmake git
	@echo "Please install SystemC and UVM-SystemC manually:"
	@echo "1. Download SystemC from https://systemc.org/"
	@echo "2. Download UVM-SystemC from https://www.accellera.org/"
	@echo "3. Set SYSTEMC_HOME and UVM_SYSTEMC_HOME environment variables"

# Simple FC4SC Test (following official examples)
SIMPLE_FC4SC_SOURCES = $(TESTDIR)/simple_fc4sc_test.cpp
SIMPLE_FC4SC_TARGET = $(BUILDDIR)/simple_fc4sc_test

$(SIMPLE_FC4SC_TARGET): $(BUILDDIR) $(TESTDIR)/simple_fc4sc_test.cpp
	@echo "=== Building Simple FC4SC Test ==="
	g++ -std=c++17 -Wall -Wextra \
	       -I/opt/homebrew/opt/systemc/include \
	       -L/opt/homebrew/opt/systemc/lib \
	       -Wl,-rpath,/opt/homebrew/opt/systemc/lib \
	       -lsystemc \
	       -I$(TESTDIR) \
	       -I./fc4sc/includes \
	       -o $@ $(TESTDIR)/simple_fc4sc_test.cpp
	@echo "=== Simple FC4SC Build Complete: $@ ==="

test-simple-fc4sc: $(SIMPLE_FC4SC_TARGET)
	@echo "=== Running Simple FC4SC Test ==="
	cd $(BUILDDIR) && ./simple_fc4sc_test
	@echo "Simple FC4SC coverage report generated: build/simple_fc4sc_coverage.xml"

# Fixed FC4SC Test (with uint fix)
FIXED_FC4SC_SOURCES = $(TESTDIR)/fixed_fc4sc_test.cpp
FIXED_FC4SC_TARGET = $(BUILDDIR)/fixed_fc4sc_test

$(FIXED_FC4SC_TARGET): $(BUILDDIR) $(TESTDIR)/fixed_fc4sc_test.cpp
	@echo "=== Building Fixed FC4SC Test ==="
	g++ -std=c++17 -Wall -Wextra \
	       -I/opt/homebrew/opt/systemc/include \
	       -L/opt/homebrew/opt/systemc/lib \
	       -Wl,-rpath,/opt/homebrew/opt/systemc/lib \
	       -lsystemc \
	       -I$(TESTDIR) \
	       -I./fc4sc/includes \
	       -o $@ $(TESTDIR)/fixed_fc4sc_test.cpp
	@echo "=== Fixed FC4SC Build Complete: $@ ==="

test-fixed-fc4sc: $(FIXED_FC4SC_TARGET)
	@echo "=== Running Fixed FC4SC Test ==="
	cd $(BUILDDIR) && ./fixed_fc4sc_test
	@echo "Fixed FC4SC coverage report generated: build/fixed_fc4sc_coverage.xml"

# Real FC4SC Simple Test (following official examples)
REAL_FC4SC_SIMPLE_SOURCES = $(TESTDIR)/real_fc4sc_simple_test.cpp
REAL_FC4SC_SIMPLE_TARGET = $(BUILDDIR)/real_fc4sc_simple_test

$(REAL_FC4SC_SIMPLE_TARGET): $(BUILDDIR) $(TESTDIR)/real_fc4sc_simple_test.cpp
	@echo "=== Building Real FC4SC Simple Test ==="
	gcc-15 -std=c++17 -Wall -Wextra \
	       -I./fc4sc/includes \
	       -o $@ $(TESTDIR)/real_fc4sc_simple_test.cpp
	@echo "=== Real FC4SC Simple Build Complete: $@ ==="

test-real-fc4sc-simple: $(REAL_FC4SC_SIMPLE_TARGET)
	@echo "=== Running Real FC4SC Simple Test ==="
	cd $(BUILDDIR) && ./real_fc4sc_simple_test
	@echo "Real FC4SC coverage report generated: build/real_fc4sc_coverage_report.xml"

# Error Injection Test
ERROR_TEST_SOURCES = $(TESTDIR)/ingress_pm_error_test.cpp
ERROR_TEST_TARGET = $(BUILDDIR)/ingress_pm_error_test

$(ERROR_TEST_TARGET): $(BUILDDIR) $(TESTDIR)/ingress_pm_error_test.cpp $(COMMON_HEADERS)
	@echo "=== Building Error Injection Test ==="
	$(CXX) $(CXXFLAGS) $(INCLUDES) \
	       -o $@ $(TESTDIR)/ingress_pm_error_test.cpp $(LDFLAGS)
	@echo "=== Error Test Build Complete: $@ ==="

test-error: $(ERROR_TEST_TARGET)
	@echo "=== Running Error Injection Test ==="
	cd $(BUILDDIR) && ./ingress_pm_error_test
	@echo "Error injection test completed with comprehensive error coverage"

# Simple Error Test (SystemC only)
SIMPLE_ERROR_SOURCES = $(TESTDIR)/simple_error_test.cpp
SIMPLE_ERROR_TARGET = $(BUILDDIR)/simple_error_test

$(SIMPLE_ERROR_TARGET): $(BUILDDIR) $(TESTDIR)/simple_error_test.cpp
	@echo "=== Building Simple Error Test ==="
	$(CXX) -std=c++17 -Wall -Wextra \
	       -I/opt/homebrew/opt/systemc/include \
	       -L/opt/homebrew/opt/systemc/lib \
	       -Wl,-rpath,/opt/homebrew/opt/systemc/lib \
	       -lsystemc \
	       -o $@ $(TESTDIR)/simple_error_test.cpp
	@echo "=== Simple Error Test Build Complete: $@ ==="

test-simple-error: $(SIMPLE_ERROR_TARGET)
	@echo "=== Running Simple Error Test ==="
	cd $(BUILDDIR) && ./simple_error_test
	@echo "Simple error injection test completed"

# Working Simple Error Test (fixed SystemC syntax)
WORKING_ERROR_SOURCES = $(TESTDIR)/working_simple_error_test.cpp
WORKING_ERROR_TARGET = $(BUILDDIR)/working_simple_error_test

$(WORKING_ERROR_TARGET): $(BUILDDIR) $(TESTDIR)/working_simple_error_test.cpp
	@echo "=== Building Working Simple Error Test ==="
	$(CXX) -std=c++17 -Wall -Wextra \
	       -I/opt/homebrew/opt/systemc/include \
	       -L/opt/homebrew/opt/systemc/lib \
	       -Wl,-rpath,/opt/homebrew/opt/systemc/lib \
	       -lsystemc \
	       -o $@ $(TESTDIR)/working_simple_error_test.cpp
	@echo "=== Working Simple Error Test Build Complete: $@ ==="

test-working-error: $(WORKING_ERROR_TARGET)
	@echo "=== Running Working Simple Error Test ==="
	cd $(BUILDDIR) && ./working_simple_error_test
	@echo "Working error injection test completed successfully"

# Fixed Error Test (corrected SystemC syntax)
FIXED_ERROR_SOURCES = $(TESTDIR)/fixed_error_test.cpp
FIXED_ERROR_TARGET = $(BUILDDIR)/fixed_error_test

$(FIXED_ERROR_TARGET): $(BUILDDIR) $(TESTDIR)/fixed_error_test.cpp
	@echo "=== Building Fixed Error Test ==="
	$(CXX) -std=c++17 -Wall -Wextra \
	       -I/opt/homebrew/opt/systemc/include \
	       -L/opt/homebrew/opt/systemc/lib \
	       -Wl,-rpath,/opt/homebrew/opt/systemc/lib \
	       -lsystemc \
	       -o $@ $(TESTDIR)/fixed_error_test.cpp
	@echo "=== Fixed Error Test Build Complete: $@ ==="

test-fixed-error: $(FIXED_ERROR_TARGET)
	@echo "=== Running Fixed Error Test ==="
	cd $(BUILDDIR) && ./fixed_error_test
	@echo "Fixed error injection test completed successfully"

# UVM Error Test (complete UVM-based error injection)
UVM_ERROR_SOURCES = $(TESTDIR)/uvm_error_test.cpp
UVM_ERROR_TARGET = $(BUILDDIR)/uvm_error_test

$(UVM_ERROR_TARGET): $(BUILDDIR) $(TESTDIR)/uvm_error_test.cpp
	@echo "=== Building UVM Error Test ==="
	$(CXX) $(CXXFLAGS) $(INCLUDES) \
	       -o $@ $(TESTDIR)/uvm_error_test.cpp $(LDFLAGS)
	@echo "=== UVM Error Test Build Complete: $@ ==="

test-uvm-error: $(UVM_ERROR_TARGET)
	@echo "=== Running UVM Error Test ==="
	cd $(BUILDDIR) && ./uvm_error_test
	@echo "UVM error injection test completed successfully"

# Simple UVM Error Test (simplified UVM-based error injection)
SIMPLE_UVM_ERROR_SOURCES = $(TESTDIR)/simple_uvm_error_test.cpp
SIMPLE_UVM_ERROR_TARGET = $(BUILDDIR)/simple_uvm_error_test

$(SIMPLE_UVM_ERROR_TARGET): $(BUILDDIR) $(TESTDIR)/simple_uvm_error_test.cpp
	@echo "=== Building Simple UVM Error Test ==="
	$(CXX) $(CXXFLAGS) $(INCLUDES) \
	       -o $@ $(TESTDIR)/simple_uvm_error_test.cpp $(LDFLAGS)
	@echo "=== Simple UVM Error Test Build Complete: $@ ==="

test-simple-uvm-error: $(SIMPLE_UVM_ERROR_TARGET)
	@echo "=== Running Simple UVM Error Test ==="
	cd $(BUILDDIR) && ./simple_uvm_error_test
	@echo "Simple UVM error injection test completed successfully"

# Final UVM Error Test (most stable UVM-based error injection)
FINAL_UVM_ERROR_SOURCES = $(TESTDIR)/final_uvm_error_test.cpp
FINAL_UVM_ERROR_TARGET = $(BUILDDIR)/final_uvm_error_test

$(FINAL_UVM_ERROR_TARGET): $(BUILDDIR) $(TESTDIR)/final_uvm_error_test.cpp
	@echo "=== Building Final UVM Error Test ==="
	$(CXX) $(CXXFLAGS) $(INCLUDES) \
	       -o $@ $(TESTDIR)/final_uvm_error_test.cpp $(LDFLAGS)
	@echo "=== Final UVM Error Test Build Complete: $@ ==="

test-final-uvm-error: $(FINAL_UVM_ERROR_TARGET)
	@echo "=== Running Final UVM Error Test ==="
	cd $(BUILDDIR) && ./final_uvm_error_test
	@echo "Final UVM error injection test completed successfully"

# Error Test with FC4SC Coverage (integrated coverage reporting)
ERROR_FC4SC_SOURCES = $(TESTDIR)/error_test_with_fc4sc.cpp
ERROR_FC4SC_TARGET = $(BUILDDIR)/error_test_with_fc4sc

$(ERROR_FC4SC_TARGET): $(BUILDDIR) $(TESTDIR)/error_test_with_fc4sc.cpp
	@echo "=== Building Error Test with FC4SC Coverage ==="
	$(CXX) -std=c++17 -Wall -Wextra \
	       -I/opt/homebrew/opt/systemc/include \
	       -L/opt/homebrew/opt/systemc/lib \
	       -Wl,-rpath,/opt/homebrew/opt/systemc/lib \
	       -lsystemc \
	       -o $@ $(TESTDIR)/error_test_with_fc4sc.cpp
	@echo "=== Error Test with FC4SC Coverage Build Complete: $@ ==="

test-error-fc4sc: $(ERROR_FC4SC_TARGET)
	@echo "=== Running Error Test with FC4SC Coverage ==="
	cd $(BUILDDIR) && ./error_test_with_fc4sc
	@echo "FC4SC coverage reports generated:"
	@echo "  - XML: build/error_fc4sc_coverage.xml"
	@echo "  - HTML: build/error_fc4sc_coverage.html"
	@echo "Error test with FC4SC coverage completed successfully"

# CSR UVM Test with FC4SC Coverage
CSR_UVM_FC4SC_SOURCES = $(TESTDIR)/csr_uvm_fc4sc_test.cpp
CSR_UVM_FC4SC_TARGET = $(BUILDDIR)/csr_uvm_fc4sc_test

$(CSR_UVM_FC4SC_TARGET): $(BUILDDIR) $(TESTDIR)/csr_uvm_fc4sc_test.cpp
	@echo "=== Building CSR UVM Test with FC4SC Coverage ==="
	$(CXX) -std=c++17 -Wall -Wextra \
	       -I/opt/homebrew/opt/systemc/include \
	       -L/opt/homebrew/opt/systemc/lib \
	       -Wl,-rpath,/opt/homebrew/opt/systemc/lib \
	       -lsystemc \
	       -o $@ $(TESTDIR)/csr_uvm_fc4sc_test.cpp
	@echo "=== CSR UVM Test with FC4SC Coverage Build Complete: $@ ==="

test-csr-uvm-fc4sc: $(CSR_UVM_FC4SC_TARGET)
	@echo "=== Running CSR UVM Test with FC4SC Coverage ==="
	cd $(BUILDDIR) && ./csr_uvm_fc4sc_test
	@echo "CSR FC4SC coverage reports generated:"
	@echo "  - XML: build/csr_fc4sc_coverage.xml"
	@echo "  - HTML: build/csr_fc4sc_coverage.html"
	@echo "CSR UVM test with FC4SC coverage completed successfully"

# CSR UVM Test with FC4SC Coverage (LLVM Clang)
CSR_UVM_FC4SC_LLVM_TARGET = $(BUILDDIR)/csr_uvm_fc4sc_test_llvm

$(CSR_UVM_FC4SC_LLVM_TARGET): $(BUILDDIR) $(TESTDIR)/csr_uvm_fc4sc_test.cpp
	@echo "=== Building CSR UVM Test with FC4SC Coverage (LLVM) ==="
	/opt/homebrew/opt/llvm/bin/clang++ -std=c++17 -Wall -Wextra \
	       -I/opt/homebrew/opt/systemc/include \
	       -L/opt/homebrew/opt/systemc/lib \
	       -Wl,-rpath,/opt/homebrew/opt/systemc/lib \
	       -lsystemc \
	       -o $@ $(TESTDIR)/csr_uvm_fc4sc_test.cpp
	@echo "=== CSR UVM Test with FC4SC Coverage (LLVM) Build Complete: $@ ==="

test-csr-uvm-fc4sc-llvm: $(CSR_UVM_FC4SC_LLVM_TARGET)
	@echo "=== Running CSR UVM Test with FC4SC Coverage (LLVM) ==="
	cd $(BUILDDIR) && ./csr_uvm_fc4sc_test_llvm
	@echo "CSR FC4SC coverage reports generated with LLVM:"
	@echo "  - XML: build/csr_fc4sc_coverage.xml"
	@echo "  - HTML: build/csr_fc4sc_coverage.html"
	@echo "CSR UVM test with FC4SC coverage (LLVM) completed successfully"

.PHONY: all basic multiple backpressure mixed stress test-all test-verbose test-debug waves clean help check-env install-deps test-simple-fc4sc test-fixed-fc4sc test-real-fc4sc-simple test-error test-simple-error test-working-error test-fixed-error test-uvm-error test-simple-uvm-error test-final-uvm-error test-error-fc4sc test-csr-uvm-fc4sc test-csr-uvm-fc4sc-llvm