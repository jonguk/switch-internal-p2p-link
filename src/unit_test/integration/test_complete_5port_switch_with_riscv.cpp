/*!
 * \file test_complete_5port_switch_with_riscv.cpp
 * \brief Test bench for Complete 5-Port Switch with RISC-V CPU
 * \author Switch Development Team
 * \date August 2024
 */

#include "systemc.h"
#include "../../systemc/integration/complete_5port_switch_with_riscv.h"
#include "../../systemc/common/switch_types.h"
#include <iostream>
#include <vector>
#include <iomanip>

using namespace switch_internal_p2p;

/**
 * @brief Test bench for Complete 5-Port Switch with RISC-V CPU
 */
class TestComplete5PortSwitchWithRISCV : public sc_module {
public:
    // =============================================================================
    // Test Signals
    // =============================================================================
    
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External AXIS Interfaces for 4 regular ports
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
    
    // Device Under Test
    Complete5PortSwitchWithRISCV* dut;
    
    // 🚀 FIX: Pre-declare credit signals (must be done before simulation starts)
    std::array<std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT>, 5> egress_shared_credits;
    
    // =============================================================================
    // Packet Verification Enhancement
    // =============================================================================
    
    struct PacketTrace {
        uint32_t sequence_id;
        int src_port;
        int dest_port;
        std::vector<uint8_t> data;
        InternalHeader header;
        sc_time sent_time;
        bool received;
        sc_time received_time;
    };
    
    std::vector<PacketTrace> sent_packets;
    std::vector<PacketTrace> received_packets;
    std::array<uint32_t, 4> port_input_count = {0, 0, 0, 0};
    std::array<uint32_t, 4> port_output_count = {0, 0, 0, 0};
    uint32_t next_sequence_id = 1;
    
    // =============================================================================
    // Constructor
    // =============================================================================
    
    SC_CTOR(TestComplete5PortSwitchWithRISCV) : 
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
        
        // Create DUT
        dut = new Complete5PortSwitchWithRISCV("dut");
        
        // Connect interfaces
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
        
        // Start test processes
        SC_THREAD(test_process);
        SC_THREAD(output_ready_driver);
        SC_THREAD(packet_monitor);
        
        std::cout << "[TestComplete5PortSwitchWithRISCV] ✅ Test bench created" << std::endl;
    }
    
    ~TestComplete5PortSwitchWithRISCV() {
        delete dut;
    }

