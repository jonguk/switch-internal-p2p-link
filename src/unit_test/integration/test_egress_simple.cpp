#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/queue_manager/egress_queue_manager.h"
#include "../../systemc/port_manager/egress_port_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Simple Egress Pipeline Debug Test
// =============================================================================

SC_MODULE(TestEgressSimple) {
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
    sc_signal<bool> ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_signal<bool> ext_last;
    sc_signal<bool> ext_ready;
    
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
    
    // Credit Return Interface (dummy)
    sc_signal<bool> credit_return_valid;
    sc_signal<CreditInfo> credit_return_info;
    sc_signal<bool> credit_return_ready;
    
    // DUTs
    EgressQueueManager* egress_queue_mgr;
    EgressPortManager* egress_port_mgr;
    
    // Shared credit signals
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> shared_credits;
    
    SC_CTOR(TestEgressSimple) : clk("clk", 10, SC_NS) {
        // Create DUTs
        egress_queue_mgr = new EgressQueueManager("egress_queue_manager");
        egress_port_mgr = new EgressPortManager("egress_port_manager");
        
        // Connect clock and reset
        egress_queue_mgr->clk(clk);
        egress_queue_mgr->rst_n(rst_n);
        egress_port_mgr->clk(clk);
        egress_port_mgr->rst_n(rst_n);
        
        // Connect Internal Bus
        egress_queue_mgr->internal_valid(internal_valid);
        egress_queue_mgr->internal_packet(internal_packet);
        egress_queue_mgr->internal_ready(internal_ready);
        
        // Connect AXIS Interface: Master → Slave
        // Master (EgressQueueManager) outputs
        egress_queue_mgr->axis_tvalid(axis_tvalid);
        egress_queue_mgr->axis_tdata(axis_tdata);
        egress_queue_mgr->axis_tkeep(axis_tkeep);
        egress_queue_mgr->axis_tuser(axis_tuser);
        egress_queue_mgr->axis_tlast(axis_tlast);
        
        // Slave (EgressPortManager) inputs  
        egress_port_mgr->axis_tvalid(axis_tvalid);
        egress_port_mgr->axis_tdata(axis_tdata);
        egress_port_mgr->axis_tkeep(axis_tkeep);
        egress_port_mgr->axis_tuser(axis_tuser);
        egress_port_mgr->axis_tlast(axis_tlast);
        
        // Ready signal: Slave output → Master input
        egress_port_mgr->axis_tready(axis_tready);
        egress_queue_mgr->axis_tready(axis_tready);
        
        // Connect External Interface
        egress_port_mgr->ext_valid(ext_valid);
        egress_port_mgr->ext_data(ext_data);
        egress_port_mgr->ext_keep(ext_keep);
        egress_port_mgr->ext_last(ext_last);
        egress_port_mgr->ext_ready(ext_ready);
        
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
        egress_queue_mgr->set_shared_credits(&shared_credits);
        
        // Configure port IDs
        egress_queue_mgr->set_port_id(2);
        egress_port_mgr->set_port_id(2);
        
        SC_THREAD(test_process);
        SC_THREAD(ext_ready_driver);
    }
    
    ~TestEgressSimple() {
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
        std::cout << "\n=== Simple Egress Pipeline Debug Test ===" << std::endl;
        
        // Initialize
        rst_n.write(false);
        internal_valid.write(false);
        credit_return_ready.write(true);
        wait(100, SC_NS);
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);
        
        std::cout << "Reset completed. Checking initial state..." << std::endl;
        std::cout << "  internal_ready: " << internal_ready.read() << std::endl;
        std::cout << "  axis_tready: " << axis_tready.read() << std::endl;
        std::cout << "  ext_ready: " << ext_ready.read() << std::endl;
        
        // Send ONE packet only
        std::cout << "Sending ONE test packet..." << std::endl;
        
        PacketEntry test_packet;
        test_packet.header.source_port = 1;
        test_packet.header.dest_port = 2;
        test_packet.header.packet_type = PacketType::DATA;
        test_packet.header.channel_type = ChannelType::LOW_PRIORITY;
        test_packet.header.packet_length = 4;
        test_packet.payload = {0xAA, 0xBB, 0xCC, 0xDD};
        test_packet.total_size = sizeof(InternalHeader) + 4;
        test_packet.timestamp = sc_time_stamp();
        
        // Send packet ONCE
        send_one_packet(test_packet);
        
        // Wait and observe
        std::cout << "Waiting for processing..." << std::endl;
        for (int i = 0; i < 1000; i++) {
            wait(clk.posedge_event());
            
            if (i % 100 == 0) {
                std::cout << "  Cycle " << i << ": axis_tvalid=" << axis_tvalid.read() 
                          << ", ext_valid=" << ext_valid.read() << std::endl;
            }
            
            // Stop if we see external output
            if (ext_valid.read()) {
                std::cout << "SUCCESS: External output detected at cycle " << i << std::endl;
                break;
            }
        }
        
        // Final statistics
        uint64_t transmitted = egress_queue_mgr->get_total_packets_transmitted();
        std::cout << "Final transmitted count: " << transmitted << std::endl;
        
        std::cout << "=== Simple Debug Test COMPLETED ===" << std::endl;
        sc_stop();
    }
    
    void ext_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            ext_ready.write(true);  // Always ready
        }
    }
    
private:
    void send_one_packet(const PacketEntry& packet) {
        std::cout << "  Sending packet to internal bus..." << std::endl;
        
        // Simple packet transmission: Set packet and valid for exactly one cycle
        internal_packet.write(packet);
        internal_valid.write(true);
        
        // Wait one clock cycle for DUT to receive
        wait(clk.posedge_event());
        
        // Immediately clear valid signal
        internal_valid.write(false);
        
        // Wait another cycle for propagation
        wait(clk.posedge_event());
        
        std::cout << "  Packet sent successfully" << std::endl;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting Simple Egress Debug Test..." << std::endl;
    
    TestEgressSimple test_module("test_egress_simple");
    
    sc_start();
    
    return 0;
}