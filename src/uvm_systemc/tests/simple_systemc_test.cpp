#include <systemc.h>
#include "../systemc/port_manager/ingress_port_manager.h"

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Simple SystemC Test for Ingress Port Manager ===" << std::endl;
    
    // 기본적인 SystemC 환경 테스트
    sc_clock clk("clk", 10, SC_NS);
    sc_signal<bool> rst_n;
    
    std::cout << "SystemC environment initialized successfully" << std::endl;
    std::cout << "Clock period: " << clk.period() << std::endl;
    
    // 간단한 시뮬레이션
    rst_n.write(false);
    sc_start(20, SC_NS);
    rst_n.write(true);
    sc_start(100, SC_NS);
    
    std::cout << "=== Test completed successfully ===" << std::endl;
    return 0;
}