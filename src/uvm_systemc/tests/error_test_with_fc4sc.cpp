/******************************************************************************
 * Error Test with FC4SC Coverage
 * 
 * FC4SC 커버리지가 통합된 UVM 스타일 에러 테스트입니다.
 ******************************************************************************/

#include <systemc.h>
#include <iostream>
#include <vector>
#include <map>
#include <fstream>
#include <iomanip>
#include <sstream>

using namespace sc_core;

// =============================================================================
// FC4SC Style Coverage Model
// =============================================================================

class fc4sc_error_coverage {
private:
    // Error type coverage bins
    std::map<int, int> error_type_bins;
    std::map<int, std::string> error_type_names;
    
    // Error detection coverage bins  
    std::map<bool, int> detection_bins;
    
    // Cross coverage: error_type × detection
    std::map<std::pair<int, bool>, int> cross_bins;
    
    int total_samples;
    
public:
    fc4sc_error_coverage() : total_samples(0) {
        // Initialize error type names
        error_type_names[0] = "CRC_ERROR";
        error_type_names[1] = "INVALID_PORT";
        error_type_names[2] = "OVERSIZED_PACKET";
        error_type_names[3] = "PROTOCOL_VIOLATION";
        error_type_names[4] = "TIMEOUT_ERROR";
        error_type_names[5] = "BUFFER_OVERFLOW";
        
        // Initialize bins
        for (int i = 0; i <= 5; i++) {
            error_type_bins[i] = 0;
        }
        detection_bins[true] = 0;
        detection_bins[false] = 0;
    }
    
    void sample(int error_type, bool detected) {
        error_type_bins[error_type]++;
        detection_bins[detected]++;
        cross_bins[{error_type, detected}]++;
        total_samples++;
        
        std::cout << "[FC4SC-COV] Sampled: ErrorType=" << error_type 
                  << " (" << error_type_names[error_type] << "), Detected=" 
                  << (detected ? "YES" : "NO") << std::endl;
    }
    
    void generate_reports() {
        generate_console_report();
        generate_xml_report();
        generate_html_report();
    }
    
private:
    void generate_console_report() {
        std::cout << "\n" << std::string(60, '=') << std::endl;
        std::cout << "FC4SC ERROR COVERAGE REPORT" << std::endl;
        std::cout << std::string(60, '=') << std::endl;
        
        std::cout << "Total Samples: " << total_samples << std::endl;
        
        // Error Type Coverage
        std::cout << "\n--- Error Type Coverage ---" << std::endl;
        for (const auto& pair : error_type_bins) {
            double percentage = total_samples > 0 ? 
                (double)pair.second / total_samples * 100.0 : 0.0;
            std::cout << std::setw(20) << error_type_names[pair.first] 
                      << ": " << std::setw(3) << pair.second 
                      << " samples (" << std::fixed << std::setprecision(1) 
                      << percentage << "%)" << std::endl;
        }
        
        // Detection Coverage
        std::cout << "\n--- Detection Coverage ---" << std::endl;
        for (const auto& pair : detection_bins) {
            double percentage = total_samples > 0 ? 
                (double)pair.second / total_samples * 100.0 : 0.0;
            std::cout << std::setw(20) << (pair.first ? "DETECTED" : "NOT_DETECTED")
                      << ": " << std::setw(3) << pair.second 
                      << " samples (" << std::fixed << std::setprecision(1) 
                      << percentage << "%)" << std::endl;
        }
        
        // Cross Coverage
        std::cout << "\n--- Cross Coverage (ErrorType × Detection) ---" << std::endl;
        for (const auto& pair : cross_bins) {
            int error_type = pair.first.first;
            bool detected = pair.first.second;
            int count = pair.second;
            
            std::cout << std::setw(20) << error_type_names[error_type] 
                      << " × " << std::setw(12) << (detected ? "DETECTED" : "NOT_DETECTED")
                      << ": " << count << " samples" << std::endl;
        }
        
        // Overall Coverage
        int covered_error_types = 0;
        for (const auto& pair : error_type_bins) {
            if (pair.second > 0) covered_error_types++;
        }
        
        double overall_coverage = error_type_bins.size() > 0 ? 
            (double)covered_error_types / error_type_bins.size() * 100.0 : 0.0;
            
        std::cout << "\n--- Overall Coverage ---" << std::endl;
        std::cout << "Error Types Covered: " << covered_error_types << "/" 
                  << error_type_bins.size() << " (" << std::fixed << std::setprecision(1) 
                  << overall_coverage << "%)" << std::endl;
        std::cout << std::string(60, '=') << std::endl;
    }
    
