#include <systemc>
#include <iostream>

using namespace sc_core;

SC_MODULE(simple_fc4sc_test) {
    sc_signal<int> port_sig;
    
    SC_CTOR(simple_fc4sc_test) {
        SC_THREAD(test_process);
    }
    
    void test_process() {
        std::cout << "=== Simple Test Started ===" << std::endl;
        
        for (int port = 1; port <= 4; port++) {
            port_sig.write(port);
            wait(10, SC_NS);
            std::cout << "Port: " << port << std::endl;
        }
        
        std::cout << "=== Simple Test Completed ===" << std::endl;
        sc_stop();
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Running Simple Test ===" << std::endl;
    simple_fc4sc_test test("simple_test");
    sc_start();
    std::cout << "=== Simple Test Done ===" << std::endl;
    return 0;
}
