#include <systemc>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/common/switch_types.h"
#include <queue>
#include <vector>

using namespace sc_core;
using namespace switch_internal_p2p;

// =============================================================================
// UVM-Style Transaction Class (without UVM dependency)
// =============================================================================
class packet_transaction {
public:
    uint8_t dest_port;
    uint8_t source_port;
    uint16_t payload_size;
    std::vector<uint8_t> payload_data;
    ChannelType channel_type;
    uint8_t queue_id;
    bool expect_crc_pass;
    bool expect_forwarding;
    
    // Transaction ID for tracking
    static int next_id;
    int transaction_id;
    
    packet_transaction() : dest_port(0), source_port(1), payload_size(64),
                          channel_type(ChannelType::LOW_PRIORITY), queue_id(0), 
                          expect_crc_pass(true), expect_forwarding(true) {
        transaction_id = next_id++;
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
        header.header_crc = header.calculate_crc();
        return header;
    }
    
    std::vector<uint8_t> create_packet_data() const {
        std::vector<uint8_t> packet_data;
        
        ExternalPacketHeader header = create_header();
        uint8_t header_bytes[9];
        header.serialize_to_bytes(header_bytes);
        for (int i = 0; i < 9; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        
        packet_data.insert(packet_data.end(), payload_data.begin(), payload_data.end());
        return packet_data;
    }
    
    std::string to_string() const {
        std::ostringstream str;
        str << "TXN[" << transaction_id << "] dest=" << (int)dest_port 
            << " src=" << (int)source_port << " payload_size=" << payload_size 
            << " channel=" << (int)channel_type << " queue=" << (int)queue_id;
        return str.str();
    }
};

int packet_transaction::next_id = 1;

// =============================================================================
// UVM-Style Driver (without UVM dependency)
// =============================================================================
SC_MODULE(packet_driver) {
    // Interface signals
    sc_out<bool> ext_valid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_out<bool> ext_last;
    sc_in<bool> ext_ready;
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Transaction queue
    std::queue<packet_transaction*> transaction_queue;
    
    // Statistics
    int transactions_sent;
    int transactions_completed;
    
    SC_CTOR(packet_driver) : transactions_sent(0), transactions_completed(0) {
        SC_THREAD(driver_process);
        sensitive << clk.pos();
        
        // Initialize outputs
        ext_valid.initialize(false);
        ext_data.initialize(0);
        ext_keep.initialize(0);
        ext_last.initialize(false);
    }
    
    void add_transaction(packet_transaction* txn) {
        transaction_queue.push(txn);
        std::cout << "[DRIVER] Queued " << txn->to_string() << std::endl;
    }
    
    void driver_process() {
        // Wait for reset
        while (!rst_n.read()) {
            wait();
        }
        
        std::cout << "[DRIVER] Started after reset" << std::endl;
        
        while (true) {
            if (!transaction_queue.empty()) {
                packet_transaction* txn = transaction_queue.front();
                transaction_queue.pop();
                
                std::cout << "[DRIVER] Driving " << txn->to_string() << std::endl;
                drive_transaction(txn);
                
                transactions_sent++;
                transactions_completed++;
                
                delete txn;  // Clean up transaction
                
                // Wait a few cycles between packets
                for (int i = 0; i < 10; i++) {
                    wait();
                }
            } else {
                wait();
            }
        }
    }
    
private:
    void drive_transaction(packet_transaction* txn) {
        std::vector<uint8_t> packet_data = txn->create_packet_data();
        
        // Wait for DUT to be ready
        int ready_wait_cycles = 0;
        while (!ext_ready.read() && ready_wait_cycles < 100) {
            wait();
            ready_wait_cycles++;
        }
        
        if (!ext_ready.read()) {
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
            ext_data.write(data_word);
            ext_keep.write(keep_word);
            ext_last.write((bytes_sent + bytes_this_beat) >= total_bytes);
            ext_valid.write(true);
            
            // Wait for clock and check ready
            wait();
            int beat_wait_cycles = 0;
            while (!ext_ready.read() && beat_wait_cycles < 50) {
                wait();
                beat_wait_cycles++;
            }
            
            if (!ext_ready.read()) {
                std::cout << "[DRIVER] ERROR: DUT not ready during packet transmission" << std::endl;
                break;
            }
            
            bytes_sent += bytes_this_beat;
        }
        
        // End transaction
        ext_valid.write(false);
        ext_last.write(false);
        
        std::cout << "[DRIVER] " << txn->to_string() << " sent successfully (" 
                  << total_bytes << " bytes)" << std::endl;
    }
};

// =============================================================================
// UVM-Style Monitor (without UVM dependency)
// =============================================================================
SC_MODULE(axis_monitor) {
    // Interface signals
    sc_in<bool> axis_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_in<bool> axis_tlast;
    sc_in<bool> axis_tready;
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Observed transactions
    std::vector<packet_transaction*> observed_transactions;
    
    // Statistics
    int packets_observed;
    int beats_observed;
    
    SC_CTOR(axis_monitor) : packets_observed(0), beats_observed(0) {
        SC_THREAD(monitor_process);
        sensitive << clk.pos();
    }
    
    void monitor_process() {
        // Wait for reset
        while (!rst_n.read()) {
            wait();
        }
        
        std::cout << "[MONITOR] Started after reset" << std::endl;
        
        while (true) {
            if (axis_tvalid.read() && axis_tready.read()) {
                packet_transaction* observed_txn = monitor_axis_transaction();
                if (observed_txn) {
                    packets_observed++;
                    observed_transactions.push_back(observed_txn);
                    
                    std::cout << "[MONITOR] Observed " << observed_txn->to_string() << std::endl;
                }
            }
            wait();
        }
    }
    
private:
    packet_transaction* monitor_axis_transaction() {
        std::vector<uint8_t> packet_data;
        sc_bv<AXIS_USER_WIDTH> first_user = 0;
        bool first_beat = true;
        
        do {
            if (axis_tvalid.read() && axis_tready.read()) {
                sc_bv<AXIS_DATA_WIDTH> data = axis_tdata.read();
                sc_bv<AXIS_KEEP_WIDTH> keep = axis_tkeep.read();
                sc_bv<AXIS_USER_WIDTH> user = axis_tuser.read();
                bool last = axis_tlast.read();
                
                beats_observed++;
                
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
                
                std::cout << "[MONITOR] AXIS beat - last=" << last 
                          << " user=0x" << std::hex << user.to_uint64() << std::dec
                          << " bytes=" << packet_data.size() << std::endl;
                
                if (last) break;
            }
            
            wait();
        } while (true);
        
        // Create transaction from observed data
        if (packet_data.size() >= 9) {
            packet_transaction* txn = new packet_transaction();
            
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
// UVM-Style Scoreboard (without UVM dependency)
// =============================================================================
SC_MODULE(packet_scoreboard) {
    // Statistics
    int expected_packets;
    int actual_packets;
    int matches;
    int mismatches;
    
    // Reference queues
    std::queue<packet_transaction*> expected_queue;
    std::vector<packet_transaction*> actual_queue;
    
    SC_CTOR(packet_scoreboard) : expected_packets(0), actual_packets(0), 
                                matches(0), mismatches(0) {
    }
    
    void expect_transaction(packet_transaction* txn) {
        expected_queue.push(txn);
        expected_packets++;
        std::cout << "[SCOREBOARD] Expected " << txn->to_string() << std::endl;
    }
    
    void observe_transaction(packet_transaction* txn) {
        actual_queue.push_back(txn);
        actual_packets++;
        std::cout << "[SCOREBOARD] Observed " << txn->to_string() << std::endl;
        
        // Try to match with expected
        if (!expected_queue.empty()) {
            packet_transaction* expected = expected_queue.front();
            expected_queue.pop();
            
            if (compare_transactions(expected, txn)) {
                matches++;
                std::cout << "[SCOREBOARD] ✅ MATCH: Expected vs Observed" << std::endl;
            } else {
                mismatches++;
                std::cout << "[SCOREBOARD] ❌ MISMATCH: Expected " << expected->to_string() 
                          << " vs Observed " << txn->to_string() << std::endl;
            }
            
            delete expected;  // Clean up expected transaction
        }
    }
    
    void print_final_report() {
        std::cout << "\n=== UVM-STYLE SCOREBOARD REPORT ===" << std::endl;
        std::cout << "Expected transactions: " << expected_packets << std::endl;
        std::cout << "Actual transactions: " << actual_packets << std::endl;
        std::cout << "Matches: " << matches << std::endl;
        std::cout << "Mismatches: " << mismatches << std::endl;
        
        if (expected_packets == actual_packets && mismatches == 0) {
            std::cout << "✅ SCOREBOARD: All transactions verified successfully!" << std::endl;
        } else {
            std::cout << "❌ SCOREBOARD: Verification failed!" << std::endl;
        }
        std::cout << "====================================" << std::endl;
    }
    
private:
    bool compare_transactions(packet_transaction* expected, packet_transaction* actual) {
        return (expected->dest_port == actual->dest_port &&
                expected->source_port == actual->source_port &&
                expected->payload_size == actual->payload_size &&
                expected->channel_type == actual->channel_type &&
                expected->queue_id == actual->queue_id);
    }
};

// =============================================================================
// UVM-Style Sequence Generator (without UVM dependency)
// =============================================================================
SC_MODULE(packet_sequence_generator) {
    packet_driver* driver;
    packet_scoreboard* scoreboard;
    
    SC_CTOR(packet_sequence_generator) {
        driver = nullptr;
        scoreboard = nullptr;
        SC_THREAD(generate_sequences);
    }
    
    void set_driver(packet_driver* drv) { driver = drv; }
    void set_scoreboard(packet_scoreboard* sb) { scoreboard = sb; }
    
    void generate_sequences() {
        // Wait a bit for reset and initialization
        wait(100, SC_NS);
        
        std::cout << "[SEQUENCE] Starting UVM-style test sequences" << std::endl;
        
        // Sequence 1: Basic packet sequence
        generate_basic_sequence();
        
        // Sequence 2: Multiple packet sizes
        generate_size_variation_sequence();
        
        // Sequence 3: Different destinations
        generate_destination_sequence();
        
        std::cout << "[SEQUENCE] All sequences generated" << std::endl;
    }
    
private:
    void generate_basic_sequence() {
        std::cout << "[SEQUENCE] Generating basic packet sequence" << std::endl;
        
        for (int i = 0; i < 3; i++) {
            packet_transaction* txn = new packet_transaction();
            txn->dest_port = 2 + i;
            txn->source_port = 1;
            txn->payload_size = 32;
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = 0;
            txn->generate_default_payload();
            
            // Send to driver and expect in scoreboard
            if (driver) {
                packet_transaction* expected_copy = new packet_transaction(*txn);
                driver->add_transaction(txn);
                
                if (scoreboard) {
                    scoreboard->expect_transaction(expected_copy);
                }
            }
        }
    }
    
    void generate_size_variation_sequence() {
        std::cout << "[SEQUENCE] Generating size variation sequence" << std::endl;
        
        uint16_t sizes[] = {64, 128, 256};
        for (int i = 0; i < 3; i++) {
            packet_transaction* txn = new packet_transaction();
            txn->dest_port = 5;
            txn->source_port = 1;
            txn->payload_size = sizes[i];
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = 0;
            txn->generate_default_payload();
            
            if (driver) {
                packet_transaction* expected_copy = new packet_transaction(*txn);
                driver->add_transaction(txn);
                
                if (scoreboard) {
                    scoreboard->expect_transaction(expected_copy);
                }
            }
        }
    }
    
    void generate_destination_sequence() {
        std::cout << "[SEQUENCE] Generating destination variation sequence" << std::endl;
        
        for (int dest = 6; dest <= 8; dest++) {
            packet_transaction* txn = new packet_transaction();
            txn->dest_port = dest;
            txn->source_port = 1;
            txn->payload_size = 96;
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = 0;
            txn->generate_default_payload();
            
            if (driver) {
                packet_transaction* expected_copy = new packet_transaction(*txn);
                driver->add_transaction(txn);
                
                if (scoreboard) {
                    scoreboard->expect_transaction(expected_copy);
                }
            }
        }
    }
};

// =============================================================================
// UVM-Style Test Environment (without UVM dependency)
// =============================================================================
SC_MODULE(uvm_style_testbench) {
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
    
    // DUT and verification components
    IngressPortManager* dut;
    packet_driver* driver;
    axis_monitor* monitor;
    packet_scoreboard* scoreboard;
    packet_sequence_generator* sequence_gen;
    
    SC_CTOR(uvm_style_testbench) : clk("clk", 10, SC_NS) {
        // Create DUT
        dut = new IngressPortManager("dut");
        
        // Connect DUT
        dut->clk(clk);
        dut->rst_n(rst_n);
        dut->ext_valid(ext_valid);
        dut->ext_data(ext_data);
        dut->ext_keep(ext_keep);
        dut->ext_last(ext_last);
        dut->ext_ready(ext_ready);
        dut->axis_tvalid(axis_tvalid);
        dut->axis_tdata(axis_tdata);
        dut->axis_tkeep(axis_tkeep);
        dut->axis_tuser(axis_tuser);
        dut->axis_tlast(axis_tlast);
        dut->axis_tready(axis_tready);
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        dut->credit_return_valid(credit_return_valid);
        dut->credit_return_ready(credit_return_ready);
        dut->set_port_id(1);
        
        // Create verification components
        driver = new packet_driver("driver");
        monitor = new axis_monitor("monitor");
        scoreboard = new packet_scoreboard("scoreboard");
        sequence_gen = new packet_sequence_generator("sequence_gen");
        
        // Connect driver
        driver->ext_valid(ext_valid);
        driver->ext_data(ext_data);
        driver->ext_keep(ext_keep);
        driver->ext_last(ext_last);
        driver->ext_ready(ext_ready);
        driver->clk(clk);
        driver->rst_n(rst_n);
        
        // Connect monitor
        monitor->axis_tvalid(axis_tvalid);
        monitor->axis_tdata(axis_tdata);
        monitor->axis_tkeep(axis_tkeep);
        monitor->axis_tuser(axis_tuser);
        monitor->axis_tlast(axis_tlast);
        monitor->axis_tready(axis_tready);
        monitor->clk(clk);
        monitor->rst_n(rst_n);
        
        // Connect sequence generator
        sequence_gen->set_driver(driver);
        sequence_gen->set_scoreboard(scoreboard);
        
        // Control processes
        SC_THREAD(reset_process);
        SC_THREAD(control_signals_process);
        SC_THREAD(test_controller);
        SC_THREAD(observation_process);
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[TB] Reset sequence completed" << std::endl;
    }
    
    void control_signals_process() {
        axis_tready.write(true);
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        credit_return_valid.write(false);
    }
    
    void observation_process() {
        // Wait for reset
        wait(50, SC_NS);
        
        // Periodically check for observed transactions and pass to scoreboard
        while (true) {
            if (!monitor->observed_transactions.empty()) {
                packet_transaction* observed = monitor->observed_transactions.back();
                monitor->observed_transactions.pop_back();
                scoreboard->observe_transaction(observed);
            }
            wait(50, SC_NS);
        }
    }
    
    void test_controller() {
        // Wait for test completion
        wait(5000, SC_NS);
        
        std::cout << "\n[TB] Test completed - generating final report" << std::endl;
        
        // Print statistics
        std::cout << "\n=== UVM-Style Final Test Statistics ===" << std::endl;
        std::cout << "Driver transactions sent: " << driver->transactions_sent << std::endl;
        std::cout << "Monitor packets observed: " << monitor->packets_observed << std::endl;
        std::cout << "Monitor beats observed: " << monitor->beats_observed << std::endl;
        std::cout << "DUT packets received: " << dut->get_packets_received() << std::endl;
        std::cout << "DUT packets forwarded: " << dut->get_packets_forwarded() << std::endl;
        
        // Print scoreboard report
        scoreboard->print_final_report();
        
        // Final verification
        bool test_passed = (driver->transactions_sent == monitor->packets_observed) &&
                          (driver->transactions_sent == (int)dut->get_packets_received()) &&
                          (driver->transactions_sent == (int)dut->get_packets_forwarded()) &&
                          (scoreboard->mismatches == 0);
        
        if (test_passed) {
            std::cout << "\n🎉 ✅ UVM-STYLE TEST PASSED!" << std::endl;
        } else {
            std::cout << "\n❌ UVM-STYLE TEST FAILED!" << std::endl;
        }
        
        std::cout << "=======================================" << std::endl;
        
        sc_stop();
    }
    
    ~uvm_style_testbench() {
        delete dut;
        delete driver;
        delete monitor;
        delete scoreboard;
        delete sequence_gen;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== UVM-Style SystemC Verification Environment ===" << std::endl;
    std::cout << "UVM methodology with pure SystemC implementation" << std::endl;
    
    // Create testbench
    uvm_style_testbench tb("uvm_style_testbench");
    
    // Run simulation
    sc_start();
    
    std::cout << "=== UVM-Style Test completed ===" << std::endl;
    return 0;
}