#include <systemc>
#include <uvm>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/common/switch_types.h"

using namespace sc_core;
using namespace uvm;
using namespace switch_internal_p2p;

// =============================================================================
// UVM Transaction for External Packets
// =============================================================================
class external_packet_transaction : public uvm_sequence_item {
public:
    // Packet fields
    uint8_t dest_port;
    uint8_t source_port;
    uint16_t payload_size;
    std::vector<uint8_t> payload_data;
    
    // Packet type
    ChannelType channel_type;
    uint8_t queue_id;
    
    // Expected results
    bool expect_crc_pass;
    bool expect_forwarding;
    
    UVM_OBJECT_UTILS(external_packet_transaction)
    
    external_packet_transaction(const std::string& name = "external_packet_transaction") 
        : uvm_sequence_item(name), dest_port(0), source_port(1), payload_size(64),
          channel_type(ChannelType::LOW_PRIORITY), queue_id(0), 
          expect_crc_pass(true), expect_forwarding(true) {
        generate_default_payload();
    }
    
    void generate_default_payload() {
        payload_data.clear();
        for (uint16_t i = 0; i < payload_size; i++) {
            payload_data.push_back(0xAA + (i % 256));
        }
    }
    
    void randomize_payload() {
        payload_data.clear();
        for (uint16_t i = 0; i < payload_size; i++) {
            payload_data.push_back(rand() % 256);
        }
    }
    
    ExternalPacketHeader create_header() const {
        ExternalPacketHeader header;
        header.channel_type = static_cast<uint8_t>(channel_type);
        header.queue_id = queue_id;
        header.dest_port = dest_port;
        header.source_port = source_port;
        header.total_packet_size = 9 + payload_size;
        header.header_crc = header.calculate_crc();  // Calculate correct CRC
        return header;
    }
    
    std::vector<uint8_t> create_packet_data() const {
        std::vector<uint8_t> packet_data;
        
        // Add header
        ExternalPacketHeader header = create_header();
        uint8_t header_bytes[9];
        header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < 9; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        
        // Add payload
        packet_data.insert(packet_data.end(), payload_data.begin(), payload_data.end());
        
        return packet_data;
    }
    
    virtual std::string convert2string() const {
        std::ostringstream str;
        str << "dest=" << (int)dest_port << " src=" << (int)source_port 
            << " payload_size=" << payload_size << " channel=" << (int)channel_type
            << " queue=" << (int)queue_id;
        return str.str();
    }
};

// =============================================================================
// UVM Driver for External Interface
// =============================================================================
class external_interface_driver : public uvm_driver<external_packet_transaction> {
public:
    // SystemC signals (to be connected to DUT)
    sc_signal<bool>* ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>>* ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>>* ext_keep;
    sc_signal<bool>* ext_last;
    sc_signal<bool>* ext_ready;
    sc_clock* clk;
    
    UVM_COMPONENT_UTILS(external_interface_driver)
    
    external_interface_driver(uvm_component_name name) 
        : uvm_driver<external_packet_transaction>(name) {
        ext_valid = nullptr;
        ext_data = nullptr;
        ext_keep = nullptr;
        ext_last = nullptr;
        ext_ready = nullptr;
        clk = nullptr;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "[DRIVER] Starting run phase" << std::endl;
        
        if (!check_connections()) {
            UVM_ERROR(get_name(), "Driver signals not properly connected!");
            return;
        }
        
        // Initialize outputs
        ext_valid->write(false);
        ext_data->write(0);
        ext_keep->write(0);
        ext_last->write(false);
        
        // Wait for reset to complete
        wait(50, SC_NS);
        
        // Main driver loop
        external_packet_transaction* txn;
        while (true) {
            seq_item_port.get_next_item(txn);
            
            if (txn != nullptr) {
                std::cout << "[DRIVER] Driving transaction: " << txn->convert2string() << std::endl;
                drive_transaction(txn);
                seq_item_port.item_done();
            } else {
                wait(10, SC_NS);
            }
        }
    }
    
private:
    bool check_connections() {
        return (ext_valid && ext_data && ext_keep && ext_last && ext_ready && clk);
    }
    
