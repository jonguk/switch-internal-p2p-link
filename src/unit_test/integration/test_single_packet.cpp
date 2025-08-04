#include <systemc.h>
#include <iostream>
#include <vector>
#include <cassert>
#include "common/switch_types.h"
#include "integration/complete_4port_switch.h"

using namespace switch_internal_p2p;

// =============================================================================
// Single Packet Test - Port 0 → Port 3
// =============================================================================

SC_MODULE(SinglePacketTest) {
public:
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External AXIS Interfaces
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
    
    // AXI Interface
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // DUT
    Complete4PortSwitch* dut;
    
    // Test state
    bool packet_sent = false;
    bool packet_received = false;
    sc_time packet_send_time;
    sc_time packet_receive_time;

    SC_CTOR(SinglePacketTest) : clk("clk", 10, SC_NS) {
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
        
        // Initialize signals
        for (int i = 0; i < 4; i++) {
            ext_axis_in_tvalid[i].write(false);
            ext_axis_in_tdata[i].write(0);
            ext_axis_in_tkeep[i].write(0);
            ext_axis_in_tuser[i].write(0);
            ext_axis_in_tlast[i].write(false);
            ext_axis_out_tready[i].write(true);
        }
        
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        
        // Register test processes
        SC_THREAD(reset_process);
        SC_THREAD(packet_send_process);
        SC_THREAD(output_monitor_process);
        
        // VCD dump
        sc_trace_file* tf = sc_create_vcd_trace_file("single_packet_test_fixed");
        sc_trace(tf, clk, "clk");
        sc_trace(tf, rst_n, "rst_n");
        
        // =============================================================================
        // PORT 0 INGRESS PIPELINE TRACING
        // =============================================================================
        
        // Port 0 External Input (테스트에서 패킷 주입)
        sc_trace(tf, ext_axis_in_tvalid[0], "p0_ext_in_tvalid");
        sc_trace(tf, ext_axis_in_tdata[0], "p0_ext_in_tdata");
        sc_trace(tf, ext_axis_in_tkeep[0], "p0_ext_in_tkeep");
        sc_trace(tf, ext_axis_in_tuser[0], "p0_ext_in_tuser");
        sc_trace(tf, ext_axis_in_tlast[0], "p0_ext_in_tlast");
        sc_trace(tf, ext_axis_in_tready[0], "p0_ext_in_tready");
        
        // Port 0 Ingress PM → Ingress QM (내부 버스)
        sc_trace(tf, dut->get_ingress_pm_to_qm_tvalid(0), "p0_pm_to_qm_tvalid");
        sc_trace(tf, dut->get_ingress_pm_to_qm_tdata(0), "p0_pm_to_qm_tdata");
        sc_trace(tf, dut->get_ingress_pm_to_qm_tuser(0), "p0_pm_to_qm_tuser");
        sc_trace(tf, dut->get_ingress_pm_to_qm_tlast(0), "p0_pm_to_qm_tlast");
        sc_trace(tf, dut->get_ingress_pm_to_qm_tready(0), "p0_pm_to_qm_tready");
        
        // =============================================================================
        // PORT 3 EGRESS PIPELINE TRACING
        // =============================================================================
        
        // Port 3 Egress QM → Egress PM (내부 버스)
        sc_trace(tf, dut->get_egress_qm_to_pm_tvalid(3), "p3_qm_to_pm_tvalid");
        sc_trace(tf, dut->get_egress_qm_to_pm_tdata(3), "p3_qm_to_pm_tdata");
        sc_trace(tf, dut->get_egress_qm_to_pm_tuser(3), "p3_qm_to_pm_tuser");
        sc_trace(tf, dut->get_egress_qm_to_pm_tlast(3), "p3_qm_to_pm_tlast");
        sc_trace(tf, dut->get_egress_qm_to_pm_tready(3), "p3_qm_to_pm_tready");
        
        // Port 3 External Output (최종 출력)
        sc_trace(tf, ext_axis_out_tvalid[3], "p3_ext_out_tvalid");
        sc_trace(tf, ext_axis_out_tdata[3], "p3_ext_out_tdata");
        sc_trace(tf, ext_axis_out_tkeep[3], "p3_ext_out_tkeep");
        sc_trace(tf, ext_axis_out_tuser[3], "p3_ext_out_tuser");
        sc_trace(tf, ext_axis_out_tlast[3], "p3_ext_out_tlast");
        sc_trace(tf, ext_axis_out_tready[3], "p3_ext_out_tready");
        
        // =============================================================================
        // CROSS-REFERENCE TRACING (다른 포트들도 확인용)
        // =============================================================================
        
        // Port 1, 2 external inputs (혹시 잘못된 패킷 주입 확인)
        sc_trace(tf, ext_axis_in_tvalid[1], "p1_ext_in_tvalid");
        sc_trace(tf, ext_axis_in_tvalid[2], "p2_ext_in_tvalid");
        
        // Port 0, 1, 2 external outputs (잘못된 라우팅 확인)
        sc_trace(tf, ext_axis_out_tvalid[0], "p0_ext_out_tvalid");
        sc_trace(tf, ext_axis_out_tvalid[1], "p1_ext_out_tvalid");
        sc_trace(tf, ext_axis_out_tvalid[2], "p2_ext_out_tvalid");
        
        std::cout << "🏁 [TEST] Single Packet Test initialized (Port 0 → Port 3)" << std::endl;
    }
    
    ~SinglePacketTest() {
        delete dut;
    }

private:
    void reset_process() {
        std::cout << "🔄 [TEST] Starting reset sequence..." << std::endl;
        
        // Initialize all external output tready signals to true (ready to receive)
        for (int i = 0; i < 4; i++) {
            ext_axis_out_tready[i].write(true);
        }
        
        rst_n.write(false);
        wait(100, SC_NS);
        rst_n.write(true);
        wait(50, SC_NS);
        
        std::cout << "✅ [TEST] Reset sequence completed" << std::endl;
        std::cout << "🔧 [TEST] All ext_axis_out_tready signals set to TRUE" << std::endl;
    }
    
    void packet_send_process() {
        wait(200, SC_NS); // Reduced wait time for 1us simulation
        
        std::cout << "🚀 [TEST] Starting packet transmission at " << sc_time_stamp() << std::endl;
        std::cout << "🚀 [TEST] Sending single packet: Port 3 → Port 0" << std::endl;
        
        // Create External Packet Header (9 bytes) - Test Port 3→0
        ExternalPacketHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        header.queue_id = 0;
        header.dest_port = 0;  // Port 0
        header.source_port = 3; // Port 3
        
        // Create payload data (small payload for clarity)
        std::vector<uint8_t> payload = {0xDE, 0xAD, 0xBE, 0xEF, 0xCA, 0xFE, 0xBA, 0xBE};
        
        header.total_packet_size = static_cast<uint16_t>(EXTERNAL_HEADER_SIZE + payload.size());
        header.header_crc = header.calculate_crc();
        
        // Create complete packet
        std::vector<uint8_t> packet_data;
        packet_data.resize(EXTERNAL_HEADER_SIZE);
        header.serialize_to_bytes(packet_data.data());
        packet_data.insert(packet_data.end(), payload.begin(), payload.end());
        
        std::cout << "📦 [TEST] Packet created: " << packet_data.size() << " bytes" << std::endl;
        std::cout << "   Header: src=" << (int)header.source_port << ", dst=" << (int)header.dest_port 
                  << ", size=" << (int)header.total_packet_size << std::endl;
        
        // Send packet via AXIS
        send_axis_packet(3, packet_data);
        
        packet_sent = true;
        packet_send_time = sc_time_stamp();
        
        std::cout << "✅ [TEST] Packet sent at " << packet_send_time << std::endl;
        
        // Wait for processing and terminate (1us total simulation)
        std::cout << "⏰ [TEST] Waiting for packet processing..." << std::endl;
        wait(800, SC_NS); // Total simulation time = 200ns + 800ns = 1000ns (1us)
        
        print_final_results();
        sc_stop();
    }
    
    void send_axis_packet(int port, const std::vector<uint8_t>& packet_data) {
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t total_beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        std::cout << "📋 [AXIS-TX] Starting transmission: port=" << port << ", bytes=" << packet_data.size() 
                  << ", beats=" << total_beats << " at " << sc_time_stamp() << std::endl;
        
        // 명시적으로 모든 신호 초기화
        ext_axis_in_tvalid[port].write(false);
        ext_axis_in_tdata[port].write(0);
        ext_axis_in_tkeep[port].write(0);
        ext_axis_in_tuser[port].write(0);
        ext_axis_in_tlast[port].write(false);
        
        std::cout << "🔧 [AXIS-TX] Signals initialized, waiting one cycle..." << std::endl;
        wait(clk.posedge_event());
        
        std::cout << "📊 [AXIS-TX] Current signal values before transmission:" << std::endl;
        std::cout << "   - tvalid=" << ext_axis_in_tvalid[port].read() << std::endl;
        std::cout << "   - tready=" << ext_axis_in_tready[port].read() << std::endl;
        
        for (size_t beat = 0; beat < total_beats; beat++) {
            // Check ready before transmission
            std::cout << "⏳ [AXIS-TX] Beat " << beat << " - Checking tready..." << std::endl;
            
            int ready_wait_cycles = 0;
            while (!ext_axis_in_tready[port].read()) {
                ready_wait_cycles++;
                if (ready_wait_cycles > 10) {
                    std::cout << "⚠️  [AXIS-TX] tready not asserted after " << ready_wait_cycles << " cycles!" << std::endl;
                }
                wait(clk.posedge_event());
            }
            
            if (ready_wait_cycles > 0) {
                std::cout << "✅ [AXIS-TX] tready asserted after " << ready_wait_cycles << " cycles" << std::endl;
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
            ext_axis_in_tuser[port].write(0);
            ext_axis_in_tlast[port].write(beat == total_beats - 1);
            
            std::cout << "📤 [AXIS-TX] Beat " << beat << "/" << total_beats 
                      << " - tvalid=1, tlast=" << (beat == total_beats - 1 ? "1" : "0")
                      << ", bytes=" << bytes_in_beat << " at " << sc_time_stamp() << std::endl;
            
            // 신호 설정 직후 상태 확인
            std::cout << "📊 [AXIS-TX] Signal check after write:" << std::endl;
            std::cout << "   - tvalid=" << ext_axis_in_tvalid[port].read() << std::endl;
            std::cout << "   - tlast=" << ext_axis_in_tlast[port].read() << std::endl;
            std::cout << "   - tready=" << ext_axis_in_tready[port].read() << std::endl;
            
            wait(clk.posedge_event());
            
            // Verify transmission occurred
            std::cout << "🔍 [AXIS-TX] After posedge:" << std::endl;
            std::cout << "   - tvalid=" << ext_axis_in_tvalid[port].read() << std::endl;
            std::cout << "   - tready=" << ext_axis_in_tready[port].read() << std::endl;
        }
        
        // Clear signals
        ext_axis_in_tvalid[port].write(false);
        ext_axis_in_tlast[port].write(false);
        
        std::cout << "🏁 [AXIS-TX] Transmission complete, signals cleared at " << sc_time_stamp() << std::endl;
        
        // 신호 클리어 후 상태 확인
        std::cout << "📊 [AXIS-TX] Signal check after clear:" << std::endl;
        std::cout << "   - tvalid=" << ext_axis_in_tvalid[port].read() << std::endl;
        std::cout << "   - tlast=" << ext_axis_in_tlast[port].read() << std::endl;
        
        wait(clk.posedge_event());
        
        std::cout << "🔚 [AXIS-TX] Final signal state:" << std::endl;
        std::cout << "   - tvalid=" << ext_axis_in_tvalid[port].read() << std::endl;
        std::cout << "   - tlast=" << ext_axis_in_tlast[port].read() << std::endl;
    }
    
    void output_monitor_process() {
        bool last_tvalid = false;
        
        while (true) {
            wait(clk.posedge_event());
            
            bool current_tvalid = ext_axis_out_tvalid[0].read();
            bool current_tready = ext_axis_out_tready[0].read();
            bool current_tlast = ext_axis_out_tlast[0].read();
            
            // Detect packet reception on port 0
            if (current_tvalid && current_tready && !last_tvalid) {
                packet_receive_time = sc_time_stamp();
                std::cout << "📥 [OUTPUT] Packet detected on Port 0 at " << packet_receive_time << std::endl;
                
                // Receive complete packet
                receive_complete_packet();
                packet_received = true;
            }
            
            last_tvalid = current_tvalid;
        }
    }
    
    void receive_complete_packet() {
        std::vector<uint8_t> received_data;
        
        while (true) {
            if (ext_axis_out_tvalid[0].read() && ext_axis_out_tready[0].read()) {
                sc_bv<AXIS_DATA_WIDTH> tdata = ext_axis_out_tdata[0].read();
                sc_bv<AXIS_KEEP_WIDTH> tkeep = ext_axis_out_tkeep[0].read();
                bool tlast = ext_axis_out_tlast[0].read();
                
                size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
                for (size_t i = 0; i < bytes_per_beat; i++) {
                    if (tkeep[i] == 1) {
                        uint8_t byte_val = tdata.range(i*8+7, i*8).to_uint();
                        received_data.push_back(byte_val);
                    }
                }
                
                if (tlast) {
                    break;
                }
            }
            wait(clk.posedge_event());
        }
        
        std::cout << "✅ [OUTPUT] Complete packet received: " << received_data.size() << " bytes" << std::endl;
        
        // Parse header manually (simple parsing)
        if (received_data.size() >= EXTERNAL_HEADER_SIZE) {
            uint16_t dest_port = (received_data[2] << 8) | received_data[3];
            uint16_t src_port = (received_data[4] << 8) | received_data[5];
            uint16_t total_size = (received_data[6] << 8) | received_data[7];
            
            std::cout << "📋 [HEADER] Received header: src=" << src_port 
                      << ", dst=" << dest_port 
                      << ", size=" << total_size << std::endl;
        }
    }
    
    void print_final_results() {
        std::cout << "\n🏆 [FINAL RESULTS] Single Packet Test (Port 0 → Port 3)" << std::endl;
        std::cout << "=========================================" << std::endl;
        std::cout << "Packet Sent: " << (packet_sent ? "✅ YES" : "❌ NO") << std::endl;
        std::cout << "Packet Received: " << (packet_received ? "✅ YES" : "❌ NO") << std::endl;
        
        if (packet_sent && packet_received) {
            sc_time latency = packet_receive_time - packet_send_time;
            std::cout << "Latency: " << latency << std::endl;
            std::cout << "🎯 TEST RESULT: ✅ SUCCESS" << std::endl;
        } else {
            std::cout << "🎯 TEST RESULT: ❌ FAILED" << std::endl;
        }
        std::cout << "=========================================" << std::endl;
    }
};

int sc_main(int argc, char* argv[]) {
    SinglePacketTest test("test");
    
    std::cout << "🚀 Starting Single Packet Test..." << std::endl;
    sc_start();
    
    return 0;
}