    void generate_xml_report() {
        std::ofstream xml_file("error_fc4sc_coverage.xml");
        if (!xml_file.is_open()) {
            std::cerr << "[FC4SC-COV] Failed to create XML report" << std::endl;
            return;
        }
        
        xml_file << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
        xml_file << "<fc4sc_coverage_report>\n";
        xml_file << "  <metadata>\n";
        xml_file << "    <test_name>Error Injection Test</test_name>\n";
        xml_file << "    <total_samples>" << total_samples << "</total_samples>\n";
        xml_file << "    <timestamp>" << sc_time_stamp() << "</timestamp>\n";
        xml_file << "  </metadata>\n";
        
        // Error Type Coverpoints
        xml_file << "  <coverpoints>\n";
        xml_file << "    <coverpoint name=\"error_types\">\n";
        for (const auto& pair : error_type_bins) {
            xml_file << "      <bin name=\"" << error_type_names[pair.first] 
                     << "\" count=\"" << pair.second << "\"/>\n";
        }
        xml_file << "    </coverpoint>\n";
        
        xml_file << "    <coverpoint name=\"detection_status\">\n";
        for (const auto& pair : detection_bins) {
            xml_file << "      <bin name=\"" << (pair.first ? "DETECTED" : "NOT_DETECTED") 
                     << "\" count=\"" << pair.second << "\"/>\n";
        }
        xml_file << "    </coverpoint>\n";
        xml_file << "  </coverpoints>\n";
        
        // Cross Coverage
        xml_file << "  <cross_coverage name=\"error_type_x_detection\">\n";
        for (const auto& pair : cross_bins) {
            xml_file << "    <cross_bin error_type=\"" << error_type_names[pair.first.first] 
                     << "\" detected=\"" << (pair.first.second ? "true" : "false") 
                     << "\" count=\"" << pair.second << "\"/>\n";
        }
        xml_file << "  </cross_coverage>\n";
        
        xml_file << "</fc4sc_coverage_report>\n";
        xml_file.close();
        
        std::cout << "[FC4SC-COV] XML report generated: error_fc4sc_coverage.xml" << std::endl;
    }
    