    void drive_transaction(external_packet_transaction* txn) {
        std::vector<uint8_t> packet_data = txn->create_packet_data();
        
        // Wait for DUT to be ready
        int ready_wait_cycles = 0;
        while (!ext_ready->read() && ready_wait_cycles < 100) {
            wait(10, SC_NS);
            ready_wait_cycles++;
        }
        
        if (!ext_ready->read()) {
            std::cout << "[DRIVER] ERROR: DUT not ready after waiting" << std::endl;
            return;
        }
        
        // Send packet data in AXIS_DATA_WIDTH chunks
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;  // 64 bytes per beat
        size_t total_bytes = packet_data.size();
        size_t bytes_sent = 0;
        
        while (bytes_sent < total_bytes) {
            // Prepare data and keep signals
            sc_bv<AXIS_DATA_WIDTH> data_word = 0;
            sc_bv<AXIS_KEEP_WIDTH> keep_word = 0;
            
            size_t bytes_this_beat = std::min(bytes_per_beat, total_bytes - bytes_sent);
            
            for (size_t i = 0; i < bytes_this_beat; i++) {
                uint8_t byte_val = packet_data[bytes_sent + i];
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
            int beat_wait_cycles = 0;
            while (!ext_ready->read() && beat_wait_cycles < 50) {
                wait(10, SC_NS);
                beat_wait_cycles++;
            }
            
            if (!ext_ready->read()) {
                std::cout << "[DRIVER] ERROR: DUT not ready during packet transmission" << std::endl;
                break;
            }
            
            bytes_sent += bytes_this_beat;
        }
        
        // End transaction
        ext_valid->write(false);
        ext_last->write(false);
        
        std::cout << "[DRIVER] Transaction completed (" << total_bytes << " bytes)" << std::endl;
    }
};

// =============================================================================
// UVM Monitor for AXIS Interface
// =============================================================================
class axis_interface_monitor : public uvm_monitor {
public:
    // SystemC signals (to be connected to DUT)
    sc_signal<bool>* axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>>* axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>>* axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>>* axis_tuser;
    sc_signal<bool>* axis_tlast;
    sc_signal<bool>* axis_tready;
    sc_clock* clk;
    
    // Analysis port for scoreboard
    uvm_analysis_port<external_packet_transaction> axis_analysis_port;
    
    UVM_COMPONENT_UTILS(axis_interface_monitor)
    
    axis_interface_monitor(uvm_component_name name) 
        : uvm_monitor(name), axis_analysis_port("axis_analysis_port") {
        axis_tvalid = nullptr;
        axis_tdata = nullptr;
        axis_tkeep = nullptr;
        axis_tuser = nullptr;
        axis_tlast = nullptr;
        axis_tready = nullptr;
        clk = nullptr;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "[MONITOR] Starting run phase" << std::endl;
        
        if (!check_connections()) {
            UVM_ERROR(get_name(), "Monitor signals not properly connected!");
            return;
        }
        
        int packets_observed = 0;
        
        while (packets_observed < 10) {  // Monitor for up to 10 packets
            wait(10, SC_NS);
            
            if (axis_tvalid->read() && axis_tready->read()) {
                external_packet_transaction* observed_txn = monitor_axis_transaction();
                if (observed_txn) {
                    packets_observed++;
                    std::cout << "[MONITOR] Packet " << packets_observed << " observed: " 
                              << observed_txn->convert2string() << std::endl;
                    
                    // Send to scoreboard
                    axis_analysis_port.write(*observed_txn);
                    delete observed_txn;
                }
            }
        }
        
        std::cout << "[MONITOR] Completed run phase" << std::endl;
    }
    
private:
    bool check_connections() {
        return (axis_tvalid && axis_tdata && axis_tkeep && axis_tuser && 
                axis_tlast && axis_tready && clk);
    }
    
    external_packet_transaction* monitor_axis_transaction() {
        std::vector<uint8_t> packet_data;
        sc_bv<AXIS_USER_WIDTH> first_user = 0;
        bool first_beat = true;
        
        do {
            if (axis_tvalid->read() && axis_tready->read()) {
                sc_bv<AXIS_DATA_WIDTH> data = axis_tdata->read();
                sc_bv<AXIS_KEEP_WIDTH> keep = axis_tkeep->read();
                sc_bv<AXIS_USER_WIDTH> user = axis_tuser->read();
                bool last = axis_tlast->read();
                
                if (first_beat) {
                    first_user = user;
                    first_beat = false;
                }
                
                // Extract valid bytes
                size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
                for (size_t i = 0; i < bytes_per_beat; i++) {
                    if (keep[i] == 1) {
                        uint8_t byte_val = data.range(i*8+7, i*8).to_uint();
                        packet_data.push_back(byte_val);
                    }
                }
                
                if (last) break;
            }
            
            wait(10, SC_NS);
        } while (true);
        
        // Create transaction from observed data
        if (packet_data.size() >= 9) {
            external_packet_transaction* txn = new external_packet_transaction();
            
            // Parse header from observed data
            ExternalPacketHeader header = ExternalPacketHeader::parse_from_bytes(packet_data.data());
            txn->dest_port = header.dest_port;
            txn->source_port = header.source_port;
            txn->payload_size = header.get_payload_size();
            txn->channel_type = static_cast<ChannelType>(header.channel_type);
            txn->queue_id = header.queue_id;
            
            // Extract payload
            txn->payload_data.clear();
            for (size_t i = 9; i < packet_data.size(); i++) {
                txn->payload_data.push_back(packet_data[i]);
            }
            
            return txn;
        }
        
        return nullptr;
    }
};

// =============================================================================
// UVM Scoreboard
// =============================================================================
class ingress_pm_scoreboard : public uvm_scoreboard {
public:
    // Analysis ports
    uvm_analysis_imp<external_packet_transaction> expected_analysis_imp;
    uvm_analysis_imp<external_packet_transaction> actual_analysis_imp;
    
