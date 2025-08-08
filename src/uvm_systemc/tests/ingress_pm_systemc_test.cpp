#include <systemc>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/common/switch_types.h"

using namespace sc_core;
using namespace switch_internal_p2p;

// =============================================================================
// Pure SystemC Test for Ingress Port Manager (no UVM)
// =============================================================================
SC_MODULE(ingress_pm_testbench) {
    // Clock and reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External interface signals
    sc_signal<bool> ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_signal<bool> ext_last;
    sc_signal<bool> ext_ready;
    
    // AXIS interface signals
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // AXI interface signals (simplified)
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Credit interface signals
    sc_signal<bool> credit_return_valid;
    sc_signal<bool> credit_return_ready;
    
    // DUT instance
    IngressPortManager* dut;
    
    // Test statistics
    int packets_sent;
    int packets_received;
    bool test_passed;
    
    SC_CTOR(ingress_pm_testbench) : clk("clk", 10, SC_NS), packets_sent(0), packets_received(0), test_passed(false) {
        // Create DUT
        dut = new IngressPortManager("dut");
        
        // Connect DUT
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // External interface
        dut->ext_valid(ext_valid);
        dut->ext_data(ext_data);
        dut->ext_keep(ext_keep);
        dut->ext_last(ext_last);
        dut->ext_ready(ext_ready);
        
        // AXIS interface
        dut->axis_tvalid(axis_tvalid);
        dut->axis_tdata(axis_tdata);
        dut->axis_tkeep(axis_tkeep);
        dut->axis_tuser(axis_tuser);
        dut->axis_tlast(axis_tlast);
        dut->axis_tready(axis_tready);
        
        // AXI interface
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Credit interface
        dut->credit_return_valid(credit_return_valid);
        dut->credit_return_ready(credit_return_ready);
        
        // Configure DUT
        dut->set_port_id(1);
        
        // Register processes
        SC_THREAD(reset_process);
        SC_THREAD(stimulus_process);
        SC_THREAD(monitor_process);
        SC_THREAD(control_signals_process);
        SC_THREAD(test_controller);
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[RESET] Reset sequence completed" << std::endl;
    }
    
    void stimulus_process() {
        // Wait for reset
        wait(50, SC_NS);
        
        std::cout << "[STIMULUS] Starting test sequence" << std::endl;
        
        // Test Case 1: Single packet
        std::cout << "[TEST 1] Single packet test" << std::endl;
        send_test_packet(2, 32);  // Dest port 2, 32 byte payload
        wait(100, SC_NS);
        
        // Test Case 2: Multiple packets
        std::cout << "[TEST 2] Multiple packet test" << std::endl;
        for (int i = 0; i < 3; i++) {
            send_test_packet(i + 3, 64);  // Different dest ports, 64 byte payload
            wait(50, SC_NS);
        }
        
        // Test Case 3: Large packet
        std::cout << "[TEST 3] Large packet test" << std::endl;
        send_test_packet(7, 256);  // Large packet
        wait(200, SC_NS);
        
        std::cout << "[STIMULUS] All test packets sent" << std::endl;
    }
    
    void monitor_process() {
        int observed_packets = 0;
        int expected_packets = 5;  // 1 + 3 + 1 packets
        
        while (observed_packets < expected_packets) {
            wait(10, SC_NS);
            
            if (axis_tvalid.read() && axis_tready.read()) {
                sc_bv<AXIS_USER_WIDTH> user = axis_tuser.read();
                bool last = axis_tlast.read();
                
                std::cout << "[MONITOR] AXIS beat observed - last=" << last 
                          << " user=0x" << std::hex << user.to_uint64() << std::dec << std::endl;
                
                if (last) {
                    observed_packets++;
                    packets_received++;
                    std::cout << "[MONITOR] Packet " << observed_packets << "/" << expected_packets << " completed" << std::endl;
                }
            }
        }
        
        std::cout << "[MONITOR] All expected packets observed" << std::endl;
        test_passed = true;
    }
    
    void control_signals_process() {
        // Keep AXIS and AXI interfaces ready
        axis_tready.write(true);
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        credit_return_valid.write(false);
    }
    
    void test_controller() {
        // Wait for test completion or timeout
        sc_time timeout = sc_time(5000, SC_NS);
        sc_time start_time = sc_time_stamp();
        
        while (!test_passed && (sc_time_stamp() - start_time) < timeout) {
            wait(100, SC_NS);
        }
        
        if (test_passed) {
            std::cout << "\n[RESULT] ✅ TEST PASSED" << std::endl;
        } else {
            std::cout << "\n[RESULT] ❌ TEST FAILED (timeout)" << std::endl;
        }
        
        print_statistics();
        sc_stop();
    }
    
    void send_test_packet(uint8_t dest_port, uint16_t payload_size) {
        std::cout << "[STIMULUS] Sending packet to port " << (int)dest_port 
                  << " with payload size " << payload_size << std::endl;
        
        // Create test packet data
        std::vector<uint8_t> packet_data;
        
        // Create external packet header
        ExternalPacketHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        header.queue_id = 0;
        header.dest_port = dest_port;
        header.source_port = 1;
        header.total_packet_size = 9 + payload_size;
        header.header_crc = header.calculate_crc();  // Calculate correct CRC
        
        // Serialize header
        uint8_t header_bytes[9];
        header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < 9; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        
        // Add payload
        for (uint16_t i = 0; i < payload_size; i++) {
            packet_data.push_back(0xAA + (i % 256));
        }
        
        // Wait for DUT to be ready
        int ready_wait_cycles = 0;
        while (!ext_ready.read() && ready_wait_cycles < 100) {
            wait(10, SC_NS);
            ready_wait_cycles++;
        }
        
        if (!ext_ready.read()) {
            std::cout << "[ERROR] DUT not ready after waiting" << std::endl;
            return;
        }
        
        // Send packet data in AXIS_DATA_WIDTH chunks
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;  // 64 bytes per beat
        size_t total_bytes = packet_data.size();
        size_t bytes_sent = 0;
        
        while (bytes_sent < total_bytes) {
            // Prepare data and keep signals
            sc_bv<AXIS_DATA_WIDTH> data_word = 0;
            sc_bv<AXIS_KEEP_WIDTH> keep_word = 0;
            
            size_t bytes_this_beat = std::min(bytes_per_beat, total_bytes - bytes_sent);
            
            for (size_t i = 0; i < bytes_this_beat; i++) {
                uint8_t byte_val = packet_data[bytes_sent + i];
                data_word.range(i*8+7, i*8) = byte_val;
                keep_word[i] = 1;
            }
            
            // Drive signals
            ext_data.write(data_word);
            ext_keep.write(keep_word);
            ext_last.write((bytes_sent + bytes_this_beat) >= total_bytes);
            ext_valid.write(true);
            
            // Wait for clock and check ready
            wait(10, SC_NS);
            int beat_wait_cycles = 0;
            while (!ext_ready.read() && beat_wait_cycles < 50) {
                wait(10, SC_NS);
                beat_wait_cycles++;
            }
            
            if (!ext_ready.read()) {
                std::cout << "[ERROR] DUT not ready during packet transmission" << std::endl;
                break;
            }
            
            bytes_sent += bytes_this_beat;
        }
        
        // End transaction
        ext_valid.write(false);
        ext_last.write(false);
        packets_sent++;
        
        std::cout << "[STIMULUS] Packet " << packets_sent << " sent successfully (" 
                  << total_bytes << " bytes)" << std::endl;
    }
    
    void print_statistics() {
        std::cout << "\n=== Final Test Statistics ===" << std::endl;
        std::cout << "Packets sent: " << packets_sent << std::endl;
        std::cout << "Packets received: " << packets_received << std::endl;
        std::cout << "DUT packets received: " << dut->get_packets_received() << std::endl;
        std::cout << "DUT packets forwarded: " << dut->get_packets_forwarded() << std::endl;
        std::cout << "DUT buffer utilization: " << dut->get_buffer_utilization() << std::endl;
        std::cout << "DUT available credits: " << dut->get_available_credits() << std::endl;
        
        // Verify test results
        bool stats_match = (packets_sent == packets_received) && 
                          (packets_sent == (int)dut->get_packets_received()) &&
                          (packets_sent == (int)dut->get_packets_forwarded());
        
        if (stats_match) {
            std::cout << "✅ All statistics match - DUT functioning correctly" << std::endl;
        } else {
            std::cout << "❌ Statistics mismatch - potential DUT issue" << std::endl;
        }
        
        std::cout << "==============================" << std::endl;
    }
    
    ~ingress_pm_testbench() {
        delete dut;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Ingress Port Manager SystemC Test ===" << std::endl;
    std::cout << "Testing DUT: " << switch_internal_p2p::AXIS_DATA_WIDTH << "-bit AXIS interface" << std::endl;
    
    // Create testbench
    ingress_pm_testbench tb("testbench");
    
    // Start simulation
    sc_start();
    
    std::cout << "=== Simulation completed ===" << std::endl;
    return 0;
}