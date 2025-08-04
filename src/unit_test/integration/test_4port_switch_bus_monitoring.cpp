#include <systemc.h>
#include <iostream>
#include <vector>
#include <array>
#include <map>
#include <set>
#include <cassert>
#include "common/switch_types.h"
#include "integration/complete_4port_switch.h"

using namespace switch_internal_p2p;

// =============================================================================
// Bus Monitoring Structures
// =============================================================================

struct BusActivity {
    sc_time timestamp;
    int port_id;
    bool tvalid;
    bool tready;
    bool tlast;
    sc_bv<AXIS_DATA_WIDTH> tdata;
    std::string bus_name;
    
    BusActivity(sc_time t, int port, bool valid, bool ready, bool last, 
                sc_bv<AXIS_DATA_WIDTH> data, const std::string& name)
        : timestamp(t), port_id(port), tvalid(valid), tready(ready), 
          tlast(last), tdata(data), bus_name(name) {}
};

struct PacketFlow {
    uint32_t packet_id;
    int source_port;
    int dest_port;
    size_t expected_size;
    sc_time inject_time;
    sc_time ingress_pm_time;
    sc_time ingress_qm_time;
    sc_time router_time;
    sc_time egress_qm_time;
    sc_time egress_pm_time;
    sc_time output_time;
    bool completed;
    std::vector<uint8_t> original_data;
    std::vector<uint8_t> received_data;
    
    PacketFlow() : packet_id(0), source_port(-1), dest_port(-1), expected_size(0),
                   completed(false) {}
};

// =============================================================================
// 4-Port Switch Bus Monitor Test Bench  
// =============================================================================

class Test4PortSwitchBusMonitor : public sc_module {
public:
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // DUT instance
    Complete4PortSwitch* dut;
    
    // External AXIS Interfaces - Input (4 ports)
    std::array<sc_signal<bool>, 4> ext_axis_in_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_in_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_in_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_in_tuser;
    std::array<sc_signal<bool>, 4> ext_axis_in_tlast;
    std::array<sc_signal<bool>, 4> ext_axis_in_tready;
    
    // External AXIS Interfaces - Output (4 ports)
    std::array<sc_signal<bool>, 4> ext_axis_out_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_out_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_out_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_out_tuser;
    std::array<sc_signal<bool>, 4> ext_axis_out_tlast;
    std::array<sc_signal<bool>, 4> ext_axis_out_tready;
    
    // AXI Interface
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Monitoring and Statistics
    std::vector<BusActivity> bus_trace;
    std::vector<PacketFlow> packet_flows;
    std::array<int, 4> packets_sent_per_port = {0, 0, 0, 0};
    std::array<int, 4> packets_received_per_port = {0, 0, 0, 0};
    uint32_t next_packet_id = 1;
    
    // Test Control
    bool test_completed = false;
    int total_packets_to_send = 12; // 각 포트에서 3개씩
    int total_packets_received = 0;

    SC_CTOR(Test4PortSwitchBusMonitor) : clk("clk", 10, SC_NS) {
        // Create DUT
        dut = new Complete4PortSwitch("dut");
        
        // Connect DUT basic signals
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // Connect external AXIS interfaces
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
        
        // Connect AXI interface
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Register test processes
        SC_THREAD(reset_process);
        SC_THREAD(packet_injection_process);
        
        // Output monitors for each port (changed to SC_THREAD for better detection)
        SC_THREAD(output_monitor_port0);
        SC_THREAD(output_monitor_port1);
        SC_THREAD(output_monitor_port2);
        SC_THREAD(output_monitor_port3);
        
        // Bus monitoring processes
        SC_THREAD(internal_bus_monitor_process);
        SC_THREAD(statistics_reporting_process);
        
        // Output ready signals (allow outputs during test, block after completion)
        for (int i = 0; i < 4; i++) {
            ext_axis_out_tready[i].write(true);
        }
        
        std::cout << "✅ [INIT] Output ready signals enabled for packet capture" << std::endl;
        
        // AXI ready signals
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        
        std::cout << "🏁 [TEST] 4-Port Switch Bus Monitor Test initialized" << std::endl;
    }

    ~Test4PortSwitchBusMonitor() {
        delete dut;
    }

private:
    void reset_process() {
        std::cout << "🔄 [TEST] Starting reset sequence..." << std::endl;
        
        // Reset sequence
        rst_n.write(false);
        wait(100, SC_NS);
        rst_n.write(true);
        wait(50, SC_NS);
        
        std::cout << "✅ [TEST] Reset sequence completed" << std::endl;
    }

