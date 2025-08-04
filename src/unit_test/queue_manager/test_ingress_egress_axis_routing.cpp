#include <systemc.h>
#include <iostream>
#include <vector>
#include <cassert>
#include "common/switch_types.h"
#include "queue_manager/ingress_queue_manager.h"
#include "queue_manager/egress_queue_manager.h"

using namespace switch_internal_p2p;

class TestIngressEgressAxisRouting : public sc_module {
public:
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // DUT instances
    IngressQueueManager* ingress_mgr;
    EgressQueueManager* egress_mgr;
    
    // External AXIS Interface (to Ingress Port Manager)
    sc_signal<bool> ext_axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> ext_axis_tuser;
    sc_signal<bool> ext_axis_tlast;
    sc_signal<bool> ext_axis_tready;
    
    // Internal AXIS Interface (Ingress → Egress)
    sc_signal<bool> internal_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> internal_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> internal_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> internal_tuser;
    sc_signal<sc_bv<AXIS_DEST_WIDTH>> internal_tdest;
    sc_signal<bool> internal_tlast;
    sc_signal<bool> internal_tready;
    
    // Output AXIS Interface (from Egress Port Manager)
    sc_signal<bool> out_axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> out_axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> out_axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> out_axis_tuser;
    sc_signal<bool> out_axis_tlast;
    sc_signal<bool> out_axis_tready;
    
    // AXI Interfaces (dummy for this test)
    sc_signal<bool> axi_master_valid_ingress, axi_master_valid_egress;
    sc_signal<sc_bv<32>> axi_master_addr_ingress, axi_master_addr_egress;
    sc_signal<sc_bv<32>> axi_master_data_ingress, axi_master_data_egress;
    sc_signal<bool> axi_master_ready_ingress, axi_master_ready_egress;
    sc_signal<bool> axi_slave_valid_ingress, axi_slave_valid_egress;
    sc_signal<sc_bv<32>> axi_slave_addr_ingress, axi_slave_addr_egress;
    sc_signal<sc_bv<32>> axi_slave_data_ingress, axi_slave_data_egress;
    sc_signal<bool> axi_slave_ready_ingress, axi_slave_ready_egress;
    
    // Credit interfaces (dummy for this test)
    sc_signal<bool> credit_return_valid;
    sc_signal<CreditInfo> credit_return_info;
    sc_signal<bool> credit_return_ready;

    SC_CTOR(TestIngressEgressAxisRouting) : clk("clk", 10, SC_NS), rst_n("rst_n") {
        // Create DUT instances
        ingress_mgr = new IngressQueueManager("ingress_mgr");
        egress_mgr = new EgressQueueManager("egress_mgr");
        
        // Connect Ingress Queue Manager
        ingress_mgr->clk(clk);
        ingress_mgr->rst_n(rst_n);
        
        // External AXIS input (from Ingress Port Manager)
        ingress_mgr->axis_tvalid(ext_axis_tvalid);
        ingress_mgr->axis_tdata(ext_axis_tdata);
        ingress_mgr->axis_tkeep(ext_axis_tkeep);
        ingress_mgr->axis_tuser(ext_axis_tuser);
        ingress_mgr->axis_tlast(ext_axis_tlast);
        ingress_mgr->axis_tready(ext_axis_tready);
        
        // Internal AXIS output (to Egress Queue Manager)
        ingress_mgr->internal_tvalid(internal_tvalid);
        ingress_mgr->internal_tdata(internal_tdata);
        ingress_mgr->internal_tkeep(internal_tkeep);
        ingress_mgr->internal_tuser(internal_tuser);
        ingress_mgr->internal_tdest(internal_tdest);
        ingress_mgr->internal_tlast(internal_tlast);
        ingress_mgr->internal_tready(internal_tready);
        
        // AXI interfaces for Ingress
        ingress_mgr->axi_master_valid(axi_master_valid_ingress);
        ingress_mgr->axi_master_addr(axi_master_addr_ingress);
        ingress_mgr->axi_master_data(axi_master_data_ingress);
        ingress_mgr->axi_master_ready(axi_master_ready_ingress);
        ingress_mgr->axi_slave_valid(axi_slave_valid_ingress);
        ingress_mgr->axi_slave_addr(axi_slave_addr_ingress);
        ingress_mgr->axi_slave_data(axi_slave_data_ingress);
        ingress_mgr->axi_slave_ready(axi_slave_ready_ingress);
        
        // Connect Egress Queue Manager
        egress_mgr->clk(clk);
        egress_mgr->rst_n(rst_n);
        
        // Internal AXIS input (from Ingress Queue Manager) - SAME SIGNALS!
        egress_mgr->internal_tvalid(internal_tvalid);
        egress_mgr->internal_tdata(internal_tdata);
        egress_mgr->internal_tkeep(internal_tkeep);
        egress_mgr->internal_tuser(internal_tuser);
        egress_mgr->internal_tdest(internal_tdest);
        egress_mgr->internal_tlast(internal_tlast);
        egress_mgr->internal_tready(internal_tready);
        
        // Output AXIS (to Egress Port Manager)
        egress_mgr->axis_tvalid(out_axis_tvalid);
        egress_mgr->axis_tdata(out_axis_tdata);
        egress_mgr->axis_tkeep(out_axis_tkeep);
        egress_mgr->axis_tuser(out_axis_tuser);
        egress_mgr->axis_tlast(out_axis_tlast);
        egress_mgr->axis_tready(out_axis_tready);
        
        // AXI interfaces for Egress
        egress_mgr->axi_master_valid(axi_master_valid_egress);
        egress_mgr->axi_master_addr(axi_master_addr_egress);
        egress_mgr->axi_master_data(axi_master_data_egress);
        egress_mgr->axi_master_ready(axi_master_ready_egress);
        egress_mgr->axi_slave_valid(axi_slave_valid_egress);
        egress_mgr->axi_slave_addr(axi_slave_addr_egress);
        egress_mgr->axi_slave_data(axi_slave_data_egress);
        egress_mgr->axi_slave_ready(axi_slave_ready_egress);
        
        // Credit return interface for Egress
        egress_mgr->credit_return_valid(credit_return_valid);
        egress_mgr->credit_return_info(credit_return_info);
        egress_mgr->credit_return_ready(credit_return_ready);
        
        // Configure DUTs
        ingress_mgr->set_port_id(1);
        egress_mgr->set_port_id(2);
        
        // Start test processes
        SC_THREAD(test_process);
        SC_THREAD(output_axis_ready_driver);
    }
    
