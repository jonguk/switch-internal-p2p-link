#include "Vingress_queue_manager.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <iostream>

int main(int argc, char **argv) {
    // Initialize Verilator
    Verilated::commandArgs(argc, argv);

    // Create DUT instance
    Vingress_queue_manager* dut = new Vingress_queue_manager;

    // Initialize VCD trace dumping
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    dut->trace(tfp, 99);
    tfp->open("ingress_qm_test.vcd");

    std::cout << "🚀 Starting Ingress Queue Manager simulation..." << std::endl;

    // Initialize signals
    dut->clk = 0;
    dut->rst_n = 0;
    dut->port_id = 1;  // Test port 1

    // AXIS input (from ingress port manager) - M2S interface
    for (int i = 0; i < 5; i++) {  // Struct has 5 words (tvalid, tdata[2], tkeep, tuser[2], tlast)
        dut->axis_in_m2s[i] = 0;
    }

    // Internal AXIS output ready - S2M interface
    dut->internal_out_s2m = 1;  // ready = 1

    // AXI interfaces
    for (int i = 0; i < 3; i++) {
        dut->axi_in_m2s[i] = 0;
    }
    dut->axi_out_s2m = 1;  // ready = 1

    std::cout << "✅ Signals initialized" << std::endl;

    // Run simulation with manual clock control
    vluint64_t sim_time = 0;
    int clock_cycles = 0;

    while (!Verilated::gotFinish() && sim_time < 2000) {  // Reduce to 200 cycles
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

                // Test 1: Send a single-beat packet at cycle 20
                if (clock_cycles == 20) {
                    std::cout << "📤 Sending single-beat test packet..." << std::endl;
                    // Struct layout: [tvalid, tdata[63:0], tkeep[7:0], tuser[63:0], tlast]
                    dut->axis_in_m2s[0] = 0x1111222233334445ULL;  // tuser[31:0] + tlast=1
                    dut->axis_in_m2s[1] = 0x55667788;             // tuser[63:32] 
                    dut->axis_in_m2s[2] = (0xFF << 1) | 0xAA;     // tkeep[7:0] + tdata[7:0]
                    dut->axis_in_m2s[3] = 0xBBCCDDEE;             // tdata[39:8]
                    dut->axis_in_m2s[4] = (1u << 9) | 0x1122;    // tvalid=1 + tdata[63:40]
                }

                // Clear AXIS signals after one cycle
                if (clock_cycles == 21) {
                    for (int i = 0; i < 5; i++) {
                        dut->axis_in_m2s[i] = 0;
                    }
                }

                // Test 2: Send a multi-beat packet at cycle 50
                if (clock_cycles == 50) {
                    std::cout << "📤 Sending multi-beat packet (beat 1/2)..." << std::endl;
                    dut->axis_in_m2s[0] = 0x2222333344445556ULL;  // Different header
                    dut->axis_in_m2s[1] = 0x66778899;             
                    dut->axis_in_m2s[2] = (0xFF << 1) | 0x11;     // tkeep=0xFF, first data byte
                    dut->axis_in_m2s[3] = 0x22334455;             
                    dut->axis_in_m2s[4] = (1u << 9) | 0x6677;    // tvalid=1, no tlast yet
                }

                if (clock_cycles == 51) {
                    std::cout << "📤 Sending multi-beat packet (beat 2/2)..." << std::endl;
                    dut->axis_in_m2s[0] = 0x2222333344445556ULL;  // Same header (tuser)
                    dut->axis_in_m2s[1] = 0x66778899;             
                    dut->axis_in_m2s[2] = (0x0F << 1) | 0x88;     // tkeep=0x0F (4 bytes), data
                    dut->axis_in_m2s[3] = 0x99AABBCC;             
                    dut->axis_in_m2s[4] = (1u << 9) | 0xDDEE;    // tvalid=1 + tlast=0
                    // Note: We should set tlast=1 for this final beat
                    dut->axis_in_m2s[0] |= 0x1;  // Set tlast=1 in LSB
                }

                // Clear AXIS signals after multi-beat packet
                if (clock_cycles == 52) {
                    for (int i = 0; i < 5; i++) {
                        dut->axis_in_m2s[i] = 0;
                    }
                }

                // Monitor internal output - M2S struct contains [tvalid, tdata, tkeep, tuser, tlast]
                if (dut->internal_out_m2s[0] & 0x1) {  // Check tvalid bit
                    std::cout << "📦 Internal output: valid=1"
                              << ", last=" << ((dut->internal_out_m2s[0] >> 8) & 0x1)  // tlast bit
                              << ", data=0x" << std::hex << dut->internal_out_m2s[1] << std::dec  // tdata lower
                              << std::endl;
                }

                // Print progress every 50 cycles
                if (clock_cycles % 50 == 0) {
                    std::cout << "⏱️  Cycle " << clock_cycles 
                              << ", axis_tready=" << (int)(dut->axis_in_s2m & 0x1)  // tready bit
                              << ", internal_tvalid=" << (int)(dut->internal_out_m2s[0] & 0x1) << std::endl;  // tvalid bit
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