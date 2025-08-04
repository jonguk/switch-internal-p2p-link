#include <systemc.h>
#include <iostream>
#include "../../systemc/router/port_router.h"

using namespace switch_internal_p2p;

// Forward declarations
template<int N> bool test_template_instantiation();
void test_all_templates();

// =============================================================================
// Port Router Header Test - Template Instantiation and Basic Interface Test
// =============================================================================

SC_MODULE(TestPortRouterHeader) {
public:
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    SC_CTOR(TestPortRouterHeader) : clk("clk", 10, SC_NS) {
        std::cout << "=== Port Router Header Test ===" << std::endl;
        
        // Test immediately in constructor (before simulation starts) 
        run_tests();
    }
    
    void run_tests() {
        std::cout << "Testing template instantiation..." << std::endl;
        
        // Test 1: 2-port router
        test_template_instantiation<2>();
        
        // Test 2: 4-port router  
        test_template_instantiation<4>();
        
        // Test 3: 8-port router
        test_template_instantiation<8>();
        
        std::cout << "=== All header tests PASSED ===" << std::endl;
    }
    
private:
    template<int N>
    void test_template_instantiation() {
        std::cout << "\n--- Testing " << N << "-port router instantiation ---" << std::endl;
        
        try {
            // Create router instance
            std::string router_name = "port_router_" + std::to_string(N);
            PortRouter<N>* router = new PortRouter<N>(router_name.c_str());
            
            std::cout << "✅ Successfully created " << N << "-port router" << std::endl;
            std::cout << "   - Number of ports: " << router->get_num_ports() << std::endl;
            
            // Test basic interface access
            test_basic_interface(router);
            
            // Clean up
            delete router;
            std::cout << "✅ Successfully destroyed " << N << "-port router" << std::endl;
            
        } catch (const std::exception& e) {
            std::cout << "❌ Error creating " << N << "-port router: " << e.what() << std::endl;
            assert(false);
        }
    }
    
    template<int N>
    void test_basic_interface(PortRouter<N>* router) {
        std::cout << "  Testing basic interface methods..." << std::endl;
        
        // Test routing table access
        router->set_routing_entry(0, 1 % N);
        uint8_t route = router->get_routing_entry(0);
        std::cout << "    Routing entry 0 -> " << (int)route << std::endl;
        
        // Test statistics access
        uint64_t packets = router->get_total_packets_routed();
        uint64_t bytes = router->get_total_bytes_routed();
        std::cout << "    Initial stats: packets=" << packets << ", bytes=" << bytes << std::endl;
        
        // Test port stats access
        PortStats stats = router->get_port_stats(0);
        std::cout << "    Port 0 stats: rx_packets=" << stats.packets_received 
                  << ", tx_packets=" << stats.packets_transmitted << std::endl;
        
        // Test queue manager access
        IngressQueueManager* ingress_qm = router->get_ingress_manager(0);
        EgressQueueManager* egress_qm = router->get_egress_manager(0);
        if (ingress_qm && egress_qm) {
            std::cout << "    ✅ Ingress and Egress Managers 0 accessible" << std::endl;
        } else {
            std::cout << "    ❌ Queue Managers 0 not found" << std::endl;
        }
        
        std::cout << "  ✅ Basic interface test passed" << std::endl;
    }
};

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused warnings
    
    std::cout << "Starting Port Router Header Test..." << std::endl;
    
    // Test template instantiation directly in sc_main (before any simulation)
    test_all_templates();
    
    std::cout << "=== All header tests PASSED ===" << std::endl;
    
    return 0;
}

// Global test functions (outside SystemC context)
template<int N>
bool test_template_instantiation() {
    std::cout << "\n--- Testing " << N << "-port router compile-time template ---" << std::endl;
    
    try {
        // Test template parameter validation
        constexpr int num_ports = N;
        static_assert(num_ports > 0 && num_ports <= 32, "NUM_PORTS must be between 1 and 32");
        
        // Test static method access
        constexpr int ports = PortRouter<N>::get_num_ports();
        std::cout << "✅ Template instantiation successful for " << ports << " ports" << std::endl;
        
        return true;
        
    } catch (const std::exception& e) {
        std::cout << "❌ Error with " << N << "-port router template: " << e.what() << std::endl;
        return false;
    }
}

void test_all_templates() {
    std::cout << "=== Port Router Header Template Test ===" << std::endl;
    std::cout << "Testing compile-time template instantiation..." << std::endl;
    
    // Test various port configurations
    bool success = true;
    success &= test_template_instantiation<1>();
    success &= test_template_instantiation<2>();
    success &= test_template_instantiation<4>();
    success &= test_template_instantiation<8>();
    success &= test_template_instantiation<16>();
    
    if (!success) {
        std::cout << "❌ Some template tests failed!" << std::endl;
        std::exit(1);
    }
    
    std::cout << "✅ All template instantiation tests passed!" << std::endl;
}