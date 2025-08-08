/**
 * Simple CSR Test with FC4SC Coverage
 * 
 * FC4SC를 사용한 간단한 CSR 테스트 및 커버리지 수집
 */

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_initiator_socket.h>
#include "/Users/jonguksong/Projects/cxl_switch/switch-internal-p2p-link/generated/switch_csr_csr_tlm.h"

// FC4SC 포함 (단순화)
#define FC4SC_NO_UVM
#include "../fc4sc/includes/fc4sc.hpp"

using namespace sc_core;
using namespace tlm;

// =============================================================================
// CSR Transaction with Coverage
// =============================================================================
struct csr_transaction {
    uint32_t address;
    uint32_t data;
    bool is_write;
    
    csr_transaction() : address(0), data(0), is_write(false) {}
    csr_transaction(uint32_t addr, uint32_t d, bool wr) 
        : address(addr), data(d), is_write(wr) {}
};

// =============================================================================
// FC4SC Coverage Model
// =============================================================================
class csr_coverage_model {
public:
    // Coverage points
    fc4sc::coverpoint<uint32_t> cp_address;
    fc4sc::coverpoint<bool> cp_is_write;
    fc4sc::coverpoint<uint32_t> cp_data;
    
    // Covergroup
    fc4sc::covergroup cg_csr_transactions;
    
    csr_coverage_model() : 
        cp_address("address_coverage"),
        cp_is_write("write_coverage"), 
        cp_data("data_coverage"),
        cg_csr_transactions("csr_transaction_coverage") {
        
        // Address bins
        cp_address.add_bin(fc4sc::bin<uint32_t>("device_id", 0x00000000));
        cp_address.add_bin(fc4sc::bin<uint32_t>("control", 0x00000004));
        cp_address.add_bin(fc4sc::bin<uint32_t>("status", 0x00000008));
        cp_address.add_bin(fc4sc::bin<uint32_t>("port_config", fc4sc::interval<uint32_t>(0x20, 0x2C)));
        
        // Write/Read coverage
        cp_is_write.add_bin(fc4sc::bin<bool>("write", true));
        cp_is_write.add_bin(fc4sc::bin<bool>("read", false));
        
        // Data patterns
        cp_data.add_bin(fc4sc::bin<uint32_t>("zero", 0));
        cp_data.add_bin(fc4sc::bin<uint32_t>("ones", 0xFFFFFFFF));
        cp_data.add_bin(fc4sc::bin<uint32_t>("pattern1", fc4sc::interval<uint32_t>(0x1000, 0x1FFF)));
        
        // Add to covergroup
        cg_csr_transactions.add_cov_point(cp_address);
        cg_csr_transactions.add_cov_point(cp_is_write);
        cg_csr_transactions.add_cov_point(cp_data);
    }
    
    void sample(const csr_transaction& trans) {
        cp_address.sample(trans.address);
        cp_is_write.sample(trans.is_write);
        cp_data.sample(trans.data);
    }
};

// =============================================================================
// Simple TLM Initiator for CSR Testing
// =============================================================================
class csr_test_initiator : public sc_module {
public:
    tlm_utils::simple_initiator_socket<csr_test_initiator> initiator_socket;
    csr_coverage_model coverage;
    
    SC_HAS_PROCESS(csr_test_initiator);
    
    csr_test_initiator(sc_module_name name) : sc_module(name) {
        SC_THREAD(test_process);
    }
    
private:
    void test_process() {
        wait(10, SC_NS);
        
        std::cout << "\n=== Starting CSR Tests with FC4SC Coverage ===" << std::endl;
        
        // Test 1: Device ID read
        test_device_id_read();
        
        // Test 2: Control register write/read
        test_control_register();
        
        // Test 3: Port config registers
        test_port_config_registers();
        
        // Test 4: Various data patterns
        test_data_patterns();
        
        wait(10, SC_NS);
        std::cout << "\n=== CSR Tests Complete ===" << std::endl;
        
        // Generate coverage report
        generate_coverage_report();
        
        sc_stop();
    }
    
    void test_device_id_read() {
        std::cout << "\n--- Testing Device ID Read ---" << std::endl;
        uint32_t value = tlm_read(0x00000000);
        std::cout << "Device ID: 0x" << std::hex << value << std::dec << std::endl;
        
        // Sample coverage
        csr_transaction trans(0x00000000, value, false);
        coverage.sample(trans);
    }
    
