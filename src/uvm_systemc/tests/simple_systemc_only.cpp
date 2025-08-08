#include <systemc>
#include <iostream>

using namespace sc_core;

// Simple SystemC module
SC_MODULE(simple_counter) {
    sc_in<bool> clk;
    sc_in<bool> reset;
    sc_out<int> count;
    
    int counter_value;
    
    SC_CTOR(simple_counter) : counter_value(0) {
        SC_METHOD(count_process);
        sensitive << clk.pos();
        reset_signal_is(reset, false);
    }
    
    void count_process() {
        if (reset.read()) {
            counter_value = 0;
        } else {
            counter_value++;
        }
        count.write(counter_value);
        
        std::cout << "@" << sc_time_stamp() 
                  << " Counter = " << counter_value << std::endl;
    }
};

// Simple testbench
SC_MODULE(testbench) {
    sc_clock clk;
    sc_signal<bool> reset;
    sc_signal<int> count;
    
    simple_counter* counter;
    
    SC_CTOR(testbench) : clk("clk", 10, SC_NS) {
        // Instantiate counter
        counter = new simple_counter("counter");
        counter->clk(clk);
        counter->reset(reset);
        counter->count(count);
        
        // Test process
        SC_THREAD(test_process);
    }
    
    void test_process() {
        std::cout << "=== SystemC Basic Test Started ===" << std::endl;
        
        // Reset sequence
        reset.write(true);
        wait(20, SC_NS);
        reset.write(false);
        
        // Run for some cycles
        wait(100, SC_NS);
        
        std::cout << "=== SystemC Basic Test Completed ===" << std::endl;
        sc_stop();
    }
    
    ~testbench() {
        delete counter;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting pure SystemC test..." << std::endl;
    
    testbench tb("testbench");
    sc_start();
    
    std::cout << "SystemC test finished successfully!" << std::endl;
    return 0;
}