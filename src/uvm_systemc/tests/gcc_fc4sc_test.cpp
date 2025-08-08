#include <systemc>
#include <iostream>
#include "../fc4sc/includes/fc4sc.hpp"

using namespace sc_core;

SC_MODULE(gcc_fc4sc_test) {
    sc_signal<int> port_sig;
    
    SC_CTOR(gcc_fc4sc_test) {
        SC_THREAD(test_process);
    }
    
    void test_process() {
        std::cout << "=== GCC FC4SC Test Started ===" << std::endl;
        
        for (int port = 1; port <= 4; port++) {
            port_sig.write(port);
            wait(10, SC_NS);
            std::cout << "Port: " << port << std::endl;
        }
        
        try {
            fc4sc::global* g = fc4sc::global::getter();
            if (g != nullptr) {
                std::cout << "✅ FC4SC global instance created successfully!" << std::endl;
                
                // XML 출력 시도 - 올바른 방법 찾기
                std::ofstream xml_file("build/gcc_fc4sc_coverage.xml");
                if (xml_file.is_open()) {
                    xml_printer printer(xml_file);
                    printer.print_data_xml(g);
                    xml_file.close();
                    std::cout << "✅ FC4SC XML export successful!" << std::endl;
                } else {
                    std::cout << "❌ Could not create XML file" << std::endl;
                }
            }
        } catch (const std::exception& e) {
            std::cout << "❌ FC4SC error: " << e.what() << std::endl;
        }
        
        std::cout << "=== GCC FC4SC Test Completed ===" << std::endl;
        sc_stop();
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Running GCC FC4SC Test ===" << std::endl;
    gcc_fc4sc_test test("gcc_fc4sc_test");
    sc_start();
    std::cout << "=== GCC FC4SC Test Done ===" << std::endl;
    return 0;
}
