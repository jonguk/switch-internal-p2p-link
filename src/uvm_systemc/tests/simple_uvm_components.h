#ifndef SIMPLE_UVM_COMPONENTS_H
#define SIMPLE_UVM_COMPONENTS_H

#include <systemc>
#include <uvm>

using namespace sc_core;
using namespace uvm;

// =============================================================================
// Simple Transaction
// =============================================================================
class simple_transaction : public uvm_sequence_item {
public:
    int a;
    int b;
    int result;
    bool valid;
    
    UVM_OBJECT_UTILS(simple_transaction)
    
    simple_transaction(const std::string& name = "simple_transaction") 
        : uvm_sequence_item(name), a(0), b(0), result(0), valid(false) {
    }
    
    virtual std::string convert2string() const {
        std::ostringstream str;
        str << "a=" << a << " b=" << b << " result=" << result << " valid=" << valid;
        return str.str();
    }
};

// =============================================================================
// Simple Driver
// =============================================================================
class simple_driver : public uvm_driver<simple_transaction> {
public:
    // SystemC interface signals
    sc_signal<bool>* valid_out;
    sc_signal<int>* a_out;
    sc_signal<int>* b_out;
    sc_signal<bool>* ready_in;
    sc_clock* clk;
    
    UVM_COMPONENT_UTILS(simple_driver)
    
    simple_driver(uvm_component_name name) : uvm_driver<simple_transaction>(name) {
        valid_out = nullptr;
        a_out = nullptr;
        b_out = nullptr;
        ready_in = nullptr;
        clk = nullptr;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "Driver: Starting run phase" << std::endl;
        
        if (!valid_out || !a_out || !b_out || !ready_in || !clk) {
            UVM_ERROR(get_name(), "Driver ports not connected!");
            return;
        }
        
        // Initialize outputs
        valid_out->write(false);
        a_out->write(0);
        b_out->write(0);
        
        // Simple test sequence
        for (int i = 0; i < 5; i++) {
            // Wait for ready
            while (!ready_in->read()) {
                wait(10, SC_NS);  // Wait for clock period
            }
            
            // Drive transaction
            a_out->write(i);
            b_out->write(i + 1);
            valid_out->write(true);
            
            std::cout << "Driver: Sent a=" << i << " b=" << (i+1) << std::endl;
            
            wait(10, SC_NS);  // Wait for clock period
            valid_out->write(false);
            
            wait(10, SC_NS);  // Wait for clock period
        }
        
        std::cout << "Driver: Completed run phase" << std::endl;
    }
};

// =============================================================================
// Simple Monitor
// =============================================================================
class simple_monitor : public uvm_monitor {
public:
    // SystemC interface signals
    sc_signal<bool>* valid_in;
    sc_signal<int>* result_in;
    sc_clock* clk;
    
    UVM_COMPONENT_UTILS(simple_monitor)
    
    simple_monitor(uvm_component_name name) : uvm_monitor(name) {
        valid_in = nullptr;
        result_in = nullptr;
        clk = nullptr;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "Monitor: Starting run phase" << std::endl;
        
        if (!valid_in || !result_in || !clk) {
            UVM_ERROR(get_name(), "Monitor ports not connected!");
            return;
        }
        
        // Monitor transactions
        while (true) {
            wait(10, SC_NS);  // Wait for clock period
            
            if (valid_in->read()) {
                int result = result_in->read();
                std::cout << "Monitor: Observed result=" << result << std::endl;
            }
        }
    }
};

// =============================================================================
// Simple Agent
// =============================================================================
class simple_agent : public uvm_agent {
public:
    simple_driver* driver;
    simple_monitor* monitor;
    
    UVM_COMPONENT_UTILS(simple_agent)
    
    simple_agent(uvm_component_name name) : uvm_agent(name) {
        driver = nullptr;
        monitor = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_agent::build_phase(phase);
        
        driver = simple_driver::type_id::create("driver", this);
        monitor = simple_monitor::type_id::create("monitor", this);
        
        std::cout << "Agent: Build phase completed" << std::endl;
    }
};

// =============================================================================
// Simple Environment
// =============================================================================
class simple_env : public uvm_env {
public:
    simple_agent* agent;
    
    UVM_COMPONENT_UTILS(simple_env)
    
    simple_env(uvm_component_name name) : uvm_env(name) {
        agent = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_env::build_phase(phase);
        
        agent = simple_agent::type_id::create("agent", this);
        
        std::cout << "Environment: Build phase completed" << std::endl;
    }
};

// =============================================================================
// Simple Test
// =============================================================================
class simple_test : public uvm_test {
public:
    simple_env* env;
    
    UVM_COMPONENT_UTILS(simple_test)
    
    simple_test(uvm_component_name name) : uvm_test(name) {
        env = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_test::build_phase(phase);
        
        env = simple_env::type_id::create("env", this);
        
        std::cout << "Test: Build phase completed" << std::endl;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "Test: Starting run phase" << std::endl;
        phase.raise_objection(this);
        
        // Let the test run for some time
        wait(200, SC_NS);
        
        std::cout << "Test: Completed successfully" << std::endl;
        phase.drop_objection(this);
    }
};

#endif // SIMPLE_UVM_COMPONENTS_H