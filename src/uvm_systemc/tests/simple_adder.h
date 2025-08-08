#ifndef SIMPLE_ADDER_H
#define SIMPLE_ADDER_H

#include <systemc>

using namespace sc_core;

// Simple adder DUT for UVM testing
SC_MODULE(simple_adder) {
    // Ports
    sc_in<bool>     clk;
    sc_in<bool>     reset;
    sc_in<bool>     valid_in;
    sc_in<int>      a;
    sc_in<int>      b;
    
    sc_out<bool>    valid_out;
    sc_out<int>     result;
    sc_out<bool>    ready;
    
    // Internal signals
    sc_signal<bool> internal_ready;
    
    SC_CTOR(simple_adder) {
        SC_METHOD(compute_process);
        sensitive << clk.pos();
        reset_signal_is(reset, false);
        
        SC_METHOD(ready_process);
        sensitive << internal_ready;
    }
    
    void compute_process() {
        if (reset.read()) {
            valid_out.write(false);
            result.write(0);
            internal_ready.write(true);
        } else {
            if (valid_in.read() && internal_ready.read()) {
                // Simple addition with 1 cycle latency
                result.write(a.read() + b.read());
                valid_out.write(true);
                internal_ready.write(false);
                
                // Ready again next cycle
                next_trigger(clk.posedge_event());
                internal_ready.write(true);
            } else {
                valid_out.write(false);
            }
        }
    }
    
    void ready_process() {
        ready.write(internal_ready.read());
    }
};

#endif // SIMPLE_ADDER_H