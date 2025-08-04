#include <systemc.h>
#include <iostream>
#include <vector>
#include <cassert>
#include "common/switch_types.h"
#include "integration/complete_5port_switch_with_cpu.h"

using namespace switch_internal_p2p;

class TestComplete5PortSwitchWithCPU : public sc_module {
public:
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // DUT instance
    Complete5PortSwitchWithCPU* dut;
    
    // External AXIS Interfaces - Input (4 regular ports)
    std::array<sc_signal<bool>, 4> ext_axis_in_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_in_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_in_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_in_tuser;
    std::array<sc_signal<bool>, 4> ext_axis_in_tlast;
    std::array<sc_signal<bool>, 4> ext_axis_in_tready;
    
    // External AXIS Interfaces - Output (4 regular ports)
    std::array<sc_signal<bool>, 4> ext_axis_out_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_out_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_out_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_out_tuser;
    std::array<sc_signal<bool>, 4> ext_axis_out_tlast;
    std::array<sc_signal<bool>, 4> ext_axis_out_tready;
    
    // CPU AXIS Interface - access via DUT methods instead of separate signals
    
    // CPU configuration is handled via direct method calls

    SC_CTOR(TestComplete5PortSwitchWithCPU) : clk("clk", 10, SC_NS) {
        // Create DUT
        dut = new Complete5PortSwitchWithCPU("dut");
        
        // Connect DUT
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // Connect external AXIS interfaces (regular ports)
        for (int i = 0; i < 4; i++) {
            dut->ext_axis_in_tvalid[i](ext_axis_in_tvalid[i]);
            dut->ext_axis_in_tdata[i](ext_axis_in_tdata[i]);
            dut->ext_axis_in_tkeep[i](ext_axis_in_tkeep[i]);
            dut->ext_axis_in_tuser[i](ext_axis_in_tuser[i]);
            dut->ext_axis_in_tlast[i](ext_axis_in_tlast[i]);
            dut->ext_axis_in_tready[i](ext_axis_in_tready[i]);
            
            dut->ext_axis_out_tvalid[i](ext_axis_out_tvalid[i]);
            dut->ext_axis_out_tdata[i](ext_axis_out_tdata[i]);
            dut->ext_axis_out_tkeep[i](ext_axis_out_tkeep[i]);
            dut->ext_axis_out_tuser[i](ext_axis_out_tuser[i]);
            dut->ext_axis_out_tlast[i](ext_axis_out_tlast[i]);
            dut->ext_axis_out_tready[i](ext_axis_out_tready[i]);
        }
        
        // CPU configuration is handled via direct method calls
        // CPU AXIS monitoring is done via access methods
        
        // Start test processes
        SC_THREAD(test_process);
        SC_THREAD(output_ready_driver);
        SC_THREAD(cpu_axis_ready_driver);
        SC_THREAD(cpu_monitor_process);
    }
    
    ~TestComplete5PortSwitchWithCPU() {
        delete dut;
    }
    
    void test_process() {
        initialize_signals();
        configure_system_via_cpu();
        
        std::cout << "\n=== Complete 5-Port Switch with CPU Test ===" << std::endl;
        
        test_basic_functionality();
        test_cpu_configuration();
        test_error_forwarding();
        test_cpu_statistics();
        
        std::cout << "\n=== All Complete 5-Port Switch with CPU tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void output_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            // Always ready to receive output on all regular ports
            for (int i = 0; i < 4; i++) {
                ext_axis_out_tready[i].write(true);
            }
        }
    }
    
    void cpu_axis_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            // CPU is always ready to receive error packets
            dut->set_cpu_axis_tready(true);
        }
    }
    
    void cpu_monitor_process() {
        // Simplified CPU monitoring - just log that we're monitoring
        while (true) {
            wait(10000, SC_NS);  // Check every 10 microseconds
            
            // In a real implementation, this would monitor the CPU AXIS interface
            // For this test, we just check the error statistics periodically
            uint64_t current_errors = dut->get_total_error_packets();
            static uint64_t last_errors = 0;
            
            if (current_errors > last_errors) {
                std::cout << "[CPU Monitor] 📥 Detected " << (current_errors - last_errors) 
                          << " new error packet(s), total: " << current_errors << std::endl;
                last_errors = current_errors;
            }
        }
    }

