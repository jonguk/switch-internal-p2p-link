#include <systemc>
#include <uvm>
#include "simple_adder.h"
#include "simple_uvm_components.h"

using namespace sc_core;
using namespace uvm;

// =============================================================================
// Testbench Module
// =============================================================================
SC_MODULE(testbench) {
    // Clock and reset
    sc_clock clk;
    sc_signal<bool> reset;
    
    // DUT interface signals
    sc_signal<bool> valid_in;
    sc_signal<int> a;
    sc_signal<int> b;
    sc_signal<bool> valid_out;
    sc_signal<int> result;
    sc_signal<bool> ready;
    
    // DUT instance
    simple_adder* dut;
    
    // UVM components
    simple_test* test;
    
    SC_CTOR(testbench) : clk("clk", 10, SC_NS) {
        // Create and connect DUT
        dut = new simple_adder("dut");
        dut->clk(clk);
        dut->reset(reset);
        dut->valid_in(valid_in);
        dut->a(a);
        dut->b(b);
        dut->valid_out(valid_out);
        dut->result(result);
        dut->ready(ready);
        
        // Create UVM test
        test = simple_test::type_id::create("test", nullptr);
        
        // Connect UVM components to signals
        if (test && test->env && test->env->agent) {
            if (test->env->agent->driver) {
                test->env->agent->driver->valid_out = &valid_in;
                test->env->agent->driver->a_out = &a;
                test->env->agent->driver->b_out = &b;
                test->env->agent->driver->ready_in = &ready;
                test->env->agent->driver->clk = &clk;
            }
            
            if (test->env->agent->monitor) {
                test->env->agent->monitor->valid_in = &valid_out;
                test->env->agent->monitor->result_in = &result;
                test->env->agent->monitor->clk = &clk;
            }
        }
        
        // Reset sequence
        SC_THREAD(reset_process);
    }
    
    void reset_process() {
        reset.write(true);
        wait(20, SC_NS);
        reset.write(false);
        std::cout << "Reset sequence completed" << std::endl;
    }
    
    ~testbench() {
        delete dut;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Simple UVM + DUT Test ===" << std::endl;
    
    // Create testbench
    testbench tb("testbench");
    
    // Run UVM test
    run_test();
    
    std::cout << "=== Test completed successfully ===" << std::endl;
    return 0;
}