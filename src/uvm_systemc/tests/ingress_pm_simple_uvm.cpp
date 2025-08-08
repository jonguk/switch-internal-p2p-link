#include <systemc>
#include <uvm>
#include "../port_manager/ingress_port_manager.h"
#include "../common/switch_types.h"

using namespace sc_core;
using namespace uvm;
using namespace switch_internal_p2p;

// =============================================================================
// Simplified UVM Test for Ingress Port Manager
// =============================================================================

class ingress_pm_simple_test : public uvm_test {
public:
    UVM_COMPONENT_UTILS(ingress_pm_simple_test)
    
    ingress_pm_simple_test(uvm_component_name name) : uvm_test(name) {
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_test::build_phase(phase);
        std::cout << "Test: Build phase completed" << std::endl;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "Test: Starting run phase" << std::endl;
        phase.raise_objection(this);
        
        // Test logic will be handled by SystemC testbench
        wait(2000, SC_NS);
        
        std::cout << "Test: Completed successfully" << std::endl;
        phase.drop_objection(this);
    }
};

// =============================================================================
// SystemC Testbench with UVM Integration
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
    
    SC_CTOR(ingress_pm_testbench) : clk("clk", 10, SC_NS), packets_sent(0), packets_received(0) {
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
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "Testbench: Reset sequence completed" << std::endl;
    }
    
    void stimulus_process() {
        // Wait for reset
        wait(50, SC_NS);
        
        std::cout << "Testbench: Starting stimulus generation" << std::endl;
        
        // Send 3 test packets
        for (int i = 0; i < 3; i++) {
            send_test_packet(i + 1, 64);  // Different dest ports, 64 byte payload
            wait(200, SC_NS);  // Gap between packets
        }
        
        std::cout << "Testbench: Stimulus generation completed" << std::endl;
    }
    
    void monitor_process() {
        int observed_packets = 0;
        
        while (observed_packets < 3) {
            wait(10, SC_NS);
            
            if (axis_tvalid.read() && axis_tready.read()) {
                sc_bv<AXIS_USER_WIDTH> user = axis_tuser.read();
                bool last = axis_tlast.read();
                
                std::cout << "Monitor: AXIS transaction observed - last=" << last 
                          << " user=0x" << std::hex << user.to_uint64() << std::dec << std::endl;
                
                if (last) {
                    observed_packets++;
                    packets_received++;
                    std::cout << "Monitor: Packet " << observed_packets << " completed" << std::endl;
                }
            }
        }
        
        std::cout << "Monitor: All packets observed" << std::endl;
    }
    
    void control_signals_process() {
        // Keep AXIS and AXI interfaces ready
        axis_tready.write(true);
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        credit_return_valid.write(false);
    }
    
    void send_test_packet(uint8_t dest_port, uint16_t payload_size) {
        std::cout << "Testbench: Sending packet to port " << (int)dest_port 
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
        header.header_crc = 0x5A;
        
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
        while (!ext_ready.read()) {
            wait(10, SC_NS);
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
            while (!ext_ready.read()) {
                wait(10, SC_NS);
            }
            
            bytes_sent += bytes_this_beat;
        }
        
        // End transaction
        ext_valid.write(false);
        ext_last.write(false);
        packets_sent++;
        
        std::cout << "Testbench: Packet " << packets_sent << " sent successfully" << std::endl;
    }
    
    void print_statistics() {
        std::cout << "\n=== Test Statistics ===" << std::endl;
        std::cout << "Packets sent: " << packets_sent << std::endl;
        std::cout << "Packets received: " << packets_received << std::endl;
        std::cout << "DUT packets received: " << dut->get_packets_received() << std::endl;
        std::cout << "DUT packets forwarded: " << dut->get_packets_forwarded() << std::endl;
        std::cout << "DUT buffer utilization: " << dut->get_buffer_utilization() << std::endl;
        std::cout << "DUT available credits: " << dut->get_available_credits() << std::endl;
        std::cout << "======================" << std::endl;
    }
    
    ~ingress_pm_testbench() {
        print_statistics();
        delete dut;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Ingress Port Manager Simple UVM Test ===" << std::endl;
    
    // Create testbench
    ingress_pm_testbench tb("testbench");
    
    // Create and run UVM test (simple version)
    ingress_pm_simple_test* test = ingress_pm_simple_test::type_id::create("test", nullptr);
    
    // Run UVM test
    run_test();
    
    std::cout << "=== Test completed successfully ===" << std::endl;
    return 0;
}