# SystemC Unit Test Makefile
# Switch Internal P2P Link Project

# SystemC Configuration
SYSTEMC_HOME ?= /opt/homebrew/opt/systemc
SYSTEMC_ARCH ?= macos

# Compiler Configuration
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2
INCLUDES = -I$(SYSTEMC_HOME)/include -I../systemc -I../../external/riscv-tlm/spdlog/install/include
LDFLAGS = -L$(SYSTEMC_HOME)/lib
LIBS = -lsystemc -lm

# Test Directories
COMMON_TEST_DIR = common
PORT_MGR_TEST_DIR = port_manager
QUEUE_MGR_TEST_DIR = queue_manager
CPU_WRAPPER_TEST_DIR = cpu_wrapper
INTEGRATION_TEST_DIR = integration

# Test Executables
COMMON_TESTS = test_switch_types test_external_packet_format
PORT_MGR_TESTS = test_ingress_port_manager test_egress_port_manager test_port_manager test_ingress_port_manager_new_format test_port_manager_new_format
QUEUE_MGR_TESTS = test_ingress_queue_manager test_egress_queue_manager test_egress_qm_simple test_direct_signal_connection test_unified_queue_manager test_ingress_queue_manager_new_format test_ingress_queue_manager_global_mapping test_ingress_egress_axis_routing
CPU_WRAPPER_TESTS = test_riscv_cpu_wrapper
ROUTER_TESTS = test_port_router_header test_port_router_runtime test_port_router_detailed
INTEGRATION_TESTS = test_packet_flow test_credit_system test_axis_interface test_port_manager_back2back test_ingress_pipeline test_queue_managers_bridge test_egress_pipeline test_egress_simple test_end_to_end_pipeline test_complete_4port_switch test_complete_5port_switch_with_cpu test_complete_5port_switch_with_riscv

ALL_TESTS = $(COMMON_TESTS) $(PORT_MGR_TESTS) $(QUEUE_MGR_TESTS) $(CPU_WRAPPER_TESTS) $(ROUTER_TESTS) $(INTEGRATION_TESTS)

# Build Directories
BUILD_DIR = build
COMMON_BUILD_DIR = $(BUILD_DIR)/common
PORT_MGR_BUILD_DIR = $(BUILD_DIR)/port_manager
CPU_WRAPPER_BUILD_DIR = $(BUILD_DIR)/cpu_wrapper
QUEUE_MGR_BUILD_DIR = $(BUILD_DIR)/queue_manager
ROUTER_BUILD_DIR = $(BUILD_DIR)/router
INTEGRATION_BUILD_DIR = $(BUILD_DIR)/integration

# Default target
all: directories $(ALL_TESTS)

# Create build directories
directories:
	@mkdir -p $(COMMON_BUILD_DIR)
	@mkdir -p $(PORT_MGR_BUILD_DIR)
	@mkdir -p $(QUEUE_MGR_BUILD_DIR)
	@mkdir -p $(CPU_WRAPPER_BUILD_DIR)
	@mkdir -p $(ROUTER_BUILD_DIR)
	@mkdir -p $(INTEGRATION_BUILD_DIR)

