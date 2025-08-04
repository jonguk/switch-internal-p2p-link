#include <systemc.h>
#include <cassert>
#include <iostream>
#include <vector>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/port_manager/egress_port_manager.h"
#include "../../systemc/queue_manager/ingress_queue_manager.h"
#include "../../systemc/queue_manager/egress_queue_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// End-to-End Pipeline Test
// Ingress Port Manager → Ingress Queue Manager → Egress Queue Manager → Egress Port Manager
// =============================================================================

SC_MODULE(TestEndToEndPipeline) {
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External Input Interface (to Ingress Port Manager)
    sc_signal<bool> ext_in_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_in_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_in_keep;
    sc_signal<bool> ext_in_last;
    sc_signal<bool> ext_in_ready;
    
    // AXIS Interface: Ingress Port Manager → Ingress Queue Manager
    sc_signal<bool> axis_ipm_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_ipm_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_ipm_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_ipm_tuser;
    sc_signal<bool> axis_ipm_tlast;
    sc_signal<bool> axis_ipm_tready;
    
    // Internal Bus Interface: Ingress Queue Manager → Egress Queue Manager
    sc_signal<bool> internal_valid;
    sc_signal<PacketEntry> internal_packet;
    sc_signal<bool> internal_ready;
    
    // AXIS Interface: Egress Queue Manager → Egress Port Manager
    sc_signal<bool> axis_eqm_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_eqm_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_eqm_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_eqm_tuser;
    sc_signal<bool> axis_eqm_tlast;
    sc_signal<bool> axis_eqm_tready;
    
    // External Output Interface (from Egress Port Manager)
    sc_signal<bool> ext_out_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_out_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_out_keep;
    sc_signal<bool> ext_out_last;
    sc_signal<bool> ext_out_ready;
    
    // AXI Interfaces (separate for each module)
    // Ingress Port Manager AXI
    sc_signal<bool> ipm_axi_master_valid;
    sc_signal<sc_bv<32>> ipm_axi_master_addr;
    sc_signal<sc_bv<32>> ipm_axi_master_data;
    sc_signal<bool> ipm_axi_master_ready;
    sc_signal<bool> ipm_axi_slave_valid;
    sc_signal<sc_bv<32>> ipm_axi_slave_addr;
    sc_signal<sc_bv<32>> ipm_axi_slave_data;
    sc_signal<bool> ipm_axi_slave_ready;
    
    // Ingress Queue Manager AXI
    sc_signal<bool> iqm_axi_master_valid;
    sc_signal<sc_bv<32>> iqm_axi_master_addr;
    sc_signal<sc_bv<32>> iqm_axi_master_data;
    sc_signal<bool> iqm_axi_master_ready;
    sc_signal<bool> iqm_axi_slave_valid;
    sc_signal<sc_bv<32>> iqm_axi_slave_addr;
    sc_signal<sc_bv<32>> iqm_axi_slave_data;
    sc_signal<bool> iqm_axi_slave_ready;
    
    // Egress Queue Manager AXI
    sc_signal<bool> eqm_axi_master_valid;
    sc_signal<sc_bv<32>> eqm_axi_master_addr;
    sc_signal<sc_bv<32>> eqm_axi_master_data;
    sc_signal<bool> eqm_axi_master_ready;
    sc_signal<bool> eqm_axi_slave_valid;
    sc_signal<sc_bv<32>> eqm_axi_slave_addr;
    sc_signal<sc_bv<32>> eqm_axi_slave_data;
    sc_signal<bool> eqm_axi_slave_ready;
    
    // Egress Port Manager AXI
    sc_signal<bool> epm_axi_master_valid;
    sc_signal<sc_bv<32>> epm_axi_master_addr;
    sc_signal<sc_bv<32>> epm_axi_master_data;
    sc_signal<bool> epm_axi_master_ready;
    sc_signal<bool> epm_axi_slave_valid;
    sc_signal<sc_bv<32>> epm_axi_slave_addr;
    sc_signal<sc_bv<32>> epm_axi_slave_data;
    sc_signal<bool> epm_axi_slave_ready;
    
    // Credit Return Interfaces (dummy)
    sc_signal<bool> credit_return_valid;
    sc_signal<CreditInfo> credit_return_info;
    sc_signal<bool> credit_return_ready;
    
    // DUTs
    IngressPortManager* ingress_port_mgr;
    IngressQueueManager* ingress_queue_mgr;
    EgressQueueManager* egress_queue_mgr;
    EgressPortManager* egress_port_mgr;
    
    // Shared credits
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> shared_credits;
    
    SC_CTOR(TestEndToEndPipeline) : clk("clk", 10, SC_NS) {
        // Create DUTs
        ingress_port_mgr = new IngressPortManager("ingress_port_manager");
        ingress_queue_mgr = new IngressQueueManager("ingress_queue_manager");
        egress_queue_mgr = new EgressQueueManager("egress_queue_manager");
        egress_port_mgr = new EgressPortManager("egress_port_manager");
        
        // Connect Ingress Port Manager
        ingress_port_mgr->clk(clk);
        ingress_port_mgr->rst_n(rst_n);
        // External interface
        ingress_port_mgr->ext_valid(ext_in_valid);
        ingress_port_mgr->ext_data(ext_in_data);
        ingress_port_mgr->ext_keep(ext_in_keep);
        ingress_port_mgr->ext_last(ext_in_last);
        ingress_port_mgr->ext_ready(ext_in_ready);
        // AXIS Master interface
        ingress_port_mgr->axis_tvalid(axis_ipm_tvalid);
        ingress_port_mgr->axis_tdata(axis_ipm_tdata);
        ingress_port_mgr->axis_tkeep(axis_ipm_tkeep);
        ingress_port_mgr->axis_tuser(axis_ipm_tuser);
        ingress_port_mgr->axis_tlast(axis_ipm_tlast);
        ingress_port_mgr->axis_tready(axis_ipm_tready);
        // AXI and credit interfaces (dummy)
        connect_dummy_axi_ipm();
        ingress_port_mgr->credit_return_valid(credit_return_valid);
        ingress_port_mgr->credit_return_ready(credit_return_ready);
        
        // Connect Ingress Queue Manager
        ingress_queue_mgr->clk(clk);
        ingress_queue_mgr->rst_n(rst_n);
        // AXIS Slave interface
        ingress_queue_mgr->axis_tvalid(axis_ipm_tvalid);
        ingress_queue_mgr->axis_tdata(axis_ipm_tdata);
        ingress_queue_mgr->axis_tkeep(axis_ipm_tkeep);
        ingress_queue_mgr->axis_tuser(axis_ipm_tuser);
        ingress_queue_mgr->axis_tlast(axis_ipm_tlast);
        ingress_queue_mgr->axis_tready(axis_ipm_tready);
        // Internal Bus Master interface
        ingress_queue_mgr->internal_valid(internal_valid);
        ingress_queue_mgr->internal_packet(internal_packet);
        ingress_queue_mgr->internal_ready(internal_ready);
        // AXI interfaces (dummy)
        connect_dummy_axi_iqm();
        
        // Connect Egress Queue Manager
        egress_queue_mgr->clk(clk);
        egress_queue_mgr->rst_n(rst_n);
        // Internal Bus Slave interface
        egress_queue_mgr->internal_valid(internal_valid);
        egress_queue_mgr->internal_packet(internal_packet);
        egress_queue_mgr->internal_ready(internal_ready);
        // AXIS Master interface
        egress_queue_mgr->axis_tvalid(axis_eqm_tvalid);
        egress_queue_mgr->axis_tdata(axis_eqm_tdata);
        egress_queue_mgr->axis_tkeep(axis_eqm_tkeep);
        egress_queue_mgr->axis_tuser(axis_eqm_tuser);
        egress_queue_mgr->axis_tlast(axis_eqm_tlast);
        egress_queue_mgr->axis_tready(axis_eqm_tready);
        // AXI and credit interfaces
        connect_dummy_axi_eqm();
        egress_queue_mgr->credit_return_valid(credit_return_valid);
        egress_queue_mgr->credit_return_info(credit_return_info);
        egress_queue_mgr->credit_return_ready(credit_return_ready);
        
        // Connect Egress Port Manager
        egress_port_mgr->clk(clk);
        egress_port_mgr->rst_n(rst_n);
        // AXIS Slave interface
        egress_port_mgr->axis_tvalid(axis_eqm_tvalid);
        egress_port_mgr->axis_tdata(axis_eqm_tdata);
        egress_port_mgr->axis_tkeep(axis_eqm_tkeep);
        egress_port_mgr->axis_tuser(axis_eqm_tuser);
        egress_port_mgr->axis_tlast(axis_eqm_tlast);
        egress_port_mgr->axis_tready(axis_eqm_tready);
        // External interface
        egress_port_mgr->ext_valid(ext_out_valid);
        egress_port_mgr->ext_data(ext_out_data);
        egress_port_mgr->ext_keep(ext_out_keep);
        egress_port_mgr->ext_last(ext_out_last);
        egress_port_mgr->ext_ready(ext_out_ready);
        // AXI interfaces (dummy)
        connect_dummy_axi_epm();
        
        // Initialize shared credits
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            shared_credits[i].write(DEFAULT_CREDITS);
        }
        egress_queue_mgr->set_shared_credits(&shared_credits);
        
        // Set port IDs
        ingress_port_mgr->set_port_id(1);
        ingress_queue_mgr->set_port_id(1);
        egress_queue_mgr->set_port_id(2);
        egress_port_mgr->set_port_id(2);
        
        SC_THREAD(test_process);
        SC_THREAD(ext_out_ready_driver);
    }
    
    ~TestEndToEndPipeline() {
        delete ingress_port_mgr;
        delete ingress_queue_mgr;
        delete egress_queue_mgr;
        delete egress_port_mgr;
    }
    
    void connect_dummy_axi_ipm() {
        ipm_axi_master_valid.write(false);
        ipm_axi_master_addr.write(0);
        ipm_axi_master_data.write(0);
        ipm_axi_master_ready.write(true);
        ipm_axi_slave_valid.write(false);
        ipm_axi_slave_addr.write(0);
        ipm_axi_slave_data.write(0);
        ipm_axi_slave_ready.write(true);
        
        ingress_port_mgr->axi_master_valid(ipm_axi_master_valid);
        ingress_port_mgr->axi_master_addr(ipm_axi_master_addr);
        ingress_port_mgr->axi_master_data(ipm_axi_master_data);
        ingress_port_mgr->axi_master_ready(ipm_axi_master_ready);
        ingress_port_mgr->axi_slave_valid(ipm_axi_slave_valid);
        ingress_port_mgr->axi_slave_addr(ipm_axi_slave_addr);
        ingress_port_mgr->axi_slave_data(ipm_axi_slave_data);
        ingress_port_mgr->axi_slave_ready(ipm_axi_slave_ready);
    }
    
    void connect_dummy_axi_iqm() {
        iqm_axi_master_valid.write(false);
        iqm_axi_master_addr.write(0);
        iqm_axi_master_data.write(0);
        iqm_axi_master_ready.write(true);
        iqm_axi_slave_valid.write(false);
        iqm_axi_slave_addr.write(0);
        iqm_axi_slave_data.write(0);
        iqm_axi_slave_ready.write(true);
        
        ingress_queue_mgr->axi_master_valid(iqm_axi_master_valid);
        ingress_queue_mgr->axi_master_addr(iqm_axi_master_addr);
        ingress_queue_mgr->axi_master_data(iqm_axi_master_data);
        ingress_queue_mgr->axi_master_ready(iqm_axi_master_ready);
        ingress_queue_mgr->axi_slave_valid(iqm_axi_slave_valid);
        ingress_queue_mgr->axi_slave_addr(iqm_axi_slave_addr);
        ingress_queue_mgr->axi_slave_data(iqm_axi_slave_data);
        ingress_queue_mgr->axi_slave_ready(iqm_axi_slave_ready);
    }
    
    void connect_dummy_axi_eqm() {
        eqm_axi_master_valid.write(false);
        eqm_axi_master_addr.write(0);
        eqm_axi_master_data.write(0);
        eqm_axi_master_ready.write(true);
        eqm_axi_slave_valid.write(false);
        eqm_axi_slave_addr.write(0);
        eqm_axi_slave_data.write(0);
        eqm_axi_slave_ready.write(true);
        
        egress_queue_mgr->axi_master_valid(eqm_axi_master_valid);
        egress_queue_mgr->axi_master_addr(eqm_axi_master_addr);
        egress_queue_mgr->axi_master_data(eqm_axi_master_data);
        egress_queue_mgr->axi_master_ready(eqm_axi_master_ready);
        egress_queue_mgr->axi_slave_valid(eqm_axi_slave_valid);
        egress_queue_mgr->axi_slave_addr(eqm_axi_slave_addr);
        egress_queue_mgr->axi_slave_data(eqm_axi_slave_data);
        egress_queue_mgr->axi_slave_ready(eqm_axi_slave_ready);
    }
    
    void connect_dummy_axi_epm() {
        epm_axi_master_valid.write(false);
        epm_axi_master_addr.write(0);
        epm_axi_master_data.write(0);
        epm_axi_master_ready.write(true);
        epm_axi_slave_valid.write(false);
        epm_axi_slave_addr.write(0);
        epm_axi_slave_data.write(0);
        epm_axi_slave_ready.write(true);
        
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
        std::cout << "\n=== End-to-End Pipeline Test ===" << std::endl;
        std::cout << "Testing: Ingress Port Manager → Ingress Queue Manager → " 
                  << "Egress Queue Manager → Egress Port Manager" << std::endl;
        
        // Initialize
        rst_n.write(false);
        ext_in_valid.write(false);
        wait(100, SC_NS);
        
        // Release reset
        rst_n.write(true);
        wait(100, SC_NS);
        
        std::cout << "Reset completed. Starting pipeline test..." << std::endl;
        
        // Test 1: Single packet end-to-end
        test_single_packet_e2e();
        
        // Test 2: Multiple packets
        test_multiple_packets_e2e();
        
        std::cout << "=== End-to-End Pipeline: All tests PASSED ===" << std::endl;
        sc_stop();
    }
    
    void ext_out_ready_driver() {
        while (true) {
            wait(clk.posedge_event());
            ext_out_ready.write(true);
        }
    }
    
