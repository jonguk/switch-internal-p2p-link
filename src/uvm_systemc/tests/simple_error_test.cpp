/******************************************************************************
 * Simple Error Injection Test
 * 
 * 이 테스트는 SystemC만 사용해서 다양한 에러 시나리오를 검증합니다.
 ******************************************************************************/

#include <systemc>
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
    UNDERSIZED_PACKET,
    PROTOCOL_VIOLATION,
    TIMEOUT_ERROR,
    BUFFER_OVERFLOW,
    NONE
};

class error_statistics {
private:
    std::map<ErrorType, int> error_counts;
    int total_injections;
    int detected_errors;
    int undetected_errors;
    
public:
    error_statistics() : total_injections(0), detected_errors(0), undetected_errors(0) {}
    
    void inject_error(ErrorType type) {
        error_counts[type]++;
        total_injections++;
    }
    
    void report_detection(bool detected) {
        if (detected) {
            detected_errors++;
        } else {
            undetected_errors++;
        }
    }
    
    void print_report() {
        std::cout << "\n=== ERROR INJECTION REPORT ===" << std::endl;
        std::cout << "Total Error Injections: " << total_injections << std::endl;
        std::cout << "Detected Errors: " << detected_errors << std::endl;
        std::cout << "Undetected Errors: " << undetected_errors << std::endl;
        
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
// Simple Error Test Module
// =============================================================================

SC_MODULE(simple_error_test) {
    // Clock and control signals
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // Data interface
    sc_signal<bool> data_valid;
    sc_signal<sc_bv<64>> data_word;
    sc_signal<bool> data_ready;
    sc_signal<bool> data_error;
    
    // Error injection controls
    sc_signal<bool> inject_crc_error;
    sc_signal<bool> inject_size_error;
    sc_signal<bool> inject_timeout;
    
    // Statistics
    error_statistics stats;
    
    SC_CTOR(simple_error_test) : clk("clk", 10, SC_NS) {
        SC_THREAD(stimulus_process);
        SC_THREAD(monitor_process);
        SC_THREAD(error_detector_process);
        SC_THREAD(reset_process);
        
        // Initialize signals
        data_valid.write(false);
        data_word.write(0);
        data_ready.write(true);
        data_error.write(false);
        inject_crc_error.write(false);
        inject_size_error.write(false);
        inject_timeout.write(false);
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[RESET] Reset sequence completed" << std::endl;
    }
    
    void stimulus_process() {
        // Wait for reset
        wait(sc_time(50, SC_NS));
        
        std::cout << "[STIMULUS] Starting error injection test" << std::endl;
        
        // Test 1: CRC Error
        test_crc_error();
        wait(sc_time(100, SC_NS));
        
        // Test 2: Invalid Port Error
        test_invalid_port();
        wait(sc_time(100, SC_NS));
        
        // Test 3: Oversized Packet Error
        test_oversized_packet();
        wait(sc_time(100, SC_NS));
        
        // Test 4: Undersized Packet Error
        test_undersized_packet();
        wait(sc_time(100, SC_NS));
        
        // Test 5: Protocol Violation
        test_protocol_violation();
        wait(sc_time(100, SC_NS));
        
        // Test 6: Timeout Error
        test_timeout_error();
        wait(sc_time(100, SC_NS));
        
        // Test 7: Buffer Overflow
        test_buffer_overflow();
        wait(sc_time(100, SC_NS));
        
        // Print final report
        stats.print_report();
        
        std::cout << "[STIMULUS] Error injection test completed" << std::endl;
        sc_stop();
    }
    
    void test_crc_error() {
        std::cout << "[TEST] Injecting CRC error" << std::endl;
        stats.inject_error(ErrorType::CRC_ERROR);
        
        // Inject CRC error flag
        inject_crc_error.write(true);
        
        // Send data with CRC error
        data_word.write(0xDEADBEEF);
        data_valid.write(true);
        wait(sc_time(20, SC_NS));
        data_valid.write(false);
        
        // Clear error flag
        inject_crc_error.write(false);
        wait(sc_time(20, SC_NS));
    }
    
    void test_invalid_port() {
        std::cout << "[TEST] Injecting invalid port error" << std::endl;
        stats.inject_error(ErrorType::INVALID_PORT);
        
        // Send data with invalid port (encoded in upper bits)
        data_word.write(0xFF000000);  // Invalid port 255
        data_valid.write(true);
        wait(sc_time(20, SC_NS));
        data_valid.write(false);
        wait(sc_time(20, SC_NS));
    }
    
    void test_oversized_packet() {
        std::cout << "[TEST] Injecting oversized packet error" << std::endl;
        stats.inject_error(ErrorType::OVERSIZED_PACKET);
        
        inject_size_error.write(true);
        
        // Send multiple data words to simulate oversized packet
        for (int i = 0; i < 10; i++) {
            data_word.write(0x12345678 + i);
            data_valid.write(true);
            wait(sc_time(10, SC_NS));
        }
        data_valid.write(false);
        inject_size_error.write(false);
        wait(sc_time(20, SC_NS));
    }
    
    void test_undersized_packet() {
        std::cout << "[TEST] Injecting undersized packet error" << std::endl;
        stats.inject_error(ErrorType::UNDERSIZED_PACKET);
        
        // Send very small data
        data_word.write(0x1);
        data_valid.write(true);
        wait(sc_time(5, SC_NS));  // Very short pulse
        data_valid.write(false);
        wait(sc_time(20, SC_NS));
    }
    
    void test_protocol_violation() {
        std::cout << "[TEST] Injecting protocol violation" << std::endl;
        stats.inject_error(ErrorType::PROTOCOL_VIOLATION);
        
        // Protocol violation: valid high without ready
        data_ready.write(false);
        data_word.write(0xBADC0DE);
        data_valid.write(true);
        wait(sc_time(30, SC_NS));
        data_valid.write(false);
        data_ready.write(true);
        wait(sc_time(20, SC_NS));
    }
    
    void test_timeout_error() {
        std::cout << "[TEST] Injecting timeout error" << std::endl;
        stats.inject_error(ErrorType::TIMEOUT_ERROR);
        
        inject_timeout.write(true);
        
        // Hold valid for a very long time
        data_word.write(0x7IMEOUT);
        data_valid.write(true);
        wait(sc_time(500, SC_NS));  // Very long timeout
        data_valid.write(false);
        
        inject_timeout.write(false);
        wait(sc_time(20, SC_NS));
    }
    
    void test_buffer_overflow() {
        std::cout << "[TEST] Injecting buffer overflow" << std::endl;
        stats.inject_error(ErrorType::BUFFER_OVERFLOW);
        
        // Send many packets rapidly
        for (int i = 0; i < 20; i++) {
            data_word.write(0xF100D000 + i);
            data_valid.write(true);
            wait(sc_time(2, SC_NS));  // Very fast
            data_valid.write(false);
            wait(sc_time(1, SC_NS));
        }
        wait(sc_time(50, SC_NS));
    }
    
    void monitor_process() {
        while (true) {
            wait(sc_time(10, SC_NS));
            
            if (data_valid.read() && data_ready.read()) {
                sc_bv<64> data = data_word.read();
                std::cout << "[MONITOR] Data transfer: 0x" << std::hex 
                          << data.to_uint64() << std::dec << std::endl;
            }
        }
    }
    
    void error_detector_process() {
        bool error_detected = false;
        
        while (true) {
            wait(sc_time(10, SC_NS));
            
            error_detected = false;
            
            // CRC error detection
            if (inject_crc_error.read() && data_valid.read()) {
                std::cout << "[ERROR-DETECTOR] CRC error detected!" << std::endl;
                data_error.write(true);
                error_detected = true;
                stats.report_detection(true);
            }
            
            // Invalid port detection
            if (data_valid.read()) {
                sc_bv<64> data = data_word.read();
                uint8_t port = (data.to_uint64() >> 24) & 0xFF;
                if (port > 8) {  // Valid ports are 1-8
                    std::cout << "[ERROR-DETECTOR] Invalid port " << (int)port << " detected!" << std::endl;
                    data_error.write(true);
                    error_detected = true;
                    stats.report_detection(true);
                }
            }
            
            // Size error detection
            if (inject_size_error.read() && data_valid.read()) {
                std::cout << "[ERROR-DETECTOR] Size error detected!" << std::endl;
                data_error.write(true);
                error_detected = true;
                stats.report_detection(true);
            }
            
            // Protocol violation detection
            if (data_valid.read() && !data_ready.read()) {
                std::cout << "[ERROR-DETECTOR] Protocol violation detected!" << std::endl;
                data_error.write(true);
                error_detected = true;
                stats.report_detection(true);
            }
            
            // Timeout detection
            if (inject_timeout.read()) {
                std::cout << "[ERROR-DETECTOR] Timeout condition detected!" << std::endl;
                data_error.write(true);
                error_detected = true;
                stats.report_detection(true);
            }
            
            // Clear error flag after detection
            if (error_detected) {
                wait(sc_time(20, SC_NS));
                data_error.write(false);
            }
        }
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Simple Error Injection Test ===" << std::endl;
    
    // Create testbench
    simple_error_test tb("simple_error_test");
    
    // Run simulation
    sc_start();
    
    std::cout << "=== Simple Error Test Completed ===" << std::endl;
    return 0;
}