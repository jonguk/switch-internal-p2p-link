/*!
 * \file test_riscv_cpu_wrapper.cpp
 * \brief Basic test for RISC-V CPU Wrapper prototype
 * \author Switch Development Team  
 * \date August 2024
 */

#include "systemc.h"
#include "../../systemc/cpu_wrapper/riscv_cpu_wrapper.h"
#include "../../systemc/common/switch_types.h"
#include <iostream>
#include <vector>

using namespace switch_internal_p2p;

/**
 * @brief Test bench for RISC-V CPU Wrapper
 */
class TestRISCVCpuWrapper : public sc_module {
public:
    // =============================================================================
    // Test Signals
    // =============================================================================
    
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // AXIS Input Interface  
    sc_signal<bool> axis_in_tvalid;
    sc_signal<sc_biguint<AXIS_DATA_WIDTH>> axis_in_tdata;
    sc_signal<sc_biguint<AXIS_DATA_WIDTH/8>> axis_in_tkeep;
    sc_signal<sc_uint<AXIS_USER_WIDTH>> axis_in_tuser;
    sc_signal<bool> axis_in_tlast;
    sc_signal<bool> axis_in_tready;
    
    // AXIS Output Interface
    sc_signal<bool> axis_out_tvalid;
    sc_signal<sc_biguint<AXIS_DATA_WIDTH>> axis_out_tdata;
    sc_signal<sc_biguint<AXIS_DATA_WIDTH/8>> axis_out_tkeep;
    sc_signal<sc_uint<AXIS_USER_WIDTH>> axis_out_tuser;
    sc_signal<bool> axis_out_tlast;
    sc_signal<bool> axis_out_tready;
    
    // AXI Configuration Interface
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_uint<32>> axi_slave_addr;
    sc_signal<sc_uint<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Device Under Test
    RISCVCpuWrapper* dut;
    
    // =============================================================================
    // Constructor
    // =============================================================================
    
    SC_CTOR(TestRISCVCpuWrapper) : 
        clk("clk", sc_time(10, SC_NS)), // 100MHz clock
        rst_n("rst_n"),
        axis_in_tvalid("axis_in_tvalid"),
        axis_in_tdata("axis_in_tdata"),
        axis_in_tkeep("axis_in_tkeep"),
        axis_in_tuser("axis_in_tuser"),
        axis_in_tlast("axis_in_tlast"),
        axis_in_tready("axis_in_tready"),
        axis_out_tvalid("axis_out_tvalid"),
        axis_out_tdata("axis_out_tdata"),
        axis_out_tkeep("axis_out_tkeep"),
        axis_out_tuser("axis_out_tuser"),
        axis_out_tlast("axis_out_tlast"),
        axis_out_tready("axis_out_tready"),
        axi_slave_valid("axi_slave_valid"),
        axi_slave_addr("axi_slave_addr"),
        axi_slave_data("axi_slave_data"),
        axi_slave_ready("axi_slave_ready")
    {
        // Create DUT
        dut = new RISCVCpuWrapper("dut");
        
        // Connect clock and reset
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // Connect AXIS input interface
        dut->axis_in_tvalid(axis_in_tvalid);
        dut->axis_in_tdata(axis_in_tdata);
        dut->axis_in_tkeep(axis_in_tkeep);
        dut->axis_in_tuser(axis_in_tuser);
        dut->axis_in_tlast(axis_in_tlast);
        dut->axis_in_tready(axis_in_tready);
        
        // Connect AXIS output interface
        dut->axis_out_tvalid(axis_out_tvalid);
        dut->axis_out_tdata(axis_out_tdata);
        dut->axis_out_tkeep(axis_out_tkeep);
        dut->axis_out_tuser(axis_out_tuser);
        dut->axis_out_tlast(axis_out_tlast);
        dut->axis_out_tready(axis_out_tready);
        
        // Connect AXI interface
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Register test process
        SC_THREAD(test_process);
        
        // Register output ready driver
        SC_THREAD(output_ready_driver);
        
        std::cout << "[TestRISCVCpuWrapper] ✅ Test bench created" << std::endl;
    }
    
    // =============================================================================
    // Destructor
    // =============================================================================
    
