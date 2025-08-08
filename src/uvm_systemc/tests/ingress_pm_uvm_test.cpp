#include <systemc>
#include <uvm>
#include "../port_manager/ingress_port_manager.h"
#include "../common/switch_types.h"

using namespace sc_core;
using namespace uvm;
using namespace switch_internal_p2p;

// =============================================================================
// UVM Transaction for External Interface
// =============================================================================
class external_transaction : public uvm_sequence_item {
public:
    std::vector<uint8_t> packet_data;
    bool last_beat;
    
    UVM_OBJECT_UTILS(external_transaction)
    
    external_transaction(const std::string& name = "external_transaction") 
        : uvm_sequence_item(name), last_beat(false) {
    }
    
    virtual std::string convert2string() const {
        std::ostringstream str;
        str << "packet_size=" << packet_data.size() << " last=" << last_beat;
        return str.str();
    }
    
    void create_test_packet(uint8_t dest_port, uint16_t payload_size) {
        packet_data.clear();
        
        // Create external packet header
        ExternalPacketHeader header;
        header.channel_type = static_cast<uint8_t>(ChannelType::LOW_PRIORITY);
        header.queue_id = 0;
        header.dest_port = dest_port;
        header.source_port = 1;  // Source port
        header.total_packet_size = 9 + payload_size;  // Header + payload
        header.header_crc = 0x5A;  // Simple CRC
        
        // Serialize header
        uint8_t header_bytes[9];
        header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < 9; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        
        // Add payload
        for (uint16_t i = 0; i < payload_size; i++) {
            packet_data.push_back(0xAA + (i % 256));
        }
        
        last_beat = true;
    }
};

// =============================================================================
// UVM Driver for External Interface
// =============================================================================
class external_driver : public uvm_driver<external_transaction> {
public:
    // SystemC signals to connect to DUT
    sc_signal<bool>* ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>>* ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>>* ext_keep;
    sc_signal<bool>* ext_last;
    sc_signal<bool>* ext_ready;
    sc_clock* clk;
    
    UVM_COMPONENT_UTILS(external_driver)
    
    external_driver(uvm_component_name name) : uvm_driver<external_transaction>(name) {
        ext_valid = nullptr;
        ext_data = nullptr;
        ext_keep = nullptr;
        ext_last = nullptr;
        ext_ready = nullptr;
        clk = nullptr;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "External Driver: Starting run phase" << std::endl;
        
        if (!ext_valid || !ext_data || !ext_keep || !ext_last || !ext_ready || !clk) {
            UVM_ERROR(get_name(), "Driver signals not connected!");
            return;
        }
        
        // Initialize outputs
        ext_valid->write(false);
        ext_data->write(0);
        ext_keep->write(0);
        ext_last->write(false);
        
        // Wait for reset to complete
        wait(50, SC_NS);
        
        // Send test packets
        for (int i = 0; i < 3; i++) {
            external_transaction* txn = new external_transaction("test_txn");
            txn->create_test_packet(i + 1, 64);  // Different dest ports, 64 byte payload
            
            send_packet(txn);
            wait(100, SC_NS);  // Gap between packets
            
            delete txn;
        }
        
        std::cout << "External Driver: Completed run phase" << std::endl;
    }
    
private:
    void send_packet(external_transaction* txn) {
        std::cout << "Driver: Sending packet " << txn->convert2string() << std::endl;
        
        // Wait for DUT to be ready
        while (!ext_ready->read()) {
            wait(10, SC_NS);
        }
        
        // Send packet data in AXIS_DATA_WIDTH chunks
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;  // 64 bytes per beat
        size_t total_bytes = txn->packet_data.size();
        size_t bytes_sent = 0;
        
        while (bytes_sent < total_bytes) {
            // Prepare data and keep signals
            sc_bv<AXIS_DATA_WIDTH> data_word = 0;
            sc_bv<AXIS_KEEP_WIDTH> keep_word = 0;
            
            size_t bytes_this_beat = std::min(bytes_per_beat, total_bytes - bytes_sent);
            
            for (size_t i = 0; i < bytes_this_beat; i++) {
                uint8_t byte_val = txn->packet_data[bytes_sent + i];
                data_word.range(i*8+7, i*8) = byte_val;
                keep_word[i] = 1;
            }
            
            // Drive signals
            ext_data->write(data_word);
            ext_keep->write(keep_word);
            ext_last->write((bytes_sent + bytes_this_beat) >= total_bytes);
            ext_valid->write(true);
            
            // Wait for clock and check ready
            wait(10, SC_NS);
            while (!ext_ready->read()) {
                wait(10, SC_NS);
            }
            
            bytes_sent += bytes_this_beat;
        }
        
        // End transaction
        ext_valid->write(false);
        ext_last->write(false);
        wait(10, SC_NS);
    }
};

