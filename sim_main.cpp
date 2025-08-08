#include "Vegress_port_manager.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <iostream>

int main(int argc, char **argv) {
    // Initialize Verilator
    Verilated::commandArgs(argc, argv);
    
    // Create DUT instance  
    Vegress_port_manager* dut = new Vegress_port_manager;
    
    // Initialize VCD trace dumping
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    dut->trace(tfp, 99);
    tfp->open("egress_pm_test.vcd");
    
    std::cout << "🚀 Starting Egress Port Manager simulation..." << std::endl;
    
    // Initialize signals
    dut->clk = 0;
    dut->rst_n = 0;
    dut->port_id = 3;  // Test port 3
    
    // AXIS input (from queue manager) - M2S interface
    for (int i = 0; i < 5; i++) {  // Struct has 5 words (tvalid, tdata[2], tkeep, tuser[2], tlast)
        dut->axis_in_m2s[i] = 0;
    }
    
    // External output ready - S2M interface
    dut->ext_out_s2m = 1;  // ready = 1
    
    // AXI interfaces - struct fields  
    // Note: Verilator converts packed structs to bit arrays
    // We'll set them to all zeros for simplicity
    for (int i = 0; i < 3; i++) {
        dut->axi_in_m2s[i] = 0;
    }
    dut->axi_out_s2m = 1;  // ready = 1
    
    std::cout << "✅ Signals initialized" << std::endl;
    
    // Run simulation with manual clock control
    vluint64_t sim_time = 0;
    int clock_cycles = 0;
    
    while (!Verilated::gotFinish() && sim_time < 20000) {
        // Toggle clock every time unit
        if (sim_time % 5 == 0) {  // Clock period = 10ns (5ns high, 5ns low)
            dut->clk = !dut->clk;
            if (dut->clk) {
                clock_cycles++;
                
                // Release reset after 10 cycles
                if (clock_cycles == 10) {
                    dut->rst_n = 1;
                    std::cout << "✅ Reset released at cycle " << clock_cycles << std::endl;
                }
                
                // Simple test: Send a packet at cycle 20
                if (clock_cycles == 20) {
                    std::cout << "📤 Sending test packet..." << std::endl;
                    // Correct bit mapping:
                    // [137]: tvalid, [136:73]: tdata, [72:65]: tkeep, [64:1]: tuser, [0]: tlast
                    dut->axis_in_m2s[0] = 0x1234567890ABCDEF;  // tuser[31:0] + tlast=1
                    dut->axis_in_m2s[1] = 0xABCDEF12;          // tuser[63:32] 
                    dut->axis_in_m2s[2] = (0xFF << 1) | 0xBE;  // tkeep[7:0] + tdata[7:0]
                    dut->axis_in_m2s[3] = 0xEFCAFEBA;          // tdata[39:8]
                    dut->axis_in_m2s[4] = (1u << 9) | 0xDEAD; // tvalid=1 + tdata[63:40]
                }
                
                // Clear AXIS signals after one cycle
                if (clock_cycles == 21) {
                    for (int i = 0; i < 5; i++) {
                        dut->axis_in_m2s[i] = 0;
                    }
                }
                
                // Monitor external output - M2S struct contains [valid, data, keep, last]
                if (dut->ext_out_m2s[0] & 0x1) {  // Check valid bit
                    std::cout << "📦 External output: valid=1"
                              << ", last=" << ((dut->ext_out_m2s[2] >> 8) & 0x1)  // last bit
                              << ", data=0x" << std::hex << dut->ext_out_m2s[1] << std::dec  // data
                              << std::endl;
                }
                
                // Print progress every 100 cycles  
                if (clock_cycles % 100 == 0) {
                    std::cout << "⏱️  Cycle " << clock_cycles 
                              << ", tready=" << (int)(dut->axis_in_s2m & 0x1)  // tready bit
                              << ", ext_valid=" << (int)(dut->ext_out_m2s[0] & 0x1) << std::endl;  // valid bit
                }
            }
        }
        
        // Evaluate model
        dut->eval();
        
        // Dump waveform
        tfp->dump(sim_time);
        
        sim_time++;
    }
    
    std::cout << "🏁 Simulation completed!" << std::endl;
    std::cout << "📊 Total cycles: " << clock_cycles << std::endl;
    std::cout << "📊 Simulation time: " << sim_time << std::endl;
    
    // Cleanup
    tfp->close();
    delete dut;
    delete tfp;
    
    return 0;
}