    ~TestRISCVCpuWrapper() {
        delete dut;
    }

private:
    // =============================================================================
    // Test Methods
    // =============================================================================
    
    void test_process() {
        std::cout << "\n🧪 ===== RISC-V CPU Wrapper Prototype Test Started =====" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test sequence
        test_reset();
        test_basic_axis_reception();
        test_credit_management();
        test_axi_configuration();
        
        // Test results
        print_test_results();
        
        std::cout << "🎉 ===== RISC-V CPU Wrapper Prototype Test Completed =====" << std::endl;
        sc_stop();
    }
    
    void output_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            axis_out_tready.write(true); // Always ready for output
        }
    }
    
    void initialize_signals() {
        std::cout << "[Test] 🔧 Initializing signals..." << std::endl;
        
        // Reset state
        rst_n.write(false);
        
        // AXIS Input (idle)
        axis_in_tvalid.write(false);
        axis_in_tdata.write(sc_biguint<AXIS_DATA_WIDTH>(0));
        axis_in_tkeep.write(sc_biguint<AXIS_DATA_WIDTH/8>(0));
        axis_in_tuser.write(0);
        axis_in_tlast.write(false);
        
        // AXI (idle)
        axi_slave_valid.write(false);
        axi_slave_addr.write(0);
        axi_slave_data.write(0);
        
        wait(50, SC_NS);
    }
    
    void test_reset() {
        std::cout << "\n[Test] 🔄 Testing Reset..." << std::endl;
        
        // Assert reset
        rst_n.write(false);
        wait(100, SC_NS);
        
        // Check reset state
        if (!axis_in_tready.read()) {
            std::cout << "[Test] ✅ AXIS input not ready during reset (correct)" << std::endl;
        } else {
            std::cout << "[Test] ❌ AXIS input should not be ready during reset" << std::endl;
        }
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);
        
        // Check post-reset state
        if (axis_in_tready.read()) {
            std::cout << "[Test] ✅ AXIS input ready after reset (correct)" << std::endl;
        } else {
            std::cout << "[Test] ❌ AXIS input should be ready after reset" << std::endl;
        }
    }
    
    void test_basic_axis_reception() {
        std::cout << "\n[Test] 📨 Testing AXIS Packet Reception..." << std::endl;
        
        // Create a simple error packet
        std::vector<uint8_t> packet_data = {
            0x01, 0x02, 0x03, 0x04,  // Error data
            0x05, 0x06, 0x07, 0x08,  // More error data
            0xAA, 0xBB, 0xCC, 0xDD   // Error signature
        };
        
        // Create internal header for high priority packet (error-like)
        InternalHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::HIGH_PRIORITY);
        header.queue_id = 0xFF;  // Special error queue
        header.dest_port = 4;    // CPU port
        header.source_port = 0;  // From port 0
        header.packet_length = packet_data.size();
        header.sequence_number = 1;
        
        // Send packet
        send_axis_packet(packet_data, header);
        
        // Wait for processing
        wait(1000, SC_NS);
        
        // Check statistics
        uint32_t packets_processed = dut->get_packets_processed();
        if (packets_processed > 0) {
            std::cout << "[Test] ✅ Packet processed successfully (count=" << packets_processed << ")" << std::endl;
        } else {
            std::cout << "[Test] ❌ No packets processed" << std::endl;
        }
    }
    
    void test_credit_management() {
        std::cout << "\n[Test] 💳 Testing Credit Management..." << std::endl;
        
        // Check initial credits
        uint32_t initial_credits = dut->get_current_credits();
        std::cout << "[Test] Initial credits: " << initial_credits << std::endl;
        
        // Send multiple packets to consume credits
        for (int i = 0; i < 5; i++) {
            std::vector<uint8_t> small_packet = {0x10, 0x20, 0x30, 0x40};
            
            InternalHeader header;
            header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
            header.queue_id = i % 4;
            header.dest_port = 4;
            header.source_port = 1;
            header.packet_length = small_packet.size();
            header.sequence_number = i + 2;
            
            send_axis_packet(small_packet, header);
            wait(100, SC_NS);
        }
        
        // Wait for credit management to kick in
        wait(1000, SC_NS);
        
        // Check if credits are managed properly
        uint32_t final_credits = dut->get_current_credits();
        std::cout << "[Test] Final credits: " << final_credits << std::endl;
        
        if (final_credits <= initial_credits) {
            std::cout << "[Test] ✅ Credits consumed as expected" << std::endl;
        } else {
            std::cout << "[Test] ❌ Credit management not working correctly" << std::endl;
        }
    }
    
    void test_axi_configuration() {
        std::cout << "\n[Test] 🔧 Testing AXI Configuration..." << std::endl;
        
        // Test credit configuration
        send_axi_write(0x0004, 24); // Set max credits to 24
        wait(100, SC_NS);
        
        // Test reset command
        send_axi_write(0x0000, 1); // Send reset command
        wait(100, SC_NS);
        
        std::cout << "[Test] ✅ AXI configuration commands sent" << std::endl;
    }
    
    void send_axis_packet(const std::vector<uint8_t>& data, const InternalHeader& header) {
        std::cout << "[Test] 📤 Sending AXIS packet (size=" << data.size() << ")" << std::endl;
        
        // Calculate number of beats needed
        int bytes_per_beat = AXIS_DATA_WIDTH / 8;
        int num_beats = (data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (int beat = 0; beat < num_beats; beat++) {
            // Wait for ready signal
            while (!axis_in_tready.read()) {
                wait(clk.posedge_event());
            }
            
            // Prepare beat data
            sc_biguint<AXIS_DATA_WIDTH> tdata = 0;
            sc_biguint<AXIS_DATA_WIDTH/8> tkeep = 0;
            
            for (int byte = 0; byte < bytes_per_beat; byte++) {
                int data_index = beat * bytes_per_beat + byte;
                if (data_index < (int)data.size()) {
                    tdata |= (sc_biguint<AXIS_DATA_WIDTH>(data[data_index]) << (byte * 8));
                    tkeep[byte] = 1;
                }
            }
            
            // Set signals
            axis_in_tvalid.write(true);
            axis_in_tdata.write(tdata);
            axis_in_tkeep.write(tkeep);
            axis_in_tlast.write(beat == num_beats - 1);
            
            // Set tuser on first beat (contains header)
            if (beat == 0) {
                sc_bv<AXIS_USER_WIDTH> tuser_bv = header.to_sc_bv();
                axis_in_tuser.write(sc_uint<AXIS_USER_WIDTH>(tuser_bv.to_uint64()));
            } else {
                axis_in_tuser.write(0);
            }
            
            // Wait for clock edge
            wait(clk.posedge_event());
        }
        
        // End transaction
        axis_in_tvalid.write(false);
        axis_in_tlast.write(false);
        axis_in_tdata.write(sc_biguint<AXIS_DATA_WIDTH>(0));
        axis_in_tkeep.write(sc_biguint<AXIS_DATA_WIDTH/8>(0));
        axis_in_tuser.write(0);
        
        std::cout << "[Test] ✅ AXIS packet sent (" << num_beats << " beats)" << std::endl;
    }
    
    void send_axi_write(uint32_t addr, uint32_t data) {
        std::cout << "[Test] 🔧 Sending AXI write: addr=0x" << std::hex << addr 
                  << ", data=0x" << data << std::dec << std::endl;
        
        // Wait for ready
        while (!axi_slave_ready.read()) {
            axi_slave_valid.write(true);
            axi_slave_addr.write(addr);
            axi_slave_data.write(data);
            wait(clk.posedge_event());
        }
        
        // Complete transaction
        wait(clk.posedge_event());
        axi_slave_valid.write(false);
        axi_slave_addr.write(0);
        axi_slave_data.write(0);
    }
    
    void print_test_results() {
        std::cout << "\n📊 ===== Test Results =====" << std::endl;
        std::cout << "Packets Processed: " << dut->get_packets_processed() << std::endl;
        std::cout << "Current Credits: " << dut->get_current_credits() << std::endl;
        std::cout << "Ready for Packets: " << (dut->is_ready_for_packets() ? "Yes" : "No") << std::endl;
    }
};

// =============================================================================
// Main Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused parameter warnings
    
    // Create test bench
    TestRISCVCpuWrapper test("test");
    
    // Run simulation with timeout
    sc_start(10, SC_MS);
    
    return 0;
}