#include <iostream>
#include <systemc>
#include "../fc4sc/includes/fc4sc.hpp"

using namespace sc_core;
using namespace std;

SC_MODULE(real_fc4sc_test) {
    // FC4SC signals
    sc_signal<int> dest_port_sig;
    sc_signal<int> payload_size_sig;
    
    // FC4SC covergroup and coverpoints
    fc4sc::covergroup* packet_cg;
    fc4sc::coverpoint<int>* cp_dest_port;
    fc4sc::coverpoint<int>* cp_payload_size;
    
    SC_CTOR(real_fc4sc_test) {
        std::cout << "[REAL-FC4SC] Creating Real FC4SC Coverage Test..." << std::endl;
        
        // Create covergroup
        packet_cg = new fc4sc::covergroup("packet_covergroup");
        
        // Create coverpoints
        cp_dest_port = new fc4sc::coverpoint<int>("dest_port_cp", &dest_port_sig);
        cp_dest_port->add_bins("port_1", fc4sc::bin<int>(1));
        cp_dest_port->add_bins("port_2", fc4sc::bin<int>(2));
        cp_dest_port->add_bins("port_3", fc4sc::bin<int>(3));
        cp_dest_port->add_bins("port_4", fc4sc::bin<int>(4));
        
        cp_payload_size = new fc4sc::coverpoint<int>("payload_size_cp", &payload_size_sig);
        cp_payload_size->add_bins("small", fc4sc::bin<int>(fc4sc::interval_t<int>(1, 64)));
        cp_payload_size->add_bins("medium", fc4sc::bin<int>(fc4sc::interval_t<int>(65, 256)));
        cp_payload_size->add_bins("large", fc4sc::bin<int>(fc4sc::interval_t<int>(257, 1024)));
        
        // Add coverpoints to covergroup
        packet_cg->add_coverpoint(cp_dest_port);
        packet_cg->add_coverpoint(cp_payload_size);
        
        std::cout << "[REAL-FC4SC] Real FC4SC Coverage initialized!" << std::endl;
        
        SC_THREAD(test_process);
    }
    
    void test_process() {
        std::cout << "[REAL-FC4SC] Starting Real FC4SC test..." << std::endl;
        
        // Generate some test data
        for (int i = 0; i < 20; i++) {
            int dest = (rand() % 4) + 1;
            int size = 32 + (rand() % 500);
            
            dest_port_sig.write(dest);
            payload_size_sig.write(size);
            
            // Sample coverage
            packet_cg->sample();
            
            std::cout << "[REAL-FC4SC] Sampled: dest=" << dest << " size=" << size << std::endl;
            
            wait(10, SC_NS);
        }
        
        // Print coverage report
        std::cout << "\n=== REAL FC4SC COVERAGE REPORT ===" << std::endl;
        double overall_coverage = packet_cg->get_coverage();
        std::cout << "Overall Coverage: " << std::fixed << std::setprecision(1) 
                  << overall_coverage << "%" << std::endl;
        
        // Export XML using real FC4SC
        try {
            fc4sc::xml_printer::coverage_save("build/real_fc4sc_coverage_report.xml");
            std::cout << "[REAL-FC4SC] ✅ Real FC4SC XML export successful!" << std::endl;
        } catch (const std::exception& e) {
            std::cerr << "[REAL-FC4SC] ❌ XML export failed: " << e.what() << std::endl;
        }
        
        if (overall_coverage >= 75.0) {
            std::cout << "\n🎉 ✅ REAL FC4SC TEST PASSED!" << std::endl;
        } else {
            std::cout << "\n❌ REAL FC4SC TEST FAILED!" << std::endl;
        }
        
        sc_stop();
    }
    
    ~real_fc4sc_test() {
        delete packet_cg;
        delete cp_dest_port;
        delete cp_payload_size;
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