    void test_control_register() {
        std::cout << "\n--- Testing Control Register ---" << std::endl;
        
        // Read initial value
        uint32_t initial = tlm_read(0x00000004);
        std::cout << "Initial control: 0x" << std::hex << initial << std::dec << std::endl;
        coverage.sample(csr_transaction(0x00000004, initial, false));
        
        // Write new value
        uint32_t new_value = 0x00000041;
        tlm_write(0x00000004, new_value);
        std::cout << "Wrote control: 0x" << std::hex << new_value << std::dec << std::endl;
        coverage.sample(csr_transaction(0x00000004, new_value, true));
        
        // Read back
        uint32_t readback = tlm_read(0x00000004);
        std::cout << "Readback control: 0x" << std::hex << readback << std::dec << std::endl;
        coverage.sample(csr_transaction(0x00000004, readback, false));
    }
    
    void test_port_config_registers() {
        std::cout << "\n--- Testing Port Config Registers ---" << std::endl;
        
        for (int i = 0; i < 4; i++) {
            uint32_t addr = 0x00000020 + (i * 4);
            
            // Read
            uint32_t value = tlm_read(addr);
            std::cout << "Port " << i << " config: 0x" << std::hex << value << std::dec << std::endl;
            coverage.sample(csr_transaction(addr, value, false));
            
            // Write
            uint32_t new_val = 0x50 + i;
            tlm_write(addr, new_val);
            coverage.sample(csr_transaction(addr, new_val, true));
        }
    }
    
    void test_data_patterns() {
        std::cout << "\n--- Testing Data Patterns ---" << std::endl;
        
        uint32_t patterns[] = {0x00000000, 0xFFFFFFFF, 0x12345678, 0x1234};
        
        for (auto pattern : patterns) {
            tlm_write(0x00000004, pattern);
            coverage.sample(csr_transaction(0x00000004, pattern, true));
            
            uint32_t readback = tlm_read(0x00000004);
            coverage.sample(csr_transaction(0x00000004, readback, false));
        }
    }
    
    uint32_t tlm_read(uint32_t address) {
        tlm::tlm_generic_payload trans;
        sc_time delay = SC_ZERO_TIME;
        uint32_t data = 0;
        
        trans.set_command(tlm::TLM_READ_COMMAND);
        trans.set_address(address);
        trans.set_data_ptr(reinterpret_cast<unsigned char*>(&data));
        trans.set_data_length(4);
        trans.set_streaming_width(4);
        trans.set_byte_enable_ptr(0);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
        
        initiator_socket->b_transport(trans, delay);
        wait(delay);
        
        return data;
    }
    
    void tlm_write(uint32_t address, uint32_t data) {
        tlm::tlm_generic_payload trans;
        sc_time delay = SC_ZERO_TIME;
        
        trans.set_command(tlm::TLM_WRITE_COMMAND);
        trans.set_address(address);
        trans.set_data_ptr(reinterpret_cast<unsigned char*>(&data));
        trans.set_data_length(4);
        trans.set_streaming_width(4);
        trans.set_byte_enable_ptr(0);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
        
        initiator_socket->b_transport(trans, delay);
        wait(delay);
    }
    
    void generate_coverage_report() {
        std::cout << "\n=== FC4SC Coverage Report ===" << std::endl;
        
        // Print coverage summary
        std::cout << "Address Coverage: " << coverage.cp_address.get_coverage() << "%" << std::endl;
        std::cout << "Write Coverage: " << coverage.cp_is_write.get_coverage() << "%" << std::endl;
        std::cout << "Data Coverage: " << coverage.cp_data.get_coverage() << "%" << std::endl;
        std::cout << "Overall Coverage: " << coverage.cg_csr_transactions.get_coverage() << "%" << std::endl;
        
        // Generate reports
        fc4sc::global::write_coverage_report("fc4sc_coverage_report.xml");
        fc4sc::global::write_coverage_report("fc4sc_coverage_report.html");
        fc4sc::global::write_coverage_report("fc4sc_coverage_report.txt");
        
        std::cout << "Coverage reports generated: XML, HTML, TXT" << std::endl;
    }
};

// =============================================================================
// Testbench
// =============================================================================
class csr_testbench : public sc_module {
public:
    csr_test_initiator* initiator;
    switch_csr_csr_tlm* csr_model;
    
    csr_testbench(sc_module_name name) : sc_module(name) {
        // Create components
        initiator = new csr_test_initiator("initiator");
        csr_model = new switch_csr_csr_tlm("csr_model");
        
        // Connect
        initiator->initiator_socket.bind(csr_model->target_socket);
        
        std::cout << "CSR Testbench with FC4SC initialized" << std::endl;
    }
    
    ~csr_testbench() {
        delete initiator;
        delete csr_model;
    }
};

// =============================================================================
// Main
// =============================================================================
int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv;  // Suppress warnings
    
    // Initialize FC4SC
    fc4sc::global::initialize();
    
    // Create testbench
    csr_testbench tb("testbench");
    
    // Run simulation
    sc_start();
    
    // Finalize FC4SC
    fc4sc::global::finalize();
    
    std::cout << "Simulation completed successfully!" << std::endl;
    return 0;
}