    ~TestIngressEgressAxisRouting() {
        delete ingress_mgr;
        delete egress_mgr;
    }
    
    void test_process() {
        initialize_signals();
        setup_global_port_mappings();
        
        std::cout << "\n=== Ingress-Egress AXIS Routing Test ===" << std::endl;
        
        test_global_to_local_routing();
        test_tdest_based_queuing();
        test_tuser_header_preservation();
        test_multi_beat_packets();
        
        std::cout << "\n=== All AXIS routing tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void output_axis_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            out_axis_tready.write(true);  // Always ready to receive output
        }
    }

private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        // Reset system
        rst_n.write(false);
        ext_axis_tvalid.write(false);
        ext_axis_tlast.write(false);
        
        // Initialize AXI signals
        axi_master_ready_ingress.write(true);
        axi_master_ready_egress.write(true);
        axi_slave_valid_ingress.write(false);
        axi_slave_valid_egress.write(false);
        credit_return_ready.write(true);
        
        wait(100, SC_NS);
        
        // Release reset
        rst_n.write(true);
        wait(50, SC_NS);
        
        std::cout << "Signal initialization complete" << std::endl;
    }
    
    void setup_global_port_mappings() {
        std::cout << "\n--- Setting up Global Port Mappings ---" << std::endl;
        
        // Setup some test mappings via AXI
        // Global Port 1000 → Local Port 3
        send_axi_write_to_ingress(0x88, (1000 << 16) | 3);
        wait(50, SC_NS);
        
        // Global Port 2000 → Local Port 5
        send_axi_write_to_ingress(0x88, (2000 << 16) | 5);
        wait(50, SC_NS);
        
        // Global Port 3000 → Local Port 7
        send_axi_write_to_ingress(0x88, (3000 << 16) | 7);
        wait(50, SC_NS);
        
        std::cout << "✅ Global port mappings configured" << std::endl;
    }
    
    void send_axi_write_to_ingress(uint32_t addr, uint32_t data) {
        axi_slave_valid_ingress.write(true);
        axi_slave_addr_ingress.write(addr);
        axi_slave_data_ingress.write(data);
        wait(clk.posedge_event());
        axi_slave_valid_ingress.write(false);
    }
    
    void test_global_to_local_routing() {
        std::cout << "\n--- Test 1: Global → Local Port Routing ---" << std::endl;
        
        // Create test packet with Global Port 1000 (should map to Local Port 3)
        ExternalPacketHeader ext_header;
        ext_header.channel_type = 1;
        ext_header.queue_id = 2;
        ext_header.dest_port = 1000;    // Global Port 1000
        ext_header.source_port = 500;   // Global Port 500
        ext_header.total_packet_size = 12;  // 9 header + 3 payload
        ext_header.header_crc = ext_header.calculate_crc();
        
        // Create internal header and packet data
        InternalHeader internal_header(ext_header);
        std::vector<uint8_t> packet_data;
        
        // Serialize header
        uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        
        // Add payload
        packet_data.push_back(0xAA);
        packet_data.push_back(0xBB);
        packet_data.push_back(0xCC);
        
        std::cout << "  📤 Sending packet: Global Port 1000 → Expected Local Port 3" << std::endl;
        
        // Send via external AXIS interface
        send_axis_packet(packet_data, internal_header);
        
        // Wait and verify internal AXIS signals
        wait_for_internal_transmission();
        
        if (internal_tvalid.read()) {
            sc_bv<AXIS_DEST_WIDTH> received_tdest = internal_tdest.read();
            uint8_t local_dest = received_tdest.range(7, 0).to_uint();
            
            std::cout << "  ✅ Internal AXIS tdest: " << (int)local_dest << std::endl;
            assert(local_dest == 3);  // Should be mapped to local port 3
            
            std::cout << "  ✅ Global→Local routing test PASSED" << std::endl;
        } else {
            std::cout << "  ❌ No internal AXIS transmission detected!" << std::endl;
            assert(false);
        }
    }
    
    void test_tdest_based_queuing() {
        std::cout << "\n--- Test 2: tdest-based Queuing ---" << std::endl;
        
        // Test multiple packets with different tdest values
        struct TestCase {
            uint16_t global_port;
            uint8_t expected_local_port;
            std::string description;
        };
        
        TestCase test_cases[] = {
            {2000, 5, "Global Port 2000 → Local Port 5"},
            {3000, 7, "Global Port 3000 → Local Port 7"},
            {1000, 3, "Global Port 1000 → Local Port 3"}
        };
        
        for (const auto& test_case : test_cases) {
            std::cout << "  📤 Testing: " << test_case.description << std::endl;
            
            ExternalPacketHeader ext_header;
            ext_header.channel_type = 0;
            ext_header.queue_id = 1;
            ext_header.dest_port = test_case.global_port;
            ext_header.source_port = 100;
            ext_header.total_packet_size = 10;  // 9 header + 1 payload
            ext_header.header_crc = ext_header.calculate_crc();
            
            InternalHeader internal_header(ext_header);
            std::vector<uint8_t> packet_data;
            
            uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
            ext_header.serialize_to_bytes(header_bytes);
            for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
                packet_data.push_back(header_bytes[i]);
            }
            packet_data.push_back(0xFF);  // Single payload byte
            
            send_axis_packet(packet_data, internal_header);
            wait_for_internal_transmission();
            
            if (internal_tvalid.read()) {
                uint8_t received_tdest = internal_tdest.read().range(7, 0).to_uint();
                std::cout << "    ✅ Received tdest: " << (int)received_tdest
                          << " (expected: " << (int)test_case.expected_local_port << ")" << std::endl;
                assert(received_tdest == test_case.expected_local_port);
            }
            
            wait(50, SC_NS);  // Allow processing time
        }
        
        std::cout << "  ✅ tdest-based queuing test PASSED" << std::endl;
    }
    
    void test_tuser_header_preservation() {
        std::cout << "\n--- Test 3: tuser Header Preservation ---" << std::endl;
        
        ExternalPacketHeader ext_header;
        ext_header.channel_type = 2;
        ext_header.queue_id = 4;
        ext_header.dest_port = 2000;    // Will map to local port 5
        ext_header.source_port = 1500;
        ext_header.total_packet_size = 15;  // 9 header + 6 payload
        ext_header.header_crc = ext_header.calculate_crc();
        
        InternalHeader internal_header(ext_header);
        std::vector<uint8_t> packet_data;
        
        uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        // Add 6-byte payload
        for (int i = 0; i < 6; i++) {
            packet_data.push_back(0x10 + i);
        }
        
        std::cout << "  📤 Sending packet with header info for tuser verification" << std::endl;
        
        send_axis_packet(packet_data, internal_header);
        wait_for_internal_transmission();
        
        if (internal_tvalid.read()) {
            // Decode tuser information
            sc_bv<AXIS_USER_WIDTH> received_tuser = internal_tuser.read();
            InternalHeader decoded_header = InternalHeader::from_sc_bv(received_tuser);
            
            std::cout << "    📥 Decoded tuser header:" << std::endl;
            std::cout << "      Queue ID: " << (int)decoded_header.queue_id << " (expected: 4)" << std::endl;
            std::cout << "      Dest Port: " << (int)decoded_header.dest_port << " (expected: 5 - mapped)" << std::endl;
            std::cout << "      Source Port: " << (int)decoded_header.source_port << " (expected: 1500)" << std::endl;
            std::cout << "      Packet Length: " << (int)decoded_header.packet_length << " (expected: 15)" << std::endl;
            
            // Note: dest_port in tuser should be the LOCAL port after mapping
            assert(decoded_header.queue_id == 4);
            assert(decoded_header.dest_port == 5);  // Mapped to local port 5
            assert(decoded_header.source_port == 1500);
            assert(decoded_header.packet_length == 15);
            
            std::cout << "    ✅ tuser header preservation test PASSED" << std::endl;
        } else {
            std::cout << "    ❌ No internal AXIS transmission detected!" << std::endl;
            assert(false);
        }
    }
    
    void test_multi_beat_packets() {
        std::cout << "\n--- Test 4: Multi-beat Packet Processing ---" << std::endl;
        
        // Create a large packet that requires multiple beats (>64 bytes)
        ExternalPacketHeader ext_header;
        ext_header.channel_type = 1;
        ext_header.queue_id = 3;
        ext_header.dest_port = 3000;    // Will map to local port 7
        ext_header.source_port = 2500;
        ext_header.total_packet_size = 100;  // 9 header + 91 payload = 100 bytes
        ext_header.header_crc = ext_header.calculate_crc();
        
        InternalHeader internal_header(ext_header);
        std::vector<uint8_t> packet_data;
        
        uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
        ext_header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        
        // Add 91 bytes of payload (total packet = 100 bytes)
        for (int i = 0; i < 91; i++) {
            packet_data.push_back(i & 0xFF);
        }
        
        std::cout << "  📤 Sending large packet (" << packet_data.size() 
                  << " bytes, requires multiple AXIS beats)" << std::endl;
        
        send_axis_packet(packet_data, internal_header);
        
        // Monitor multiple internal AXIS beats
        int beat_count = 0;
        bool first_beat_checked = false;
        
        while (beat_count < 10) {  // Timeout after 10 attempts
            wait(clk.posedge_event());
            
            if (internal_tvalid.read()) {
                beat_count++;
                bool is_last = internal_tlast.read();
                
                std::cout << "    📥 Internal AXIS Beat " << beat_count 
                          << (is_last ? " (LAST)" : "") << std::endl;
                
                if (beat_count == 1 && !first_beat_checked) {
                    // Check first beat has tuser and correct tdest
                    sc_bv<AXIS_USER_WIDTH> tuser = internal_tuser.read();
                    sc_bv<AXIS_DEST_WIDTH> tdest = internal_tdest.read();
                    
                    uint8_t dest_port = tdest.range(7, 0).to_uint();
                    assert(dest_port == 7);  // Should be mapped to local port 7
                    
                    InternalHeader decoded = InternalHeader::from_sc_bv(tuser);
                    assert(decoded.queue_id == 3);
                    assert(decoded.packet_length == 100);
                    
                    first_beat_checked = true;
                    std::cout << "      ✅ First beat tuser/tdest verified" << std::endl;
                }
                
                if (is_last) {
                    std::cout << "    ✅ Multi-beat transmission completed in " 
                              << beat_count << " beats" << std::endl;
                    break;
                }
            }
        }
        
        assert(beat_count > 1);  // Should require multiple beats
        assert(first_beat_checked);  // Should have verified first beat
        
        std::cout << "  ✅ Multi-beat packet test PASSED" << std::endl;
    }
    
    void send_axis_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header) {
        // Send packet via external AXIS interface (simulating Ingress Port Manager)
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;  // 64 bytes per beat
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
            
            // Set tuser only on first beat
            sc_bv<AXIS_USER_WIDTH> tuser = 0;
            if (beat == 0) {
                tuser = header.to_sc_bv();
            }
            
            // Send beat
            ext_axis_tdata.write(tdata);
            ext_axis_tkeep.write(tkeep);
            ext_axis_tuser.write(tuser);
            ext_axis_tlast.write(is_last_beat);
            ext_axis_tvalid.write(true);
            
            wait(clk.posedge_event());
            
            // Wait for ready
            while (!ext_axis_tready.read()) {
                wait(clk.posedge_event());
            }
        }
        
        // End transmission
        ext_axis_tvalid.write(false);
        ext_axis_tlast.write(false);
    }
    
    void wait_for_internal_transmission() {
        int timeout = 0;
        while (!internal_tvalid.read() && timeout < 1000) {
            wait(clk.posedge_event());
            timeout++;
        }
        
        if (timeout >= 1000) {
            std::cout << "⚠️  Timeout waiting for internal transmission" << std::endl;
        }
    }
};

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused warnings
    
    std::cout << "Starting Ingress-Egress AXIS Routing Test..." << std::endl;
    
    TestIngressEgressAxisRouting test("test");
    
    sc_start();
    
    return 0;
}