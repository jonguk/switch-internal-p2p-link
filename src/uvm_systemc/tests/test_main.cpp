#include <systemc.h>
#include <uvmsc/base/uvm_base.h>
#include <uvmsc/macros/uvm_macros.h>
#include <uvmsc/comps/uvm_comps.h>
#include <uvmsc/phasing/uvm_phasing.h>
#include "ingress_pm_tests.h"

using namespace uvm;
using namespace uvm_switch_verification;

int sc_main(int argc, char* argv[]) {
    // Initialize UVM
    uvm_init(argc, argv);
    
    // Print UVM SystemC banner
    UVM_INFO("UVM_TESTBENCH", "=== UVM SystemC Ingress Port Manager Verification ===", UVM_LOW);
    UVM_INFO("UVM_TESTBENCH", "Starting comprehensive verification suite...", UVM_LOW);
    
    // Set default test timeout
    uvm_top::set_timeout(sc_time(10, SC_MS));
    
    // Register test types
    basic_test::type_id::create("basic_test", nullptr);
    multiple_packets_test::type_id::create("multiple_packets_test", nullptr);
    backpressure_test::type_id::create("backpressure_test", nullptr);
    mixed_types_test::type_id::create("mixed_types_test", nullptr);
    stress_test::type_id::create("stress_test", nullptr);
    
    // Determine which test to run
    std::string test_name = "basic_test"; // Default test
    
    // Parse command line for test selection
    for (int i = 1; i < argc; i++) {
        if (std::string(argv[i]) == "+UVM_TESTNAME") {
            if (i + 1 < argc) {
                test_name = argv[i + 1];
                i++; // Skip next argument
            }
        }
    }
    
    UVM_INFO("UVM_TESTBENCH", ("Selected test: " + test_name).c_str(), UVM_LOW);
    
    // Set verbosity level
    uvm_top::set_report_verbosity_level(UVM_MEDIUM);
    
    // Create and run the selected test
    uvm_component* test_instance = nullptr;
    
    if (test_name == "basic_test") {
        test_instance = basic_test::type_id::create("test", nullptr);
    } else if (test_name == "multiple_packets_test") {
        test_instance = multiple_packets_test::type_id::create("test", nullptr);
    } else if (test_name == "backpressure_test") {
        test_instance = backpressure_test::type_id::create("test", nullptr);
    } else if (test_name == "mixed_types_test") {
        test_instance = mixed_types_test::type_id::create("test", nullptr);
    } else if (test_name == "stress_test") {
        test_instance = stress_test::type_id::create("test", nullptr);
    } else {
        UVM_FATAL("UVM_TESTBENCH", ("Unknown test: " + test_name).c_str());
    }
    
    // Run all tests if "all" is specified
    if (test_name == "all") {
        UVM_INFO("UVM_TESTBENCH", "Running all tests in sequence...", UVM_LOW);
        
        std::vector<std::string> all_tests = {
            "basic_test",
            "multiple_packets_test", 
            "backpressure_test",
            "mixed_types_test",
            "stress_test"
        };
        
        bool all_passed = true;
        
        for (const auto& current_test : all_tests) {
            UVM_INFO("UVM_TESTBENCH", ("=== Running " + current_test + " ===").c_str(), UVM_LOW);
            
            try {
                uvm_component* current_test_instance = nullptr;
                
                if (current_test == "basic_test") {
                    current_test_instance = basic_test::type_id::create("test", nullptr);
                } else if (current_test == "multiple_packets_test") {
                    current_test_instance = multiple_packets_test::type_id::create("test", nullptr);
                } else if (current_test == "backpressure_test") {
                    current_test_instance = backpressure_test::type_id::create("test", nullptr);
                } else if (current_test == "mixed_types_test") {
                    current_test_instance = mixed_types_test::type_id::create("test", nullptr);
                } else if (current_test == "stress_test") {
                    current_test_instance = stress_test::type_id::create("test", nullptr);
                }
                
                // Run UVM phases
                uvm_top::run_test();
                
                UVM_INFO("UVM_TESTBENCH", (current_test + " PASSED").c_str(), UVM_LOW);
                
            } catch (const std::exception& e) {
                UVM_ERROR("UVM_TESTBENCH", (current_test + " FAILED: " + e.what()).c_str());
                all_passed = false;
            }
        }
        
        if (all_passed) {
            UVM_INFO("UVM_TESTBENCH", "=== ALL TESTS PASSED ===", UVM_LOW);
        } else {
            UVM_ERROR("UVM_TESTBENCH", "=== SOME TESTS FAILED ===");
        }
        
    } else {
        // Run single test
        uvm_top::run_test();
    }
    
    // Final report
    UVM_INFO("UVM_TESTBENCH", "=== UVM SystemC Verification Complete ===", UVM_LOW);
    
    return 0;
}

// Test selection help
void print_usage() {
    std::cout << "\nUVM SystemC Ingress Port Manager Test Suite\n";
    std::cout << "Usage: ./test_executable [+UVM_TESTNAME <test_name>]\n\n";
    std::cout << "Available tests:\n";
    std::cout << "  basic_test           - Basic single packet functionality\n";
    std::cout << "  multiple_packets_test - Multiple packet handling\n";
    std::cout << "  backpressure_test    - AXIS backpressure handling\n";
    std::cout << "  mixed_types_test     - Different packet types (DATA/CONTROL/CREDIT)\n";
    std::cout << "  stress_test          - High-throughput stress testing\n";
    std::cout << "  all                  - Run all tests in sequence\n\n";
    std::cout << "Examples:\n";
    std::cout << "  ./test_executable                              # Run basic_test (default)\n";
    std::cout << "  ./test_executable +UVM_TESTNAME stress_test    # Run stress test\n";
    std::cout << "  ./test_executable +UVM_TESTNAME all           # Run all tests\n\n";
}