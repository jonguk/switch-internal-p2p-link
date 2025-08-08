#include <systemc>
#include <uvm>

using namespace sc_core;
using namespace uvm;

// =============================================================================
// Simple UVM Test - Basic Components Only
// =============================================================================

class simple_transaction : public uvm_sequence_item {
public:
    int data_a;
    int data_b;
    int expected_result;
    
    UVM_OBJECT_UTILS(simple_transaction)
    
    simple_transaction(const std::string& name = "simple_transaction") 
        : uvm_sequence_item(name), data_a(0), data_b(0), expected_result(0) {
    }
    
    virtual std::string convert2string() const {
        std::ostringstream str;
        str << "a=" << data_a << " b=" << data_b << " expected=" << expected_result;
        return str.str();
    }
};

class simple_sequence : public uvm_sequence<simple_transaction> {
public:
    UVM_OBJECT_UTILS(simple_sequence)
    
    simple_sequence(const std::string& name = "simple_sequence") 
        : uvm_sequence<simple_transaction>(name) {
    }
    
    virtual void body() {
        std::cout << "Sequence: Starting body" << std::endl;
        
        for (int i = 0; i < 5; i++) {
            simple_transaction* req = simple_transaction::type_id::create("req");
            req->data_a = i;
            req->data_b = i + 1;
            req->expected_result = req->data_a + req->data_b;
            
            std::cout << "Sequence: Generated transaction " << req->convert2string() << std::endl;
            
            // In real UVM, this would be sent to sequencer
            // For now, just demonstrate the creation
        }
        
        std::cout << "Sequence: Body completed" << std::endl;
    }
};

class simple_driver : public uvm_driver<simple_transaction> {
public:
    UVM_COMPONENT_UTILS(simple_driver)
    
    simple_driver(uvm_component_name name) : uvm_driver<simple_transaction>(name) {
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "Driver: Starting run phase" << std::endl;
        
        // Simulate some processing time
        wait(100, SC_NS);
        
        std::cout << "Driver: Processing transactions..." << std::endl;
        
        // In real UVM, this would get transactions from sequencer
        // and drive them to DUT interface
        for (int i = 0; i < 3; i++) {
            std::cout << "Driver: Processing transaction " << i << std::endl;
            wait(20, SC_NS);
        }
        
        std::cout << "Driver: Run phase completed" << std::endl;
    }
};

class simple_monitor : public uvm_monitor {
public:
    UVM_COMPONENT_UTILS(simple_monitor)
    
    simple_monitor(uvm_component_name name) : uvm_monitor(name) {
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "Monitor: Starting run phase" << std::endl;
        
        // Simulate monitoring activity
        for (int i = 0; i < 5; i++) {
            wait(25, SC_NS);
            std::cout << "Monitor: Observed activity at time " << sc_time_stamp() << std::endl;
        }
        
        std::cout << "Monitor: Run phase completed" << std::endl;
    }
};

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
        
        // Create and run a simple sequence
        simple_sequence* seq = simple_sequence::type_id::create("main_seq");
        seq->body();
        
        // Let the test run
        wait(200, SC_NS);
        
        std::cout << "Test: Completed successfully" << std::endl;
        phase.drop_objection(this);
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Simple UVM Basic Test ===" << std::endl;
    
    // Run UVM test
    run_test();
    
    std::cout << "=== Test completed successfully ===" << std::endl;
    return 0;
}