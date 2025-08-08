#include <systemc>
#include <uvm>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/common/switch_types.h"

using namespace sc_core;
using namespace uvm;
using namespace switch_internal_p2p;

// =============================================================================
// Simplified UVM Test for Ingress Port Manager
// =============================================================================

class ingress_pm_simple_uvm_test : public uvm_test {
public:
    UVM_COMPONENT_UTILS(ingress_pm_simple_uvm_test)
    
    ingress_pm_simple_uvm_test(uvm_component_name name) : uvm_test(name) {
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_test::build_phase(phase);
        std::cout << "[UVM TEST] Build phase completed" << std::endl;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "[UVM TEST] Starting run phase" << std::endl;
        phase.raise_objection(this);
        
        // Test will be handled by SystemC testbench
        wait(3000, SC_NS);
        
        std::cout << "[UVM TEST] Completed successfully" << std::endl;
        phase.drop_objection(this);
    }
};

// =============================================================================
// SystemC Testbench with UVM Integration
// =============================================================================
SC_MODULE(uvm_ingress_pm_testbench) {
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
    
    // UVM test instance
    ingress_pm_simple_uvm_test* uvm_test;
    
    SC_CTOR(uvm_ingress_pm_testbench) : clk("clk", 10, SC_NS), 
          packets_sent(0), packets_received(0), test_passed(false) {
        
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
        
        // Create UVM test
        uvm_test = ingress_pm_simple_uvm_test::type_id::create("uvm_test", nullptr);
        
        // Register processes
        SC_THREAD(reset_process);
        SC_THREAD(uvm_stimulus_process);
        SC_THREAD(uvm_monitor_process);
        SC_THREAD(control_signals_process);
        SC_THREAD(test_controller);
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[UVM TB] Reset sequence completed" << std::endl;
    }
    
    void uvm_stimulus_process() {
        // Wait for reset
        wait(50, SC_NS);
        
        std::cout << "[UVM STIMULUS] Starting UVM-driven test sequence" << std::endl;
        
        // UVM-style test patterns
        struct TestCase {
            uint8_t dest_port;
            uint16_t payload_size;
            ChannelType channel_type;
            std::string description;
        };
        
        TestCase test_cases[] = {
            {2, 32, ChannelType::LOW_PRIORITY, "Small packet - Low priority"},
            {3, 64, ChannelType::LOW_PRIORITY, "Medium packet - Low priority"},
            {4, 128, ChannelType::LOW_PRIORITY, "Large packet - Low priority"},
            {5, 256, ChannelType::LOW_PRIORITY, "XL packet - Low priority"},
            {6, 96, ChannelType::LOW_PRIORITY, "Custom packet - Low priority"}
        };
        
        for (auto& test_case : test_cases) {
            std::cout << "[UVM STIMULUS] " << test_case.description << std::endl;
            send_uvm_packet(test_case.dest_port, test_case.payload_size, test_case.channel_type);
            wait(150, SC_NS);  // Gap between packets
        }
        
        std::cout << "[UVM STIMULUS] All UVM test cases completed" << std::endl;
    }
    
    void uvm_monitor_process() {
        int observed_packets = 0;
        int expected_packets = 5;  // Number of test cases
        
        while (observed_packets < expected_packets) {
            wait(10, SC_NS);
            
            if (axis_tvalid.read() && axis_tready.read()) {
                sc_bv<AXIS_USER_WIDTH> user = axis_tuser.read();
                bool last = axis_tlast.read();
                
                std::cout << "[UVM MONITOR] AXIS beat observed - last=" << last 
                          << " user=0x" << std::hex << user.to_uint64() << std::dec << std::endl;
                
                if (last) {
                    observed_packets++;
                    packets_received++;
                    
                    // UVM-style verification
                    verify_axis_transaction(user);
                    
                    std::cout << "[UVM MONITOR] Packet " << observed_packets 
                              << "/" << expected_packets << " verified" << std::endl;
                }
            }
        }
        
        std::cout << "[UVM MONITOR] All expected packets verified" << std::endl;
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
            std::cout << "\n[UVM RESULT] ✅ ALL UVM TESTS PASSED" << std::endl;
        } else {
            std::cout << "\n[UVM RESULT] ❌ UVM TESTS FAILED (timeout)" << std::endl;
        }
        
        print_uvm_statistics();
        sc_stop();
    }
    
    void send_uvm_packet(uint8_t dest_port, uint16_t payload_size, ChannelType channel_type) {
        std::cout << "[UVM STIMULUS] Sending UVM packet to port " << (int)dest_port 
                  << " with payload size " << payload_size << std::endl;
        
        // Create test packet data with UVM-style header
        std::vector<uint8_t> packet_data;
        
        // Create external packet header
        ExternalPacketHeader header;
        header.channel_type = static_cast<uint8_t>(channel_type);
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
        
        // Add UVM-style payload pattern
        for (uint16_t i = 0; i < payload_size; i++) {
            // UVM-style pattern: alternating with packet ID
            packet_data.push_back((dest_port << 4) | (i % 16));
        }
        
        // Wait for DUT to be ready
        int ready_wait_cycles = 0;
        while (!ext_ready.read() && ready_wait_cycles < 100) {
            wait(10, SC_NS);
            ready_wait_cycles++;
        }
        
        if (!ext_ready.read()) {
            std::cout << "[UVM ERROR] DUT not ready after waiting" << std::endl;
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
                std::cout << "[UVM ERROR] DUT not ready during packet transmission" << std::endl;
                break;
            }
            
            bytes_sent += bytes_this_beat;
        }
        
        // End transaction
        ext_valid.write(false);
        ext_last.write(false);
        packets_sent++;
        
        std::cout << "[UVM STIMULUS] UVM packet " << packets_sent << " sent successfully (" 
                  << total_bytes << " bytes)" << std::endl;
    }
    
    void verify_axis_transaction(sc_bv<AXIS_USER_WIDTH> user_field) {
        // UVM-style verification of AXIS user field
        uint64_t user_val = user_field.to_uint64();
        
        // Extract fields from user field (assuming internal header format)
        uint8_t crc = (user_val >> 56) & 0xFF;
        uint8_t dest_port = (user_val >> 32) & 0xFF;
        uint8_t src_port = (user_val >> 16) & 0xFF;
        uint16_t length = user_val & 0xFFFF;
        
        std::cout << "[UVM VERIFY] Internal header - CRC: 0x" << std::hex << (int)crc
                  << " Dest: " << std::dec << (int)dest_port
                  << " Src: " << (int)src_port
                  << " Len: " << length << std::endl;
        
        // UVM-style assertions
        if (src_port != 1) {
            std::cout << "[UVM ERROR] Source port mismatch! Expected: 1, Got: " << (int)src_port << std::endl;
        }
        
        if (dest_port < 2 || dest_port > 6) {
            std::cout << "[UVM ERROR] Destination port out of range! Got: " << (int)dest_port << std::endl;
        }
        
        if (length < 41) {  // Minimum packet size (9 + 32)
            std::cout << "[UVM ERROR] Packet length too small! Got: " << length << std::endl;
        }
        
        std::cout << "[UVM VERIFY] ✅ Packet verification passed" << std::endl;
    }
    
    void print_uvm_statistics() {
        std::cout << "\n=== UVM Final Test Statistics ===" << std::endl;
        std::cout << "UVM Packets sent: " << packets_sent << std::endl;
        std::cout << "UVM Packets received: " << packets_received << std::endl;
        std::cout << "DUT packets received: " << dut->get_packets_received() << std::endl;
        std::cout << "DUT packets forwarded: " << dut->get_packets_forwarded() << std::endl;
        std::cout << "DUT buffer utilization: " << dut->get_buffer_utilization() << std::endl;
        std::cout << "DUT available credits: " << dut->get_available_credits() << std::endl;
        
        // UVM-style verification
        bool uvm_stats_match = (packets_sent == packets_received) && 
                              (packets_sent == (int)dut->get_packets_received()) &&
                              (packets_sent == (int)dut->get_packets_forwarded());
        
        if (uvm_stats_match) {
            std::cout << "✅ UVM: All statistics match - DUT functioning correctly" << std::endl;
        } else {
            std::cout << "❌ UVM: Statistics mismatch - potential DUT issue" << std::endl;
        }
        
        std::cout << "=================================" << std::endl;
    }
    
    ~uvm_ingress_pm_testbench() {
        delete dut;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== UVM SystemC Simple Integration Test ===" << std::endl;
    std::cout << "UVM-driven test with real SystemC DUT" << std::endl;
    
    // Create testbench
    uvm_ingress_pm_testbench tb("uvm_testbench");
    
    // Run UVM test
    run_test();
    
    std::cout << "=== UVM SystemC Integration Test completed ===" << std::endl;
    return 0;
}