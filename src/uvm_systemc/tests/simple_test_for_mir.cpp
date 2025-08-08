// Simple test for LLVM IR and MIR extraction
#include <iostream>
#include <systemc.h>

using namespace sc_core;

SC_MODULE(simple_counter) {
    sc_in<bool> clk;
    sc_in<bool> reset;
    sc_out<int> count;
    
    int counter_value;
    
    SC_CTOR(simple_counter) : counter_value(0) {
        SC_METHOD(count_process);
        sensitive << clk.pos();
    }
    
    void count_process() {
        if (reset.read()) {
            counter_value = 0;
        } else {
            counter_value++;
        }
        count.write(counter_value);
        
        std::cout << "Counter: " << counter_value << std::endl;
    }
};

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv;
    
    sc_clock clk("clk", 10, SC_NS);
    sc_signal<bool> reset;
    sc_signal<int> count;
    
    simple_counter counter("counter");
    counter.clk(clk);
    counter.reset(reset);
    counter.count(count);
    
    reset.write(true);
    sc_start(20, SC_NS);
    reset.write(false);
    sc_start(100, SC_NS);
    
    return 0;
}
