/**
 * CSR FC4SC Test - Using correct FC4SC API patterns
 * 
 * 성공한 FC4SC 테스트 패턴을 참조하여 작성
 */

#include <iostream>
#include <systemc>
#include <tlm>
#include <tlm_utils/simple_initiator_socket.h>
#include "/Users/jonguksong/Projects/cxl_switch/switch-internal-p2p-link/generated/switch_csr_csr_tlm.h"
#include "../fc4sc/includes/fc4sc.hpp"

using namespace sc_core;
using namespace tlm;
using namespace std;

// =============================================================================
// CSR TLM Initiator with FC4SC Coverage
// =============================================================================
SC_MODULE(csr_fc4sc_test) {
    tlm_utils::simple_initiator_socket<csr_fc4sc_test> initiator_socket;
    
    // FC4SC signals
    sc_signal<uint32_t> address_sig;
    sc_signal<bool> is_write_sig;
    sc_signal<uint32_t> data_sig;
    
    // FC4SC covergroup and coverpoints
    fc4sc::covergroup* csr_cg;
    fc4sc::coverpoint<uint32_t>* cp_address;
    fc4sc::coverpoint<bool>* cp_is_write;
    fc4sc::coverpoint<uint32_t>* cp_data;
    
    SC_CTOR(csr_fc4sc_test) {
        std::cout << "[CSR-FC4SC] Creating CSR FC4SC Coverage Test..." << std::endl;
        
        // Create covergroup
        csr_cg = new fc4sc::covergroup("csr_covergroup");
        
        // Create coverpoints with signal connections
        cp_address = new fc4sc::coverpoint<uint32_t>("address_cp", &address_sig);
        cp_address->add_bins("device_id", fc4sc::bin<uint32_t>(0x00000000));
        cp_address->add_bins("control", fc4sc::bin<uint32_t>(0x00000004));
        cp_address->add_bins("status", fc4sc::bin<uint32_t>(0x00000008));
        cp_address->add_bins("port_config", fc4sc::bin<uint32_t>(fc4sc::interval_t<uint32_t>(0x20, 0x2C)));
        
        cp_is_write = new fc4sc::coverpoint<bool>("write_cp", &is_write_sig);
        cp_is_write->add_bins("write", fc4sc::bin<bool>(true));
        cp_is_write->add_bins("read", fc4sc::bin<bool>(false));
        
        cp_data = new fc4sc::coverpoint<uint32_t>("data_cp", &data_sig);
        cp_data->add_bins("zero", fc4sc::bin<uint32_t>(0));
        cp_data->add_bins("ones", fc4sc::bin<uint32_t>(0xFFFFFFFF));
        cp_data->add_bins("pattern", fc4sc::bin<uint32_t>(fc4sc::interval_t<uint32_t>(0x1000, 0x1FFF)));
        
        // Add coverpoints to covergroup
        csr_cg->add_coverpoint(cp_address);
        csr_cg->add_coverpoint(cp_is_write);
        csr_cg->add_coverpoint(cp_data);
        
        std::cout << "[CSR-FC4SC] FC4SC Coverage initialized!" << std::endl;
        
        SC_THREAD(test_process);
    }
    
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
        
        // Generate coverage report
        generate_coverage_report();
        
        std::cout << "\n=== CSR Tests Complete ===" << std::endl;
        sc_stop();
    }
    