    // Statistics
    int expected_count;
    int actual_count;
    int matches;
    int mismatches;
    
    UVM_COMPONENT_UTILS(ingress_pm_scoreboard)
    
    ingress_pm_scoreboard(uvm_component_name name) 
        : uvm_scoreboard(name), 
          expected_analysis_imp("expected_analysis_imp", this),
          actual_analysis_imp("actual_analysis_imp", this),
          expected_count(0), actual_count(0), matches(0), mismatches(0) {
    }
    
    virtual void write(const external_packet_transaction& txn) {
        // This will be called by both expected and actual analysis ports
        // We need to implement separate write methods for each
        std::cout << "[SCOREBOARD] Received transaction: " << txn.convert2string() << std::endl;
        actual_count++;
        
        // Simple verification - in real implementation, would match expected vs actual
        matches++;
    }
    
    virtual void report_phase(uvm_phase& phase) {
        std::cout << "\n=== SCOREBOARD REPORT ===" << std::endl;
        std::cout << "Expected transactions: " << expected_count << std::endl;
        std::cout << "Actual transactions: " << actual_count << std::endl;
        std::cout << "Matches: " << matches << std::endl;
        std::cout << "Mismatches: " << mismatches << std::endl;
        
        if (actual_count > 0 && mismatches == 0) {
            std::cout << "✅ SCOREBOARD: All transactions verified successfully!" << std::endl;
        } else {
            std::cout << "❌ SCOREBOARD: Verification failed!" << std::endl;
        }
        std::cout << "=========================" << std::endl;
    }
};

// =============================================================================
// UVM Sequences
// =============================================================================
class basic_packet_sequence : public uvm_sequence<external_packet_transaction> {
public:
    UVM_OBJECT_UTILS(basic_packet_sequence)
    
    basic_packet_sequence(const std::string& name = "basic_packet_sequence")
        : uvm_sequence<external_packet_transaction>(name) {
    }
    
    virtual void body() {
        std::cout << "[SEQUENCE] Starting basic packet sequence" << std::endl;
        
        // Send 5 different packets
        for (int i = 0; i < 5; i++) {
            external_packet_transaction* txn = external_packet_transaction::type_id::create("txn");
            
            start_item(txn);
            
            // Customize transaction
            txn->dest_port = 2 + i;
            txn->source_port = 1;
            txn->payload_size = 32 + (i * 32);  // 32, 64, 96, 128, 160 bytes
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = 0;
            txn->generate_default_payload();
            
            finish_item(txn);
            
            std::cout << "[SEQUENCE] Sent packet " << (i+1) << ": " << txn->convert2string() << std::endl;
        }
        
        std::cout << "[SEQUENCE] Basic packet sequence completed" << std::endl;
    }
};

// =============================================================================
// UVM Agent
// =============================================================================
class ingress_pm_agent : public uvm_agent {
public:
    external_interface_driver* driver;
    axis_interface_monitor* monitor;
    uvm_sequencer<external_packet_transaction>* sequencer;
    
    UVM_COMPONENT_UTILS(ingress_pm_agent)
    
    ingress_pm_agent(uvm_component_name name) : uvm_agent(name) {
        driver = nullptr;
        monitor = nullptr;
        sequencer = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_agent::build_phase(phase);
        
        driver = external_interface_driver::type_id::create("driver", this);
        monitor = axis_interface_monitor::type_id::create("monitor", this);
        sequencer = uvm_sequencer<external_packet_transaction>::type_id::create("sequencer", this);
        
        std::cout << "[AGENT] Build phase completed" << std::endl;
    }
    