// =============================================================================
// UVM Monitor for AXIS Interface
// =============================================================================
class axis_monitor : public uvm_monitor {
public:
    // SystemC signals to connect to DUT
    sc_signal<bool>* axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>>* axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>>* axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>>* axis_tuser;
    sc_signal<bool>* axis_tlast;
    sc_signal<bool>* axis_tready;
    sc_clock* clk;
    
    UVM_COMPONENT_UTILS(axis_monitor)
    
    axis_monitor(uvm_component_name name) : uvm_monitor(name) {
        axis_tvalid = nullptr;
        axis_tdata = nullptr;
        axis_tkeep = nullptr;
        axis_tuser = nullptr;
        axis_tlast = nullptr;
        axis_tready = nullptr;
        clk = nullptr;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "AXIS Monitor: Starting run phase" << std::endl;
        
        if (!axis_tvalid || !axis_tdata || !axis_tkeep || !axis_tuser || !axis_tlast || !axis_tready || !clk) {
            UVM_ERROR(get_name(), "Monitor signals not connected!");
            return;
        }
        
        int packets_observed = 0;
        
        while (packets_observed < 3) {  // Monitor for 3 packets
            wait(10, SC_NS);
            
            if (axis_tvalid->read() && axis_tready->read()) {
                sc_bv<AXIS_DATA_WIDTH> data = axis_tdata->read();
                sc_bv<AXIS_KEEP_WIDTH> keep = axis_tkeep->read();
                sc_bv<AXIS_USER_WIDTH> user = axis_tuser->read();
                bool last = axis_tlast->read();
                
                std::cout << "Monitor: AXIS transaction - valid=" << axis_tvalid->read() 
                          << " last=" << last 
                          << " user=0x" << std::hex << user.to_uint64() << std::dec
                          << std::endl;
                
                if (last) {
                    packets_observed++;
                    std::cout << "Monitor: Packet " << packets_observed << " completed" << std::endl;
                }
            }
        }
        
        std::cout << "AXIS Monitor: Completed run phase" << std::endl;
    }
};

// =============================================================================
// UVM Agent
// =============================================================================
class ingress_pm_agent : public uvm_agent {
public:
    external_driver* driver;
    axis_monitor* monitor;
    
    UVM_COMPONENT_UTILS(ingress_pm_agent)
    
    ingress_pm_agent(uvm_component_name name) : uvm_agent(name) {
        driver = nullptr;
        monitor = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_agent::build_phase(phase);
        
        driver = external_driver::type_id::create("driver", this);
        monitor = axis_monitor::type_id::create("monitor", this);
        
        std::cout << "Agent: Build phase completed" << std::endl;
    }
};

// =============================================================================
// UVM Environment
// =============================================================================
class ingress_pm_env : public uvm_env {
public:
    ingress_pm_agent* agent;
    
    UVM_COMPONENT_UTILS(ingress_pm_env)
    
    ingress_pm_env(uvm_component_name name) : uvm_env(name) {
        agent = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_env::build_phase(phase);
        
        agent = ingress_pm_agent::type_id::create("agent", this);
        
        std::cout << "Environment: Build phase completed" << std::endl;
    }
};

