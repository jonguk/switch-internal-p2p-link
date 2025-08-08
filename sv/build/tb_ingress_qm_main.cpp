#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vtb_ingress_queue_manager.h"

// SystemC time stamp function
double sc_time_stamp() { return 0; }

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);
    
    printf("🚀 Starting Ingress Queue Manager SystemVerilog testbench...\n");
    
    Vtb_ingress_queue_manager* tb = new Vtb_ingress_queue_manager;
    
    VerilatedVcdC* tfp = new VerilatedVcdC;
    tb->trace(tfp, 99);
    tfp->open("tb_ingress_queue_manager.vcd");
    
    int time_counter = 0;
    while (!Verilated::gotFinish() && time_counter < 1000000) { // 1ms timeout
        tb->eval();
        tfp->dump(time_counter);
        Verilated::timeInc(5); // 시간 진행
        time_counter += 5; // Advance time by 5ns steps (matches 100MHz clock)
        
        if (time_counter % 100000 == 0) {
            printf("⏱️  Time: %d ns\n", time_counter);
        }
    }
    
    if (time_counter >= 1000000) {
        printf("❌ Timeout after %d ns\n", time_counter);
    } else {
        printf("✅ Test completed at %d ns\n", time_counter);
    }
    
    tfp->close();
    delete tfp;
    delete tb;
    
    printf("✅ VCD saved to tb_ingress_queue_manager.vcd\n");
    
    return 0;
}