    void packet_injection_process() {
        // Initialize all input signals
        for (int i = 0; i < 4; i++) {
            ext_axis_in_tvalid[i].write(false);
            ext_axis_in_tdata[i].write(0);
            ext_axis_in_tkeep[i].write(0);
            ext_axis_in_tuser[i].write(0);
            ext_axis_in_tlast[i].write(false);
        }
        
        wait(200, SC_NS); // Wait for reset and initial setup
        
        std::cout << "🚀 [TEST] Starting packet injection..." << std::endl;
        
        // Routing table: Port 0->1, 1->2, 2->3, 3->0 (round robin)
        std::array<int, 4> routing_table = {1, 2, 3, 0};
        
        // Send 3 packets from each port
        for (int round = 0; round < 3; round++) {
            std::cout << "🔄 [TEST] Starting round " << (round + 1) << std::endl;
            
            // Send one packet from each port in this round
            for (int src_port = 0; src_port < 4; src_port++) {
                int dest_port = routing_table[src_port];
                send_packet(src_port, dest_port, round);
                
                // Increased delay between packets for proper processing
                wait(300, SC_NS);
            }
            
            // Longer delay between rounds for complete processing
            wait(500, SC_NS);
        }
        
        std::cout << "📦 [TEST] All packets injected. Total: " << total_packets_to_send << std::endl;
        
        // 🔧 CRITICAL: Force clear all input signals to prevent infinite loops
        std::cout << "🚫 [TEST] Blocking all input signals to prevent packet re-injection..." << std::endl;
        for (int i = 0; i < 4; i++) {
            ext_axis_in_tvalid[i].write(false);
            ext_axis_in_tdata[i].write(0);
            ext_axis_in_tkeep[i].write(0);
            ext_axis_in_tuser[i].write(0);
            ext_axis_in_tlast[i].write(false);
        }
        
        // Also block ready signals to prevent further packet acceptance
        for (int i = 0; i < 4; i++) {
            ext_axis_out_tready[i].write(false);
        }
        
        // Wait for packet processing with periodic checks
        std::cout << "⏳ [TEST] Waiting for packet processing completion..." << std::endl;
        wait_for_packet_completion_isolated();
        
        test_completed = true;
        print_final_statistics();
        sc_stop();
    }

    void wait_for_packet_completion_isolated() {
        int completion_checks = 0;
        int stable_count = 0;
        int last_received_count = 0;
        const int MAX_CHECKS = 50;         // Reduced checks since no more loops
        const int STABLE_THRESHOLD = 5;    // Reduced threshold
        const int CHECK_INTERVAL_NS = 200; // Longer interval
        
        std::cout << "🔒 [WAIT] Isolated mode: No more packets can enter the system" << std::endl;
        
        while (completion_checks < MAX_CHECKS) {
            wait(CHECK_INTERVAL_NS, SC_NS);
            completion_checks++;
            
            // Count total received packets
            int current_received = 0;
            for (int i = 0; i < 4; i++) {
                current_received += packets_received_per_port[i];
            }
            
            // Check if packet count is stable (not increasing)
            if (current_received == last_received_count) {
                stable_count++;
            } else {
                stable_count = 0; // Reset if still receiving packets
                last_received_count = current_received;
            }
            
            // Log progress every 5 checks
            if (completion_checks % 5 == 0) {
                std::cout << "⏳ [ISOLATED] Check " << completion_checks 
                          << ": Received " << current_received << "/" << total_packets_to_send
                          << " packets (stable: " << stable_count << ")" << std::endl;
            }
            
            // If stable for enough checks, consider complete
            if (stable_count >= STABLE_THRESHOLD) {
                std::cout << "✅ [ISOLATED] System stabilized after " 
                          << completion_checks << " checks (no loops detected)" << std::endl;
                break;
            }
            
            // Early exit if we received all expected packets
            if (current_received >= total_packets_to_send) {
                std::cout << "🎯 [ISOLATED] All expected packets received cleanly!" << std::endl;
                wait(200, SC_NS); // Brief final wait
                break;
            }
        }
        
        if (completion_checks >= MAX_CHECKS) {
            std::cout << "⏰ [ISOLATED] Timeout reached - system appears stable" << std::endl;
        }
        
        // Final isolation check
        wait(500, SC_NS);
        std::cout << "🛡️ [ISOLATED] Final packet count: " << total_packets_received 
                  << " (no further activity expected)" << std::endl;
    }