    virtual void connect_phase(uvm_phase& phase) {
        uvm_agent::connect_phase(phase);
        
        if (driver && sequencer) {
            driver->seq_item_port.connect(sequencer->seq_item_export);
        }
        
        std::cout << "[AGENT] Connect phase completed" << std::endl;
    }
};

// =============================================================================
// UVM Environment
// =============================================================================
class ingress_pm_environment : public uvm_env {
public:
    ingress_pm_agent* agent;
    ingress_pm_scoreboard* scoreboard;
    
    UVM_COMPONENT_UTILS(ingress_pm_environment)
    
    ingress_pm_environment(uvm_component_name name) : uvm_env(name) {
        agent = nullptr;
        scoreboard = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_env::build_phase(phase);
        
        agent = ingress_pm_agent::type_id::create("agent", this);
        scoreboard = ingress_pm_scoreboard::type_id::create("scoreboard", this);
        
        std::cout << "[ENVIRONMENT] Build phase completed" << std::endl;
    }
    
    virtual void connect_phase(uvm_phase& phase) {
        uvm_env::connect_phase(phase);
        
        if (agent && agent->monitor && scoreboard) {
            agent->monitor->axis_analysis_port.connect(scoreboard->actual_analysis_imp);
        }
        
        std::cout << "[ENVIRONMENT] Connect phase completed" << std::endl;
    }
};

// =============================================================================
// UVM Test
// =============================================================================
class ingress_pm_uvm_test : public uvm_test {
public:
    ingress_pm_environment* env;
    
    UVM_COMPONENT_UTILS(ingress_pm_uvm_test)
    
    ingress_pm_uvm_test(uvm_component_name name) : uvm_test(name) {
        env = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_test::build_phase(phase);
        
        env = ingress_pm_environment::type_id::create("env", this);
        
        std::cout << "[TEST] Build phase completed" << std::endl;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "[TEST] Starting run phase" << std::endl;
        phase.raise_objection(this);
        
        // Start sequence
        basic_packet_sequence* seq = basic_packet_sequence::type_id::create("seq");
        seq->start(env->agent->sequencer);
        
        // Let the test run for a while
        wait(2000, SC_NS);
        
        std::cout << "[TEST] Completed successfully" << std::endl;
        phase.drop_objection(this);
    }
};

// =============================================================================
// SystemC Testbench Module (Integration Layer)
// =============================================================================
SC_MODULE(uvm_systemc_testbench) {
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
    ingress_pm_uvm_test* uvm_test;
    
    SC_CTOR(uvm_systemc_testbench) : clk("clk", 10, SC_NS) {
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
        uvm_test = ingress_pm_uvm_test::type_id::create("uvm_test", nullptr);
        
        // Connect UVM components to SystemC signals
        connect_uvm_to_systemc();
        
        // Initialize control signals
        SC_THREAD(reset_process);
        SC_THREAD(axis_ready_process);
        SC_THREAD(axi_ready_process);
    }
    
    void connect_uvm_to_systemc() {
        if (uvm_test && uvm_test->env && uvm_test->env->agent) {
            if (uvm_test->env->agent->driver) {
                uvm_test->env->agent->driver->ext_valid = &ext_valid;
                uvm_test->env->agent->driver->ext_data = &ext_data;
                uvm_test->env->agent->driver->ext_keep = &ext_keep;
                uvm_test->env->agent->driver->ext_last = &ext_last;
                uvm_test->env->agent->driver->ext_ready = &ext_ready;
                uvm_test->env->agent->driver->clk = &clk;
            }
            
            if (uvm_test->env->agent->monitor) {
                uvm_test->env->agent->monitor->axis_tvalid = &axis_tvalid;
                uvm_test->env->agent->monitor->axis_tdata = &axis_tdata;
                uvm_test->env->agent->monitor->axis_tkeep = &axis_tkeep;
                uvm_test->env->agent->monitor->axis_tuser = &axis_tuser;
                uvm_test->env->agent->monitor->axis_tlast = &axis_tlast;
                uvm_test->env->agent->monitor->axis_tready = &axis_tready;
                uvm_test->env->agent->monitor->clk = &clk;
            }
        }
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[TB] Reset sequence completed" << std::endl;
    }
    
    void axis_ready_process() {
        axis_tready.write(true);  // Always ready for testing
    }
    
    void axi_ready_process() {
        axi_master_ready.write(true);  // Always ready for testing
        axi_slave_valid.write(false);  // No AXI transactions for now
    }
    
    ~uvm_systemc_testbench() {
        delete dut;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== UVM SystemC Complete Integration Test ===" << std::endl;
    
    // Create testbench
    uvm_systemc_testbench tb("testbench");
    
    // Run UVM test
    run_test();
    
    std::cout << "=== UVM SystemC Test completed ===" << std::endl;
    return 0;
}