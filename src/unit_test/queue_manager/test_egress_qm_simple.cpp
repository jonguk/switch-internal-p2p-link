/*
 * Simple Egress Queue Manager Test
 * Tests basic AXIS signal reception and packet processing
 */

#include "systemc.h"
#include "../../systemc/queue_manager/egress_queue_manager.h"
#include "../../systemc/common/switch_types.h"
#include <iostream>

using namespace switch_internal_p2p;

SC_MODULE(SimpleEgressQMTest) {
public:
    // Clock and Reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // DUT
    EgressQueueManager* dut;
    
    // Internal AXIS signals (from router)
    sc_signal<bool> internal_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> internal_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> internal_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> internal_tuser;
    sc_signal<sc_bv<AXIS_DEST_WIDTH>> internal_tdest;
    sc_signal<bool> internal_tlast;
    sc_signal<bool> internal_tready;
    
    // External AXIS signals (to external port)
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // AXI signals (dummy)
    sc_signal<bool> axi_master_valid, axi_master_ready;
    sc_signal<sc_bv<32>> axi_master_addr, axi_master_data;
    sc_signal<bool> axi_slave_valid, axi_slave_ready;
    sc_signal<sc_bv<32>> axi_slave_addr, axi_slave_data;
    
    // Credit return signals (dummy)
    sc_signal<bool> credit_return_valid, credit_return_ready;
    sc_signal<CreditInfo> credit_return_info;
    
    // Constructor
    SC_CTOR(SimpleEgressQMTest) : clk("clk", 5, SC_NS) {
        // Create DUT
        dut = new EgressQueueManager("egress_qm");
        dut->clk(clk);
        dut->rst_n(rst_n);
        dut->set_port_id(0);  // Set port ID
        
        // Connect internal AXIS (from router)
        dut->internal_tvalid(internal_tvalid);
        dut->internal_tdata(internal_tdata);
        dut->internal_tkeep(internal_tkeep);
        dut->internal_tuser(internal_tuser);
        dut->internal_tdest(internal_tdest);
        dut->internal_tlast(internal_tlast);
        dut->internal_tready(internal_tready);
        
        // Connect external AXIS (to external port)
        dut->axis_tvalid(axis_tvalid);
        dut->axis_tdata(axis_tdata);
        dut->axis_tkeep(axis_tkeep);
        dut->axis_tuser(axis_tuser);
        dut->axis_tlast(axis_tlast);
        dut->axis_tready(axis_tready);
        
        // Connect AXI (dummy connections)
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Connect credit return (dummy)
        dut->credit_return_valid(credit_return_valid);
        dut->credit_return_info(credit_return_info);
        dut->credit_return_ready(credit_return_ready);
        
        // Register test process
        SC_THREAD(test_process);
        
        // Register reset control process
        SC_THREAD(reset_process);
    }
    
    ~SimpleEgressQMTest() {
        delete dut;
    }
    
    void reset_process() {
        rst_n.write(false);
        for (int i = 0; i < 5; i++) {
            wait(clk.posedge_event());
        }
        rst_n.write(true);
        std::cout << "✅ Reset released" << std::endl;
    }
    
    void test_process() {
        // Wait for reset release
        while (!rst_n.read()) {
            wait(clk.posedge_event());
        }
        
        // Initialize signals
        std::cout << "🚀 Starting Simple Egress QM Test..." << std::endl;
        
        // Initialize all signals
        internal_tvalid.write(false);
        internal_tdata.write(sc_bv<AXIS_DATA_WIDTH>("0"));
        internal_tkeep.write(sc_bv<AXIS_KEEP_WIDTH>("0"));
        internal_tuser.write(sc_bv<AXIS_USER_WIDTH>("0"));
        internal_tdest.write(sc_bv<AXIS_DEST_WIDTH>("0"));
        internal_tlast.write(false);
        
        axis_tready.write(true);  // Always ready to receive output
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        axi_slave_addr.write(sc_bv<32>("0"));
        axi_slave_data.write(sc_bv<32>("0"));
        credit_return_info.write(CreditInfo());  // Default CreditInfo
        credit_return_ready.write(true);
        
        for (int i = 0; i < 10; i++) {
            wait(clk.posedge_event());  // Wait for initialization
        }
        
        std::cout << "✅ Initialization complete" << std::endl;
        
        // Test 1: Send a simple packet
        std::cout << "🔄 Test 1: Sending simple packet..." << std::endl;
        send_simple_packet();
        
        for (int i = 0; i < 50; i++) {
            wait(clk.posedge_event());  // Wait for processing
        }
        
        std::cout << "✅ Simple Egress QM Test completed!" << std::endl;
        sc_stop();
    }
    
    void send_simple_packet() {
        // Create simple test header
        InternalHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        header.queue_id = 0;
        header.dest_port = 1;
        header.source_port = 0;
        header.packet_length = 8;
        header.sequence_number = 1;
        header.header_crc = 0x12;
        
        // Convert header to tuser
        sc_bv<AXIS_USER_WIDTH> tuser_bv = header.to_sc_bv();
        
        // Create simple payload
        sc_bv<AXIS_DATA_WIDTH> tdata = 0;
        sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
        
        // Set 8 bytes of payload data
        for (int i = 0; i < 8; i++) {
            uint8_t byte_val = 0x10 + i;  // Simple pattern: 0x10, 0x11, 0x12, ...
            for (int bit = 0; bit < 8; bit++) {
                tdata[i * 8 + bit] = (byte_val >> bit) & 1;
            }
            tkeep[i] = 1;  // Mark byte as valid
        }
        
        std::cout << "[Test] 📤 Sending AXIS packet: tuser=" << std::hex << tuser_bv.to_uint64() << std::dec << std::endl;
        
        // Send AXIS beat
        wait(clk.posedge_event());  // Wait for clock edge
        internal_tvalid.write(true);
        internal_tdata.write(tdata);
        internal_tkeep.write(tkeep);
        internal_tuser.write(tuser_bv);
        internal_tdest.write(sc_bv<AXIS_DEST_WIDTH>("0"));
        internal_tlast.write(true);  // Single beat packet
        
        // Wait for ready
        while (!internal_tready.read()) {
            wait(clk.posedge_event());
        }
        
        wait(clk.posedge_event());  // Clock edge for transmission
        
        // End transmission
        internal_tvalid.write(false);
        internal_tlast.write(false);
        
        std::cout << "[Test] ✅ AXIS packet sent" << std::endl;
    }
};

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv;
    
    SimpleEgressQMTest test("simple_egress_qm_test");
    
    // Enable VCD tracing
    sc_trace_file* tf = sc_create_vcd_trace_file("simple_egress_qm_test");
    sc_trace(tf, test.clk, "clk");
    sc_trace(tf, test.rst_n, "rst_n");
    sc_trace(tf, test.internal_tvalid, "internal_tvalid");
    sc_trace(tf, test.internal_tdata, "internal_tdata");
    sc_trace(tf, test.internal_tready, "internal_tready");
    sc_trace(tf, test.axis_tvalid, "axis_tvalid");
    sc_trace(tf, test.axis_tdata, "axis_tdata");
    
    // Run simulation
    sc_start();
    
    sc_close_vcd_trace_file(tf);
    return 0;
}