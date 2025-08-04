#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/queue_manager/egress_queue_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Very Simple Egress Queue Manager Test
// =============================================================================

SC_MODULE(TestEgressPipelineSimple) {
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // Internal Bus Interface (input to Egress Queue Manager)
    sc_signal<bool> internal_valid;
    sc_signal<PacketEntry> internal_packet;
    sc_signal<bool> internal_ready;
    
    // AXIS Interface (output from Egress Queue Manager)
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // Separate AXI signals (like successful test_ingress_pipeline)
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Credit Return Interface
    sc_signal<bool> credit_return_valid;
    sc_signal<CreditInfo> credit_return_info;
    sc_signal<bool> credit_return_ready;
    
    // DUT (Only Egress Queue Manager)
    EgressQueueManager* queue_mgr;
    
    // Shared credit signals
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> shared_credits;
    
    // Control variables
    bool axis_ready_control;
    
    SC_CTOR(TestEgressPipelineSimple) : clk("clk", 10, SC_NS), axis_ready_control(true) {
        // Create DUT
        queue_mgr = new EgressQueueManager("egress_queue_manager");
        
        // Connect clock and reset
        queue_mgr->clk(clk);
        queue_mgr->rst_n(rst_n);
        
        // Connect Internal Bus Interface
        queue_mgr->internal_valid(internal_valid);
        queue_mgr->internal_packet(internal_packet);
        queue_mgr->internal_ready(internal_ready);
        
        // Connect AXIS Interface
        queue_mgr->axis_tvalid(axis_tvalid);
        queue_mgr->axis_tdata(axis_tdata);
        queue_mgr->axis_tkeep(axis_tkeep);
        queue_mgr->axis_tuser(axis_tuser);
        queue_mgr->axis_tlast(axis_tlast);
        queue_mgr->axis_tready(axis_tready);
        
        // Connect AXI Interface - separate signals like test_ingress_pipeline
        queue_mgr->axi_master_valid(axi_master_valid);
        queue_mgr->axi_master_addr(axi_master_addr);
        queue_mgr->axi_master_data(axi_master_data);
        queue_mgr->axi_master_ready(axi_master_ready);
        queue_mgr->axi_slave_valid(axi_slave_valid);
        queue_mgr->axi_slave_addr(axi_slave_addr);
        queue_mgr->axi_slave_data(axi_slave_data);
        queue_mgr->axi_slave_ready(axi_slave_ready);
        
        // Connect Credit Return Interface
        queue_mgr->credit_return_valid(credit_return_valid);
        queue_mgr->credit_return_info(credit_return_info);
        queue_mgr->credit_return_ready(credit_return_ready);
        
        // Initialize shared credits
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            shared_credits[i].write(DEFAULT_CREDITS);
        }
        
        // Set shared credits
        queue_mgr->set_shared_credits(&shared_credits);
        
        // Configure port ID
        queue_mgr->set_port_id(2);
        
        SC_THREAD(test_process);
        SC_THREAD(axis_ready_driver);
    }
    
    ~TestEgressPipelineSimple() {
        delete queue_mgr;
    }
    
    void test_process() {
        std::cout << "\n=== Testing Simple Egress Queue Manager Integration ===" << std::endl;
        
        // Initialize signals
        initialize_signals();
        
        // Test 1: Reset functionality
        test_reset();
        
        // Test 2: Single packet flow
        test_single_packet();
        
        std::cout << "=== Simple Egress Queue Manager test COMPLETED ===" << std::endl;
        sc_stop();
    }
    
    void axis_ready_driver() {
        // Control axis_tready
        while (true) {
            wait(clk.posedge_event());
            axis_tready.write(axis_ready_control);
        }
    }

private:
    void initialize_signals() {
        std::cout << "Initializing signals..." << std::endl;
        
        rst_n.write(false);
        
        // Internal Bus interface
        internal_valid.write(false);
        
        // AXI signals
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        axi_slave_addr.write(0);
        axi_slave_data.write(0);
        
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
        assert(internal_ready.read() == true);
        assert(axis_tvalid.read() == false);
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);
        
        // Check post-reset state
        assert(internal_ready.read() == true);
        
        std::cout << "  Reset test PASSED" << std::endl;
    }
    
    void test_single_packet() {
        std::cout << "Testing single packet through queue manager..." << std::endl;
        
        // Create test packet
        PacketEntry test_packet;
        test_packet.header.source_port = 1;
        test_packet.header.dest_port = 2;
        test_packet.header.packet_type = PacketType::DATA;
        test_packet.header.channel_type = ChannelType::LOW_PRIORITY;
        test_packet.header.packet_length = 4;
        test_packet.payload = {0xAA, 0xBB, 0xCC, 0xDD};
        
        std::cout << "  Sending packet to internal bus..." << std::endl;
        
        // Send packet through internal bus
        send_internal_packet(test_packet);
        
        // Wait for processing
        wait(500, SC_NS);
        
        // Check for AXIS output
        bool found_axis_output = false;
        for (int i = 0; i < 100; i++) {
            if (axis_tvalid.read()) {
                found_axis_output = true;
                std::cout << "  Found axis_tvalid at cycle " << i << std::endl;
                break;
            }
            wait(clk.posedge_event());
        }
        
        if (found_axis_output) {
            std::cout << "  Single packet test PASSED" << std::endl;
        } else {
            std::cout << "  Single packet test FAILED - no AXIS output" << std::endl;
        }
    }
    
    void send_internal_packet(const PacketEntry& packet) {
        // Wait for ready
        while (!internal_ready.read()) {
            wait(clk.posedge_event());
        }
        
        // Send packet
        internal_packet.write(packet);
        internal_valid.write(true);
        
        wait(clk.posedge_event());
        
        // Wait for handshake
        assert(internal_ready.read() == true);
        
        internal_valid.write(false);
        wait(clk.posedge_event());
    }
};

// =============================================================================
// Main Test Function
// =============================================================================

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting Simple Egress Pipeline test..." << std::endl;
    
    TestEgressPipelineSimple test_module("test_egress_pipeline_simple");
    
    sc_start();
    
    return 0;
}