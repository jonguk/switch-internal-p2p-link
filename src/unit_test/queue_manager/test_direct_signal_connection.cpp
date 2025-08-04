/*
 * Direct Signal Connection Test
 * Tests signal propagation without Port Router complexity
 */

#include "systemc.h"
#include "../../systemc/queue_manager/egress_queue_manager.h"  
#include "../../systemc/common/switch_types.h"
#include <iostream>

using namespace switch_internal_p2p;

SC_MODULE(DirectSignalTest) {
public:
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // Two DUTs to test signal passing
    EgressQueueManager* sender_qm;   // Pretends to be a "router" 
    EgressQueueManager* receiver_qm; // Actual egress QM
    
    // Direct signals between DUTs (bypass Port Router)
    sc_signal<bool> direct_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> direct_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> direct_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> direct_tuser;
    sc_signal<sc_bv<AXIS_DEST_WIDTH>> direct_tdest;
    sc_signal<bool> direct_tlast;
    sc_signal<bool> direct_tready;
    
    // External signals for testing
    sc_signal<bool> test_input_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> test_input_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> test_input_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> test_input_tuser;
    sc_signal<sc_bv<AXIS_DEST_WIDTH>> test_input_tdest;
    sc_signal<bool> test_input_tlast;
    sc_signal<bool> test_input_tready;
    
    sc_signal<bool> test_output_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> test_output_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> test_output_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> test_output_tuser;
    sc_signal<bool> test_output_tlast;
    sc_signal<bool> test_output_tready;
    
    // AXI signals for sender
    sc_signal<bool> sender_axi_master_valid, sender_axi_master_ready;
    sc_signal<sc_bv<32>> sender_axi_master_addr, sender_axi_master_data;
    sc_signal<bool> sender_axi_slave_valid, sender_axi_slave_ready;
    sc_signal<sc_bv<32>> sender_axi_slave_addr, sender_axi_slave_data;
    
    // AXI signals for receiver
    sc_signal<bool> receiver_axi_master_valid, receiver_axi_master_ready;
    sc_signal<sc_bv<32>> receiver_axi_master_addr, receiver_axi_master_data;
    sc_signal<bool> receiver_axi_slave_valid, receiver_axi_slave_ready;
    sc_signal<sc_bv<32>> receiver_axi_slave_addr, receiver_axi_slave_data;
    
    // Credit return signals for sender
    sc_signal<bool> sender_credit_return_valid, sender_credit_return_ready;
    sc_signal<CreditInfo> sender_credit_return_info;
    
    // Credit return signals for receiver
    sc_signal<bool> receiver_credit_return_valid, receiver_credit_return_ready;
    sc_signal<CreditInfo> receiver_credit_return_info;
    
    // Shared credits for both DUTs
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> sender_shared_credits;
    std::array<sc_signal<uint16_t>, MAX_QUEUES_PER_PORT> receiver_shared_credits;
    
    // Constructor
    SC_CTOR(DirectSignalTest) : clk("clk", 5, SC_NS) {
        // Create both DUTs
        sender_qm = new EgressQueueManager("sender_qm");
        receiver_qm = new EgressQueueManager("receiver_qm");
        
        // Connect sender (acts as router)
        connect_sender();
        
        // Connect receiver (actual egress QM)
        connect_receiver();
        
        // Register processes
        SC_THREAD(reset_process);
        SC_THREAD(test_process);
        SC_THREAD(signal_monitor);
    }
    
    void connect_sender() {
        sender_qm->clk(clk);
        sender_qm->rst_n(rst_n);
        sender_qm->set_port_id(0);
        
        // Connect test input to sender's internal input
        sender_qm->internal_tvalid(test_input_tvalid);
        sender_qm->internal_tdata(test_input_tdata);
        sender_qm->internal_tkeep(test_input_tkeep);
        sender_qm->internal_tuser(test_input_tuser);  
        sender_qm->internal_tdest(test_input_tdest);
        sender_qm->internal_tlast(test_input_tlast);
        sender_qm->internal_tready(test_input_tready);
        
        // Connect sender's external output to direct signals
        sender_qm->axis_tvalid(direct_tvalid);
        sender_qm->axis_tdata(direct_tdata);
        sender_qm->axis_tkeep(direct_tkeep);
        sender_qm->axis_tuser(direct_tuser);
        sender_qm->axis_tlast(direct_tlast);
        sender_qm->axis_tready(direct_tready);
        
        // Connect AXI (sender)
        sender_qm->axi_master_valid(sender_axi_master_valid);
        sender_qm->axi_master_addr(sender_axi_master_addr);
        sender_qm->axi_master_data(sender_axi_master_data);
        sender_qm->axi_master_ready(sender_axi_master_ready);
        sender_qm->axi_slave_valid(sender_axi_slave_valid);
        sender_qm->axi_slave_addr(sender_axi_slave_addr);
        sender_qm->axi_slave_data(sender_axi_slave_data);
        sender_qm->axi_slave_ready(sender_axi_slave_ready);
        
        // Connect credit return (sender)
        sender_qm->credit_return_valid(sender_credit_return_valid);
        sender_qm->credit_return_info(sender_credit_return_info);
        sender_qm->credit_return_ready(sender_credit_return_ready);
        
        // Initialize and connect shared credits (sender)
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            sender_shared_credits[i].write(DEFAULT_CREDITS);
        }
        sender_qm->set_shared_credits(&sender_shared_credits);
    }
    
    void connect_receiver() {
        receiver_qm->clk(clk);
        receiver_qm->rst_n(rst_n);
        receiver_qm->set_port_id(1);
        
        // Connect direct signals to receiver's internal input
        receiver_qm->internal_tvalid(direct_tvalid);
        receiver_qm->internal_tdata(direct_tdata);
        receiver_qm->internal_tkeep(direct_tkeep);
        receiver_qm->internal_tuser(direct_tuser);
        receiver_qm->internal_tdest(direct_tdest);
        receiver_qm->internal_tlast(direct_tlast);
        receiver_qm->internal_tready(direct_tready);
        
        // Connect receiver's external output to test output
        receiver_qm->axis_tvalid(test_output_tvalid);
        receiver_qm->axis_tdata(test_output_tdata);
        receiver_qm->axis_tkeep(test_output_tkeep);
        receiver_qm->axis_tuser(test_output_tuser);
        receiver_qm->axis_tlast(test_output_tlast);
        receiver_qm->axis_tready(test_output_tready);
        
        // Connect AXI (receiver)
        receiver_qm->axi_master_valid(receiver_axi_master_valid);
        receiver_qm->axi_master_addr(receiver_axi_master_addr);
        receiver_qm->axi_master_data(receiver_axi_master_data);
        receiver_qm->axi_master_ready(receiver_axi_master_ready);
        receiver_qm->axi_slave_valid(receiver_axi_slave_valid);
        receiver_qm->axi_slave_addr(receiver_axi_slave_addr);
        receiver_qm->axi_slave_data(receiver_axi_slave_data);
        receiver_qm->axi_slave_ready(receiver_axi_slave_ready);
        
        // Connect credit return (receiver)
        receiver_qm->credit_return_valid(receiver_credit_return_valid);
        receiver_qm->credit_return_info(receiver_credit_return_info);
        receiver_qm->credit_return_ready(receiver_credit_return_ready);
        
        // Initialize and connect shared credits (receiver)
        for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
            receiver_shared_credits[i].write(DEFAULT_CREDITS);
        }
        receiver_qm->set_shared_credits(&receiver_shared_credits);
    }
    
    ~DirectSignalTest() {
        delete sender_qm;
        delete receiver_qm;
    }
    
    void reset_process() {
        rst_n.write(false);
        for (int i = 0; i < 5; i++) {
            wait(clk.posedge_event());
        }
        rst_n.write(true);
        std::cout << "✅ Reset released" << std::endl;
    }
    
    void signal_monitor() {
        wait(rst_n.posedge_event());
        wait(clk.posedge_event());
        
        while (true) {
            wait(clk.posedge_event());
            
            // Monitor direct signal propagation
            if (direct_tvalid.read()) {
                std::cout << "[Monitor] 🔍 DIRECT SIGNAL: tvalid=1, tready=" 
                         << (direct_tready.read() ? "1" : "0") 
                         << ", tlast=" << (direct_tlast.read() ? "1" : "0") << std::endl;
            }
            
            // Monitor test output
            if (test_output_tvalid.read()) {
                std::cout << "[Monitor] 📤 OUTPUT SIGNAL: tvalid=1, tready=" 
                         << (test_output_tready.read() ? "1" : "0")
                         << ", tlast=" << (test_output_tlast.read() ? "1" : "0") << std::endl;
            }
        }
    }
    
    void test_process() {
        // Wait for reset release
        wait(rst_n.posedge_event());
        
        std::cout << "🚀 Starting Direct Signal Connection Test..." << std::endl;
        
        // Initialize all signals
        test_input_tvalid.write(false);
        test_input_tdata.write(sc_bv<AXIS_DATA_WIDTH>("0"));
        test_input_tkeep.write(sc_bv<AXIS_KEEP_WIDTH>("0"));
        test_input_tuser.write(sc_bv<AXIS_USER_WIDTH>("0"));
        test_input_tdest.write(sc_bv<AXIS_DEST_WIDTH>("0"));
        test_input_tlast.write(false);
        
        test_output_tready.write(true);  // Always ready to receive output
        
        // Initialize sender AXI signals
        sender_axi_master_ready.write(true);
        sender_axi_slave_valid.write(false);
        sender_axi_slave_addr.write(sc_bv<32>("0"));
        sender_axi_slave_data.write(sc_bv<32>("0"));
        sender_credit_return_info.write(CreditInfo());
        sender_credit_return_ready.write(true);
        
        // Initialize receiver AXI signals
        receiver_axi_master_ready.write(true);
        receiver_axi_slave_valid.write(false);
        receiver_axi_slave_addr.write(sc_bv<32>("0"));
        receiver_axi_slave_data.write(sc_bv<32>("0"));
        receiver_credit_return_info.write(CreditInfo());
        receiver_credit_return_ready.write(true);
        
        for (int i = 0; i < 10; i++) {
            wait(clk.posedge_event());
        }
        
        std::cout << "✅ Initialization complete" << std::endl;
        
        // Test: Send packet through the chain
        std::cout << "🔄 Test: Sending packet through sender->receiver chain..." << std::endl;
        send_test_packet();
        
        for (int i = 0; i < 100; i++) {
            wait(clk.posedge_event());
        }
        
        std::cout << "✅ Direct Signal Connection Test completed!" << std::endl;
        sc_stop();
    }
    
    void send_test_packet() {
        // Create test header
        InternalHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        header.queue_id = 0;
        header.dest_port = 1;
        header.source_port = 0;
        header.packet_length = 8;
        header.sequence_number = 1;
        header.header_crc = 0x12;
        
        sc_bv<AXIS_USER_WIDTH> tuser_bv = header.to_sc_bv();
        
        // Create payload
        sc_bv<AXIS_DATA_WIDTH> tdata = 0;
        sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
        
        for (int i = 0; i < 8; i++) {
            uint8_t byte_val = 0x20 + i;
            for (int bit = 0; bit < 8; bit++) {
                tdata[i * 8 + bit] = (byte_val >> bit) & 1;
            }
            tkeep[i] = 1;
        }
        
        std::cout << "[Test] 📤 Sending test packet through chain..." << std::endl;
        
        // Send to test input (sender QM internal input)
        wait(clk.posedge_event());
        test_input_tvalid.write(true);
        test_input_tdata.write(tdata);
        test_input_tkeep.write(tkeep);
        test_input_tuser.write(tuser_bv);
        test_input_tdest.write(sc_bv<AXIS_DEST_WIDTH>("1"));  // Target receiver
        test_input_tlast.write(true);
        
        // Wait for ready
        int timeout = 0;
        while (!test_input_tready.read() && timeout < 100) {
            wait(clk.posedge_event());
            timeout++;
        }
        
        if (timeout >= 100) {
            std::cout << "[Test] ⚠️  TIMEOUT waiting for test_input_tready" << std::endl;
            return;
        }
        
        wait(clk.posedge_event());
        
        // End transmission
        test_input_tvalid.write(false);
        test_input_tlast.write(false);
        
        std::cout << "[Test] ✅ Test packet sent to sender QM" << std::endl;
    }
};

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv;
    
    DirectSignalTest test("direct_signal_test");
    
    // Enable VCD tracing
    sc_trace_file* tf = sc_create_vcd_trace_file("direct_signal_test");
    sc_trace(tf, test.clk, "clk");
    sc_trace(tf, test.rst_n, "rst_n");
    sc_trace(tf, test.test_input_tvalid, "test_input_tvalid");
    sc_trace(tf, test.test_input_tready, "test_input_tready");
    sc_trace(tf, test.direct_tvalid, "direct_tvalid");
    sc_trace(tf, test.direct_tready, "direct_tready");
    sc_trace(tf, test.test_output_tvalid, "test_output_tvalid");
    sc_trace(tf, test.test_output_tready, "test_output_tready");
    
    // Run simulation
    sc_start();
    
    sc_close_vcd_trace_file(tf);
    return 0;
}