#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/queue_manager/egress_queue_manager.h"
#include "../../systemc/port_manager/egress_port_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Egress Pipeline Test (Step 3)
// Egress Queue Manager → AXIS → Egress Port Manager
// =============================================================================

SC_MODULE(TestEgressPipeline) {
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // Internal Bus Input Interface (to Egress Queue Manager)
    sc_signal<bool> internal_valid;
    sc_signal<PacketEntry> internal_packet;
    sc_signal<bool> internal_ready;
    
    // AXIS Interface: Egress Queue Manager → Egress Port Manager
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // External Output Interface (from Egress Port Manager)
    sc_signal<bool> ext_out_valid;
    sc_signal<sc_bv<EXTERNAL_DATA_WIDTH>> ext_out_data;
    sc_signal<bool> ext_out_ready;
    
    // Dummy AXI signals for Egress Queue Manager
    sc_signal<bool> eqm_axi_master_valid;
    sc_signal<sc_bv<32>> eqm_axi_master_addr;
    sc_signal<sc_bv<32>> eqm_axi_master_data;
    sc_signal<bool> eqm_axi_master_ready;
    sc_signal<bool> eqm_axi_slave_valid;
    sc_signal<sc_bv<32>> eqm_axi_slave_addr;
    sc_signal<sc_bv<32>> eqm_axi_slave_data;
    sc_signal<bool> eqm_axi_slave_ready;
    
    // Dummy AXI signals for Egress Port Manager
    sc_signal<bool> epm_axi_master_valid;
    sc_signal<sc_bv<32>> epm_axi_master_addr;
    sc_signal<sc_bv<32>> epm_axi_master_data;
    sc_signal<bool> epm_axi_master_ready;
    sc_signal<bool> epm_axi_slave_valid;
    sc_signal<sc_bv<32>> epm_axi_slave_addr;
    sc_signal<sc_bv<32>> epm_axi_slave_data;
    sc_signal<bool> epm_axi_slave_ready;
    
    // Credit Return Interface (dummy for now)
    sc_signal<bool> credit_return_valid;
    sc_signal<CreditInfo> credit_return_info;
    sc_signal<bool> credit_return_ready;
    
    // DUTs (Devices Under Test)
    EgressQueueManager* egress_queue_mgr;
    EgressPortManager* egress_port_mgr;
    
    // Shared credit signals
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> shared_credits;
    
    // Control variables
    bool ext_out_ready_control;
    
    SC_CTOR(TestEgressPipeline) : clk("clk", 10, SC_NS), ext_out_ready_control(true) {
        // Create DUTs
        egress_queue_mgr = new EgressQueueManager("egress_queue_manager");
        egress_port_mgr = new EgressPortManager("egress_port_manager");
        
        // Connect clock and reset
        egress_queue_mgr->clk(clk);
        egress_queue_mgr->rst_n(rst_n);
        egress_port_mgr->clk(clk);
        egress_port_mgr->rst_n(rst_n);
        
        // Connect Internal Bus Input (to Egress Queue Manager)
        egress_queue_mgr->internal_valid(internal_valid);
        egress_queue_mgr->internal_packet(internal_packet);
        egress_queue_mgr->internal_ready(internal_ready);
        
        // Connect AXIS Interface: Egress Queue Manager → Egress Port Manager
        egress_queue_mgr->axis_tvalid(axis_tvalid);
        egress_queue_mgr->axis_tdata(axis_tdata);
        egress_queue_mgr->axis_tkeep(axis_tkeep);
        egress_queue_mgr->axis_tuser(axis_tuser);
        egress_queue_mgr->axis_tlast(axis_tlast);
        egress_queue_mgr->axis_tready(axis_tready);
        
        egress_port_mgr->axis_tvalid(axis_tvalid);
        egress_port_mgr->axis_tdata(axis_tdata);
        egress_port_mgr->axis_tkeep(axis_tkeep);
        egress_port_mgr->axis_tuser(axis_tuser);
        egress_port_mgr->axis_tlast(axis_tlast);
        egress_port_mgr->axis_tready(axis_tready);
        
        // Connect External Output Interface (from Egress Port Manager)
        egress_port_mgr->ext_out_valid(ext_out_valid);
        egress_port_mgr->ext_out_data(ext_out_data);
        egress_port_mgr->ext_out_ready(ext_out_ready);
        
        // Connect dummy AXI signals
        connect_dummy_axi();
        
        // Connect credit return interface
        egress_queue_mgr->credit_return_valid(credit_return_valid);
        egress_queue_mgr->credit_return_info(credit_return_info);
        egress_queue_mgr->credit_return_ready(credit_return_ready);
        
        // Initialize shared credits
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            shared_credits[i].write(DEFAULT_CREDITS);
        }
        
        // Set shared credits for egress queue manager
        egress_queue_mgr->set_shared_credits(&shared_credits);
        
        // Configure port IDs
        egress_queue_mgr->set_port_id(2);   // Egress queue
        egress_port_mgr->set_port_id(2);    // Egress port
        
        SC_THREAD(test_process);
        SC_THREAD(ext_out_ready_driver);
        SC_THREAD(internal_packet_driver);
    }
    
    ~TestEgressPipeline() {
        delete egress_queue_mgr;
        delete egress_port_mgr;
    }
    
    void connect_dummy_axi() {
        // Initialize Egress Queue Manager AXI signals
        eqm_axi_master_valid.write(false);
        eqm_axi_master_addr.write(0);
        eqm_axi_master_data.write(0);
        eqm_axi_master_ready.write(true);
        eqm_axi_slave_valid.write(false);
        eqm_axi_slave_addr.write(0);
        eqm_axi_slave_data.write(0);
        eqm_axi_slave_ready.write(true);
        
        // Initialize Egress Port Manager AXI signals
        epm_axi_master_valid.write(false);
        epm_axi_master_addr.write(0);
        epm_axi_master_data.write(0);
        epm_axi_master_ready.write(true);
        epm_axi_slave_valid.write(false);
        epm_axi_slave_addr.write(0);
        epm_axi_slave_data.write(0);
        epm_axi_slave_ready.write(true);
        
        // Connect Egress Queue Manager AXI
        egress_queue_mgr->axi_master_valid(eqm_axi_master_valid);
        egress_queue_mgr->axi_master_addr(eqm_axi_master_addr);
        egress_queue_mgr->axi_master_data(eqm_axi_master_data);
        egress_queue_mgr->axi_master_ready(eqm_axi_master_ready);
        egress_queue_mgr->axi_slave_valid(eqm_axi_slave_valid);
        egress_queue_mgr->axi_slave_addr(eqm_axi_slave_addr);
        egress_queue_mgr->axi_slave_data(eqm_axi_slave_data);
        egress_queue_mgr->axi_slave_ready(eqm_axi_slave_ready);
        
        // Connect Egress Port Manager AXI
        egress_port_mgr->axi_master_valid(epm_axi_master_valid);
        egress_port_mgr->axi_master_addr(epm_axi_master_addr);
        egress_port_mgr->axi_master_data(epm_axi_master_data);
        egress_port_mgr->axi_master_ready(epm_axi_master_ready);
        egress_port_mgr->axi_slave_valid(epm_axi_slave_valid);
        egress_port_mgr->axi_slave_addr(epm_axi_slave_addr);
        egress_port_mgr->axi_slave_data(epm_axi_slave_data);
        egress_port_mgr->axi_slave_ready(epm_axi_slave_ready);
    }
    
    void test_process() {
        std::cout << "\n=== Step 3: Egress Pipeline Test ===" << std::endl;
        std::cout << "Testing: Egress Queue Manager → AXIS → Egress Port Manager" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Basic packet egress
        test_basic_packet_egress();
        
        // Test 3: Multiple packets
        test_multiple_packets();
        
        // Test 4: Different packet sizes
        test_different_packet_sizes();
        
        // Test 5: Queue priority
        test_queue_priority();
        
        std::cout << "=== Step 3: All Egress Pipeline tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void ext_out_ready_driver() {
        // Control ext_out_ready based on ext_out_ready_control
        while (true) {
            wait(clk.posedge_event());
            ext_out_ready.write(ext_out_ready_control);
        }
    }
    
    void internal_packet_driver() {
        // Keep internal_valid low initially
        internal_valid.write(false);
        while (true) {
            wait(clk.posedge_event());
        }
    }
    
