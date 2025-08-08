#include <systemc>
#include <iostream>
#include "../fc4sc/includes/fc4sc.hpp"

using namespace sc_core;

// 공식 FC4SC 예제 스타일을 따른 간단한 테스트
SC_MODULE(simple_fc4sc_test) {
    sc_signal<int> port_sig;
    sc_signal<int> size_sig;
    
    SC_CTOR(simple_fc4sc_test) {
        SC_THREAD(test_process);
    }
    
    void test_process() {
        std::cout << "=== Simple FC4SC Test Started ===" << std::endl;
        
        // 간단한 테스트 데이터
        for (int port = 1; port <= 4; port++) {
            for (int size : {32, 128}) {
                port_sig.write(port);
                size_sig.write(size);
                wait(10, SC_NS);
                
                std::cout << "Sampled: port=" << port << ", size=" << size << std::endl;
            }
        }
        
        std::cout << "=== Simple FC4SC Test Completed ===" << std::endl;
        sc_stop();
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Running Simple FC4SC Test ===" << std::endl;
    
    simple_fc4sc_test test("simple_fc4sc_test");
    sc_start();
    
    std::cout << "=== Simple FC4SC Test Done ===" << std::endl;
    return 0;
}