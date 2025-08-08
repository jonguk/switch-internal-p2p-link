#include <systemc.h>
#include <uvmsc/base/uvm_base.h>
#include <uvmsc/macros/uvm_macros.h>
#include <uvmsc/comps/uvm_comps.h>

using namespace sc_core;
using namespace uvm;

// Simple UVM test class
class simple_test : public uvm_test {
public:
    UVM_COMPONENT_UTILS(simple_test)
    
    simple_test(uvm_component_name name) : uvm_test(name) {
        UVM_INFO(get_type_name(), "Simple UVM Test created", UVM_MEDIUM);
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_test::build_phase(phase);
        UVM_INFO(get_type_name(), "Build phase completed", UVM_MEDIUM);
    }
    
    virtual void run_phase(uvm_phase& phase) {
        UVM_INFO(get_type_name(), "Starting run phase", UVM_MEDIUM);
        phase.raise_objection(this);
        
        // Simple test logic
        wait(100, SC_NS);
        
        UVM_INFO(get_type_name(), "Test completed successfully", UVM_MEDIUM);
        phase.drop_objection(this);
    }
};

int sc_main(int argc, char* argv[]) {
    // Initialize UVM
    uvm_init(argc, argv);
    
    // Create and run test
    uvm_config_db<uvm_object_wrapper*>::set(NULL, "*", "uvm_test_top", 
                                             simple_test::get_type());
    
    // Start UVM phases
    uvm_run_test();
    
    return 0;
}