    void wait_for_packet_completion() {
        int completion_checks = 0;
        int stable_count = 0;
        int last_received_count = 0;
        const int MAX_CHECKS = 100;        // Maximum number of checks
        const int STABLE_THRESHOLD = 10;   // Number of stable checks needed
        const int CHECK_INTERVAL_NS = 100; // Check every 100ns
        
        while (completion_checks < MAX_CHECKS) {
            wait(CHECK_INTERVAL_NS, SC_NS);
            completion_checks++;
            
            // Count total received packets
            int current_received = 0;
            for (int i = 0; i < 4; i++) {
                current_received += packets_received_per_port[i];
            }
            
            // Check if packet count is stable (not increasing)
            if (current_received == last_received_count) {
                stable_count++;
            } else {
                stable_count = 0; // Reset if still receiving packets
                last_received_count = current_received;
            }
            
            // Log progress every 10 checks
            if (completion_checks % 10 == 0) {
                std::cout << "⏳ [WAIT] Check " << completion_checks 
                          << ": Received " << current_received << "/" << total_packets_to_send
                          << " packets (stable: " << stable_count << ")" << std::endl;
            }
            
            // If stable for enough checks, consider complete
            if (stable_count >= STABLE_THRESHOLD) {
                std::cout << "✅ [WAIT] Packet processing appears stable after " 
                          << completion_checks << " checks" << std::endl;
                break;
            }
            
            // Early exit if we received all expected packets
            if (current_received >= total_packets_to_send) {
                std::cout << "🎯 [WAIT] All expected packets received!" << std::endl;
                wait(500, SC_NS); // Small additional wait for final processing
                break;
            }
        }
        
        if (completion_checks >= MAX_CHECKS) {
            std::cout << "⏰ [WAIT] Timeout reached after " << MAX_CHECKS << " checks" << std::endl;
        }
    }

    void send_packet(int src_port, int dest_port, int round) {
        // Create packet data
        std::vector<uint8_t> packet_data = create_test_packet(src_port, dest_port, round);
        uint32_t packet_id = next_packet_id++;
        
        // Record packet flow
        PacketFlow flow;
        flow.packet_id = packet_id;
        flow.source_port = src_port;
        flow.dest_port = dest_port;
        flow.expected_size = packet_data.size();
        flow.inject_time = sc_time_stamp();
        flow.original_data = packet_data;
        packet_flows.push_back(flow);
        
        std::cout << "📤 [PORT" << src_port << "] Sending packet " << packet_id 
                  << " to port " << dest_port << " (size: " << packet_data.size() << " bytes)" << std::endl;
        
        // Send packet via AXIS
        send_axis_packet(src_port, packet_data);
        
        packets_sent_per_port[src_port]++;
    }

    std::vector<uint8_t> create_test_packet(int src_port, int dest_port, int round) {
        std::vector<uint8_t> packet;
        
        // Create External Packet Header (9 bytes)
        ExternalPacketHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        header.queue_id = (src_port * 2 + round) % 8; // Different queue IDs
        header.dest_port = static_cast<uint16_t>(dest_port);
        header.source_port = static_cast<uint16_t>(src_port);
        
        // Create payload data
        std::vector<uint8_t> payload;
        int payload_size = 32 + (round * 16) + (src_port * 8); // Variable payload sizes
        for (int i = 0; i < payload_size; i++) {
            payload.push_back(static_cast<uint8_t>(0x10 + src_port + (i % 16)));
        }
        
        header.total_packet_size = static_cast<uint16_t>(EXTERNAL_HEADER_SIZE + payload.size());
        header.header_crc = header.calculate_crc();
        
        // Reserve space for header
        packet.resize(EXTERNAL_HEADER_SIZE);
        
        // Serialize header
        header.serialize_to_bytes(packet.data());
        
        // Add payload
        packet.insert(packet.end(), payload.begin(), payload.end());
        
        return packet;
    }

