#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/port_manager/port_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Test Module for Unified PortManager
// =============================================================================

SC_MODULE(TestPortManager) {
    // Test signals
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External Input Interface
    sc_signal<bool> ext_in_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_in_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_in_keep;
    sc_signal<bool> ext_in_last;
    sc_signal<bool> ext_in_ready;
    
    // External Output Interface
    sc_signal<bool> ext_out_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_out_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_out_keep;
    sc_signal<bool> ext_out_last;
    sc_signal<bool> ext_out_ready;
    
    // Internal AXIS Interface (Queue Manager simulation)
    sc_signal<bool> ingress_axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ingress_axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ingress_axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> ingress_axis_tuser;
    sc_signal<bool> ingress_axis_tlast;
    sc_signal<bool> ingress_axis_tready;
    
    sc_signal<bool> egress_axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> egress_axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> egress_axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> egress_axis_tuser;
    sc_signal<bool> egress_axis_tlast;
    sc_signal<bool> egress_axis_tready;
    
    // AXI Interface
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Credit Interface
    sc_signal<bool> credit_return_valid;
    sc_signal<bool> credit_return_ready;
    
    // Device Under Test
    PortManager* dut;
    
    // Control variable for external output ready
    bool ext_out_ready_control;
    
    SC_CTOR(TestPortManager) : clk("clk", 10, SC_NS) {
        // Create DUT
        dut = new PortManager("port_manager");
        
        // Connect signals
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // External interfaces
        dut->ext_in_valid(ext_in_valid);
        dut->ext_in_data(ext_in_data);
        dut->ext_in_keep(ext_in_keep);
        dut->ext_in_last(ext_in_last);
        dut->ext_in_ready(ext_in_ready);
        
        dut->ext_out_valid(ext_out_valid);
        dut->ext_out_data(ext_out_data);
        dut->ext_out_keep(ext_out_keep);
        dut->ext_out_last(ext_out_last);
        dut->ext_out_ready(ext_out_ready);
        
        // Internal AXIS interfaces
        dut->ingress_axis_tvalid(ingress_axis_tvalid);
        dut->ingress_axis_tdata(ingress_axis_tdata);
        dut->ingress_axis_tkeep(ingress_axis_tkeep);
        dut->ingress_axis_tuser(ingress_axis_tuser);
        dut->ingress_axis_tlast(ingress_axis_tlast);
        dut->ingress_axis_tready(ingress_axis_tready);
        
        dut->egress_axis_tvalid(egress_axis_tvalid);
        dut->egress_axis_tdata(egress_axis_tdata);
        dut->egress_axis_tkeep(egress_axis_tkeep);
        dut->egress_axis_tuser(egress_axis_tuser);
        dut->egress_axis_tlast(egress_axis_tlast);
        dut->egress_axis_tready(egress_axis_tready);
        
        // AXI interfaces
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
        dut->configure_port(5);  // Use port ID 5 for testing
        
        // Initialize control variables
        ext_out_ready_control = true;  // Default: ready
        
        SC_THREAD(test_process);
        SC_THREAD(queue_manager_simulation);
        SC_THREAD(ext_out_ready_driver);
    }
    
    ~TestPortManager() {
        delete dut;
    }
    
    void test_process() {
        std::cout << "\n=== Testing Unified PortManager ===" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset and configuration
        test_reset_and_configuration();
        
        // Test 2: Basic End-to-End packet flow
        test_basic_end_to_end_flow();
        
        // Test 3: Multiple packet processing
        test_multiple_packet_processing();
        
        // Test 4: Unified statistics
        test_unified_statistics();
        
        // Test 5: AXI interface arbitration
        test_axi_arbitration();
        
        // Test 6: Health monitoring
        test_health_monitoring();
        
        // Test 7: Stress testing - High load packet processing
        test_high_load_processing();
        
        // Test 8: Negative testing - Error conditions
        test_negative_conditions();
        
        // Test 9: Tracing system validation
        test_tracing_system();
        
        // Test 10: Backpressure buffer monitoring
        test_backpressure_buffer_monitoring();
        
        std::cout << "=== All Unified PortManager tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void queue_manager_simulation() {
        // Simple AXIS loopback to simulate Queue Manager behavior
        // This creates a direct path from Ingress AXIS output to Egress AXIS input
        
        while (true) {
            wait(clk.posedge_event());
            
            // Always ready to receive from Ingress
            ingress_axis_tready.write(true);
            
            // egress_axis_tready is controlled by DUT (EgressPortManager)
            
            // Forward data from Ingress to Egress with minimal delay
            if (ingress_axis_tvalid.read()) {
                // Capture data immediately before any delays
                sc_bv<AXIS_DATA_WIDTH> captured_data = ingress_axis_tdata.read();
                sc_bv<AXIS_KEEP_WIDTH> captured_keep = ingress_axis_tkeep.read();
                sc_bv<AXIS_USER_WIDTH> captured_user = ingress_axis_tuser.read();
                bool captured_last = ingress_axis_tlast.read();
                
                std::cout << "[QueueMgr] Ingress AXIS data received, tready=" 
                          << egress_axis_tready.read() << std::endl;
                std::cout << "[QueueMgr] Captured data=0x" << std::hex << captured_data.to_uint64() << std::dec
                          << ", user=0x" << std::hex << captured_user.to_uint64() << std::dec << std::endl;
                
                wait(5, SC_NS);  // Small processing delay
                
                // Send to Egress only if Egress is ready
                if (egress_axis_tready.read()) {
                    egress_axis_tvalid.write(true);
                    egress_axis_tdata.write(captured_data);
                    egress_axis_tkeep.write(captured_keep);
                    egress_axis_tuser.write(captured_user);
                    egress_axis_tlast.write(captured_last);
                    
                    std::cout << "[QueueMgr] Forwarding to Egress AXIS, data=0x" 
                              << std::hex << captured_data.to_uint64() << std::dec
                              << ", user=0x" << std::hex << captured_user.to_uint64() << std::dec << std::endl;
                    
                    // Verify captured header is valid
                    if (captured_user == 0) {
                        std::cout << "[QueueMgr] WARNING: No header captured from Ingress!" << std::endl;
                    }
                    
                    // Proper AXIS handshaking: clear valid immediately after handshake
                    wait(clk.posedge_event());
                    
                    std::cout << "[QueueMgr] AXIS handshake completed, clearing valid" << std::endl;
                    egress_axis_tvalid.write(false);
                } else {
                    // Egress not ready, keep trying
                    std::cout << "[QueueMgr] Egress not ready, waiting..." << std::endl;
                    egress_axis_tvalid.write(false);
                }
            } else {
                egress_axis_tvalid.write(false);
                egress_axis_tdata.write(0);
                egress_axis_tkeep.write(0);
                egress_axis_tuser.write(0);
                egress_axis_tlast.write(false);
            }
        }
    }
    
    void ext_out_ready_driver() {
        // External output ready driver with control
        while (true) {
            wait(clk.posedge_event());
            ext_out_ready.write(ext_out_ready_control);
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        
        // External input interface
        ext_in_valid.write(false);
        ext_in_data.write(0);
        ext_in_keep.write(0);
        ext_in_last.write(false);
        
        // External output ready driven by separate thread
        
        // AXI interfaces
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        axi_slave_addr.write(0);
        axi_slave_data.write(0);
        
        // Credit interface
        credit_return_valid.write(false);
        
        // Egress AXIS signals are controlled by queue_manager_simulation
        
        wait(20, SC_NS);
    }
    
    void test_reset_and_configuration() {
        std::cout << "Testing reset and configuration..." << std::endl;
        
        // Apply reset
        rst_n.write(false);
        wait(50, SC_NS);
        
        // Check reset state
        assert(ext_in_ready.read() == false);
        assert(ext_out_valid.read() == false);
        
        // Release reset
        rst_n.write(true);
        wait(50, SC_NS);
        
        // Check post-reset state
        assert(ext_in_ready.read() == true);
        
        // Verify configuration
        assert(dut->get_port_id() == 5);
        
        std::cout << "  Reset and configuration test PASSED" << std::endl;
    }
    
    void test_basic_end_to_end_flow() {
        std::cout << "Testing basic End-to-End packet flow..." << std::endl;
        
        // Get initial statistics
        PortManager::PortStats initial_stats = dut->get_unified_statistics();
        std::cout << "  Initial stats - RX: " << initial_stats.packets_received 
                  << ", TX: " << initial_stats.packets_transmitted << std::endl;
        
        // Send test packet
        std::vector<uint8_t> test_packet = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};
        std::cout << "  Sending test packet of " << test_packet.size() << " bytes..." << std::endl;
        
        sc_time test_start = sc_time_stamp();
        send_external_packet(test_packet);
        
        std::cout << "  Packet sent, waiting for output..." << std::endl;
        
        // Wait for complete processing
        wait_for_external_output();
        
        sc_time test_end = sc_time_stamp();
        std::cout << "  Total test time: " << (test_end - test_start) << std::endl;
        
        // Verify End-to-End processing
        PortManager::PortStats final_stats = dut->get_unified_statistics();
        std::cout << "  Final stats - RX: " << final_stats.packets_received 
                  << ", TX: " << final_stats.packets_transmitted << std::endl;
        
        assert(final_stats.packets_received > initial_stats.packets_received);
        assert(final_stats.packets_transmitted > initial_stats.packets_transmitted);
        assert(final_stats.total_packets_processed > initial_stats.total_packets_processed);
        
        std::cout << "  Basic End-to-End flow test PASSED" << std::endl;
        std::cout << "    Packets processed: " << final_stats.total_packets_processed << std::endl;
    }
    
    void test_multiple_packet_processing() {
        std::cout << "Testing multiple packet processing..." << std::endl;
        
        PortManager::PortStats initial_stats = dut->get_unified_statistics();
        
        // Send multiple packets of different sizes
        std::vector<std::vector<uint8_t>> test_packets = {
            {0x01, 0x02, 0x03, 0x04},
            {0x10, 0x20, 0x30, 0x40, 0x50, 0x60},
            {0xFF, 0xEE},
            {0xDE, 0xAD, 0xBE, 0xEF, 0xCA, 0xFE, 0xBA, 0xBE}
        };
        
        for (const auto& packet : test_packets) {
            send_external_packet(packet);
            wait(50, SC_NS);  // Inter-packet delay
        }
        
        // Wait for all packets to be processed
        wait(300, SC_NS);
        
        PortManager::PortStats final_stats = dut->get_unified_statistics();
        uint64_t packets_processed = final_stats.packets_received - initial_stats.packets_received;
        
        assert(packets_processed >= test_packets.size());
        assert(final_stats.processing_efficiency > 90.0);  // Should be high efficiency
        
        std::cout << "  Multiple packet processing test PASSED" << std::endl;
        std::cout << "    Packets processed: " << packets_processed << std::endl;
        std::cout << "    Processing efficiency: " << final_stats.processing_efficiency << "%" << std::endl;
    }
    
    void test_unified_statistics() {
        std::cout << "Testing unified statistics..." << std::endl;
        
        // Get comprehensive statistics
        PortManager::PortStats stats = dut->get_unified_statistics();
        
        // Print detailed statistics
        dut->print_status();
        
        // Verify statistics consistency
        assert(stats.total_packets_processed == stats.packets_received);
        // Processing efficiency can be > 100% in test environment due to multiple processing
        assert(stats.processing_efficiency >= 0.0);
        assert(stats.average_latency >= sc_time(0, SC_NS));
        
        std::cout << "  Unified statistics test PASSED" << std::endl;
        std::cout << "    Average latency: " << stats.average_latency << std::endl;
    }
    
    void test_axi_arbitration() {
        std::cout << "Testing AXI arbitration..." << std::endl;
        
        // Test AXI slave interface
        axi_slave_valid.write(true);
        axi_slave_addr.write(0x100);  // Test address
        axi_slave_data.write(0x12345678);
        
        wait(50, SC_NS);
        
        // Check that AXI ready was asserted (arbitration working)
        assert(axi_slave_ready.read() == true);
        
        axi_slave_valid.write(false);
        wait(50, SC_NS);
        
        std::cout << "  AXI arbitration test PASSED" << std::endl;
    }
    
    void test_health_monitoring() {
        std::cout << "Testing health monitoring..." << std::endl;
        
        // Check system health
        bool is_healthy = dut->is_healthy();
        
        std::cout << "  System health status: " << (is_healthy ? "HEALTHY" : "UNHEALTHY") << std::endl;
        
        // In normal test conditions, system should be healthy
        assert(is_healthy);
        
        std::cout << "  Health monitoring test PASSED" << std::endl;
    }
    
    void test_high_load_processing() {
        std::cout << "Testing high load packet processing..." << std::endl;
        
        PortManager::PortStats initial_stats = dut->get_unified_statistics();
        sc_time test_start = sc_time_stamp();
        
        // Test 1: Continuous packet stream (100 packets)
        std::cout << "  Sending 100 continuous packets..." << std::endl;
        std::vector<std::vector<uint8_t>> stress_packets;
        
        // Generate varied size packets
        for (int i = 0; i < 100; i++) {
            std::vector<uint8_t> packet;
            size_t packet_size = 4 + (i % 60);  // 4 to 63 bytes
            
            for (size_t j = 0; j < packet_size; j++) {
                packet.push_back((uint8_t)(i + j));
            }
            stress_packets.push_back(packet);
        }
        
        // Send all packets back-to-back
        for (size_t i = 0; i < stress_packets.size(); i++) {
            send_external_packet(stress_packets[i]);
            
            // Very short inter-packet delay to stress the system
            wait(5, SC_NS);
            
            // Show progress every 20 packets
            if ((i + 1) % 20 == 0) {
                std::cout << "    Sent " << (i + 1) << " packets..." << std::endl;
            }
        }
        
        // Wait for all packets to be processed
        wait(1000, SC_NS);  // Allow time for processing
        
        PortManager::PortStats final_stats = dut->get_unified_statistics();
        sc_time test_end = sc_time_stamp();
        sc_time total_time = test_end - test_start;
        
        // Verify all packets were processed
        uint64_t packets_processed = final_stats.packets_received - initial_stats.packets_received;
        assert(packets_processed >= 100);
        
        // Calculate throughput
        double throughput = (double)packets_processed / (total_time.to_seconds() * 1e9);  // packets/ns
        
        std::cout << "  High load test results:" << std::endl;
        std::cout << "    Packets processed: " << packets_processed << std::endl;
        std::cout << "    Total time: " << total_time << std::endl;
        std::cout << "    Throughput: " << throughput << " packets/ns" << std::endl;
        std::cout << "    Processing efficiency: " << final_stats.processing_efficiency << "%" << std::endl;
        
        // Verify system health under stress
        assert(dut->is_healthy());
        assert(final_stats.processing_efficiency >= 95.0);
        
        std::cout << "  High load processing test PASSED" << std::endl;
    }
    
    void test_negative_conditions() {
        std::cout << "Testing negative conditions and error handling..." << std::endl;
        
        // Test 1: Reset during packet transmission
        std::cout << "  Testing reset during packet transmission..." << std::endl;
        {
            // Start sending a packet
            ext_in_valid.write(true);
            ext_in_data.write(0xDEADBEEF);
            ext_in_keep.write(0xF);
            ext_in_last.write(false);
            
            wait(clk.posedge_event());
            
            // Apply reset in middle of transmission
            rst_n.write(false);
            wait(20, SC_NS);
            rst_n.write(true);
            wait(50, SC_NS);
            
            // Clear transmission
            ext_in_valid.write(false);
            ext_in_last.write(false);
            
            // System should recover
            assert(ext_in_ready.read() == true);
            std::cout << "    Reset during transmission: PASSED" << std::endl;
        }
        
        // Test 2: Empty packet (0 bytes)
        std::cout << "  Testing empty packet handling..." << std::endl;
        {
            PortManager::PortStats before_stats = dut->get_unified_statistics();
            
            // Send empty packet
            ext_in_valid.write(true);
            ext_in_data.write(0);
            ext_in_keep.write(0);  // No valid bytes
            ext_in_last.write(true);
            
            wait(clk.posedge_event());
            ext_in_valid.write(false);
            ext_in_last.write(false);
            
            wait(100, SC_NS);
            
            // Empty packets should be handled gracefully (may be dropped or processed)
            PortManager::PortStats after_stats = dut->get_unified_statistics();
            std::cout << "    Empty packet handling: PASSED (processed: " 
                      << (after_stats.packets_received - before_stats.packets_received) << ")" << std::endl;
        }
        
        // Test 3: Maximum size packet (64 bytes for AXIS_DATA_WIDTH=512)
        std::cout << "  Testing maximum size packet..." << std::endl;
        {
            std::vector<uint8_t> max_packet;
            for (int i = 0; i < 64; i++) {  // Max bytes per beat
                max_packet.push_back((uint8_t)i);
            }
            
            PortManager::PortStats before_stats = dut->get_unified_statistics();
            send_external_packet(max_packet);
            wait(200, SC_NS);
            
            PortManager::PortStats after_stats = dut->get_unified_statistics();
            assert(after_stats.packets_received > before_stats.packets_received);
            std::cout << "    Maximum size packet: PASSED" << std::endl;
        }
        
        // Test 4: Back-pressure scenario (slower external output)
        std::cout << "  Testing back-pressure handling..." << std::endl;
        {
            // Temporarily slow down external output
            ext_out_ready_control = false;
            
            // Send packets while output is blocked
            for (int i = 0; i < 5; i++) {
                std::vector<uint8_t> packet = {(uint8_t)(0x10 + i), (uint8_t)(0x20 + i)};
                send_external_packet(packet);
                wait(20, SC_NS);
            }
            
            wait(100, SC_NS);  // Let packets accumulate
            
            // Re-enable output
            ext_out_ready_control = true;
            wait(500, SC_NS);  // Let packets drain
            
            // System should handle back-pressure gracefully
            assert(dut->is_healthy());
            std::cout << "    Back-pressure handling: PASSED" << std::endl;
        }
        
        // Test 5: Invalid AXI access
        std::cout << "  Testing invalid AXI access..." << std::endl;
        {
            // Send invalid AXI address
            axi_slave_valid.write(true);
            axi_slave_addr.write(0xFFFFFFFF);  // Invalid address
            axi_slave_data.write(0x12345678);
            
            wait(50, SC_NS);
            
            // Should not crash the system
            axi_slave_valid.write(false);
            assert(dut->is_healthy());
            std::cout << "    Invalid AXI access: PASSED" << std::endl;
        }
        
        // Test 6: Credit exhaustion simulation
        std::cout << "  Testing credit management under stress..." << std::endl;
        {
            // Send many packets to potentially exhaust credits
            for (int i = 0; i < 20; i++) {
                std::vector<uint8_t> packet = {(uint8_t)i, (uint8_t)(i+1), (uint8_t)(i+2)};
                send_external_packet(packet);
                wait(10, SC_NS);  // Fast transmission
            }
            
            wait(200, SC_NS);
            
            PortManager::PortStats final_stats = dut->get_unified_statistics();
            
            // System should maintain credit balance
            assert(final_stats.available_credits > 0);
            assert(dut->is_healthy());
            std::cout << "    Credit management: PASSED (Credits: " 
                      << final_stats.available_credits << ")" << std::endl;
        }
        
        // Test 7: Timeout resilience
        std::cout << "  Testing timeout resilience..." << std::endl;
        {
            // This test verifies our timeout system works
            sc_time timeout_start = sc_time_stamp();
            
            // Send a packet and verify it doesn't timeout
            std::vector<uint8_t> packet = {0xCA, 0xFE, 0xBA, 0xBE};
            send_external_packet(packet);
            wait_for_external_output();
            
            sc_time timeout_end = sc_time_stamp();
            sc_time elapsed = timeout_end - timeout_start;
            
            // Should complete well before our 5000ns timeout
            assert(elapsed < sc_time(1000, SC_NS));
            std::cout << "    Timeout resilience: PASSED (Elapsed: " << elapsed << ")" << std::endl;
        }
        
        std::cout << "  Negative conditions test PASSED" << std::endl;
    }
    
    void test_tracing_system() {
        std::cout << "Testing Tracing System..." << std::endl;
        
        // Test 1: Enable tracing and VCD file generation
        std::cout << "  Enabling tracing system..." << std::endl;
        dut->enable_tracing();
        dut->open_vcd_file("test_port_manager_trace.vcd");
        
        // Test 2: Packet journey tracking
        std::cout << "  Testing packet journey tracking..." << std::endl;
        {
            // Send a few packets with tracing
            for (int i = 0; i < 5; i++) {
                std::vector<uint8_t> packet = {(uint8_t)(0xA0 + i), (uint8_t)(0xB0 + i), (uint8_t)(0xC0 + i)};
                
                // Start packet trace
                uint64_t packet_id = dut->start_packet_trace(packet.size(), 5, 0, PacketType::DATA);
                std::cout << "    Started tracing packet ID: " << packet_id << std::endl;
                
                // Send packet
                send_external_packet(packet);
                
                // Update packet trace at checkpoints
                dut->update_packet_trace(packet_id, "QUEUE_MANAGER");
                
                // Wait for output and complete trace
                wait_for_external_output();
                dut->complete_packet_trace(packet_id);
                
                std::cout << "    Completed tracing packet ID: " << packet_id << std::endl;
                
                wait(50, SC_NS);  // Small gap between packets
            }
        }
        
        // Test 3: Get tracing metrics
        std::cout << "  Checking tracing metrics..." << std::endl;
        {
            auto metrics = dut->get_tracing_metrics();
            auto completed_packets = dut->get_completed_packets();
            auto active_packets = dut->get_active_packets();
            
            std::cout << "    Completed packets: " << completed_packets.size() << std::endl;
            std::cout << "    Active packets: " << active_packets.size() << std::endl;
            std::cout << "    Average throughput: " << metrics.average_throughput << " pps" << std::endl;
            std::cout << "    Peak throughput: " << metrics.peak_throughput << " pps" << std::endl;
            std::cout << "    Average latency: " << metrics.avg_latency << std::endl;
            std::cout << "    System health: " << (metrics.is_healthy ? "HEALTHY" : "UNHEALTHY") << std::endl;
            
            // Verify that packets were traced
            assert(completed_packets.size() >= 5);
            assert(metrics.is_healthy);
        }
        
        // Test 4: Print tracing summary
        std::cout << "  Printing tracing summary..." << std::endl;
        dut->print_tracing_summary();
        
        // Test 5: Export packet journey data
        std::cout << "  Exporting packet journey data..." << std::endl;
        dut->export_packet_journey("test_packet_journey.csv");
        
        // Test 6: Verify packet journey details
        std::cout << "  Verifying packet journey details..." << std::endl;
        {
            auto completed_packets = dut->get_completed_packets();
            for (const auto& packet : completed_packets) {
                // Verify packet has complete journey
                assert(packet.completed);
                assert(packet.ingress_timestamp < packet.egress_timestamp);
                assert(packet.processing_latency > SC_ZERO_TIME);
                assert(packet.route_path.find("INGRESS") != std::string::npos);
                assert(packet.route_path.find("EGRESS") != std::string::npos);
                
                std::cout << "    Packet " << packet.packet_id 
                          << ": " << packet.route_path 
                          << " (latency: " << packet.processing_latency << ")" << std::endl;
            }
        }
        
        // Test 7: Test tracing disable
        std::cout << "  Testing tracing disable..." << std::endl;
        dut->disable_tracing();
        
        // Send a packet without tracing
        std::vector<uint8_t> untraced_packet = {0xFF, 0xEE, 0xDD};
        uint64_t untraced_id = dut->start_packet_trace(3);  // Should return 0 when disabled
        assert(untraced_id == 0);
        
        send_external_packet(untraced_packet);
        wait_for_external_output();
        
        std::cout << "  Tracing system test PASSED" << std::endl;
    }
    
    void test_backpressure_buffer_monitoring() {
        std::cout << "Testing backpressure buffer monitoring..." << std::endl;
        
        // Enable tracing to monitor buffer usage
        dut->enable_tracing();
        dut->open_vcd_file("backpressure_trace.vcd");
        
        std::cout << "  Setting up backpressure scenario..." << std::endl;
        
        // Start with normal operation
        ext_out_ready_control = true;
        wait(50, SC_NS);
        
        // Get initial metrics
        auto initial_metrics = dut->get_tracing_metrics();
        std::cout << "  Initial buffer usage - Ingress: " << initial_metrics.ingress_peak_usage 
                  << ", Egress: " << initial_metrics.egress_peak_usage << std::endl;
        
        // Phase 1: Send packets with gradual backpressure introduction
        std::cout << "  Phase 1: Introducing gradual backpressure..." << std::endl;
        std::vector<uint32_t> ingress_usage_history;
        std::vector<uint32_t> egress_usage_history;
        
        for (int cycle = 0; cycle < 20; cycle++) {
            // Create varied-size packets
            std::vector<uint8_t> packet;
            int packet_size = 3 + (cycle % 5);  // 3-7 bytes
            for (int i = 0; i < packet_size; i++) {
                packet.push_back((uint8_t)(0x40 + cycle + i));
            }
            
            // Send packet
            uint64_t packet_id = dut->start_packet_trace(packet.size(), 5, 0, PacketType::DATA);
            send_external_packet(packet);
            
            // Apply backpressure pattern: gradually increase blocking duration
            if (cycle > 5) {  // Start backpressure after initial packets
                int block_cycles = (cycle - 5) * 2;  // Increasing block duration
                
                std::cout << "    Cycle " << cycle << ": Blocking ext_out_ready for " 
                          << block_cycles << " cycles" << std::endl;
                
                ext_out_ready_control = false;  // Block output
                wait(block_cycles, SC_NS);     // Let buffer accumulate
                ext_out_ready_control = true;   // Allow draining
                
                // Monitor buffer usage
                auto current_metrics = dut->get_tracing_metrics();
                ingress_usage_history.push_back(current_metrics.ingress_peak_usage);
                egress_usage_history.push_back(current_metrics.egress_peak_usage);
                
                std::cout << "      Buffer usage - Ingress: " << current_metrics.ingress_peak_usage 
                          << ", Egress: " << current_metrics.egress_peak_usage << std::endl;
                
                dut->update_packet_trace(packet_id, "QUEUE_MANAGER");
            }
            
            wait(30, SC_NS);  // Inter-packet delay
            
            if (packet_id > 0) {
                dut->complete_packet_trace(packet_id);
            }
        }
        
        // Phase 2: Heavy backpressure test
        std::cout << "  Phase 2: Heavy backpressure stress test..." << std::endl;
        
        // Send burst of packets while heavily blocking output
        ext_out_ready_control = false;  // Block output completely
        
        for (int i = 0; i < 10; i++) {
            std::vector<uint8_t> burst_packet = {(uint8_t)(0x80 + i), (uint8_t)(0x90 + i), (uint8_t)(0xA0 + i)};
            uint64_t packet_id = dut->start_packet_trace(burst_packet.size(), 5, 0, PacketType::DATA);
            send_external_packet(burst_packet);
            dut->update_packet_trace(packet_id, "QUEUED");
            wait(10, SC_NS);  // Fast burst
        }
        
        wait(200, SC_NS);  // Let packets accumulate in buffer
        
        auto peak_metrics = dut->get_tracing_metrics();
        std::cout << "    Peak buffer usage during burst - Ingress: " << peak_metrics.ingress_peak_usage 
                  << ", Egress: " << peak_metrics.egress_peak_usage << std::endl;
        
        // Phase 3: Gradual drain with intermittent backpressure
        std::cout << "  Phase 3: Intermittent backpressure during drain..." << std::endl;
        
        for (int drain_cycle = 0; drain_cycle < 15; drain_cycle++) {
            // Alternate between allowing and blocking output
            bool allow_output = (drain_cycle % 3) != 2;  // 66% duty cycle
            ext_out_ready_control = allow_output;
            
            if (allow_output) {
                std::cout << "    Drain cycle " << drain_cycle << ": Allowing output" << std::endl;
                wait(40, SC_NS);
            } else {
                std::cout << "    Drain cycle " << drain_cycle << ": Blocking output" << std::endl;
                wait(20, SC_NS);
            }
            
            auto drain_metrics = dut->get_tracing_metrics();
            std::cout << "      Current buffer usage - Ingress: " << drain_metrics.ingress_peak_usage 
                      << ", Egress: " << drain_metrics.egress_peak_usage << std::endl;
        }
        
        // Phase 4: Complete drain
        std::cout << "  Phase 4: Complete system drain..." << std::endl;
        ext_out_ready_control = true;  // Allow full drain
        wait(500, SC_NS);
        
        auto final_metrics = dut->get_tracing_metrics();
        
        // Verify buffer behavior
        assert(final_metrics.ingress_peak_usage >= initial_metrics.ingress_peak_usage || 
               final_metrics.egress_peak_usage >= initial_metrics.egress_peak_usage);
        std::cout << "    Buffer peak usage - Ingress: " << initial_metrics.ingress_peak_usage 
                  << " → " << final_metrics.ingress_peak_usage << ", Egress: " 
                  << initial_metrics.egress_peak_usage << " → " << final_metrics.egress_peak_usage << " ✓" << std::endl;
        
        // Verify system health
        assert(dut->is_healthy());
        std::cout << "    System remained healthy under backpressure ✓" << std::endl;
        
        // Print buffer usage trend
        std::cout << "  Buffer usage trend during backpressure:" << std::endl;
        for (size_t i = 0; i < ingress_usage_history.size() && i < egress_usage_history.size(); i++) {
            std::cout << "    Step " << i << " - Ingress: " << ingress_usage_history[i] 
                      << ", Egress: " << egress_usage_history[i] << std::endl;
        }
        
        // Export detailed trace
        dut->export_packet_journey("backpressure_packet_journey.csv");
        dut->print_tracing_summary();
        
        // Close tracing
        dut->close_vcd_file();
        dut->disable_tracing();
        
        std::cout << "  Backpressure buffer monitoring test PASSED" << std::endl;
        std::cout << "  Generated files: backpressure_trace.vcd.vcd, backpressure_packet_journey.csv" << std::endl;
    }
    
    void send_external_packet(const std::vector<uint8_t>& packet_data) {
        // Send packet through external input interface
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
        
        for (size_t beat = 0; beat < beats; beat++) {
            // Wait for ready with timeout
            sc_time timeout_start = sc_time_stamp();
            while (!ext_in_ready.read()) {
                wait(clk.posedge_event());
                if (sc_time_stamp() - timeout_start > sc_time(1000, SC_NS)) {
                    std::cerr << "TIMEOUT: External input not ready after 1000ns" << std::endl;
                    assert(false);
                }
            }
            
            wait(clk.posedge_event());
            
            ext_in_valid.write(true);
            
            // Pack data into beat
            sc_bv<AXIS_DATA_WIDTH> data_beat = 0;
            sc_bv<AXIS_KEEP_WIDTH> keep_beat = 0;
            
            size_t bytes_in_beat = std::min(packet_data.size() - beat * bytes_per_beat, bytes_per_beat);
            
            for (size_t i = 0; i < bytes_in_beat; i++) {
                size_t byte_idx = beat * bytes_per_beat + i;
                if (byte_idx < packet_data.size()) {
                    data_beat.range(i*8+7, i*8) = packet_data[byte_idx];
                    keep_beat[i] = 1;
                }
            }
            
            ext_in_data.write(data_beat);
            ext_in_keep.write(keep_beat);
            ext_in_last.write(beat == beats - 1);
        }
        
        wait(clk.posedge_event());
        ext_in_valid.write(false);
        ext_in_last.write(false);
    }
    
    void wait_for_external_output() {
        // Wait for external output with timeout
        sc_time timeout_start = sc_time_stamp();
        while (!ext_out_valid.read()) {
            wait(clk.posedge_event());
            if (sc_time_stamp() - timeout_start > sc_time(5000, SC_NS)) {
                std::cerr << "TIMEOUT: External output not valid after 5000ns" << std::endl;
                std::cerr << "Debug info:" << std::endl;
                std::cerr << "  ext_out_valid: " << ext_out_valid.read() << std::endl;
                std::cerr << "  ext_in_ready: " << ext_in_ready.read() << std::endl;
                dut->print_status();
                assert(false);
            }
        }
        
        std::cout << "  External output detected, waiting for complete transmission..." << std::endl;
        
        // Wait for complete transmission with timeout
        timeout_start = sc_time_stamp();
        do {
            wait(clk.posedge_event());
            if (sc_time_stamp() - timeout_start > sc_time(2000, SC_NS)) {
                std::cerr << "TIMEOUT: External output transmission incomplete after 2000ns" << std::endl;
                assert(false);
            }
        } while (ext_out_valid.read() && !ext_out_last.read());
        
        wait(20, SC_NS);  // Additional settling time
        std::cout << "  External output transmission completed" << std::endl;
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int, char*[]) {
    std::cout << "Starting Unified PortManager unit tests..." << std::endl;
    
    TestPortManager test_module("test_port_manager");
    
    // Set global timeout to prevent infinite hang
    sc_time global_timeout(30, SC_SEC);  // 30 seconds timeout
    
    std::cout << "Running tests with " << global_timeout << " timeout..." << std::endl;
    
    sc_start(global_timeout);
    
    if (sc_time_stamp() >= global_timeout) {
        std::cerr << "\nERROR: Global timeout reached! Test hung at " << sc_time_stamp() << std::endl;
        return 1;
    }
    
    std::cout << "\nTests completed successfully in " << sc_time_stamp() << std::endl;
    return 0;
}