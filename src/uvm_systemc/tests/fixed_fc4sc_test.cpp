#include <systemc>
#include <iostream>
#include "../fc4sc/includes/fc4sc.hpp"

using namespace sc_core;

SC_MODULE(fixed_fc4sc_test) {
    sc_signal<int> port_sig;
    
    SC_CTOR(fixed_fc4sc_test) {
        SC_THREAD(test_process);
    }
    
    void test_process() {
        std::cout << "=== Fixed FC4SC Test Started ===" << std::endl;
        
        for (int port = 1; port <= 4; port++) {
            port_sig.write(port);
            wait(10, SC_NS);
            std::cout << "Port: " << port << std::endl;
        }
        
        try {
            fc4sc::global* g = fc4sc::global::getter();
            if (g != nullptr) {
                std::cout << "✅ FC4SC global instance OK!" << std::endl;
                fc4sc::xml_printer::coverage_save("build/fixed_fc4sc_coverage.xml");
                std::cout << "✅ FC4SC XML export OK!" << std::endl;
            }
        } catch (const std::exception& e) {
            std::cout << "❌ FC4SC error: " << e.what() << std::endl;
        }
        
        std::cout << "=== Fixed FC4SC Test Completed ===" << std::endl;
        sc_stop();
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Running Fixed FC4SC Test ===" << std::endl;
    fixed_fc4sc_test test("fixed_test");
    sc_start();
    std::cout << "=== Fixed FC4SC Test Done ===" << std::endl;
    return 0;
}