    void send_axis_packet(int port, const std::vector<uint8_t>& packet_data) {
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t total_beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (size_t beat = 0; beat < total_beats; beat++) {
            // Wait for ready
            while (!ext_axis_in_tready[port].read()) {
                wait(clk.posedge_event());
            }
            
            // Prepare data beat
            sc_bv<AXIS_DATA_WIDTH> tdata = 0;
            sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
            
            size_t bytes_in_beat = std::min(packet_data.size() - beat * bytes_per_beat, bytes_per_beat);
            
            for (size_t i = 0; i < bytes_in_beat; i++) {
                size_t byte_idx = beat * bytes_per_beat + i;
                if (byte_idx < packet_data.size()) {
                    tdata.range(i*8+7, i*8) = packet_data[byte_idx];
                    tkeep[i] = 1;
                }
            }
            
            // Set AXIS signals
            ext_axis_in_tvalid[port].write(true);
            ext_axis_in_tdata[port].write(tdata);
            ext_axis_in_tkeep[port].write(tkeep);
            ext_axis_in_tuser[port].write(0); // No user data for external interface
            ext_axis_in_tlast[port].write(beat == total_beats - 1);
            
            wait(clk.posedge_event());
        }
        
        // Clear signals
        ext_axis_in_tvalid[port].write(false);
        ext_axis_in_tlast[port].write(false);
        
        wait(clk.posedge_event());
    }

    void output_monitor_port0() {
        monitor_output_port(0);
    }
    
    void output_monitor_port1() {
        monitor_output_port(1);
    }
    
    void output_monitor_port2() {
        monitor_output_port(2);
    }
    
    void output_monitor_port3() {
        monitor_output_port(3);
    }
    
    void monitor_output_port(int port) {
        static std::array<bool, 4> last_tvalid = {false, false, false, false};
        static std::array<int, 4> packet_count_per_port = {0, 0, 0, 0};
        
        // Wait for reset to complete
        wait(200, SC_NS);
        
        while (true) {
            wait(clk.posedge_event()); // Synchronize with clock
            
            bool current_tvalid = ext_axis_out_tvalid[port].read();
            bool current_tready = ext_axis_out_tready[port].read();
            bool current_tlast = ext_axis_out_tlast[port].read();
            
            // For multi-beat packets, call receive function every cycle when tvalid is high
            if (current_tvalid && current_tready) {
                std::vector<uint8_t> packet_data = receive_axis_packet(port);
                
                // Only process when complete packet is received (non-empty)
                if (!packet_data.empty()) {
                    packet_count_per_port[port]++;
                    packets_received_per_port[port]++;
                    total_packets_received++;
                    
                    std::cout << "📥 [PORT" << port << "] Packet #" << packet_count_per_port[port] 
                              << " received at " << sc_time_stamp() 
                              << " (size: " << packet_data.size() << " bytes)" << std::endl;
                    
                    // Try to match with expected flows
                    update_packet_flow_completion(port, packet_data);
                }
            }
            
            // Original logic for tracking signal transitions (keep for debugging)
            if (current_tvalid && current_tready && !last_tvalid[port]) {
                // Just for logging - actual packet handling is done above
                // (packet_data processing moved to above section)
                
                // In isolated mode, warn if too many packets (indicates loop)
                if (packet_count_per_port[port] > 5) {
                    std::cout << "⚠️ [PORT" << port << "] WARNING: Too many packets (" 
                              << packet_count_per_port[port] << ") - possible loop detected!" << std::endl;
                }
            }
            
            last_tvalid[port] = current_tvalid;
        }
    }
    
    uint32_t create_packet_signature(const std::vector<uint8_t>& data) {
        // Simple hash of first few bytes for packet identification
        uint32_t signature = 0;
        size_t bytes_to_hash = std::min(data.size(), (size_t)8);
        for (size_t i = 0; i < bytes_to_hash; i++) {
            signature = (signature << 4) ^ data[i];
        }
        return signature;
    }