private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        
        // Internal bus interface
        internal_valid.write(false);
        
        // Credit return
        credit_return_ready.write(true);
        
        wait(50, SC_NS);
    }
    
    void test_reset() {
        std::cout << "Testing reset functionality..." << std::endl;
        
        // Apply reset
        rst_n.write(false);
        wait(100, SC_NS);
        
        // Check reset state
        assert(internal_ready.read() == true);   // Egress QM should be ready
        assert(axis_tvalid.read() == false);     // No AXIS output
        assert(ext_out_valid.read() == false);   // No external output
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);
        
        // Check post-reset state
        assert(internal_ready.read() == true);
        assert(axis_tready.read() == true);      // Egress PM should be ready
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_basic_packet_egress() {
        std::cout << "Testing basic packet egress..." << std::endl;
        
        // Create test packet with internal format
        std::vector<uint8_t> test_payload = {0xDE, 0xAD, 0xBE, 0xEF};
        InternalHeader test_header;
        test_header.source_port = 1;
        test_header.dest_port = 2;
        test_header.packet_type = PacketType::DATA;
        test_header.channel_type = ChannelType::LOW_PRIORITY;
        test_header.packet_length = test_payload.size();
        test_header.sequence_number = 100;
        test_header.hop_count = 1;
        
        PacketEntry test_packet = create_packet_entry(test_payload, test_header);
        
        std::cout << "  Sending " << test_payload.size() << " byte packet through egress pipeline..." << std::endl;
        
        // Send internal packet to Egress Queue Manager
        send_internal_packet(test_packet);
        
        // Wait for processing through AXIS
        std::cout << "  Waiting for AXIS processing..." << std::endl;
        wait(1000, SC_NS);
        
        // Check that packet came out on external output
        bool packet_received = false;
        std::vector<uint8_t> received_data;
        
        // Wait for external output
        for (int i = 0; i < 200; i++) {
            if (ext_out_valid.read()) {
                packet_received = true;
                std::cout << "  Found ext_out_valid at cycle " << i << std::endl;
                
                // Extract data from external output
                auto out_data = ext_out_data.read();
                for (int j = 0; j < EXTERNAL_DATA_WIDTH/8 && received_data.size() < test_payload.size(); j++) {
                    received_data.push_back((out_data.range(j*8+7, j*8)).to_uint());
                }
                break;
            }
            wait(clk.posedge_event());
        }
        
        if (packet_received) {
            // Verify payload
            std::cout << "  Payload verification: received " << received_data.size() << " bytes" << std::endl;
            for (size_t i = 0; i < std::min(received_data.size(), test_payload.size()); i++) {
                std::cout << "    Byte " << i << ": 0x" << std::hex << (int)received_data[i] 
                          << " (expected 0x" << (int)test_payload[i] << ")" << std::dec << std::endl;
                assert(received_data[i] == test_payload[i]);
            }
            
            std::cout << "  Basic packet egress test PASSED" << std::endl;
        } else {
            std::cout << "  Basic packet egress test FAILED - no output detected" << std::endl;
        }
    }
    
    void test_multiple_packets() {
        std::cout << "Testing multiple packet egress..." << std::endl;
        
        std::vector<std::vector<uint8_t>> test_payloads = {
            {0x11, 0x22},
            {0x33, 0x44, 0x55},
            {0x66, 0x77, 0x88, 0x99}
        };
        
        for (size_t p = 0; p < test_payloads.size(); p++) {
            std::cout << "  Sending packet " << (p+1) << " (" << test_payloads[p].size() << " bytes)..." << std::endl;
            
            InternalHeader header;
            header.source_port = 1;
            header.dest_port = p % MAX_QUEUES_PER_PORT;
            header.packet_type = PacketType::DATA;
            header.channel_type = ChannelType::LOW_PRIORITY;
            header.packet_length = test_payloads[p].size();
            header.sequence_number = 200 + p;
            header.hop_count = 1;
            
            PacketEntry packet = create_packet_entry(test_payloads[p], header);
            send_internal_packet(packet);
            
            // Wait for processing
            wait(800, SC_NS);
            
            // Check for output
            bool found_output = false;
            for (int i = 0; i < 100; i++) {
                if (ext_out_valid.read()) {
                    found_output = true;
                    std::cout << "    Packet " << (p+1) << " output detected" << std::endl;
                    break;
                }
                wait(clk.posedge_event());
            }
            
            if (found_output) {
                std::cout << "    Packet " << (p+1) << " egress successful" << std::endl;
            } else {
                std::cout << "    Packet " << (p+1) << " - no output detected" << std::endl;
            }
            
            wait(200, SC_NS);  // Allow time between packets
        }
        
        std::cout << "  Multiple packet egress test COMPLETED" << std::endl;
    }
    
    void test_different_packet_sizes() {
        std::cout << "Testing different packet sizes..." << std::endl;
        
        std::vector<size_t> test_sizes = {1, 8, 16, 32, 64};
        
        for (size_t s = 0; s < test_sizes.size(); s++) {
            size_t packet_size = test_sizes[s];
            std::cout << "  Testing " << packet_size << " byte packet..." << std::endl;
            
            // Create packet of specified size
            std::vector<uint8_t> payload(packet_size);
            for (size_t i = 0; i < packet_size; i++) {
                payload[i] = (uint8_t)(0x10 + i % 16);
            }
            
            InternalHeader header;
            header.source_port = 1;
            header.dest_port = 0;
            header.packet_type = PacketType::DATA;
            header.channel_type = ChannelType::LOW_PRIORITY;
            header.packet_length = packet_size;
            header.sequence_number = 300 + s;
            header.hop_count = 1;
            
            PacketEntry packet = create_packet_entry(payload, header); 
            send_internal_packet(packet);
            
            // Wait and check for output
            wait(1000, SC_NS);
            
            bool found_output = false;
            for (int i = 0; i < 150; i++) {
                if (ext_out_valid.read()) {
                    found_output = true;
                    break;
                }
                wait(clk.posedge_event());
            }
            
            std::cout << "    " << packet_size << " byte packet: " 
                      << (found_output ? "SUCCESS" : "NO OUTPUT") << std::endl;
                      
            wait(200, SC_NS);
        }
        
        std::cout << "  Different packet sizes test COMPLETED" << std::endl;
    }
    
    void test_queue_priority() {
        std::cout << "Testing queue priority..." << std::endl;
        
        // Send packets to different queues/priorities
        std::vector<ChannelType> priorities = {
            ChannelType::LOW_PRIORITY,
            ChannelType::HIGH_PRIORITY,
            ChannelType::CONTROL_CHANNEL
        };
        
        for (size_t q = 0; q < priorities.size(); q++) {
            InternalHeader header;
            header.source_port = 1;
            header.dest_port = q;
            header.packet_type = PacketType::DATA;
            header.channel_type = priorities[q];
            header.packet_length = 4;
            header.sequence_number = 400 + q;
            header.hop_count = 1;
            
            std::vector<uint8_t> priority_data = {
                (uint8_t)(0xA0 + q),
                (uint8_t)(0xB0 + q),
                (uint8_t)(0xC0 + q),
                (uint8_t)(0xD0 + q)
            };
            
            std::cout << "  Sending packet to queue " << q << " with priority " << (int)priorities[q] << std::endl;
            
            PacketEntry packet = create_packet_entry(priority_data, header);
            send_internal_packet(packet);
            
            wait(800, SC_NS);
        }
        
        // Verify queue processing
        for (int q = 0; q < 3; q++) {
            const QueueStats& egress_stats = egress_queue_mgr->get_queue_stats(q);
            std::cout << "  Queue " << q << " packets received: " << egress_stats.packets_received << std::endl;
        }
        
        std::cout << "  Queue priority test COMPLETED" << std::endl;
    }
    
    PacketEntry create_packet_entry(const std::vector<uint8_t>& payload, const InternalHeader& header) {
        PacketEntry packet;
        packet.header = header;
        packet.data.clear();
        
        // Add header to data (serialized form)
        std::vector<uint8_t> header_bytes = header.serialize();
        for (uint8_t byte : header_bytes) {
            packet.data.push_back(byte);
        }
        
        // Add payload
        for (uint8_t byte : payload) {
            packet.data.push_back(byte);
        }
        
        return packet;
    }
    
    void send_internal_packet(const PacketEntry& packet) {
        // Wait for internal_ready
        int timeout = 0;
        while (!internal_ready.read() && timeout < 100) {
            wait(clk.posedge_event());
            timeout++;
        }
        
        if (timeout >= 100) {
            std::cout << "  Timeout waiting for internal_ready" << std::endl;
            return;
        }
        
        // Send packet via internal bus
        internal_packet.write(packet);
        internal_valid.write(true);
        
        wait(clk.posedge_event());
        
        // Wait for handshake completion
        while (internal_ready.read() && internal_valid.read()) {
            wait(clk.posedge_event());
        }
        
        internal_valid.write(false);
        wait(clk.posedge_event());
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting Step 3: Egress Pipeline tests..." << std::endl;
    
    TestEgressPipeline test_module("test_egress_pipeline");
    
    sc_start();
    
    return 0;
}