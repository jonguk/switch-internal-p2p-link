#include <iostream>
#include <systemc>

// FC4SC 매크로 사용
#define FC4SC_DISABLE_SAMPLING false
#include "../fc4sc/includes/fc4sc.hpp"

using namespace sc_core;
using namespace std;

SC_MODULE(real_fc4sc_test) {
    sc_signal<int> dest_port_sig;
    sc_signal<int> payload_size_sig;
    
    // FC4SC covergroup 매크로 사용
    CG(packet_cg) {
        CP(dest_port) {
            BIN(port_1, 1);
            BIN(port_2, 2);
            BIN(port_3, 3);
            BIN(port_4, 4);
        }
        
        CP(payload_size) {
            BIN(small, RANGE(1, 64));
            BIN(medium, RANGE(65, 256));
            BIN(large, RANGE(257, 1024));
        }
    } packet_cg_inst;
    
    SC_CTOR(real_fc4sc_test) : packet_cg_inst("packet_cg") {
        std::cout << "[REAL-FC4SC] Creating Real FC4SC Coverage Test..." << std::endl;
        
        // FC4SC 매크로로 coverpoint 바인딩
        packet_cg_inst.dest_port(dest_port_sig);
        packet_cg_inst.payload_size(payload_size_sig);
        
        std::cout << "[REAL-FC4SC] Real FC4SC Coverage initialized!" << std::endl;
        
        SC_THREAD(test_process);
    }
    
    void test_process() {
        std::cout << "[REAL-FC4SC] Starting Real FC4SC test..." << std::endl;
        
        for (int i = 0; i < 20; i++) {
            int dest = (rand() % 4) + 1;
            int size = 32 + (rand() % 500);
            
            dest_port_sig.write(dest);
            payload_size_sig.write(size);
            
            // FC4SC 샘플링
            packet_cg_inst.sample();
            
            std::cout << "[REAL-FC4SC] Sampled: dest=" << dest << " size=" << size << std::endl;
            
            wait(10, SC_NS);
        }
        
        std::cout << "\n=== REAL FC4SC COVERAGE REPORT ===" << std::endl;
        double overall_coverage = packet_cg_inst.get_coverage();
        std::cout << "Overall Coverage: " << std::fixed << std::setprecision(1) 
                  << overall_coverage << "%" << std::endl;
        
        // FC4SC XML 리포트 생성
        fc4sc::global::getter()->print_xml("build/real_fc4sc_coverage_report.xml");
        std::cout << "[REAL-FC4SC] ✅ Real FC4SC XML export successful!" << std::endl;
        
        if (overall_coverage >= 50.0) {
            std::cout << "\n🎉 ✅ REAL FC4SC TEST PASSED!" << std::endl;
        } else {
            std::cout << "\n❌ REAL FC4SC TEST FAILED!" << std::endl;
        }
        
        sc_stop();
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Real FC4SC SystemC Test ===" << std::endl;
    std::cout << "Using Accellera FC4SC library" << std::endl;
    
    real_fc4sc_test test("real_fc4sc_test");
    
    sc_start();
    
    std::cout << "=== Real FC4SC Test completed ===" << std::endl;
    return 0;
}