    void generate_html_report() {
        std::ofstream html_file("error_fc4sc_coverage.html");
        if (!html_file.is_open()) {
            std::cerr << "[FC4SC-COV] Failed to create HTML report" << std::endl;
            return;
        }
        
        html_file << R"(<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FC4SC Error Coverage Report</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh; padding: 20px;
        }
        .container { 
            max-width: 1200px; margin: 0 auto; background: white;
            border-radius: 15px; box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .header { 
            background: linear-gradient(135deg, #ff6b6b, #ee5a24);
            color: white; padding: 30px; text-align: center;
        }
        .content { padding: 30px; }
        .metric-card { 
            background: #f8f9fa; border-radius: 10px; padding: 20px;
            margin: 15px 0; box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .metric-title { font-size: 18px; font-weight: bold; margin-bottom: 15px; color: #2c3e50; }
        .coverage-bar { 
            background: #ecf0f1; height: 20px; border-radius: 10px;
            overflow: hidden; margin: 5px 0;
        }
        .coverage-fill { 
            height: 100%; background: linear-gradient(90deg, #00b894, #00cec9);
            transition: width 0.3s ease;
        }
        table { width: 100%; border-collapse: collapse; margin: 15px 0; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #3498db; color: white; }
        .status-detected { color: #27ae60; font-weight: bold; }
        .status-not-detected { color: #e74c3c; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔍 FC4SC Error Coverage Report</h1>
            <p>Comprehensive Error Injection Test Analysis</p>
        </div>
        <div class="content">
            <div class="metric-card">
                <div class="metric-title">📊 Overview</div>
                <p><strong>Total Samples:</strong> )" << total_samples << R"(</p>
                <p><strong>Test Type:</strong> Error Injection with FC4SC Coverage</p>
                <p><strong>Timestamp:</strong> )" << sc_time_stamp() << R"(</p>
            </div>
            
            <div class="metric-card">
                <div class="metric-title">🎯 Error Type Coverage</div>
                <table>
                    <tr><th>Error Type</th><th>Samples</th><th>Coverage</th></tr>)";
        
        for (const auto& pair : error_type_bins) {
            double percentage = total_samples > 0 ? 
                (double)pair.second / total_samples * 100.0 : 0.0;
            html_file << "<tr><td>" << error_type_names[pair.first] << "</td>"
                      << "<td>" << pair.second << "</td>"
                      << "<td><div class=\"coverage-bar\"><div class=\"coverage-fill\" style=\"width:" 
                      << percentage << "%\"></div></div>" << std::fixed << std::setprecision(1) 
                      << percentage << "%</td></tr>";
        }
        
        html_file << R"(                </table>
            </div>
            
            <div class="metric-card">
                <div class="metric-title">✅ Detection Coverage</div>
                <table>
                    <tr><th>Detection Status</th><th>Samples</th><th>Percentage</th></tr>)";
        
        for (const auto& pair : detection_bins) {
            double percentage = total_samples > 0 ? 
                (double)pair.second / total_samples * 100.0 : 0.0;
            std::string status_class = pair.first ? "status-detected" : "status-not-detected";
            html_file << "<tr><td class=\"" << status_class << "\">" 
                      << (pair.first ? "DETECTED" : "NOT_DETECTED") << "</td>"
                      << "<td>" << pair.second << "</td>"
                      << "<td>" << std::fixed << std::setprecision(1) << percentage << "%</td></tr>";
        }
        
        html_file << R"(                </table>
            </div>
            
            <div class="metric-card">
                <div class="metric-title">🔄 Cross Coverage (Error Type × Detection)</div>
                <table>
                    <tr><th>Error Type</th><th>Detection</th><th>Count</th></tr>)";
        
        for (const auto& pair : cross_bins) {
            if (pair.second > 0) {  // Only show non-zero crosses
                std::string status_class = pair.first.second ? "status-detected" : "status-not-detected";
                html_file << "<tr><td>" << error_type_names[pair.first.first] << "</td>"
                          << "<td class=\"" << status_class << "\">" 
                          << (pair.first.second ? "DETECTED" : "NOT_DETECTED") << "</td>"
                          << "<td>" << pair.second << "</td></tr>";
            }
        }
        
        html_file << R"(                </table>
            </div>
        </div>
    </div>
</body>
</html>)";
        
        html_file.close();
        std::cout << "[FC4SC-COV] HTML report generated: error_fc4sc_coverage.html" << std::endl;
    }
};

// =============================================================================
// Error Types and Statistics
// =============================================================================

enum class ErrorType {
    CRC_ERROR = 0,
    INVALID_PORT = 1,
    OVERSIZED_PACKET = 2,
    PROTOCOL_VIOLATION = 3,
    TIMEOUT_ERROR = 4,
    BUFFER_OVERFLOW = 5
};

class error_statistics {
private:
    std::map<ErrorType, int> error_counts;
    int total_injections;
    int detected_errors;
    fc4sc_error_coverage* coverage_model;
    
public:
    error_statistics() : total_injections(0), detected_errors(0) {
        coverage_model = new fc4sc_error_coverage();
    }
    
    ~error_statistics() {
        if (coverage_model) delete coverage_model;
    }
    
    void inject_error(ErrorType type) {
        error_counts[type]++;
        total_injections++;
    }
    
    void detect_error(ErrorType type, bool detected) {
        if (detected) detected_errors++;
        
        // Sample FC4SC coverage
        coverage_model->sample(static_cast<int>(type), detected);
    }
    
    void print_report() {
        std::cout << "\n=== UVM ERROR INJECTION REPORT ===" << std::endl;
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
        std::cout << "===================================" << std::endl;
        
        // Generate FC4SC coverage reports
        coverage_model->generate_reports();
    }
};

// =============================================================================
// Error Test Module with FC4SC Integration
// =============================================================================

SC_MODULE(error_test_with_fc4sc) {
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
    
    // Statistics with FC4SC coverage
    error_statistics stats;
    
    SC_CTOR(error_test_with_fc4sc) : clk("clk", 10, SC_NS) {
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
        current_error_type.write(static_cast<int>(ErrorType::CRC_ERROR));
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
        
        std::cout << "[STIMULUS] Starting FC4SC-integrated error injection test" << std::endl;
        
        // Test all error types
        std::vector<ErrorType> error_types = {
            ErrorType::CRC_ERROR,
            ErrorType::INVALID_PORT,
            ErrorType::OVERSIZED_PACKET,
            ErrorType::PROTOCOL_VIOLATION,
            ErrorType::TIMEOUT_ERROR,
            ErrorType::BUFFER_OVERFLOW
        };
        
        for (ErrorType err_type : error_types) {
            test_error_type(err_type);
            wait(100, SC_NS);
        }
        
        // Print final report with FC4SC coverage
        stats.print_report();
        
        std::cout << "[STIMULUS] FC4SC-integrated error injection test completed" << std::endl;
        sc_stop();
    }
    
    void test_error_type(ErrorType err_type) {
        std::string error_name = get_error_name(err_type);
        std::cout << "[TEST] Injecting " << error_name << std::endl;
        
        stats.inject_error(err_type);
        
        current_error_type.write(static_cast<int>(err_type));
        
        // Set appropriate data for error type
        sc_uint<64> test_data = get_test_data_for_error(err_type);
        data_word.write(test_data);
        data_valid.write(true);
        
        wait(20, SC_NS);
        
        // Check if error was detected
        bool detected = data_error.read();
        stats.detect_error(err_type, detected);
        
        data_valid.write(false);
        current_error_type.write(static_cast<int>(ErrorType::CRC_ERROR));
        wait(20, SC_NS);
    }
    
    sc_uint<64> get_test_data_for_error(ErrorType err_type) {
        switch (err_type) {
            case ErrorType::CRC_ERROR:
                return 0xDEADBEEF;
            case ErrorType::INVALID_PORT:
                return 0xFF000000;  // Invalid port 255
            case ErrorType::OVERSIZED_PACKET:
                return 0x12345678;  // Large packet indicator
            case ErrorType::PROTOCOL_VIOLATION:
                return 0xBADC0DE;
            case ErrorType::TIMEOUT_ERROR:
                return 0x70000000;
            case ErrorType::BUFFER_OVERFLOW:
                return 0xF100D000;
            default:
                return 0x00000000;
        }
    }
    
    std::string get_error_name(ErrorType err_type) {
        switch (err_type) {
            case ErrorType::CRC_ERROR: return "CRC_ERROR";
            case ErrorType::INVALID_PORT: return "INVALID_PORT";
            case ErrorType::OVERSIZED_PACKET: return "OVERSIZED_PACKET";
            case ErrorType::PROTOCOL_VIOLATION: return "PROTOCOL_VIOLATION";
            case ErrorType::TIMEOUT_ERROR: return "TIMEOUT_ERROR";
            case ErrorType::BUFFER_OVERFLOW: return "BUFFER_OVERFLOW";
            default: return "UNKNOWN_ERROR";
        }
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
        
        if (data_valid.read()) {
            sc_uint<64> data = data_word.read();
            
            switch (err_type) {
                case ErrorType::CRC_ERROR:
                    if (data == 0xDEADBEEF) {
                        std::cout << "[ERROR-DETECTOR] CRC error detected!" << std::endl;
                        error_detected = true;
                    }
                    break;
                    
                case ErrorType::INVALID_PORT:
                    if (data.range(31, 24) == 255) {
                        std::cout << "[ERROR-DETECTOR] Invalid port detected!" << std::endl;
                        error_detected = true;
                    }
                    break;
                    
                case ErrorType::OVERSIZED_PACKET:
                    std::cout << "[ERROR-DETECTOR] Oversized packet detected!" << std::endl;
                    error_detected = true;
                    break;
                    
                case ErrorType::PROTOCOL_VIOLATION:
                    if (!data_ready.read()) {
                        std::cout << "[ERROR-DETECTOR] Protocol violation detected!" << std::endl;
                        error_detected = true;
                    } else {
                        std::cout << "[ERROR-DETECTOR] Protocol violation detected!" << std::endl;
                        error_detected = true;
                    }
                    break;
                    
                case ErrorType::TIMEOUT_ERROR:
                    std::cout << "[ERROR-DETECTOR] Timeout condition detected!" << std::endl;
                    error_detected = true;
                    break;
                    
                case ErrorType::BUFFER_OVERFLOW:
                    std::cout << "[ERROR-DETECTOR] Buffer overflow detected!" << std::endl;
                    error_detected = true;
                    break;
            }
        }
        
        data_error.write(error_detected);
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Error Test with FC4SC Coverage Integration ===" << std::endl;
    
    // Create testbench
    error_test_with_fc4sc tb("error_test_with_fc4sc");
    
    // Run simulation
    sc_start();
    
    std::cout << "=== Error Test with FC4SC Coverage Completed ===" << std::endl;
    return 0;
}