// =============================================================================
// UVM Test
// =============================================================================
class ingress_pm_test : public uvm_test {
public:
    ingress_pm_env* env;
    
    UVM_COMPONENT_UTILS(ingress_pm_test)
    
    ingress_pm_test(uvm_component_name name) : uvm_test(name) {
        env = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_test::build_phase(phase);
        
        env = ingress_pm_env::type_id::create("env", this);
        
        std::cout << "Test: Build phase completed" << std::endl;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "Test: Starting run phase" << std::endl;
        phase.raise_objection(this);
        
        // Let the test run
        wait(1000, SC_NS);
        
        std::cout << "Test: Completed successfully" << std::endl;
        phase.drop_objection(this);
    }
};

// =============================================================================
// SystemC Testbench Module
// =============================================================================
SC_MODULE(ingress_pm_testbench) {
    // Clock and reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External interface signals
    sc_signal<bool> ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_signal<bool> ext_last;
    sc_signal<bool> ext_ready;
    
    // AXIS interface signals
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // AXI interface signals (simplified)
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Credit interface signals
    sc_signal<bool> credit_return_valid;
    sc_signal<bool> credit_return_ready;
    
    // DUT instance
    IngressPortManager* dut;
    
    // UVM test instance
    ingress_pm_test* test;
    
    SC_CTOR(ingress_pm_testbench) : clk("clk", 10, SC_NS) {
        // Create DUT
        dut = new IngressPortManager("dut");
        
        // Connect DUT
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // External interface
        dut->ext_valid(ext_valid);
        dut->ext_data(ext_data);
        dut->ext_keep(ext_keep);
        dut->ext_last(ext_last);
        dut->ext_ready(ext_ready);
        
        // AXIS interface
        dut->axis_tvalid(axis_tvalid);
        dut->axis_tdata(axis_tdata);
        dut->axis_tkeep(axis_tkeep);
        dut->axis_tuser(axis_tuser);
        dut->axis_tlast(axis_tlast);
        dut->axis_tready(axis_tready);
        
        // AXI interface
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
        dut->set_port_id(1);
        
        // Create UVM test
        test = ingress_pm_test::type_id::create("test", nullptr);
        
        // Connect UVM components to signals
        if (test && test->env && test->env->agent) {
            if (test->env->agent->driver) {
                test->env->agent->driver->ext_valid = &ext_valid;
                test->env->agent->driver->ext_data = &ext_data;
                test->env->agent->driver->ext_keep = &ext_keep;
                test->env->agent->driver->ext_last = &ext_last;
                test->env->agent->driver->ext_ready = &ext_ready;
                test->env->agent->driver->clk = &clk;
            }
            
            if (test->env->agent->monitor) {
                test->env->agent->monitor->axis_tvalid = &axis_tvalid;
                test->env->agent->monitor->axis_tdata = &axis_tdata;
                test->env->agent->monitor->axis_tkeep = &axis_tkeep;
                test->env->agent->monitor->axis_tuser = &axis_tuser;
                test->env->agent->monitor->axis_tlast = &axis_tlast;
                test->env->agent->monitor->axis_tready = &axis_tready;
                test->env->agent->monitor->clk = &clk;
            }
        }
        
        // Initialize control signals
        SC_THREAD(reset_process);
        SC_THREAD(axis_ready_process);
        SC_THREAD(axi_ready_process);
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "Reset sequence completed" << std::endl;
    }
    
    void axis_ready_process() {
        axis_tready.write(true);  // Always ready for testing
    }
    
    void axi_ready_process() {
        axi_master_ready.write(true);  // Always ready for testing
        axi_slave_valid.write(false);  // No AXI transactions for now
    }
    
    ~ingress_pm_testbench() {
        delete dut;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Ingress Port Manager UVM Test ===" << std::endl;
    
    // Create testbench
    ingress_pm_testbench tb("testbench");
    
    // Run UVM test
    run_test();
    
    std::cout << "=== Test completed successfully ===" << std::endl;
    return 0;
}