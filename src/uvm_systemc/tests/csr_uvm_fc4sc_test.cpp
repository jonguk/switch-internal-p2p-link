/******************************************************************************
 * CSR UVM Test with FC4SC Coverage Integration
 * 
 * UVM 스타일 검증 환경으로 CSR 레지스터를 검증하고 FC4SC 커버리지를 통합합니다.
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
// CSR Register Definitions
// =============================================================================

enum CSR_Registers {
    DEVICE_ID_REG = 0x00000000,
    CONTROL_REG   = 0x00000004,
    STATUS_REG    = 0x00000008,
    PORT0_CONFIG  = 0x00000020,
    PORT1_CONFIG  = 0x00000024,
    PORT2_CONFIG  = 0x00000028,
    PORT3_CONFIG  = 0x0000002C
};

// =============================================================================
// FC4SC Style Coverage Model for CSR
// =============================================================================

class fc4sc_csr_coverage {
private:
    // Address coverage bins
    std::map<uint32_t, int> address_bins;
    std::map<uint32_t, std::string> address_names;
    
    // Operation type coverage
    std::map<bool, int> operation_bins;
    
    // Data pattern coverage
    std::map<std::string, int> data_pattern_bins;
    
    // Cross coverage: address × operation
    std::map<std::pair<uint32_t, bool>, int> cross_bins;
    
    int total_samples;
    
public:
    fc4sc_csr_coverage() : total_samples(0) {
        // Initialize address names
        address_names[DEVICE_ID_REG] = "DEVICE_ID";
        address_names[CONTROL_REG] = "CONTROL";
        address_names[STATUS_REG] = "STATUS";
        address_names[PORT0_CONFIG] = "PORT0_CONFIG";
        address_names[PORT1_CONFIG] = "PORT1_CONFIG";
        address_names[PORT2_CONFIG] = "PORT2_CONFIG";
        address_names[PORT3_CONFIG] = "PORT3_CONFIG";
        
        // Initialize bins
        for (const auto& pair : address_names) {
            address_bins[pair.first] = 0;
        }
        operation_bins[true] = 0;   // write
        operation_bins[false] = 0;  // read
        
        data_pattern_bins["ZERO"] = 0;
        data_pattern_bins["ONES"] = 0;
        data_pattern_bins["PATTERN"] = 0;
        data_pattern_bins["RANDOM"] = 0;
    }
    
    void sample(uint32_t address, bool is_write, uint32_t data) {
        address_bins[address]++;
        operation_bins[is_write]++;
        cross_bins[{address, is_write}]++;
        
        // Classify data pattern
        std::string pattern = classify_data_pattern(data);
        data_pattern_bins[pattern]++;
        
        total_samples++;
        
        std::cout << "[FC4SC-COV] Sampled: Addr=0x" << std::hex << address 
                  << " (" << address_names[address] << "), Op=" 
                  << (is_write ? "WRITE" : "READ") << ", Data=0x" << data 
                  << " (" << pattern << ")" << std::dec << std::endl;
    }
    
    void generate_reports() {
        generate_console_report();
        generate_xml_report();
        generate_html_report();
    }
    
private:
    std::string classify_data_pattern(uint32_t data) {
        if (data == 0x00000000) return "ZERO";
        if (data == 0xFFFFFFFF) return "ONES";
        if ((data & 0xF0F0F0F0) == 0x50505050) return "PATTERN";
        return "RANDOM";
    }
    
    void generate_console_report() {
        std::cout << "\n" << std::string(60, '=') << std::endl;
        std::cout << "FC4SC CSR COVERAGE REPORT" << std::endl;
        std::cout << std::string(60, '=') << std::endl;
        
        std::cout << "Total Samples: " << total_samples << std::endl;
        
        // Address Coverage
        std::cout << "\n--- Address Coverage ---" << std::endl;
        for (const auto& pair : address_bins) {
            double percentage = total_samples > 0 ? 
                (double)pair.second / total_samples * 100.0 : 0.0;
            std::cout << std::setw(15) << address_names[pair.first] 
                      << " (0x" << std::hex << pair.first << std::dec << "): " 
                      << std::setw(3) << pair.second 
                      << " samples (" << std::fixed << std::setprecision(1) 
                      << percentage << "%)" << std::endl;
        }
        
        // Operation Coverage
        std::cout << "\n--- Operation Coverage ---" << std::endl;
        for (const auto& pair : operation_bins) {
            double percentage = total_samples > 0 ? 
                (double)pair.second / total_samples * 100.0 : 0.0;
            std::cout << std::setw(15) << (pair.first ? "WRITE" : "READ")
                      << ": " << std::setw(3) << pair.second 
                      << " samples (" << std::fixed << std::setprecision(1) 
                      << percentage << "%)" << std::endl;
        }
        
        // Data Pattern Coverage
        std::cout << "\n--- Data Pattern Coverage ---" << std::endl;
        for (const auto& pair : data_pattern_bins) {
            double percentage = total_samples > 0 ? 
                (double)pair.second / total_samples * 100.0 : 0.0;
            std::cout << std::setw(15) << pair.first
                      << ": " << std::setw(3) << pair.second 
                      << " samples (" << std::fixed << std::setprecision(1) 
                      << percentage << "%)" << std::endl;
        }
        
        // Cross Coverage
        std::cout << "\n--- Cross Coverage (Address × Operation) ---" << std::endl;
        for (const auto& pair : cross_bins) {
            if (pair.second > 0) {
                uint32_t addr = pair.first.first;
                bool is_write = pair.first.second;
                std::cout << std::setw(15) << address_names[addr] 
                          << " × " << std::setw(5) << (is_write ? "WRITE" : "READ")
                          << ": " << pair.second << " samples" << std::endl;
            }
        }
        
        // Overall Coverage
        int covered_addresses = 0;
        for (const auto& pair : address_bins) {
            if (pair.second > 0) covered_addresses++;
        }
        
        double overall_coverage = address_bins.size() > 0 ? 
            (double)covered_addresses / address_bins.size() * 100.0 : 0.0;
            
        std::cout << "\n--- Overall Coverage ---" << std::endl;
        std::cout << "Addresses Covered: " << covered_addresses << "/" 
                  << address_bins.size() << " (" << std::fixed << std::setprecision(1) 
                  << overall_coverage << "%)" << std::endl;
        std::cout << std::string(60, '=') << std::endl;
    }
    
    void generate_xml_report() {
        std::ofstream xml_file("csr_fc4sc_coverage.xml");
        if (!xml_file.is_open()) {
            std::cerr << "[FC4SC-COV] Failed to create XML report" << std::endl;
            return;
        }
        
        xml_file << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
        xml_file << "<fc4sc_csr_coverage_report>\n";
        xml_file << "  <metadata>\n";
        xml_file << "    <test_name>CSR UVM Test</test_name>\n";
        xml_file << "    <total_samples>" << total_samples << "</total_samples>\n";
        xml_file << "    <timestamp>" << sc_time_stamp() << "</timestamp>\n";
        xml_file << "  </metadata>\n";
        
        // Address Coverpoints
        xml_file << "  <coverpoints>\n";
        xml_file << "    <coverpoint name=\"csr_addresses\">\n";
        for (const auto& pair : address_bins) {
            xml_file << "      <bin name=\"" << address_names[pair.first] 
                     << "\" address=\"0x" << std::hex << pair.first << std::dec
                     << "\" count=\"" << pair.second << "\"/>\n";
        }
        xml_file << "    </coverpoint>\n";
        
        xml_file << "    <coverpoint name=\"operations\">\n";
        for (const auto& pair : operation_bins) {
            xml_file << "      <bin name=\"" << (pair.first ? "WRITE" : "READ") 
                     << "\" count=\"" << pair.second << "\"/>\n";
        }
        xml_file << "    </coverpoint>\n";
        
        xml_file << "    <coverpoint name=\"data_patterns\">\n";
        for (const auto& pair : data_pattern_bins) {
            xml_file << "      <bin name=\"" << pair.first 
                     << "\" count=\"" << pair.second << "\"/>\n";
        }
        xml_file << "    </coverpoint>\n";
        xml_file << "  </coverpoints>\n";
        
        // Cross Coverage
        xml_file << "  <cross_coverage name=\"address_x_operation\">\n";
        for (const auto& pair : cross_bins) {
            if (pair.second > 0) {
                xml_file << "    <cross_bin address=\"" << address_names[pair.first.first] 
                         << "\" operation=\"" << (pair.first.second ? "WRITE" : "READ") 
                         << "\" count=\"" << pair.second << "\"/>\n";
            }
        }
        xml_file << "  </cross_coverage>\n";
        
        xml_file << "</fc4sc_csr_coverage_report>\n";
        xml_file.close();
        
        std::cout << "[FC4SC-COV] XML report generated: csr_fc4sc_coverage.xml" << std::endl;
    }
    
    void generate_html_report() {
        std::ofstream html_file("csr_fc4sc_coverage.html");
        if (!html_file.is_open()) {
            std::cerr << "[FC4SC-COV] Failed to create HTML report" << std::endl;
            return;
        }
        
        html_file << R"(<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FC4SC CSR Coverage Report</title>
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
            background: linear-gradient(135deg, #4facfe, #00f2fe);
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
        .addr-code { font-family: monospace; background: #f1f2f6; padding: 2px 4px; border-radius: 3px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📋 FC4SC CSR Coverage Report</h1>
            <p>Control and Status Register Verification Analysis</p>
        </div>
        <div class="content">
            <div class="metric-card">
                <div class="metric-title">📊 Overview</div>
                <p><strong>Total Samples:</strong> )" << total_samples << R"(</p>
                <p><strong>Test Type:</strong> CSR UVM Test with FC4SC Coverage</p>
                <p><strong>Timestamp:</strong> )" << sc_time_stamp() << R"(</p>
            </div>
            
            <div class="metric-card">
                <div class="metric-title">🎯 Address Coverage</div>
                <table>
                    <tr><th>Register</th><th>Address</th><th>Samples</th><th>Coverage</th></tr>)";
        
        for (const auto& pair : address_bins) {
            double percentage = total_samples > 0 ? 
                (double)pair.second / total_samples * 100.0 : 0.0;
            html_file << "<tr><td>" << address_names[pair.first] << "</td>"
                      << "<td class=\"addr-code\">0x" << std::hex << pair.first << std::dec << "</td>"
                      << "<td>" << pair.second << "</td>"
                      << "<td><div class=\"coverage-bar\"><div class=\"coverage-fill\" style=\"width:" 
                      << percentage << "%\"></div></div>" << std::fixed << std::setprecision(1) 
                      << percentage << "%</td></tr>";
        }
        
        html_file << R"(                </table>
            </div>
            
            <div class="metric-card">
                <div class="metric-title">🔧 Operation Coverage</div>
                <table>
                    <tr><th>Operation</th><th>Samples</th><th>Percentage</th></tr>)";
        
        for (const auto& pair : operation_bins) {
            double percentage = total_samples > 0 ? 
                (double)pair.second / total_samples * 100.0 : 0.0;
            html_file << "<tr><td>" << (pair.first ? "WRITE" : "READ") << "</td>"
                      << "<td>" << pair.second << "</td>"
                      << "<td>" << std::fixed << std::setprecision(1) << percentage << "%</td></tr>";
        }
        
        html_file << R"(                </table>
            </div>
        </div>
    </div>
</body>
</html>)";
        
        html_file.close();
        std::cout << "[FC4SC-COV] HTML report generated: csr_fc4sc_coverage.html" << std::endl;
    }
};

// =============================================================================
// CSR Transaction
// =============================================================================

class csr_transaction {
public:
    uint32_t address;
    uint32_t data;
    bool is_write;
    bool response_ok;
    
    csr_transaction(uint32_t addr = 0, uint32_t d = 0, bool wr = false) 
        : address(addr), data(d), is_write(wr), response_ok(true) {}
        
    void print() const {
        std::cout << "[TXN] " << (is_write ? "WRITE" : "READ") 
                  << " addr=0x" << std::hex << address 
                  << " data=0x" << data << std::dec 
                  << " resp=" << (response_ok ? "OK" : "ERROR") << std::endl;
    }
    
    // Stream operator for sc_fifo compatibility
    friend std::ostream& operator<<(std::ostream& os, const csr_transaction& txn) {
        os << (txn.is_write ? "WRITE" : "READ") 
           << " addr=0x" << std::hex << txn.address 
           << " data=0x" << txn.data << std::dec 
           << " resp=" << (txn.response_ok ? "OK" : "ERROR");
        return os;
    }
};

// =============================================================================
// CSR Model (Simple Register Model)
// =============================================================================

class csr_model {
private:
    std::map<uint32_t, uint32_t> registers;
    
public:
    csr_model() {
        // Initialize registers with default values
        registers[DEVICE_ID_REG] = 0x12345678;  // Device ID
        registers[CONTROL_REG] = 0x00000000;    // Control register
        registers[STATUS_REG] = 0x00000001;     // Status register (ready)
        registers[PORT0_CONFIG] = 0x00000000;   // Port configs
        registers[PORT1_CONFIG] = 0x00000000;
        registers[PORT2_CONFIG] = 0x00000000;
        registers[PORT3_CONFIG] = 0x00000000;
    }
    
    uint32_t read(uint32_t address) {
        if (registers.find(address) != registers.end()) {
            return registers[address];
        }
        std::cout << "[CSR-MODEL] Warning: Read from invalid address 0x" 
                  << std::hex << address << std::dec << std::endl;
        return 0xDEADBEEF;  // Error pattern
    }
    
    bool write(uint32_t address, uint32_t data) {
        if (address == DEVICE_ID_REG) {
            std::cout << "[CSR-MODEL] Warning: Cannot write to read-only DEVICE_ID" << std::endl;
            return false;  // Read-only register
        }
        
        if (registers.find(address) != registers.end()) {
            registers[address] = data;
            return true;
        }
        
        std::cout << "[CSR-MODEL] Warning: Write to invalid address 0x" 
                  << std::hex << address << std::dec << std::endl;
        return false;
    }
    
    void print_state() {
        std::cout << "\n--- CSR Model State ---" << std::endl;
        for (const auto& pair : registers) {
            std::cout << "0x" << std::hex << pair.first << ": 0x" 
                      << pair.second << std::dec << std::endl;
        }
        std::cout << "-----------------------" << std::endl;
    }
};

// =============================================================================
// UVM-Style Driver
// =============================================================================

SC_MODULE(csr_driver) {
    sc_fifo<csr_transaction>* req_fifo;
    sc_fifo<csr_transaction>* rsp_fifo;
    csr_model* model;
    fc4sc_csr_coverage* coverage;
    
    SC_CTOR(csr_driver) {
        SC_THREAD(drive_process);
    }
    
    void set_interfaces(sc_fifo<csr_transaction>* req, 
                       sc_fifo<csr_transaction>* rsp,
                       csr_model* mdl,
                       fc4sc_csr_coverage* cov) {
        req_fifo = req;
        rsp_fifo = rsp;
        model = mdl;
        coverage = cov;
    }
    
    void drive_process() {
        while (true) {
            csr_transaction txn;
            req_fifo->read(txn);
            
            std::cout << "[DRIVER] Driving transaction..." << std::endl;
            txn.print();
            
            // Execute transaction on model
            if (txn.is_write) {
                txn.response_ok = model->write(txn.address, txn.data);
            } else {
                txn.data = model->read(txn.address);
                txn.response_ok = true;
            }
            
            // Sample coverage
            coverage->sample(txn.address, txn.is_write, txn.data);
            
            // Send response
            rsp_fifo->write(txn);
            
            wait(10, SC_NS);  // Transaction delay
        }
    }
};

// =============================================================================
// UVM-Style Monitor
// =============================================================================

SC_MODULE(csr_monitor) {
    sc_fifo<csr_transaction>* rsp_fifo;
    sc_fifo<csr_transaction>* analysis_fifo;
    
    SC_CTOR(csr_monitor) {
        SC_THREAD(monitor_process);
    }
    
    void set_interfaces(sc_fifo<csr_transaction>* rsp, 
                       sc_fifo<csr_transaction>* analysis) {
        rsp_fifo = rsp;
        analysis_fifo = analysis;
    }
    
    void monitor_process() {
        while (true) {
            csr_transaction txn;
            rsp_fifo->read(txn);
            
            std::cout << "[MONITOR] Observed transaction..." << std::endl;
            txn.print();
            
            // Forward to scoreboard
            analysis_fifo->write(txn);
            
            wait(1, SC_NS);
        }
    }
};

// =============================================================================
// UVM-Style Scoreboard
// =============================================================================

SC_MODULE(csr_scoreboard) {
    sc_fifo<csr_transaction>* analysis_fifo;
    int transactions_checked;
    int errors_detected;
    
    SC_CTOR(csr_scoreboard) : transactions_checked(0), errors_detected(0) {
        SC_THREAD(check_process);
    }
    
    void set_interfaces(sc_fifo<csr_transaction>* analysis) {
        analysis_fifo = analysis;
    }
    
    void check_process() {
        while (true) {
            csr_transaction txn;
            analysis_fifo->read(txn);
            
            transactions_checked++;
            
            // Check for errors
            if (!txn.response_ok) {
                errors_detected++;
                std::cout << "[SCOREBOARD] ERROR: Transaction failed!" << std::endl;
            }
            
            // Check for invalid data patterns
            if (!txn.is_write && txn.data == 0xDEADBEEF) {
                errors_detected++;
                std::cout << "[SCOREBOARD] ERROR: Invalid address read detected!" << std::endl;
            }
            
            std::cout << "[SCOREBOARD] Checked transaction " << transactions_checked 
                      << ", errors: " << errors_detected << std::endl;
            
            wait(1, SC_NS);
        }
    }
    
    void print_summary() {
        std::cout << "\n=== SCOREBOARD SUMMARY ===" << std::endl;
        std::cout << "Total Transactions: " << transactions_checked << std::endl;
        std::cout << "Errors Detected: " << errors_detected << std::endl;
        if (errors_detected == 0) {
            std::cout << "✅ All transactions PASSED!" << std::endl;
        } else {
            std::cout << "❌ " << errors_detected << " transactions FAILED!" << std::endl;
        }
        std::cout << "==========================" << std::endl;
    }
};

// =============================================================================
// UVM-Style Sequence
// =============================================================================

SC_MODULE(csr_sequence) {
    sc_fifo<csr_transaction>* req_fifo;
    csr_scoreboard* scoreboard;
    fc4sc_csr_coverage* coverage;
    csr_model* model;
    
    SC_CTOR(csr_sequence) {
        SC_THREAD(sequence_process);
    }
    
    void set_interfaces(sc_fifo<csr_transaction>* req, 
                       csr_scoreboard* sb,
                       fc4sc_csr_coverage* cov,
                       csr_model* mdl) {
        req_fifo = req;
        scoreboard = sb;
        coverage = cov;
        model = mdl;
    }
    
    void sequence_process() {
        wait(20, SC_NS);  // Wait for initialization
        
        std::cout << "\n=== Starting CSR UVM Sequence ===" << std::endl;
        
        // Test 1: Read all registers
        test_read_all_registers();
        
        // Test 2: Write/read control register
        test_control_register();
        
        // Test 3: Write/read port config registers
        test_port_config_registers();
        
        // Test 4: Error injection - invalid addresses
        test_invalid_addresses();
        
        // Test 5: Data patterns
        test_data_patterns();
        
        wait(50, SC_NS);  // Allow all transactions to complete
        
        std::cout << "\n=== CSR UVM Sequence Complete ===" << std::endl;
        
        // Generate final reports before stopping
        wait(10, SC_NS);  // Small delay for cleanup
        generate_final_reports();
        sc_stop();
    }
    
    void generate_final_reports() {
        std::cout << "\n=== Generating Final Reports ===" << std::endl;
        scoreboard->print_summary();
        coverage->generate_reports();
        model->print_state();
    }
    
private:
    void test_read_all_registers() {
        std::cout << "\n--- Test: Read All Registers ---" << std::endl;
        
        std::vector<uint32_t> addresses = {
            DEVICE_ID_REG, CONTROL_REG, STATUS_REG,
            PORT0_CONFIG, PORT1_CONFIG, PORT2_CONFIG, PORT3_CONFIG
        };
        
        for (uint32_t addr : addresses) {
            csr_transaction txn(addr, 0, false);  // Read
            req_fifo->write(txn);
            wait(5, SC_NS);
        }
    }
    
    void test_control_register() {
        std::cout << "\n--- Test: Control Register Write/Read ---" << std::endl;
        
        std::vector<uint32_t> test_values = {0x00000001, 0x00000041, 0xFFFFFFFF, 0x00000000};
        
        for (uint32_t value : test_values) {
            // Write
            csr_transaction write_txn(CONTROL_REG, value, true);
            req_fifo->write(write_txn);
            wait(5, SC_NS);
            
            // Read back
            csr_transaction read_txn(CONTROL_REG, 0, false);
            req_fifo->write(read_txn);
            wait(5, SC_NS);
        }
    }
    
    void test_port_config_registers() {
        std::cout << "\n--- Test: Port Config Registers ---" << std::endl;
        
        std::vector<uint32_t> port_addresses = {
            PORT0_CONFIG, PORT1_CONFIG, PORT2_CONFIG, PORT3_CONFIG
        };
        
        for (size_t i = 0; i < port_addresses.size(); i++) {
            uint32_t addr = port_addresses[i];
            uint32_t config_value = 0x50505050 + i;
            
            // Write
            csr_transaction write_txn(addr, config_value, true);
            req_fifo->write(write_txn);
            wait(5, SC_NS);
            
            // Read back
            csr_transaction read_txn(addr, 0, false);
            req_fifo->write(read_txn);
            wait(5, SC_NS);
        }
    }
    
    void test_invalid_addresses() {
        std::cout << "\n--- Test: Invalid Addresses ---" << std::endl;
        
        std::vector<uint32_t> invalid_addresses = {0x00000100, 0x00001000, 0xFFFFFFFF};
        
        for (uint32_t addr : invalid_addresses) {
            // Try read
            csr_transaction read_txn(addr, 0, false);
            req_fifo->write(read_txn);
            wait(5, SC_NS);
            
            // Try write
            csr_transaction write_txn(addr, 0xDEADBEEF, true);
            req_fifo->write(write_txn);
            wait(5, SC_NS);
        }
    }
    
    void test_data_patterns() {
        std::cout << "\n--- Test: Data Patterns ---" << std::endl;
        
        std::vector<uint32_t> patterns = {
            0x00000000, 0xFFFFFFFF, 0x55555555, 0xAAAAAAAA,
            0x12345678, 0x87654321, 0x50505050
        };
        
        for (uint32_t pattern : patterns) {
            csr_transaction write_txn(CONTROL_REG, pattern, true);
            req_fifo->write(write_txn);
            wait(5, SC_NS);
            
            csr_transaction read_txn(CONTROL_REG, 0, false);
            req_fifo->write(read_txn);
            wait(5, SC_NS);
        }
    }
};

// =============================================================================
// CSR UVM Testbench with FC4SC Integration
// =============================================================================

SC_MODULE(csr_uvm_testbench) {
    // UVM Components
    csr_sequence* seq;
    csr_driver* drv;
    csr_monitor* mon;
    csr_scoreboard* sb;
    
    // Model and Coverage
    csr_model* model;
    fc4sc_csr_coverage* coverage;
    
    // Communication FIFOs
    sc_fifo<csr_transaction>* req_fifo;
    sc_fifo<csr_transaction>* rsp_fifo;
    sc_fifo<csr_transaction>* analysis_fifo;
    
    SC_CTOR(csr_uvm_testbench) {
        std::cout << "[CSR-UVM] Creating CSR UVM Testbench with FC4SC Coverage..." << std::endl;
        
        // Create FIFOs
        req_fifo = new sc_fifo<csr_transaction>("req_fifo", 10);
        rsp_fifo = new sc_fifo<csr_transaction>("rsp_fifo", 10);
        analysis_fifo = new sc_fifo<csr_transaction>("analysis_fifo", 10);
        
        // Create model and coverage
        model = new csr_model();
        coverage = new fc4sc_csr_coverage();
        
        // Create UVM components
        seq = new csr_sequence("sequence");
        drv = new csr_driver("driver");
        mon = new csr_monitor("monitor");
        sb = new csr_scoreboard("scoreboard");
        
        // Connect interfaces
        seq->set_interfaces(req_fifo, sb, coverage, model);
        drv->set_interfaces(req_fifo, rsp_fifo, model, coverage);
        mon->set_interfaces(rsp_fifo, analysis_fifo);
        sb->set_interfaces(analysis_fifo);
        
        // Cleanup process
        SC_THREAD(cleanup_process);
        
        std::cout << "[CSR-UVM] CSR UVM Testbench initialized!" << std::endl;
    }
    
    void cleanup_process() {
        // Wait for the sequence to complete and signal for report generation
        while (sc_time_stamp() < sc_time(800, SC_NS)) {
            wait(10, SC_NS);
        }
        
        // Generate final reports
        std::cout << "\n=== Generating Final Reports ===" << std::endl;
        sb->print_summary();
        coverage->generate_reports();
        model->print_state();
    }
    
    ~csr_uvm_testbench() {
        delete seq;
        delete drv;
        delete mon;
        delete sb;
        delete model;
        delete coverage;
        delete req_fifo;
        delete rsp_fifo;
        delete analysis_fifo;
    }
};

// =============================================================================
// Main
// =============================================================================

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv;  // Suppress warnings
    
    std::cout << "=== CSR UVM Test with FC4SC Coverage Integration ===" << std::endl;
    
    // Create testbench
    csr_uvm_testbench tb("csr_uvm_testbench");
    
    // Run simulation
    sc_start();
    
    std::cout << "=== CSR UVM Test with FC4SC Coverage Completed ===" << std::endl;
    return 0;
}
