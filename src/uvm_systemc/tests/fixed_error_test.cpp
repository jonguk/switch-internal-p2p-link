/******************************************************************************
 * Fixed Error Injection Test
 * 
 * SystemC 기본 문법에 맞춘 간단한 에러 테스트입니다.
 ******************************************************************************/

#include <systemc.h>
#include <iostream>
#include <vector>
#include <map>
#include <iomanip>

using namespace sc_core;

// =============================================================================
// Error Types and Statistics
// =============================================================================

enum class ErrorType {
    CRC_ERROR,
    INVALID_PORT,
    OVERSIZED_PACKET,
    PROTOCOL_VIOLATION,
    TIMEOUT_ERROR,
    NONE
};

class error_statistics {
private:
    std::map<ErrorType, int> error_counts;
    int total_injections;
    int detected_errors;
    
public:
    error_statistics() : total_injections(0), detected_errors(0) {}
    
    void inject_error(ErrorType type) {
        error_counts[type]++;
        total_injections++;
    }
    
    void report_detection(bool detected) {
        if (detected) {
            detected_errors++;
        }
    }
    
    void print_report() {
        std::cout << "\n=== ERROR INJECTION REPORT ===" << std::endl;
        std::cout << "Total Error Injections: " << total_injections << std::endl;
        std::cout << "Detected Errors: " << detected_errors << std::endl;
        
        if (total_injections > 0) {
            double detection_rate = (double)detected_errors / total_injections * 100.0;
            std::cout << "Error Detection Rate: " << std::fixed << std::setprecision(2) 
                      << detection_rate << "%" << std::endl;
        }
        
        std::cout << "\n--- Error Type Breakdown ---" << std::endl;
        for (const auto& pair : error_counts) {
            std::cout << "Error Type " << static_cast<int>(pair.first) 
                      << ": " << pair.second << " injections" << std::endl;
        }
        std::cout << "===============================" << std::endl;
    }
};

// =============================================================================
// Fixed Error Test Module
// =============================================================================

SC_MODULE(fixed_error_test) {
    // Clock and control signals
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // Data interface
    sc_signal<bool> data_valid;
    sc_signal<sc_uint<64>> data_word;
    sc_signal<bool> data_ready;
    sc_signal<bool> data_error;
    
    // Error injection controls
    sc_signal<int> current_error_type;
    
    // Statistics
    error_statistics stats;
    
    SC_CTOR(fixed_error_test) : clk("clk", 10, SC_NS) {
        SC_THREAD(stimulus_process);
        
        SC_METHOD(monitor_process);
        sensitive << data_valid << data_ready;
        
        SC_METHOD(error_detector_process);
        sensitive << data_valid << current_error_type;
        
        SC_THREAD(reset_process);
        
        // Initialize signals
        data_valid.write(false);
        data_word.write(0);
        data_ready.write(true);
        data_error.write(false);
        current_error_type.write(static_cast<int>(ErrorType::NONE));
    }
    
    void reset_process() {
        wait(25, SC_NS);
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[RESET] Reset sequence completed" << std::endl;
    }
    
    void stimulus_process() {
        // Wait for reset
        wait(50, SC_NS);
        
        std::cout << "[STIMULUS] Starting error injection test" << std::endl;
        
        // Test 1: CRC Error
        test_crc_error();
        wait(100, SC_NS);
        
        // Test 2: Invalid Port Error
        test_invalid_port();
        wait(100, SC_NS);
        
        // Test 3: Protocol Violation
        test_protocol_violation();
        wait(100, SC_NS);
        
        // Test 4: Timeout Error
        test_timeout_error();
        wait(100, SC_NS);
        
        // Print final report
        stats.print_report();
        
        std::cout << "[STIMULUS] Error injection test completed" << std::endl;
        sc_stop();
    }
    
    void test_crc_error() {
        std::cout << "[TEST] Injecting CRC error" << std::endl;
        stats.inject_error(ErrorType::CRC_ERROR);
        
        current_error_type.write(static_cast<int>(ErrorType::CRC_ERROR));
        data_word.write(0xDEADBEEF);
        data_valid.write(true);
        wait(20, SC_NS);
        data_valid.write(false);
        current_error_type.write(static_cast<int>(ErrorType::NONE));
        wait(20, SC_NS);
    }
    
    void test_invalid_port() {
        std::cout << "[TEST] Injecting invalid port error" << std::endl;
        stats.inject_error(ErrorType::INVALID_PORT);
        
        current_error_type.write(static_cast<int>(ErrorType::INVALID_PORT));
        data_word.write(0xFF000000);  // Invalid port 255
        data_valid.write(true);
        wait(20, SC_NS);
        data_valid.write(false);
        current_error_type.write(static_cast<int>(ErrorType::NONE));
        wait(20, SC_NS);
    }
    
    void test_protocol_violation() {
        std::cout << "[TEST] Injecting protocol violation" << std::endl;
        stats.inject_error(ErrorType::PROTOCOL_VIOLATION);
        
        current_error_type.write(static_cast<int>(ErrorType::PROTOCOL_VIOLATION));
        data_ready.write(false);
        data_word.write(0xBADC0DE);
        data_valid.write(true);
        wait(30, SC_NS);
        data_valid.write(false);
        data_ready.write(true);
        current_error_type.write(static_cast<int>(ErrorType::NONE));
        wait(20, SC_NS);
    }
    
    void test_timeout_error() {
        std::cout << "[TEST] Injecting timeout error" << std::endl;
        stats.inject_error(ErrorType::TIMEOUT_ERROR);
        
        current_error_type.write(static_cast<int>(ErrorType::TIMEOUT_ERROR));
        data_word.write(0x12345678);  // Fixed hex constant
        data_valid.write(true);
        wait(200, SC_NS);  // Long timeout
        data_valid.write(false);
        current_error_type.write(static_cast<int>(ErrorType::NONE));
        wait(20, SC_NS);
    }
    
    void monitor_process() {
        if (data_valid.read() && data_ready.read()) {
            sc_uint<64> data = data_word.read();
            std::cout << "[MONITOR] Data transfer: 0x" << std::hex 
                      << data.to_uint64() << std::dec << std::endl;
        }
    }
    
    void error_detector_process() {
        bool error_detected = false;
        ErrorType err_type = static_cast<ErrorType>(current_error_type.read());
        
        if (data_valid.read() && err_type != ErrorType::NONE) {
            switch (err_type) {
                case ErrorType::CRC_ERROR:
                    std::cout << "[ERROR-DETECTOR] CRC error detected!" << std::endl;
                    error_detected = true;
                    break;
                    
                case ErrorType::INVALID_PORT:
                    std::cout << "[ERROR-DETECTOR] Invalid port detected!" << std::endl;
                    error_detected = true;
                    break;
                    
                case ErrorType::PROTOCOL_VIOLATION:
                    if (!data_ready.read()) {
                        std::cout << "[ERROR-DETECTOR] Protocol violation detected!" << std::endl;
                        error_detected = true;
                    }
                    break;
                    
                case ErrorType::TIMEOUT_ERROR:
                    std::cout << "[ERROR-DETECTOR] Timeout condition detected!" << std::endl;
                    error_detected = true;
                    break;
                    
                default:
                    break;
            }
            
            if (error_detected) {
                data_error.write(true);
                stats.report_detection(true);
            }
        } else {
            data_error.write(false);
        }
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Fixed Simple Error Injection Test ===" << std::endl;
    
    // Create testbench
    fixed_error_test tb("fixed_error_test");
    
    // Run simulation
    sc_start();
    
    std::cout << "=== Fixed Error Test Completed ===" << std::endl;
    return 0;
}