    std::vector<uint8_t> receive_axis_packet(int port) {
        // Multi-beat packet reception with static buffers per port
        static std::array<std::vector<uint8_t>, 4> packet_buffers;
        static std::array<bool, 4> receiving_packet = {false, false, false, false};
        
        if (ext_axis_out_tvalid[port].read() && ext_axis_out_tready[port].read()) {
            sc_bv<AXIS_DATA_WIDTH> tdata = ext_axis_out_tdata[port].read();
            sc_bv<AXIS_KEEP_WIDTH> tkeep = ext_axis_out_tkeep[port].read();
            bool tlast = ext_axis_out_tlast[port].read();
            
            // Start new packet if not already receiving
            if (!receiving_packet[port]) {
                packet_buffers[port].clear();
                receiving_packet[port] = true;
            }
            
            // Extract bytes based on keep signal
            size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
            for (size_t i = 0; i < bytes_per_beat; i++) {
                if (tkeep[i] == 1) {
                    uint8_t byte_val = tdata.range(i*8+7, i*8).to_uint();
                    packet_buffers[port].push_back(byte_val);
                }
            }
            
            // Complete packet when tlast is asserted
            if (tlast && !packet_buffers[port].empty()) {
                std::cout << "✅ [PORT" << port << "] Received complete packet, size: " 
                          << packet_buffers[port].size() << " bytes" << std::endl;
                receiving_packet[port] = false;
                return packet_buffers[port]; // Return complete packet
            }
        }
        
        return {}; // Return empty if packet not complete yet
    }

    void update_packet_flow_completion(int output_port, const std::vector<uint8_t>& received_data) {
        // Find matching packet flow based on expected destination
        for (auto& flow : packet_flows) {
            if (flow.dest_port == output_port && !flow.completed && 
                flow.expected_size == received_data.size()) {
                flow.completed = true;
                flow.output_time = sc_time_stamp();
                flow.received_data = received_data;
                
                sc_time latency = flow.output_time - flow.inject_time;
                std::cout << "🎯 [FLOW] Packet " << flow.packet_id 
                          << " completed: " << flow.source_port << "→" << flow.dest_port
                          << " (latency: " << latency << ")" << std::endl;
                break;
            }
        }
    }

    void internal_bus_monitor_process() {
        wait(100, SC_NS); // Wait for reset
        
        while (!test_completed) {
            wait(clk.posedge_event());
            
            // Monitor internal buses through DUT access
            monitor_internal_buses();
        }
    }

    void monitor_internal_buses() {
        sc_time current_time = sc_time_stamp();
        
        // Note: In a real implementation, we would need access to internal signals
        // For this test, we'll monitor through component interfaces
        
        // This is a placeholder - in real HW, these signals would be accessible
        // through hierarchical references or debug interfaces
        
        static int last_monitor_cycle = 0;
        int current_cycle = (int)(current_time / clk.period());
        
        if (current_cycle > last_monitor_cycle) {
            // Sample internal bus activity every few cycles
            if (current_cycle % 10 == 0) {
                log_bus_activity();
            }
            last_monitor_cycle = current_cycle;
        }
    }

    void log_bus_activity() {
        // Log current statistics
        std::cout << "📊 [MONITOR] @ " << sc_time_stamp() << ": ";
        for (int i = 0; i < 4; i++) {
            std::cout << "P" << i << "(" << packets_sent_per_port[i] << "→" 
                      << packets_received_per_port[i] << ") ";
        }
        std::cout << std::endl;
    }

    void statistics_reporting_process() {
        wait(1000, SC_NS); // Initial delay
        
        while (!test_completed) {
            print_intermediate_statistics();
            wait(500, SC_NS); // Report every 500ns
        }
    }

    void print_intermediate_statistics() {
        std::cout << "\n📈 [STATS] Intermediate Report @ " << sc_time_stamp() << std::endl;
        std::cout << "   Packets Sent:     ";
        for (int i = 0; i < 4; i++) {
            std::cout << "Port" << i << ":" << packets_sent_per_port[i] << " ";
        }
        std::cout << "\n   Packets Received: ";
        for (int i = 0; i < 4; i++) {
            std::cout << "Port" << i << ":" << packets_received_per_port[i] << " ";
        }
        std::cout << "\n   Total Received: " << total_packets_received 
                  << "/" << total_packets_to_send << std::endl;
        
        // Packet flow completion status
        int completed_flows = 0;
        for (const auto& flow : packet_flows) {
            if (flow.completed) completed_flows++;
        }
        std::cout << "   Completed Flows: " << completed_flows << "/" << packet_flows.size() << std::endl;
    }