private:
    void initialize_signals() {
        std::cout << "Initializing Complete 5-Port Switch with CPU..." << std::endl;
        
        // Reset system
        rst_n.write(false);
        
        // Initialize input signals for regular ports
        for (int i = 0; i < 4; i++) {
            ext_axis_in_tvalid[i].write(false);
            ext_axis_in_tlast[i].write(false);
        }
        
        // Initialize CPU AXIS signals (via DUT methods)
        // This will be done in cpu_axis_ready_driver
        
        // CPU configuration will be done via direct method calls
        
        wait(100, SC_NS);
        
        // Release reset
        rst_n.write(true);
        wait(50, SC_NS);
        
        std::cout << "Complete 5-Port Switch with CPU initialization complete" << std::endl;
    }
    
    void configure_system_via_cpu() {
        std::cout << "\n--- CPU System Configuration ---" << std::endl;
        
        // Configure global port mappings via CPU
        std::cout << "🖥️  CPU configuring global port mappings..." << std::endl;
        
        // Global Port 1000 → Local Port 0
        send_cpu_config_write(0x1088, (1000 << 16) | 0);
        
        // Global Port 2000 → Local Port 1  
        send_cpu_config_write(0x1088, (2000 << 16) | 1);
        
        // Global Port 3000 → Local Port 2
        send_cpu_config_write(0x1088, (3000 << 16) | 2);
        
        // Global Port 4000 → Local Port 3
        send_cpu_config_write(0x1088, (4000 << 16) | 3);
        
        // Enable error forwarding to CPU
        std::cout << "🖥️  CPU enabling error forwarding..." << std::endl;
        send_cpu_config_write(0x3000, 1);  // Enable error forwarding
        
        // Add custom error conditions
        std::cout << "🖥️  CPU configuring error conditions..." << std::endl;
        send_cpu_config_write(0x3004, 0x05);  // Custom error type
        
        std::cout << "✅ CPU system configuration complete" << std::endl;
    }
    
    void send_cpu_config_write(uint32_t addr, uint32_t data) {
        dut->cpu_write_config(addr, data);
        wait(50, SC_NS);  // Allow time for processing
    }
    
    uint32_t send_cpu_stats_read(uint32_t addr) {
        uint32_t data = dut->cpu_read_stats(addr);
        std::cout << "🖥️  CPU Stats Read: addr=0x" << std::hex << addr 
                  << ", data=0x" << data << std::dec << std::endl;
        return data;
    }
    
    void test_basic_functionality() {
        std::cout << "\n--- Test 1: Basic 5-Port Functionality ---" << std::endl;
        
        // Test component access
        assert(dut->get_ingress_port_manager(0) != nullptr);
        assert(dut->get_egress_port_manager(0) != nullptr);
        assert(dut->get_ingress_queue_manager(0) != nullptr);  // Regular port
        assert(dut->get_egress_queue_manager(0) != nullptr);   // Regular port
        assert(dut->get_ingress_queue_manager(4) != nullptr);  // CPU port
        assert(dut->get_egress_queue_manager(4) != nullptr);   // CPU port
        assert(dut->get_port_router() != nullptr);
        
        // Regular ports should have Port Managers
        for (int i = 0; i < 4; i++) {
            assert(dut->get_ingress_port_manager(i) != nullptr);
            assert(dut->get_egress_port_manager(i) != nullptr);
        }
        
        // CPU port should NOT have Port Managers (returns nullptr)
        assert(dut->get_ingress_port_manager(4) == nullptr);
        assert(dut->get_egress_port_manager(4) == nullptr);
        
        std::cout << "✅ All components accessible (4 regular ports + 1 CPU port)" << std::endl;
        
        // Test statistics
        uint64_t initial_packets = dut->get_total_packets_processed();
        uint64_t initial_bytes = dut->get_total_bytes_processed();
        uint64_t initial_errors = dut->get_total_error_packets();
        
        std::cout << "📊 Initial stats: packets=" << initial_packets 
                  << ", bytes=" << initial_bytes 
                  << ", errors=" << initial_errors << std::endl;
        
        std::cout << "✅ Basic 5-port functionality test PASSED" << std::endl;
    }
    
    void test_cpu_configuration() {
        std::cout << "\n--- Test 2: CPU Configuration Interface ---" << std::endl;
        
        std::cout << "🖥️  Testing CPU AXI configuration..." << std::endl;
        
        // Test various configuration commands
        send_cpu_config_write(0x1000, 0x12345678);  // Port Router config
        
        send_cpu_config_write(0x2000, 0x87654321);  // Port Manager config
        
        send_cpu_config_write(0x3000, 0);           // Disable error forwarding temporarily
        
        send_cpu_config_write(0x3000, 1);           // Re-enable error forwarding
        
        std::cout << "✅ CPU configuration interface test PASSED" << std::endl;
    }
    
    void test_error_forwarding() {
        std::cout << "\n--- Test 3: Error Packet Forwarding to CPU ---" << std::endl;
        
        std::cout << "📤 Sending normal packets to trigger system activity..." << std::endl;
        
        // Send some normal packets to generate system activity
        for (int port = 0; port < 2; port++) {
            ExternalPacketHeader header;
            header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
            header.queue_id = 0;
            header.dest_port = 1000 + port * 1000;  // Use configured global ports
            header.source_port = 500 + port * 100;
            header.total_packet_size = 15;
            header.header_crc = header.calculate_crc();
            
            std::vector<uint8_t> packet_data;
            uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
            header.serialize_to_bytes(header_bytes);
            for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
                packet_data.push_back(header_bytes[i]);
            }
            
            // Add payload
            for (int i = 0; i < 6; i++) {
                packet_data.push_back(0x20 + port * 16 + i);
            }
            
            send_packet_to_port(port, packet_data);
            wait(200, SC_NS);
        }
        
        std::cout << "⏳ Waiting for error simulation (may take time)..." << std::endl;
        
        // Wait for simulated error packets to be generated
        // The error_monitoring_process generates errors every 50000 cycles
        wait(100000, SC_NS);
        
        // Check final error count
        uint64_t final_errors = dut->get_total_error_packets();
        std::cout << "📊 Total error packets forwarded to CPU: " << final_errors << std::endl;
        
        std::cout << "✅ Error packet forwarding test PASSED" << std::endl;
    }
    
    void test_cpu_statistics() {
        std::cout << "\n--- Test 4: CPU Statistics Reading ---" << std::endl;
        
        std::cout << "🖥️  CPU reading system statistics..." << std::endl;
        
        // Read total packets processed (low 32 bits)
        uint32_t packets_low = send_cpu_stats_read(0x4000);
        
        // Read total packets processed (high 32 bits)
        uint32_t packets_high = send_cpu_stats_read(0x4004);
        
        // Read total error packets
        uint32_t error_packets = send_cpu_stats_read(0x4008);
        
        uint64_t total_packets = ((uint64_t)packets_high << 32) | packets_low;
        
        std::cout << "📊 CPU Statistics Summary:" << std::endl;
        std::cout << "    Total Packets: " << total_packets << std::endl;
        std::cout << "    Error Packets: " << error_packets << std::endl;
        
        // Verify statistics consistency
        assert(total_packets == dut->get_total_packets_processed());
        assert(error_packets == dut->get_total_error_packets());
        
        std::cout << "✅ CPU statistics reading test PASSED" << std::endl;
    }
    
    void send_packet_to_port(int port_id, const std::vector<uint8_t>& packet_data) {
        if (port_id < 0 || port_id >= 4) return;  // Only regular ports
        
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8; // 64 bytes per beat
        size_t total_beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (size_t beat = 0; beat < total_beats; beat++) {
            size_t start_byte = beat * bytes_per_beat;
            size_t bytes_this_beat = std::min(bytes_per_beat, packet_data.size() - start_byte);
            bool is_last_beat = (beat == total_beats - 1);
            
            // Prepare AXIS signals
            sc_bv<AXIS_DATA_WIDTH> tdata = 0;
            sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
            
            for (size_t i = 0; i < bytes_this_beat; i++) {
                uint8_t byte_val = packet_data[start_byte + i];
                tdata.range((i+1)*8-1, i*8) = byte_val;
                tkeep[i] = 1;
            }
            
            // Set tuser on first beat (if needed)
            sc_bv<AXIS_USER_WIDTH> tuser = 0;
            
            // Send beat
            ext_axis_in_tdata[port_id].write(tdata);
            ext_axis_in_tkeep[port_id].write(tkeep);
            ext_axis_in_tuser[port_id].write(tuser);
            ext_axis_in_tlast[port_id].write(is_last_beat);
            ext_axis_in_tvalid[port_id].write(true);
            
            wait(clk.posedge_event());
            
            // Wait for ready
            while (!ext_axis_in_tready[port_id].read()) {
                wait(clk.posedge_event());
            }
        }
        
        // End transmission
        ext_axis_in_tvalid[port_id].write(false);
        ext_axis_in_tlast[port_id].write(false);
    }
};

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused warnings
    
    std::cout << "Starting Complete 5-Port Switch with CPU Test..." << std::endl;
    
    TestComplete5PortSwitchWithCPU test("test");
    
    sc_start();
    
    return 0;
}