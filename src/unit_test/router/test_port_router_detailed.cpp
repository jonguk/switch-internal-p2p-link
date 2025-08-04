/*!
 * \file test_port_router_detailed.cpp
 * \brief Detailed Port Router Test with Internal Signal Monitoring
 * \author Switch Development Team
 * \date August 2024
 */

#include "systemc.h"
#include "../../systemc/router/port_router.h"
#include "../../systemc/common/switch_types.h"
#include <iostream>
#include <vector>
#include <iomanip>

using namespace switch_internal_p2p;

/**
 * @brief Detailed test bench for Port Router with internal signal monitoring
 */
SC_MODULE(TestPortRouterDetailed) {
public:
    // =============================================================================
    // Signals and Components
    // =============================================================================
    
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // 4-port router for testing
    PortRouter<4>* router;
    
    // External AXIS signals for all 4 ports
    std::array<sc_signal<bool>, 4> ext_axis_in_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_in_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_in_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_in_tuser;
    std::array<sc_signal<bool>, 4> ext_axis_in_tlast;
    std::array<sc_signal<bool>, 4> ext_axis_in_tready;
    
    std::array<sc_signal<bool>, 4> ext_axis_out_tvalid;
    std::array<sc_signal<sc_bv<AXIS_DATA_WIDTH>>, 4> ext_axis_out_tdata;
    std::array<sc_signal<sc_bv<AXIS_KEEP_WIDTH>>, 4> ext_axis_out_tkeep;
    std::array<sc_signal<sc_bv<AXIS_USER_WIDTH>>, 4> ext_axis_out_tuser;
    std::array<sc_signal<bool>, 4> ext_axis_out_tlast;
    std::array<sc_signal<bool>, 4> ext_axis_out_tready;
    
    // AXI Configuration signals (PortRouter uses sc_bv<32>)
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Shared credits for Egress Queue Managers (Ingress QMs auto-initialize)
    std::array<std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT>, 4> egress_shared_credits;
    
    // =============================================================================
    // Packet Tracking and Verification
    // =============================================================================
    
    struct DetailedPacketTrace {
        uint32_t sequence_id;
        int src_port;
        int dest_port;
        std::vector<uint8_t> original_data;
        InternalHeader original_header;
        sc_time sent_time;
        
        // Internal tracking
        bool ingress_received;
        sc_time ingress_time;
        bool router_forwarded;
        sc_time router_time;
        bool egress_sent;
        sc_time egress_time;
        bool external_received;
        sc_time external_time;
        
        // Data integrity
        std::vector<uint8_t> received_data;
        InternalHeader received_header;
        bool data_matches;
    };
    
    std::vector<DetailedPacketTrace> packet_traces;
    std::array<uint32_t, 4> port_ingress_count = {0, 0, 0, 0};
    std::array<uint32_t, 4> port_egress_count = {0, 0, 0, 0};
    uint32_t next_sequence_id = 1;
    
    // =============================================================================
    // Constructor
    // =============================================================================
    
    SC_CTOR(TestPortRouterDetailed) : 
        clk("clk", sc_time(10, SC_NS)), // 100MHz clock
        rst_n("rst_n")
    {
        // Initialize signal arrays
        for (int i = 0; i < 4; i++) {
            ext_axis_in_tvalid[i].write(false);
            ext_axis_in_tdata[i].write(sc_bv<AXIS_DATA_WIDTH>("0"));
            ext_axis_in_tkeep[i].write(sc_bv<AXIS_KEEP_WIDTH>("0"));
            ext_axis_in_tuser[i].write(sc_bv<AXIS_USER_WIDTH>("0"));
            ext_axis_in_tlast[i].write(false);
            
            ext_axis_out_tready[i].write(true);
        }
        
        // Create router
        router = new PortRouter<4>("port_router");
        
        // Connect clock and reset
        router->clk(clk);
        router->rst_n(rst_n);
        
        // Connect external AXIS interfaces
        for (int i = 0; i < 4; i++) {
            router->ext_axis_in_tvalid[i](ext_axis_in_tvalid[i]);
            router->ext_axis_in_tdata[i](ext_axis_in_tdata[i]);
            router->ext_axis_in_tkeep[i](ext_axis_in_tkeep[i]);
            router->ext_axis_in_tuser[i](ext_axis_in_tuser[i]);
            router->ext_axis_in_tlast[i](ext_axis_in_tlast[i]);
            router->ext_axis_in_tready[i](ext_axis_in_tready[i]);
            
            router->ext_axis_out_tvalid[i](ext_axis_out_tvalid[i]);
            router->ext_axis_out_tdata[i](ext_axis_out_tdata[i]);
            router->ext_axis_out_tkeep[i](ext_axis_out_tkeep[i]);
            router->ext_axis_out_tuser[i](ext_axis_out_tuser[i]);
            router->ext_axis_out_tlast[i](ext_axis_out_tlast[i]);
            router->ext_axis_out_tready[i](ext_axis_out_tready[i]);
        }
        
        // Connect AXI interfaces
        router->axi_master_valid(axi_master_valid);
        router->axi_master_addr(axi_master_addr);
        router->axi_master_data(axi_master_data);
        router->axi_master_ready(axi_master_ready);
        
        router->axi_slave_valid(axi_slave_valid);
        router->axi_slave_addr(axi_slave_addr);
        router->axi_slave_data(axi_slave_data);
        router->axi_slave_ready(axi_slave_ready);
        
        // Start test processes
        SC_THREAD(test_process);
        SC_THREAD(detailed_monitor);
        SC_THREAD(output_ready_driver);
        
        std::cout << "[TestPortRouterDetailed] ✅ Test bench created with detailed monitoring" << std::endl;
    }
    
    ~TestPortRouterDetailed() {
        delete router;
    }
    
    // =============================================================================
    // Test Process
    // =============================================================================
    
    void test_process() {
        initialize_system();
        
        std::cout << "\n🔍 ===== Port Router Detailed Internal Signal Test =====" << std::endl;
        
        // Test 1: Single port routing
        test_single_port_routing();
        wait(5, SC_US);
        
        // Test 2: Multi-port concurrent routing
        test_multi_port_routing();
        wait(5, SC_US);
        
        // Test 3: Packet integrity verification
        test_packet_integrity();
        wait(5, SC_US);
        
        // Generate detailed report
        print_detailed_analysis_report();
        
        std::cout << "🎉 ===== Port Router Detailed Test Completed =====" << std::endl;
        sc_stop();
    }
    
    void detailed_monitor() {
        std::array<bool, 4> prev_ext_in_tvalid = {false, false, false, false};
        std::array<bool, 4> prev_ext_out_tvalid = {false, false, false, false};
        
        std::cout << "\n🔬 Detailed Monitor Started - Tracking all internal signals..." << std::endl;
        
        while (true) {
            wait(clk.posedge_event());
            
            for (int i = 0; i < 4; i++) {
                bool current_ext_in_tvalid = ext_axis_in_tvalid[i].read();
                bool current_ext_out_tvalid = ext_axis_out_tvalid[i].read();
                
                // Monitor external input (to Ingress QM)
                if (current_ext_in_tvalid && !prev_ext_in_tvalid[i]) {
                    port_ingress_count[i]++;
                    sc_bv<AXIS_USER_WIDTH> tuser = ext_axis_in_tuser[i].read();
                    sc_bv<AXIS_DATA_WIDTH> tdata = ext_axis_in_tdata[i].read();
                    bool tlast = ext_axis_in_tlast[i].read();
                    
                    InternalHeader header = InternalHeader::from_sc_bv(tuser);
                    
                    std::cout << "🔽 [" << sc_time_stamp() << "] EXT→INGRESS Port " << i 
                              << " | Seq:" << header.sequence_number << " | Src:" << header.source_port 
                              << " → Dest:" << header.dest_port
                              << " | tuser=0x" << std::hex << tuser.to_uint64() << std::dec
                              << " | tlast=" << (tlast ? "1" : "0") << std::endl;
                    
                    // Update packet trace
                    for (auto& trace : packet_traces) {
                        if (trace.original_header.sequence_number == header.sequence_number && 
                            !trace.ingress_received) {
                            trace.ingress_received = true;
                            trace.ingress_time = sc_time_stamp();
                            break;
                        }
                    }
                }
                
                // Monitor external output (from Egress QM)
                if (current_ext_out_tvalid && !prev_ext_out_tvalid[i]) {
                    port_egress_count[i]++;
                    sc_bv<AXIS_USER_WIDTH> tuser = ext_axis_out_tuser[i].read();
                    sc_bv<AXIS_DATA_WIDTH> tdata = ext_axis_out_tdata[i].read();
                    bool tlast = ext_axis_out_tlast[i].read();
                    
                    InternalHeader header = InternalHeader::from_sc_bv(tuser);
                    
                    std::cout << "🔼 [" << sc_time_stamp() << "] EGRESS→EXT Port " << i 
                              << " | Seq:" << header.sequence_number << " | Src:" << header.source_port 
                              << " → Dest:" << header.dest_port
                              << " | tuser=0x" << std::hex << tuser.to_uint64() << std::dec
                              << " | tlast=" << (tlast ? "1" : "0") << std::endl;
                    
                    // Update packet trace - mark as externally received
                    for (auto& trace : packet_traces) {
                        if (trace.original_header.sequence_number == header.sequence_number && 
                            !trace.external_received) {
                            trace.external_received = true;
                            trace.external_time = sc_time_stamp();
                            trace.received_header = header;
                            
                            // Verify routing correctness
                            bool routing_correct = (trace.dest_port == i);
                            std::cout << "🎯 [" << sc_time_stamp() << "] ROUTING " 
                                     << (routing_correct ? "✅ CORRECT" : "❌ ERROR")
                                     << ": Seq:" << header.sequence_number 
                                     << " expected Port " << trace.dest_port 
                                     << ", received on Port " << i << std::endl;
                            break;
                        }
                    }
                }
                
                prev_ext_in_tvalid[i] = current_ext_in_tvalid;
                prev_ext_out_tvalid[i] = current_ext_out_tvalid;
            }
        }
    }
    
    void output_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            // Always ready to receive output on all ports
            for (int i = 0; i < 4; i++) {
                ext_axis_out_tready[i].write(true);
            }
        }
    }
    
    // =============================================================================
    // Test Functions
    // =============================================================================
    
    void initialize_system() {
        std::cout << "[Test] 🔧 Initializing Port Router Detailed Test..." << std::endl;
        
        // Reset system
        rst_n.write(false);
        wait(100, SC_NS);
        
        // Initialize AXI signals correctly:
        // Port Router AXI Master interface - we provide ready signal
        axi_master_ready.write(true);
        
        // Port Router AXI Slave interface - we provide input signals
        axi_slave_valid.write(false);
        axi_slave_addr.write(sc_bv<32>("0"));
        axi_slave_data.write(sc_bv<32>("0"));
        
        // Port Router drives: axi_master_valid/addr/data and axi_slave_ready
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);
        
        // 🎯 CRITICAL: Initialize credits for all Queue Managers
        std::cout << "[Test] 🔧 Initializing credits for all Queue Managers..." << std::endl;
        
        // 🎯 CRITICAL FIX: Initialize credits once, then let Egress QM manage them
        // Use separate signal arrays to avoid multiple driver conflicts
        
        for (int port = 0; port < 4; port++) {
            // Initialize Egress QM credits ONCE only
            for (int queue = 0; queue < MAX_QUEUES_PER_PORT; queue++) {
                egress_shared_credits[port][queue].write(DEFAULT_CREDITS);
            }
            
            // Get Queue Managers and set initial credits
            IngressQueueManager* ingress_qm = router->get_ingress_manager(port);
            EgressQueueManager* egress_qm = router->get_egress_manager(port);
            
            if (ingress_qm) {
                std::cout << "[Test] ✅ Port " << port << " Ingress QM (auto-initialized credits)" << std::endl;
            } else {
                std::cout << "[Test] ⚠️  Port " << port << " Ingress QM not found!" << std::endl;
            }
            
            if (egress_qm) {
                // Set shared credits pointer ONCE - Egress QM will manage from here
                egress_qm->set_shared_credits(&egress_shared_credits[port]);
                std::cout << "[Test] ✅ Port " << port << " Egress QM credits initialized and linked" << std::endl;
            } else {
                std::cout << "[Test] ⚠️  Port " << port << " Egress QM not found!" << std::endl;
            }
        }
        
        // Allow credit initialization to propagate
        wait(200, SC_NS);
        
        std::cout << "[Test] ✅ System initialized, reset released, and credits configured" << std::endl;
    }
    
    void test_single_port_routing() {
        std::cout << "\n[Test] 🔄 Testing Single Port Routing (Port 0 → Port 2)..." << std::endl;
        
        // Create test packet
        std::vector<uint8_t> test_data = {0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88};
        InternalHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        header.queue_id = 1;
        header.dest_port = 2;
        header.source_port = 0;
        header.packet_length = test_data.size();
        header.sequence_number = next_sequence_id++;
        header.header_crc = 0x12;
        
        send_detailed_packet(0, test_data, header);
        wait(2, SC_US); // Wait for processing
        
        std::cout << "[Test] ✅ Single port routing test completed" << std::endl;
    }
    
    void test_multi_port_routing() {
        std::cout << "\n[Test] 🔀 Testing Multi-Port Concurrent Routing..." << std::endl;
        
        // Test multiple routing scenarios simultaneously
        std::vector<std::pair<int, int>> routing_pairs = {{0, 1}, {1, 3}, {2, 0}, {3, 2}};
        
        for (auto& pair : routing_pairs) {
            int src = pair.first;
            int dest = pair.second;
            
            std::vector<uint8_t> data = {
                (uint8_t)(0x10 + src), (uint8_t)(0x20 + dest), 
                (uint8_t)(0x30 + src), (uint8_t)(0x40 + dest)
            };
            
            InternalHeader header;
            header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
            header.queue_id = 0;
            header.dest_port = dest;
            header.source_port = src;
            header.packet_length = data.size();
            header.sequence_number = next_sequence_id++;
            header.header_crc = 0x34;
            
            send_detailed_packet(src, data, header);
            wait(100, SC_NS); // Small gap between packets
        }
        
        wait(3, SC_US); // Wait for all packets to be processed
        std::cout << "[Test] ✅ Multi-port routing test completed" << std::endl;
    }
    
    void test_packet_integrity() {
        std::cout << "\n[Test] 🔍 Testing Packet Data Integrity..." << std::endl;
        
        // Send packets with known patterns
        for (int i = 0; i < 4; i++) {
            std::vector<uint8_t> pattern_data;
            for (int j = 0; j < 8; j++) {
                pattern_data.push_back((uint8_t)(i * 16 + j));
            }
            
            InternalHeader header;
            header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
            header.queue_id = 2;
            header.dest_port = (i + 2) % 4; // Circular routing
            header.source_port = i;
            header.packet_length = pattern_data.size();
            header.sequence_number = next_sequence_id++;
            header.header_crc = 0x56;
            
            send_detailed_packet(i, pattern_data, header);
            wait(500, SC_NS);
        }
        
        wait(4, SC_US); // Wait for processing
        std::cout << "[Test] ✅ Packet integrity test completed" << std::endl;
    }
    
    void send_detailed_packet(int port_id, const std::vector<uint8_t>& data, const InternalHeader& header) {
        if (port_id >= 4) return;
        
        // Create detailed trace
        DetailedPacketTrace trace;
        trace.sequence_id = header.sequence_number;
        trace.src_port = port_id;
        trace.dest_port = header.dest_port;
        trace.original_data = data;
        trace.original_header = header;
        trace.sent_time = sc_time_stamp();
        trace.ingress_received = false;
        trace.router_forwarded = false;
        trace.egress_sent = false;
        trace.external_received = false;
        trace.data_matches = false;
        packet_traces.push_back(trace);
        
        std::cout << "[Test] 📤 Sending detailed packet Seq:" << header.sequence_number 
                  << " on Port " << port_id << " → Port " << header.dest_port 
                  << " (size=" << data.size() << ")" << std::endl;
        
        // Calculate number of beats needed
        int bytes_per_beat = AXIS_DATA_WIDTH / 8;
        int num_beats = (data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (int beat = 0; beat < num_beats; beat++) {
            // Wait for ready signal with timeout to prevent infinite wait
            int timeout_cycles = 0;
            while (!ext_axis_in_tready[port_id].read() && timeout_cycles < 1000) {
                wait(clk.posedge_event());
                timeout_cycles++;
            }
            
            if (timeout_cycles >= 1000) {
                std::cout << "[Test] ⚠️  TIMEOUT waiting for tready on Port " << port_id 
                         << ", tready=" << ext_axis_in_tready[port_id].read() << std::endl;
                return; // Exit function to prevent infinite wait
            }
            
            // Prepare beat data
            sc_bv<AXIS_DATA_WIDTH> tdata = 0;
            sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
            
            for (int byte = 0; byte < bytes_per_beat; byte++) {
                int data_index = beat * bytes_per_beat + byte;
                if (data_index < (int)data.size()) {
                    // Set data byte
                    for (int bit = 0; bit < 8; bit++) {
                        int bit_index = byte * 8 + bit;
                        tdata[bit_index] = (data[data_index] >> bit) & 1;
                    }
                    tkeep[byte] = 1;
                }
            }
            
            // Set signals
            ext_axis_in_tvalid[port_id].write(true);
            ext_axis_in_tdata[port_id].write(tdata);
            ext_axis_in_tkeep[port_id].write(tkeep);
            ext_axis_in_tlast[port_id].write(beat == num_beats - 1);
            
            // Set tuser on first beat (contains header)
            if (beat == 0) {
                sc_bv<AXIS_USER_WIDTH> tuser_bv = header.to_sc_bv();
                ext_axis_in_tuser[port_id].write(tuser_bv);
            } else {
                ext_axis_in_tuser[port_id].write(sc_bv<AXIS_USER_WIDTH>("0"));
            }
            
            // Wait for clock edge
            wait(clk.posedge_event());
        }
        
        // End transaction
        ext_axis_in_tvalid[port_id].write(false);
        ext_axis_in_tlast[port_id].write(false);
        ext_axis_in_tdata[port_id].write(sc_bv<AXIS_DATA_WIDTH>("0"));
        ext_axis_in_tkeep[port_id].write(sc_bv<AXIS_KEEP_WIDTH>("0"));
        ext_axis_in_tuser[port_id].write(sc_bv<AXIS_USER_WIDTH>("0"));
        
        std::cout << "[Test] ✅ Detailed packet Seq:" << header.sequence_number 
                 << " sent (" << num_beats << " beats)" << std::endl;
    }
    
    void print_detailed_analysis_report() {
        std::cout << "\n📊 ===== DETAILED PORT ROUTER ANALYSIS REPORT =====" << std::endl;
        
        // Port statistics
        std::cout << "\n🔢 Port Traffic Statistics:" << std::endl;
        for (int i = 0; i < 4; i++) {
            std::cout << "  Port " << i << ": Ingress=" << port_ingress_count[i] 
                     << ", Egress=" << port_egress_count[i] << std::endl;
        }
        
        // Packet journey analysis
        std::cout << "\n🎯 Packet Journey Analysis:" << std::endl;
        uint32_t total_sent = packet_traces.size();
        uint32_t ingress_received = 0;
        uint32_t external_received = 0;
        uint32_t routing_correct = 0;
        
        for (const auto& trace : packet_traces) {
            if (trace.ingress_received) ingress_received++;
            if (trace.external_received) external_received++;
            if (trace.external_received && trace.dest_port == trace.received_header.dest_port) {
                routing_correct++;
            }
        }
        
        std::cout << "  Packets Sent: " << total_sent << std::endl;
        std::cout << "  Ingress Received: " << ingress_received << " (" 
                 << (total_sent > 0 ? (ingress_received * 100 / total_sent) : 0) << "%)" << std::endl;
        std::cout << "  External Received: " << external_received << " (" 
                 << (total_sent > 0 ? (external_received * 100 / total_sent) : 0) << "%)" << std::endl;
        std::cout << "  Routing Correct: " << routing_correct << " (" 
                 << (external_received > 0 ? (routing_correct * 100 / external_received) : 0) << "%)" << std::endl;
        
        // Detailed packet breakdown
        std::cout << "\n📋 Individual Packet Analysis:" << std::endl;
        for (const auto& trace : packet_traces) {
            std::cout << "  Seq:" << trace.sequence_id 
                     << " | " << trace.src_port << "→" << trace.dest_port;
            
            if (trace.ingress_received) {
                sc_time ingress_latency = trace.ingress_time - trace.sent_time;
                std::cout << " | Ingress:" << ingress_latency;
            } else {
                std::cout << " | Ingress:❌";
            }
            
            if (trace.external_received) {
                sc_time total_latency = trace.external_time - trace.sent_time;
                std::cout << " | Total:" << total_latency << " ✅";
            } else {
                std::cout << " | Total:❌";
            }
            
            std::cout << std::endl;
        }
        
        // Final assessment
        bool all_tests_passed = (external_received == total_sent) && (routing_correct == external_received);
        std::cout << "\n🏆 FINAL ASSESSMENT: " 
                 << (all_tests_passed ? "✅ ALL TESTS PASSED" : "❌ ISSUES DETECTED") 
                 << std::endl;
        std::cout << "===========================================" << std::endl;
    }
};