private:
    void test_single_packet_e2e() {
        std::cout << "Testing single packet end-to-end..." << std::endl;
        
        // Send external packet
        std::vector<uint8_t> test_data = {0xAA, 0xBB, 0xCC, 0xDD};
        send_external_packet(test_data);
        
        // Wait for processing through all 4 stages
        std::cout << "  Waiting for packet to traverse all 4 pipeline stages..." << std::endl;
        
        int timeout = 0;
        while (!ext_out_valid.read() && timeout < 1000) {
            wait(clk.posedge_event());
            timeout++;
        }
        
        if (timeout >= 1000) {
            std::cout << "  ERROR: Timeout waiting for external output!" << std::endl;
            assert(false);
        }
        
        std::cout << "  SUCCESS: Packet emerged from pipeline in " << timeout << " cycles!" << std::endl;
        
        // Verify data integrity
        sc_bv<AXIS_DATA_WIDTH> output_data = ext_out_data.read();
        for (size_t i = 0; i < test_data.size(); i++) {
            uint8_t received_byte = output_data.range(i*8+7, i*8).to_uint();
            assert(received_byte == test_data[i]);
        }
        
        std::cout << "  Data integrity verified!" << std::endl;
        
        // Wait for completion
        wait(100, SC_NS);
    }
    
    void test_multiple_packets_e2e() {
        std::cout << "Testing multiple packets end-to-end..." << std::endl;
        
        std::vector<std::vector<uint8_t>> test_packets = {
            {0x11, 0x22},
            {0x33, 0x44, 0x55},
            {0x66, 0x77, 0x88, 0x99}
        };
        
        for (size_t p = 0; p < test_packets.size(); p++) {
            std::cout << "  Sending packet " << (p+1) << " of " << test_packets.size() << std::endl;
            
            send_external_packet(test_packets[p]);
            
            // Wait for this packet to complete
            int timeout = 0;
            while (!ext_out_valid.read() && timeout < 500) {
                wait(clk.posedge_event());
                timeout++;
            }
            
            if (timeout >= 500) {
                std::cout << "  ERROR: Timeout for packet " << (p+1) << std::endl;
                assert(false);
            }
            
            std::cout << "  Packet " << (p+1) << " completed in " << timeout << " cycles" << std::endl;
            
            // Wait between packets
            wait(50, SC_NS);
        }
        
        std::cout << "  All " << test_packets.size() << " packets processed successfully!" << std::endl;
    }
    
    void send_external_packet(const std::vector<uint8_t>& data) {
        // Simple packet transmission
        sc_bv<AXIS_DATA_WIDTH> tdata = 0;
        sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
        
        // Pack data into single beat
        for (size_t i = 0; i < data.size() && i < (AXIS_DATA_WIDTH/8); i++) {
            tdata.range(i*8+7, i*8) = data[i];
            tkeep[i] = 1;
        }
        
        // Send for exactly one cycle
        ext_in_data.write(tdata);
        ext_in_keep.write(tkeep);
        ext_in_last.write(true);
        ext_in_valid.write(true);
        
        wait(clk.posedge_event());
        
        ext_in_valid.write(false);
        ext_in_last.write(false);
        
        wait(clk.posedge_event());
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "Starting End-to-End Pipeline Integration Test..." << std::endl;
    
    TestEndToEndPipeline test_module("test_end_to_end_pipeline");
    
    sc_start();
    
    return 0;
}