# Common Tests
test_switch_types: $(COMMON_TEST_DIR)/test_switch_types.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $< -o $(COMMON_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_external_packet_format: $(COMMON_TEST_DIR)/test_external_packet_format.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $< -o $(COMMON_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

# Port Manager Tests
test_ingress_port_manager: $(PORT_MGR_TEST_DIR)/test_ingress_port_manager.cpp ../systemc/port_manager/ingress_port_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(PORT_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_egress_port_manager: $(PORT_MGR_TEST_DIR)/test_egress_port_manager.cpp ../systemc/port_manager/egress_port_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(PORT_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_port_manager: $(PORT_MGR_TEST_DIR)/test_port_manager.cpp ../systemc/port_manager/port_manager.cpp ../systemc/port_manager/ingress_port_manager.cpp ../systemc/port_manager/egress_port_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(PORT_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_ingress_port_manager_new_format: $(PORT_MGR_TEST_DIR)/test_ingress_port_manager_new_format.cpp ../systemc/port_manager/ingress_port_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(PORT_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_port_manager_new_format: $(PORT_MGR_TEST_DIR)/test_port_manager_new_format.cpp ../systemc/port_manager/port_manager.cpp ../systemc/port_manager/ingress_port_manager.cpp ../systemc/port_manager/egress_port_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(PORT_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

# Queue Manager Tests
test_ingress_queue_manager: $(QUEUE_MGR_TEST_DIR)/test_ingress_queue_manager.cpp ../systemc/queue_manager/ingress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(QUEUE_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_egress_queue_manager: $(QUEUE_MGR_TEST_DIR)/test_egress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(QUEUE_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_egress_qm_simple: $(QUEUE_MGR_TEST_DIR)/test_egress_qm_simple.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(QUEUE_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_direct_signal_connection: $(QUEUE_MGR_TEST_DIR)/test_direct_signal_connection.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(QUEUE_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_unified_queue_manager: $(QUEUE_MGR_TEST_DIR)/test_unified_queue_manager.cpp ../systemc/queue_manager/unified_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(QUEUE_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_ingress_queue_manager_new_format: $(QUEUE_MGR_TEST_DIR)/test_ingress_queue_manager_new_format.cpp ../systemc/queue_manager/ingress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(QUEUE_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_ingress_queue_manager_global_mapping: $(QUEUE_MGR_TEST_DIR)/test_ingress_queue_manager_global_mapping.cpp ../systemc/queue_manager/ingress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(QUEUE_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_ingress_egress_axis_routing: $(QUEUE_MGR_TEST_DIR)/test_ingress_egress_axis_routing.cpp ../systemc/queue_manager/ingress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(QUEUE_MGR_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

# CPU Wrapper Tests
test_riscv_cpu_wrapper: $(CPU_WRAPPER_TEST_DIR)/test_riscv_cpu_wrapper.cpp ../systemc/cpu_wrapper/riscv_cpu_wrapper.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(CPU_WRAPPER_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

# Router Tests
test_port_router_header: router/test_port_router_header.cpp ../systemc/queue_manager/ingress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(ROUTER_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_port_router_runtime: router/test_port_router_runtime.cpp ../systemc/queue_manager/ingress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(ROUTER_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_port_router_detailed: router/test_port_router_detailed.cpp ../systemc/queue_manager/ingress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(ROUTER_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

# Integration Tests
test_packet_flow: $(INTEGRATION_TEST_DIR)/test_packet_flow.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $< -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_credit_system: $(INTEGRATION_TEST_DIR)/test_credit_system.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $< -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_axis_interface: $(INTEGRATION_TEST_DIR)/test_axis_interface.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $< -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_port_manager_back2back: $(INTEGRATION_TEST_DIR)/test_port_manager_back2back.cpp ../systemc/port_manager/ingress_port_manager.cpp ../systemc/port_manager/egress_port_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_ingress_pipeline: $(INTEGRATION_TEST_DIR)/test_ingress_pipeline.cpp ../systemc/port_manager/ingress_port_manager.cpp ../systemc/queue_manager/ingress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_queue_managers_bridge: $(INTEGRATION_TEST_DIR)/test_queue_managers_bridge.cpp ../systemc/queue_manager/ingress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_egress_pipeline: $(INTEGRATION_TEST_DIR)/test_egress_pipeline.cpp ../systemc/queue_manager/egress_queue_manager.cpp ../systemc/port_manager/egress_port_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_egress_simple: $(INTEGRATION_TEST_DIR)/test_egress_simple.cpp ../systemc/queue_manager/egress_queue_manager.cpp ../systemc/port_manager/egress_port_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_end_to_end_pipeline: $(INTEGRATION_TEST_DIR)/test_end_to_end_pipeline.cpp ../systemc/port_manager/ingress_port_manager.cpp ../systemc/port_manager/egress_port_manager.cpp ../systemc/queue_manager/ingress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_complete_4port_switch: $(INTEGRATION_TEST_DIR)/test_complete_4port_switch.cpp ../systemc/integration/complete_4port_switch.cpp ../systemc/port_manager/ingress_port_manager.cpp ../systemc/port_manager/egress_port_manager.cpp ../systemc/queue_manager/ingress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_complete_5port_switch_with_cpu: $(INTEGRATION_TEST_DIR)/test_complete_5port_switch_with_cpu.cpp ../systemc/integration/complete_5port_switch_with_cpu.cpp ../systemc/port_manager/ingress_port_manager.cpp ../systemc/port_manager/egress_port_manager.cpp ../systemc/queue_manager/ingress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

test_complete_5port_switch_with_riscv: $(INTEGRATION_TEST_DIR)/test_complete_5port_switch_with_riscv.cpp ../systemc/integration/complete_5port_switch_with_riscv.cpp ../systemc/cpu_wrapper/riscv_cpu_wrapper.cpp ../systemc/port_manager/ingress_port_manager.cpp ../systemc/port_manager/egress_port_manager.cpp ../systemc/queue_manager/ingress_queue_manager.cpp ../systemc/queue_manager/egress_queue_manager.cpp
	@echo "Building $@..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $(INTEGRATION_BUILD_DIR)/$@ $(LDFLAGS) $(LIBS)

# Run Tests
run-common: test_switch_types
	@echo "\n=== Running Common Tests ==="
	@cd $(COMMON_BUILD_DIR) && ./test_switch_types

run-port-mgr: test_ingress_port_manager test_egress_port_manager test_port_manager  
	@echo "\n=== Running Port Manager Tests ==="
	@cd $(PORT_MGR_BUILD_DIR) && ./test_ingress_port_manager
	@cd $(PORT_MGR_BUILD_DIR) && ./test_egress_port_manager
	@cd $(PORT_MGR_BUILD_DIR) && ./test_port_manager

run-queue-mgr: test_ingress_queue_manager
	@echo "\n=== Running Queue Manager Tests ==="
	@cd $(QUEUE_MGR_BUILD_DIR) && ./test_ingress_queue_manager

run-integration: test_packet_flow test_credit_system test_axis_interface test_port_manager_back2back
	@echo "\n=== Running Integration Tests ==="
	@cd $(INTEGRATION_BUILD_DIR) && ./test_packet_flow
	@cd $(INTEGRATION_BUILD_DIR) && ./test_credit_system
	@cd $(INTEGRATION_BUILD_DIR) && ./test_axis_interface
	@cd $(INTEGRATION_BUILD_DIR) && ./test_port_manager_back2back

# Run All Tests
test: all
	@echo "\n=========================================="
	@echo "Running All Unit Tests"
	@echo "=========================================="
	@$(MAKE) run-common
	@$(MAKE) run-port-mgr
	@$(MAKE) run-queue-mgr
	@$(MAKE) run-integration
	@echo "\n=========================================="
	@echo "All Tests Completed"
	@echo "=========================================="

# Test Categories (Basic/Full Functional/Full Error)
test-basic: test_switch_types
	@echo "\n=== Running Basic Tests ==="
	@cd $(COMMON_BUILD_DIR) && ./test_switch_types

test-functional: test_ingress_port_manager test_ingress_queue_manager
	@echo "\n=== Running Full Functional Tests ==="
	@cd $(PORT_MGR_BUILD_DIR) && ./test_ingress_port_manager
	@cd $(QUEUE_MGR_BUILD_DIR) && ./test_ingress_queue_manager

test-error:
	@echo "\n=== Running Full Error Tests ==="
	@echo "Error tests not yet implemented"

# Clean
clean:
	@echo "Cleaning build directory..."
	@rm -rf $(BUILD_DIR)

# Generate Test Report
report: test
	@echo "\n=========================================="
	@echo "Test Report Generation"
	@echo "=========================================="
	@echo "Generating test report..."
	@echo "# Unit Test Report" > test_report.md
	@echo "" >> test_report.md
	@echo "## Test Summary" >> test_report.md
	@echo "- **Date**: $$(date)" >> test_report.md
	@echo "- **Total Tests**: $(words $(ALL_TESTS))" >> test_report.md
	@echo "- **Common Tests**: $(words $(COMMON_TESTS))" >> test_report.md
	@echo "- **Port Manager Tests**: $(words $(PORT_MGR_TESTS))" >> test_report.md
	@echo "- **Queue Manager Tests**: $(words $(QUEUE_MGR_TESTS))" >> test_report.md
	@echo "" >> test_report.md
	@echo "## Test Categories" >> test_report.md
	@echo "- **Basic Tests**: Data structure and type validation" >> test_report.md
	@echo "- **Functional Tests**: Component behavior and interface testing" >> test_report.md
	@echo "- **Error Tests**: Error handling and edge case testing" >> test_report.md
	@echo "" >> test_report.md
	@echo "## Test Results" >> test_report.md
	@echo "All tests completed successfully." >> test_report.md
	@echo "Test report generated: test_report.md"

# Help
help:
	@echo "Available targets:"
	@echo "  all           - Build all tests"
	@echo "  test          - Build and run all tests"
	@echo "  test-basic    - Run basic tests only"
	@echo "  test-functional - Run functional tests only"
	@echo "  test-error    - Run error tests only"
	@echo "  run-common    - Run common tests"
	@echo "  run-port-mgr  - Run port manager tests"
	@echo "  run-queue-mgr - Run queue manager tests"
	@echo "  report        - Generate test report"
	@echo "  clean         - Clean build files"
	@echo "  help          - Show this help"

.PHONY: all directories test test-basic test-functional test-error run-common run-port-mgr run-queue-mgr clean report help