    void print_final_statistics() {
        std::cout << "\n🏆 [FINAL REPORT] 4-Port Switch Bus Monitor Test Results" << std::endl;
        std::cout << "=========================================================" << std::endl;
        
        // Overall statistics
        std::cout << "📊 Overall Statistics:" << std::endl;
        std::cout << "   Test Duration: " << sc_time_stamp() << std::endl;
        std::cout << "   Total Packets Sent: " << total_packets_to_send << std::endl;
        std::cout << "   Total Packets Received: " << total_packets_received << std::endl;
        std::cout << "   Success Rate: " << (total_packets_received * 100.0 / total_packets_to_send) << "%" << std::endl;
        
        // Per-port statistics
        std::cout << "\n📈 Per-Port Statistics:" << std::endl;
        for (int i = 0; i < 4; i++) {
            std::cout << "   Port " << i << ": Sent=" << packets_sent_per_port[i] 
                      << ", Received=" << packets_received_per_port[i] << std::endl;
        }
        
        // Packet flow analysis
        std::cout << "\n🔍 Packet Flow Analysis:" << std::endl;
        int completed_flows = 0;
        double total_latency = 0.0;
        double min_latency = 1e6, max_latency = 0.0;
        
        for (const auto& flow : packet_flows) {
            if (flow.completed) {
                completed_flows++;
                double latency_ns = (flow.output_time - flow.inject_time).to_double();
                total_latency += latency_ns;
                min_latency = std::min(min_latency, latency_ns);
                max_latency = std::max(max_latency, latency_ns);
                
                std::cout << "   Packet " << flow.packet_id << ": " 
                          << flow.source_port << "→" << flow.dest_port 
                          << " (latency: " << (latency_ns/1000.0) << "μs)" << std::endl;
            } else {
                std::cout << "   ❌ Packet " << flow.packet_id << ": " 
                          << flow.source_port << "→" << flow.dest_port << " LOST!" << std::endl;
            }
        }
        
        if (completed_flows > 0) {
            std::cout << "\n⏱️  Latency Statistics:" << std::endl;
            std::cout << "   Completed Flows: " << completed_flows << "/" << packet_flows.size() << std::endl;
            std::cout << "   Average Latency: " << (total_latency / completed_flows / 1000.0) << "μs" << std::endl;
            std::cout << "   Min Latency: " << (min_latency / 1000.0) << "μs" << std::endl;
            std::cout << "   Max Latency: " << (max_latency / 1000.0) << "μs" << std::endl;
        }
        
        // Test verdict
        bool test_passed = (total_packets_received == total_packets_to_send) && 
                          (completed_flows == packet_flows.size());
        
        std::cout << "\n🎯 TEST VERDICT: " << (test_passed ? "✅ PASSED" : "❌ FAILED") << std::endl;
        
        if (!test_passed) {
            std::cout << "   Issues detected:" << std::endl;
            if (total_packets_received != total_packets_to_send) {
                std::cout << "   - Packet count mismatch" << std::endl;
            }
            if (completed_flows != packet_flows.size()) {
                std::cout << "   - Incomplete packet flows" << std::endl;
            }
        }
        
        std::cout << "=========================================================" << std::endl;
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused parameter warnings
    
    std::cout << "🚀 Starting 4-Port Switch Bus Monitoring Test..." << std::endl;
    
    // Create test bench
    Test4PortSwitchBusMonitor testbench("testbench");
    
    // Enable waveform dumping
    sc_trace_file* tf = sc_create_vcd_trace_file("4port_switch_bus_monitor");
    if (tf) {
        sc_trace(tf, testbench.clk, "clk");
        sc_trace(tf, testbench.rst_n, "rst_n");
        
        // Trace external interfaces
        for (int i = 0; i < 4; i++) {
            std::string port_name = "port" + std::to_string(i);
            sc_trace(tf, testbench.ext_axis_in_tvalid[i], port_name + "_in_tvalid");
            sc_trace(tf, testbench.ext_axis_in_tready[i], port_name + "_in_tready");
            sc_trace(tf, testbench.ext_axis_in_tlast[i], port_name + "_in_tlast");
            sc_trace(tf, testbench.ext_axis_out_tvalid[i], port_name + "_out_tvalid");
            sc_trace(tf, testbench.ext_axis_out_tready[i], port_name + "_out_tready");
            sc_trace(tf, testbench.ext_axis_out_tlast[i], port_name + "_out_tlast");
        }
        
        std::cout << "📊 Waveform tracing enabled: 4port_switch_bus_monitor.vcd" << std::endl;
    }
    
    // Run simulation
    sc_start();
    
    if (tf) {
        sc_close_vcd_trace_file(tf);
    }
    
    std::cout << "🏁 Test completed!" << std::endl;
    return 0;
}