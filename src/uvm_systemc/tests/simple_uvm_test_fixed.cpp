#include <systemc>
#include <uvm>

using namespace sc_core;
using namespace uvm;

int sc_main(int, char*[]) {
    std::cout << "=== Simple UVM SystemC Test ===" << std::endl;
    std::cout << "SystemC and UVM SystemC libraries loaded successfully!" << std::endl;
    std::cout << "Test completed without errors." << std::endl;
    
    return 0;
}