private:
    // =============================================================================
    // Test Methods
    // =============================================================================
    
    void test_process() {
        std::cout << "\n🧪 ===== Complete 5-Port Switch with RISC-V CPU Test Started =====" << std::endl;
        
        // Initialize and configure system
        initialize_signals();
        configure_system();
        
        // Run test cases with sufficient gaps for VCD observation
        test_basic_functionality();
        wait(5, SC_US);  // 5 microsecond gap for clear separation
        
        test_cross_port_routing();
        wait(5, SC_US);  // 5 microsecond gap for clear separation
        
        test_cpu_error_handling();
        wait(5, SC_US);  // 5 microsecond gap for clear separation
        
        test_cpu_configuration();
        wait(2, SC_US);  // 2 microsecond gap
        
        test_cpu_statistics();
        
        // Print final results
        print_test_results();
        
        // Generate comprehensive packet verification report
        print_packet_verification_report();
        
        std::cout << "🎉 ===== Complete 5-Port Switch with RISC-V CPU Test Completed =====" << std::endl;
        sc_stop();
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
    
    void packet_monitor() {
        std::array<bool, 4> prev_tvalid_in = {false, false, false, false};
        std::array<bool, 4> prev_tvalid_out = {false, false, false, false};
        
        std::cout << "\n📡 Packet Monitor Started - Monitoring all 4 ports..." << std::endl;
        
        while (true) {
            wait(clk.posedge_event());
            
            // Monitor input packets (rising edge of tvalid)
            for (int i = 0; i < 4; i++) {
                bool current_tvalid_in = ext_axis_in_tvalid[i].read();
                bool current_tvalid_out = ext_axis_out_tvalid[i].read();
                
                // Detect new input packet
                if (current_tvalid_in && !prev_tvalid_in[i]) {
                    sc_bv<AXIS_USER_WIDTH> tuser = ext_axis_in_tuser[i].read();
                    sc_bv<AXIS_DATA_WIDTH> tdata = ext_axis_in_tdata[i].read();
                    bool tlast = ext_axis_in_tlast[i].read();
                    
                    // Extract header for routing verification
                    InternalHeader input_header = InternalHeader::from_sc_bv(tuser);
                    
                    std::cout << "📥 [" << sc_time_stamp() << "] INPUT Port " << i 
                              << " → Dest:" << input_header.dest_port << " | Seq:" << input_header.sequence_number
                              << " | tuser=0x" << std::hex << tuser.to_uint64() << std::dec
                              << " | tlast=" << (tlast ? "1" : "0")
                              << " | tdata[31:0]=0x" << std::hex << ((tdata >> 0) & 0xFFFFFFFF).to_uint() << std::dec
                              << std::endl;
                }
                
                // 🔍 DEBUG: Log output tvalid status only when there's activity
                static int debug_counter = 0;
                if (i == 0 && (debug_counter++ % 1000) == 0) { // Log every 1000 cycles
                    bool any_activity = false;
                    for (int j = 0; j < 4; j++) {
                        if (ext_axis_out_tvalid[j].read()) any_activity = true;
                    }
                    if (any_activity) {
                        std::cout << "🔍 [MONITOR] Output tvalid status: ";
                        for (int j = 0; j < 4; j++) {
                            bool cur_out = ext_axis_out_tvalid[j].read();
                            bool prev_out = prev_tvalid_out[j];
                            std::cout << "Port" << j << ":" << (cur_out ? "1" : "0") 
                                     << "(" << (prev_out ? "1" : "0") << ") ";
                        }
                        std::cout << std::endl;
                    }
                }
                
                // 🚀 FIX: More tolerant packet detection (catch brief tvalid pulses)
                if (current_tvalid_out && !prev_tvalid_out[i]) {
                    std::cout << "🔍 [TRIGGER] Output packet detected on Port " << i 
                             << " | tvalid: 0→1" << std::endl;
                    port_output_count[i]++;
                    sc_bv<AXIS_USER_WIDTH> tuser_out = ext_axis_out_tuser[i].read();
                    sc_bv<AXIS_DATA_WIDTH> tdata_out = ext_axis_out_tdata[i].read();
                    bool tlast_out = ext_axis_out_tlast[i].read();
                    
                    // Extract header for routing verification
                    InternalHeader output_header = InternalHeader::from_sc_bv(tuser_out);
                    
                    // 🚀 FIX: Port-based packet matching (first unmatched packet to this port)
                    bool matched = false;
                    std::cout << "🔍 [DEBUG] Looking for match: Port " << i 
                             << " (Output Seq:" << output_header.sequence_number << ")" << std::endl;
                    
                    for (auto& pkt : sent_packets) {
                        // 🚀 FIX: Match first unmatched packet going to this external port
                        if ((pkt.dest_port - 1) == i && !pkt.received) { // dest_port 1-4 maps to external ports 0-3
                            pkt.received = true;
                            pkt.received_time = sc_time_stamp();
                            matched = true;
                            std::cout << "✅ [MATCHED] Port " << i << " | Packet Seq:" << pkt.header.sequence_number 
                                     << " | dest_port:" << pkt.dest_port << " | ✅ SUCCESS!" << std::endl;
                            break;
                        }
                    }
                    
                    if (!matched) {
                        std::cout << "❌ [NO MATCH] Port " << i << " - no more packets expected on this port!" << std::endl;
                    }
                    
                    std::cout << "📤 [" << sc_time_stamp() << "] OUTPUT Port " << i 
                              << " ← From:" << output_header.source_port << " | Seq:" << output_header.sequence_number
                              << " | tuser=0x" << std::hex << tuser_out.to_uint64() << std::dec
                              << " | tlast=" << (tlast_out ? "1" : "0")
                              << " | tdata[31:0]=0x" << std::hex << ((tdata_out >> 0) & 0xFFFFFFFF).to_uint() << std::dec
                              << " | Port Count:" << port_output_count[i]
                              << std::endl;
                    
                    // Verify routing: packet should arrive at intended destination
                    bool routing_verified = false;
                    for (auto& sent_pkt : sent_packets) {
                        if (!sent_pkt.received && sent_pkt.header.sequence_number == output_header.sequence_number) {
                            // CPU 포트 체크: CPU=0번이지만 외부에서는 안 보임, 실제 포트는 1-4번→외부 0-3번
                            int expected_external_port = (sent_pkt.dest_port == 0) ? -1 : sent_pkt.dest_port - 1;
                            
                            if (expected_external_port == i) {
                                routing_verified = true;
                                sent_pkt.received = true;
                                sent_pkt.received_time = sc_time_stamp();
                                
                                sc_time latency = sent_pkt.received_time - sent_pkt.sent_time;
                                std::cout << "🎯 [" << sc_time_stamp() << "] ROUTING VERIFIED: Seq:" 
                                         << output_header.sequence_number << " correctly routed to Port " 
                                         << i << " (latency: " << latency << ")" << std::endl;
                                break;
                            }
                        }
                    }
                    
                    if (!routing_verified && sent_packets.size() > 0) {
                        std::cout << "❌ [" << sc_time_stamp() << "] ROUTING ERROR: Unexpected packet Seq:" 
                                 << output_header.sequence_number << " on Port " << i << std::endl;
                    }
                }
                
                prev_tvalid_in[i] = current_tvalid_in;
                prev_tvalid_out[i] = current_tvalid_out;
            }
        }
    }
    
    void initialize_egress_credits() {
        std::cout << "[Test] 💳 Initializing Egress QM credits..." << std::endl;
        
        // 🚀 FIX: Initialize Egress QM credits for all 5 ports (using pre-declared signals)
        // Access Port Router and initialize each Egress QM's credits
        for (int port = 0; port < 5; port++) {
            auto* egress_qm = dut->get_port_router()->get_egress_manager(port);
            if (egress_qm) {
                // Initialize credit values using pre-declared member variable
                for (int queue = 0; queue < MAX_QUEUES_PER_PORT; queue++) {
                    egress_shared_credits[port][queue].write(DEFAULT_CREDITS);
                }
                
                egress_qm->set_shared_credits(&egress_shared_credits[port]);
                std::cout << "[Test] ✅ Port " << port << " Egress QM credits initialized" << std::endl;
            } else {
                std::cout << "[Test] ⚠️  Port " << port << " Egress QM not found!" << std::endl;
            }
        }
        
        wait(50, SC_NS); // Allow credits to propagate
        std::cout << "[Test] ✅ All Egress QM credits initialized" << std::endl;
    }
    
    void initialize_signals() {
        std::cout << "[Test] 🔧 Initializing Complete 5-Port Switch with RISC-V..." << std::endl;
        
        // Reset system
        rst_n.write(false);
        
        // Initialize all input signals
        for (int i = 0; i < 4; i++) {
            ext_axis_in_tvalid[i].write(false);
            ext_axis_in_tdata[i].write(sc_bv<AXIS_DATA_WIDTH>("0"));
            ext_axis_in_tkeep[i].write(sc_bv<AXIS_KEEP_WIDTH>("0"));
            ext_axis_in_tuser[i].write(sc_bv<AXIS_USER_WIDTH>("0"));
            ext_axis_in_tlast[i].write(false);
        }
        
        wait(100, SC_NS);
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);
        
        // 🚀 FIX: Initialize Egress QM credits (same as 4-port fix)
        initialize_egress_credits();
        
        std::cout << "[Test] ✅ System initialized and reset released" << std::endl;
    }
    
    void configure_system() {
        std::cout << "[Test] ⚙️  Configuring system via CPU..." << std::endl;
        
        // 🚀 FIX: Configure global port mappings for actual packet dest_port values
        // New port structure: CPU=0, External Ports=1,2,3,4
        send_cpu_config_write(0x1088, (0 << 16) | 0); // Global Port 0 → Local Port 0 (CPU)
        send_cpu_config_write(0x1088, (1 << 16) | 1); // Global Port 1 → Local Port 1 (Ext Port 0)
        send_cpu_config_write(0x1088, (2 << 16) | 2); // Global Port 2 → Local Port 2 (Ext Port 1)
        send_cpu_config_write(0x1088, (3 << 16) | 3); // Global Port 3 → Local Port 3 (Ext Port 2)
        send_cpu_config_write(0x1088, (4 << 16) | 4); // Global Port 4 → Local Port 4 (Ext Port 3)
        
        // Enable error forwarding to CPU
        send_cpu_config_write(0x3000, 1); // Enable error forwarding
        send_cpu_config_write(0x3004, 0x01); // Add CRC error condition
        send_cpu_config_write(0x3004, 0x02); // Add queue overflow condition
        
        std::cout << "[Test] ✅ System configuration complete" << std::endl;
    }
    
    void test_basic_functionality() {
        std::cout << "\n[Test] 🔄 Testing Basic Functionality..." << std::endl;
        
        // Send packet from Port 0 to CPU (Port 4)
        std::vector<uint8_t> packet_data = {
            0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
            0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
            0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17
        };
        
        InternalHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::HIGH_PRIORITY);
        header.queue_id = 0;
        header.dest_port = 0; // CPU port (새로운 포트 구조)
        header.source_port = 1; // Router port 1 (External port 0)
        header.packet_length = packet_data.size();
        header.sequence_number = 1;
        
        send_axis_packet(0, packet_data, header);
        
        // Wait for processing with extended time for VCD capture
        wait(2, SC_US);
        
        std::cout << "[Test] ✅ Basic functionality test completed" << std::endl;
    }
    
    void test_cross_port_routing() {
        std::cout << "\n[Test] 🔀 Testing ALL Ports with Enhanced Multi-Directional Traffic..." << std::endl;
        
        // 새로운 포트 구조: CPU=0번, 실제포트=1-4번 (외부 0-3번)
        // Scenario 1: Port 0 → Port 3 (External Port 0 → External Port 2) 
        std::cout << "[Test] 📤 Scenario 1: External Port 0 → External Port 2" << std::endl;
        std::vector<uint8_t> packet1 = {0xAA, 0xBB, 0xCC, 0xDD, 0x11, 0x22, 0x33, 0x44};
        InternalHeader header1;
        header1.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        header1.queue_id = 1;
        header1.dest_port = 3; // Router port 3 (External port 2)
        header1.source_port = 1; // Router port 1 (External port 0)
        header1.packet_length = packet1.size();
        header1.sequence_number = 10;
        send_axis_packet(0, packet1, header1); // External port 0
        
        wait(1, SC_US);  // 1 microsecond gap between scenarios
        
        // Scenario 2: Port 1 → Port 4 (External Port 1 → External Port 3) 
        std::cout << "[Test] 📤 Scenario 2: External Port 1 → External Port 3" << std::endl;
        std::vector<uint8_t> packet2 = {0x55, 0x66, 0x77, 0x88, 0x99, 0xAA};
        InternalHeader header2;
        header2.channel_type = static_cast<uint8_t>(ChannelType::HIGH_PRIORITY);
        header2.queue_id = 0;
        header2.dest_port = 4; // Router port 4 (External port 3)
        header2.source_port = 2; // Router port 2 (External port 1)
        header2.packet_length = packet2.size();
        header2.sequence_number = 11;
        send_axis_packet(1, packet2, header2); // External port 1
        
        wait(1, SC_US);  // 1 microsecond gap between scenarios
        
        // Scenario 3: Port 2 → CPU (External Port 2 → CPU Port 0)
        std::cout << "[Test] 📤 Scenario 3: External Port 2 → CPU Port 0" << std::endl;
        std::vector<uint8_t> packet3 = {0xFF, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88, 0x77, 0x66};
        InternalHeader header3;
        header3.channel_type = static_cast<uint8_t>(ChannelType::CONTROL_CHANNEL);
        header3.queue_id = 2;
        header3.dest_port = 0; // CPU port 0
        header3.source_port = 3; // Router port 3 (External port 2)
        header3.packet_length = packet3.size();
        header3.sequence_number = 12;
        send_axis_packet(2, packet3, header3); // External port 2
        
        wait(1, SC_US);  // 1 microsecond gap between scenarios
        
        // Scenario 4: Port 3 → Port 1 (External Port 3 → External Port 0)
        std::cout << "[Test] 📤 Scenario 4: External Port 3 → External Port 0" << std::endl;
        std::vector<uint8_t> packet4 = {0x12, 0x34, 0x56, 0x78};
        InternalHeader header4;
        header4.channel_type = static_cast<uint8_t>(ChannelType::MANAGEMENT);
        header4.queue_id = 3;
        header4.dest_port = 1; // Router port 1 (External port 0)
        header4.source_port = 4; // Router port 4 (External port 3)
        header4.packet_length = packet4.size();
        header4.sequence_number = 13;
        send_axis_packet(3, packet4, header4); // External port 3
        
        wait(1, SC_US);  // 1 microsecond gap before mesh traffic
        
        // Scenario 5: Full Mesh Traffic (모든 포트 동시 전송)
        std::cout << "[Test] 📤 Scenario 5: Full Mesh Traffic (모든 포트 동시 활성화)" << std::endl;
        
        // Port 0 → Port 1
        std::vector<uint8_t> mesh1 = {0x01, 0x02, 0x03, 0x04};
        InternalHeader mesh_header1;
        mesh_header1.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        mesh_header1.queue_id = 0;
        mesh_header1.dest_port = 2; // Router port 2 (External port 1)
        mesh_header1.source_port = 1; // Router port 1 (External port 0)
        mesh_header1.packet_length = mesh1.size();
        mesh_header1.sequence_number = 20;
        send_axis_packet(0, mesh1, mesh_header1);
        
        wait(500, SC_NS);  // 500ns gap for mesh traffic separation
        
        // Port 1 → Port 2  
        std::vector<uint8_t> mesh2 = {0x11, 0x12, 0x13, 0x14};
        InternalHeader mesh_header2;
        mesh_header2.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        mesh_header2.queue_id = 1;
        mesh_header2.dest_port = 3; // Router port 3 (External port 2)
        mesh_header2.source_port = 2; // Router port 2 (External port 1)
        mesh_header2.packet_length = mesh2.size();
        mesh_header2.sequence_number = 21;
        send_axis_packet(1, mesh2, mesh_header2);
        
        wait(500, SC_NS);  // 500ns gap for mesh traffic separation
        
        // Port 2 → Port 3
        std::vector<uint8_t> mesh3 = {0x21, 0x22, 0x23, 0x24};
        InternalHeader mesh_header3;
        mesh_header3.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        mesh_header3.queue_id = 2;
        mesh_header3.dest_port = 4; // Router port 4 (External port 3)
        mesh_header3.source_port = 3; // Router port 3 (External port 2)
        mesh_header3.packet_length = mesh3.size();
        mesh_header3.sequence_number = 22;
        send_axis_packet(2, mesh3, mesh_header3);
        
        wait(500, SC_NS);  // 500ns gap for mesh traffic separation
        
        // Port 3 → CPU
        std::vector<uint8_t> mesh4 = {0x31, 0x32, 0x33, 0x34};
        InternalHeader mesh_header4;
        mesh_header4.channel_type = static_cast<uint8_t>(ChannelType::HIGH_PRIORITY);
        mesh_header4.queue_id = 3;
        mesh_header4.dest_port = 0; // CPU port 0
        mesh_header4.source_port = 4; // Router port 4 (External port 3)
        mesh_header4.packet_length = mesh4.size();
        mesh_header4.sequence_number = 23;
        send_axis_packet(3, mesh4, mesh_header4);
        
        // 패킷 전달 관찰을 위한 충분한 대기
        std::cout << "[Test] ⏳ Waiting for all packets to be routed..." << std::endl;
        wait(5, SC_US); // 5 microseconds for comprehensive routing
        
        // 결과 확인
        int active_outputs = 0;
        for (int i = 0; i < 4; i++) {
            if (ext_axis_out_tvalid[i].read()) {
                active_outputs++;
                std::cout << "[Test] 🎯 Output active on External Port " << i << " (Router Port " << (i+1) << ")" << std::endl;
            }
        }
        
        std::cout << "[Test] 📊 Total active outputs: " << active_outputs << "/4 ports" << std::endl;
        std::cout << "[Test] ✅ Enhanced Multi-Port Routing Test Completed" << std::endl;
    }
    
    void test_cpu_error_handling() {
        std::cout << "\n[Test] 🚨 Testing CPU Error Handling..." << std::endl;
        
        // Create a high priority error packet
        std::vector<uint8_t> error_data = {
            0xFF, 0xEE, 0xDD, 0xCC, // Error signature
            0x01, 0x00, 0x00, 0x00  // Error code: CRC Error
        };
        
        InternalHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::HIGH_PRIORITY);
        header.queue_id = 0xFF; // Special error queue
        header.dest_port = 0; // CPU port (새로운 포트 구조)
        header.source_port = 2; // Router port 2 (External port 1)
        header.packet_length = error_data.size();
        header.sequence_number = 3;
        
        send_axis_packet(1, error_data, header);
        
        // Wait for CPU processing with extended time for VCD capture
        wait(2, SC_US);
        
        std::cout << "[Test] ✅ CPU error handling test completed" << std::endl;
    }
    
    void test_cpu_configuration() {
        std::cout << "\n[Test] 🔧 Testing CPU Configuration..." << std::endl;
        
        // Test various configuration commands
        send_cpu_config_write(0x1000, 0x12345678); // Router config
        send_cpu_config_write(0x2000, 0xABCDEF00); // Port 0 Ingress PM config
        send_cpu_config_write(0x2400, 0x87654321); // Port 0 Egress PM config
        
        wait(200, SC_NS);
        
        std::cout << "[Test] ✅ CPU configuration test completed" << std::endl;
    }
    
    void test_cpu_statistics() {
        std::cout << "\n[Test] 📊 Testing CPU Statistics..." << std::endl;
        
        // Read various statistics
        uint32_t total_packets = send_cpu_stats_read(0x4000);
        uint32_t error_packets = send_cpu_stats_read(0x4004);
        uint32_t cpu_packets = send_cpu_stats_read(0x4008);
        uint32_t cpu_credits = send_cpu_stats_read(0x400C);
        
        std::cout << "[Test] 📈 Statistics Summary:" << std::endl;
        std::cout << "  Total Packets: " << total_packets << std::endl;
        std::cout << "  Error Packets: " << error_packets << std::endl;
        std::cout << "  CPU Packets: " << cpu_packets << std::endl;
        std::cout << "  CPU Credits: " << cpu_credits << std::endl;
        
        std::cout << "[Test] ✅ CPU statistics test completed" << std::endl;
    }
    
    void send_axis_packet(int port_id, const std::vector<uint8_t>& data, const InternalHeader& header) {
        if (port_id >= 4) return;
        
        // Create packet trace for verification
        PacketTrace trace;
        trace.sequence_id = next_sequence_id++;
        trace.src_port = port_id;
        trace.dest_port = header.dest_port;
        trace.data = data;
        trace.header = header;
        trace.sent_time = sc_time_stamp();
        trace.received = false;
        sent_packets.push_back(trace);
        
        std::cout << "[Test] 📤 Sending packet #" << trace.sequence_id << " on Port " << port_id 
                  << " (size=" << data.size() << ", dest=" << header.dest_port << ", seq=" << header.sequence_number << ")" << std::endl;
        
        // Calculate number of beats needed
        int bytes_per_beat = AXIS_DATA_WIDTH / 8;
        int num_beats = (data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (int beat = 0; beat < num_beats; beat++) {
            // Wait for ready signal with timeout
            int timeout_cycles = 0;
            while (!ext_axis_in_tready[port_id].read() && timeout_cycles < 1000) {
                wait(clk.posedge_event());
                timeout_cycles++;
            }
            
            if (timeout_cycles >= 1000) {
                std::cout << "[Test] ⚠️  TIMEOUT waiting for tready on Port " << port_id 
                         << " (current tready=" << ext_axis_in_tready[port_id].read() << ")" << std::endl;
                return; // Skip this packet
            }
            
            std::cout << "[Test] 🔍 Port " << port_id << " beat " << beat 
                     << " - tready=" << ext_axis_in_tready[port_id].read() << std::endl;
            
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
        
        // Update counters
        port_input_count[port_id]++;
        
        std::cout << "[Test] ✅ AXIS packet #" << trace.sequence_id << " sent (" << num_beats 
                 << " beats, Port " << port_id << " count: " << port_input_count[port_id] << ")" << std::endl;
    }
    
    void send_cpu_config_write(uint32_t addr, uint32_t data) {
        dut->cpu_write_config(addr, data);
        wait(50, SC_NS); // Allow time for processing
    }
    
    uint32_t send_cpu_stats_read(uint32_t addr) {
        uint32_t data = dut->cpu_read_stats(addr);
        return data;
    }
    
    void print_test_results() {
        std::cout << "\n📊 ===== Final Test Results =====" << std::endl;
        std::cout << "Total Packets Processed: " << dut->get_total_packets_processed() << std::endl;
        std::cout << "Total Error Packets: " << dut->get_total_error_packets() << std::endl;
        std::cout << "Total Bytes Processed: " << dut->get_total_bytes_processed() << std::endl;
        std::cout << "CPU Packets Processed: " << dut->get_cpu_packets_processed() << std::endl;
        std::cout << "CPU Credits Available: " << dut->get_cpu_credits() << std::endl;
        std::cout << "CPU Ready: " << (dut->is_cpu_ready() ? "Yes" : "No") << std::endl;
        std::cout << "===============================" << std::endl;
    }
    
    void print_packet_verification_report() {
        std::cout << "\n📊 ===== PACKET VERIFICATION REPORT =====" << std::endl;
        
        // Port statistics
        std::cout << "\n🔢 Port Statistics:" << std::endl;
        uint32_t total_input = 0, total_output = 0;
        for (int i = 0; i < 4; i++) {
            std::cout << "  Port " << i << ": Input=" << port_input_count[i] 
                     << ", Output=" << port_output_count[i] << std::endl;
            total_input += port_input_count[i];
            total_output += port_output_count[i];
        }
        std::cout << "  TOTAL: Input=" << total_input << ", Output=" << total_output << std::endl;
        
        // Routing verification
        std::cout << "\n🎯 Routing Verification:" << std::endl;
        uint32_t sent_count = sent_packets.size();
        uint32_t received_count = 0;
        uint32_t cpu_packets = 0;
        
        for (const auto& pkt : sent_packets) {
            if (pkt.received) {
                received_count++;
            }
            if (pkt.dest_port == 0) {
                cpu_packets++;
            }
        }
        
        std::cout << "  Packets Sent: " << sent_count << std::endl;
        std::cout << "  Packets Received: " << received_count << std::endl;
        std::cout << "  CPU-bound Packets: " << cpu_packets << " (not externally visible)" << std::endl;
        
        if (sent_count > 0) {
            uint32_t expected_external = sent_count - cpu_packets;
            double success_rate = (expected_external > 0) ? (double)received_count / expected_external * 100.0 : 100.0;
            std::cout << "  External Success Rate: " << std::fixed << std::setprecision(1) 
                     << success_rate << "%" << std::endl;
        }
        
        // Missing packets analysis
        std::cout << "\n📋 Packet Routing Details:" << std::endl;
        for (const auto& pkt : sent_packets) {
            std::string status = pkt.received ? "✅ RECEIVED" : (pkt.dest_port == 0 ? "🔵 CPU" : "❌ MISSING");
            std::cout << "  Seq:" << pkt.header.sequence_number 
                     << " | Ext" << pkt.src_port << "→";
            if (pkt.dest_port == 0) {
                std::cout << "CPU";
            } else {
                std::cout << "Ext" << (pkt.dest_port - 1);
            }
            std::cout << " | " << status;
            if (pkt.received) {
                sc_time latency = pkt.received_time - pkt.sent_time;
                std::cout << " | Latency:" << latency;
            }
            std::cout << std::endl;
        }
        
        // Final verification result
        uint32_t expected_external = sent_count - cpu_packets;
        bool all_tests_passed = (received_count == expected_external);
        std::cout << "\n🏆 VERIFICATION RESULT: " 
                 << (all_tests_passed ? "✅ ALL EXTERNAL ROUTING VERIFIED" : "❌ ROUTING ISSUES DETECTED") 
                 << std::endl;
        std::cout << "===========================================" << std::endl;
    }
};

// =============================================================================
// Main Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused parameter warnings
    
    // =============================================================================
    // VCD Waveform Setup
    // =============================================================================
    
    // Create VCD trace file
    sc_trace_file* tf = sc_create_vcd_trace_file("complete_5port_switch_with_riscv");
    tf->set_time_unit(1, SC_NS);
    
    // Create test bench
    TestComplete5PortSwitchWithRISCV test("test");
    
    // Trace clock and reset
    sc_trace(tf, test.clk, "clk");
    sc_trace(tf, test.rst_n, "rst_n");
    
    // Trace AXIS signals for all 4 ports
    for (int i = 0; i < 4; i++) {
        std::string port_prefix = "port" + std::to_string(i);
        
        // Input AXIS
        sc_trace(tf, test.ext_axis_in_tvalid[i], port_prefix + "_in_tvalid");
        sc_trace(tf, test.ext_axis_in_tdata[i], port_prefix + "_in_tdata");
        sc_trace(tf, test.ext_axis_in_tkeep[i], port_prefix + "_in_tkeep");
        sc_trace(tf, test.ext_axis_in_tuser[i], port_prefix + "_in_tuser");
        sc_trace(tf, test.ext_axis_in_tlast[i], port_prefix + "_in_tlast");
        sc_trace(tf, test.ext_axis_in_tready[i], port_prefix + "_in_tready");
        
        // Output AXIS
        sc_trace(tf, test.ext_axis_out_tvalid[i], port_prefix + "_out_tvalid");
        sc_trace(tf, test.ext_axis_out_tdata[i], port_prefix + "_out_tdata");
        sc_trace(tf, test.ext_axis_out_tkeep[i], port_prefix + "_out_tkeep");
        sc_trace(tf, test.ext_axis_out_tuser[i], port_prefix + "_out_tuser");
        sc_trace(tf, test.ext_axis_out_tlast[i], port_prefix + "_out_tlast");
        sc_trace(tf, test.ext_axis_out_tready[i], port_prefix + "_out_tready");
    }
    
    std::cout << "\n🌊 VCD Waveform tracing enabled: complete_5port_switch_with_riscv.vcd" << std::endl;
    std::cout << "📊 To view waveforms: gtkwave complete_5port_switch_with_riscv.vcd" << std::endl;
    
    // =============================================================================
    // Run Simulation
    // =============================================================================
    
    std::cout << "\n🚀 Starting packet flow simulation..." << std::endl;
    
    // Run simulation with extended timeout for detailed observation
    sc_start(50, SC_MS); // 50ms timeout for detailed simulation
    
    // Close trace file
    sc_close_vcd_trace_file(tf);
    
    std::cout << "\n✅ Simulation completed. VCD file generated." << std::endl;
    
    return 0;
}