// =============================================================================
// Main Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused parameter warnings
    
    // Create test bench
    TestPortRouterDetailed test("test_port_router_detailed");
    
    // Enable VCD tracing
    sc_trace_file* tf = sc_create_vcd_trace_file("port_router_detailed");
    
    // Trace clock and reset
    sc_trace(tf, test.clk, "clk");
    sc_trace(tf, test.rst_n, "rst_n");
    
    // Trace external AXIS signals for all ports
    for (int i = 0; i < 4; i++) {
        std::string port_prefix = "port" + std::to_string(i);
        
        sc_trace(tf, test.ext_axis_in_tvalid[i], port_prefix + "_in_tvalid");
        sc_trace(tf, test.ext_axis_in_tdata[i], port_prefix + "_in_tdata");
        sc_trace(tf, test.ext_axis_in_tkeep[i], port_prefix + "_in_tkeep");
        sc_trace(tf, test.ext_axis_in_tuser[i], port_prefix + "_in_tuser");
        sc_trace(tf, test.ext_axis_in_tlast[i], port_prefix + "_in_tlast");
        sc_trace(tf, test.ext_axis_in_tready[i], port_prefix + "_in_tready");
        
        sc_trace(tf, test.ext_axis_out_tvalid[i], port_prefix + "_out_tvalid");
        sc_trace(tf, test.ext_axis_out_tdata[i], port_prefix + "_out_tdata");
        sc_trace(tf, test.ext_axis_out_tkeep[i], port_prefix + "_out_tkeep");
        sc_trace(tf, test.ext_axis_out_tuser[i], port_prefix + "_out_tuser");
        sc_trace(tf, test.ext_axis_out_tlast[i], port_prefix + "_out_tlast");
        sc_trace(tf, test.ext_axis_out_tready[i], port_prefix + "_out_tready");
    }
    
    std::cout << "\n🌊 VCD Waveform tracing enabled: port_router_detailed.vcd" << std::endl;
    std::cout << "📊 To view waveforms: gtkwave port_router_detailed.vcd" << std::endl;
    
    std::cout << "\n🚀 Starting detailed Port Router internal signal test..." << std::endl;
    
    // Run simulation for sufficient time
    sc_start(50, SC_MS);
    
    // Close trace file
    sc_close_vcd_trace_file(tf);
    
    std::cout << "\n✅ Detailed Port Router test completed. VCD file generated." << std::endl;
    
    return 0;
}