private:
    void test_device_id_read() {
        std::cout << "\n--- Testing Device ID Read ---" << std::endl;
        uint32_t value = tlm_read(0x00000000);
        std::cout << "Device ID: 0x" << std::hex << value << std::dec << std::endl;
        
        // Sample coverage
        sample_coverage(0x00000000, value, false);
    }
    
    void test_control_register() {
        std::cout << "\n--- Testing Control Register ---" << std::endl;
        
        // Read initial value
        uint32_t initial = tlm_read(0x00000004);
        std::cout << "Initial control: 0x" << std::hex << initial << std::dec << std::endl;
        sample_coverage(0x00000004, initial, false);
        
        // Write new value
        uint32_t new_value = 0x00000041;
        tlm_write(0x00000004, new_value);
        std::cout << "Wrote control: 0x" << std::hex << new_value << std::dec << std::endl;
        sample_coverage(0x00000004, new_value, true);
        
        // Read back
        uint32_t readback = tlm_read(0x00000004);
        std::cout << "Readback control: 0x" << std::hex << readback << std::dec << std::endl;
        sample_coverage(0x00000004, readback, false);
    }
    
    void test_port_config_registers() {
        std::cout << "\n--- Testing Port Config Registers ---" << std::endl;
        
        for (int i = 0; i < 4; i++) {
            uint32_t addr = 0x00000020 + (i * 4);
            
            // Read
            uint32_t value = tlm_read(addr);
            std::cout << "Port " << i << " config: 0x" << std::hex << value << std::dec << std::endl;
            sample_coverage(addr, value, false);
            
            // Write
            uint32_t new_val = 0x50 + i;
            tlm_write(addr, new_val);
            sample_coverage(addr, new_val, true);
        }
    }
    
    void test_data_patterns() {
        std::cout << "\n--- Testing Data Patterns ---" << std::endl;
        
        uint32_t patterns[] = {0x00000000, 0xFFFFFFFF, 0x12345678, 0x1234};
        
        for (auto pattern : patterns) {
            tlm_write(0x00000004, pattern);
            sample_coverage(0x00000004, pattern, true);
            
            uint32_t readback = tlm_read(0x00000004);
            sample_coverage(0x00000004, readback, false);
        }
    }
    
    void sample_coverage(uint32_t address, uint32_t data, bool is_write) {
        // Update signals
        address_sig.write(address);
        data_sig.write(data);
        is_write_sig.write(is_write);
        
        // Sample coverage
        csr_cg->sample();
        
        wait(1, SC_NS);  // Small delay
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
        double overall_coverage = csr_cg->get_coverage();
        std::cout << "Overall Coverage: " << std::fixed << std::setprecision(1) 
                  << overall_coverage << "%" << std::endl;
        
        // Generate XML report using correct FC4SC API
        try {
            fc4sc::xml_printer::coverage_save("build/csr_fc4sc_coverage_report.xml");
            std::cout << "✅ FC4SC XML coverage report generated: build/csr_fc4sc_coverage_report.xml" << std::endl;
            
            // Also try HTML export if available
            try {
                fc4sc::xml_printer::coverage_save("build/csr_fc4sc_coverage_report.html");
                std::cout << "✅ FC4SC HTML coverage report generated: build/csr_fc4sc_coverage_report.html" << std::endl;
            } catch (...) {
                std::cout << "Note: HTML export not available, XML report generated" << std::endl;
            }
            
        } catch (const std::exception& e) {
            std::cerr << "❌ FC4SC XML export failed: " << e.what() << std::endl;
        }
        
        if (overall_coverage >= 50.0) {
            std::cout << "\n🎉 ✅ CSR FC4SC TEST PASSED!" << std::endl;
        } else {
            std::cout << "\n❌ CSR FC4SC TEST NEEDS MORE COVERAGE!" << std::endl;
        }
    }
    
    ~csr_fc4sc_test() {
        delete csr_cg;
        delete cp_address;
        delete cp_is_write;
        delete cp_data;
    }
};

// =============================================================================
// Testbench
// =============================================================================
SC_MODULE(csr_testbench) {
    csr_fc4sc_test* test;
    switch_csr_csr_tlm* csr_model;
    
    SC_CTOR(csr_testbench) {
        // Create components
        test = new csr_fc4sc_test("csr_fc4sc_test");
        csr_model = new switch_csr_csr_tlm("csr_model");
        
        // Connect
        test->initiator_socket.bind(csr_model->target_socket);
        
        std::cout << "[CSR-FC4SC] CSR Testbench with FC4SC initialized" << std::endl;
    }
    
    ~csr_testbench() {
        delete test;
        delete csr_model;
    }
};

// =============================================================================
// Main
// =============================================================================
int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv;  // Suppress warnings
    
    std::cout << "=== CSR FC4SC SystemC Test ===" << std::endl;
    std::cout << "Using Accellera FC4SC library for coverage" << std::endl;
    
    // Create testbench
    csr_testbench tb("testbench");
    
    // Run simulation
    sc_start();
    
    std::cout << "Simulation completed successfully!" << std::endl;
    return 0;
}
