#include <systemc>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/common/switch_types.h"
#include <queue>
#include <vector>
#include <map>
#include <string>
#include <iomanip>
#include <fstream>
#include <sstream>

using namespace sc_core;
using namespace switch_internal_p2p;

// =============================================================================
// Simplified FC4SC-style Coverage (without actual FC4SC library for now)
// =============================================================================
class simplified_fc4sc_coverage {
private:
    std::map<uint8_t, int> dest_port_bins;
    std::map<std::string, int> size_bins;
    std::map<uint8_t, int> channel_type_bins;
    std::map<uint8_t, int> queue_id_bins;
    std::map<std::pair<uint8_t, std::string>, int> cross_dest_size;
    
    int total_samples;
    
public:
    simplified_fc4sc_coverage() : total_samples(0) {
        std::cout << "[SIMPLIFIED-FC4SC] Coverage model initialized" << std::endl;
    }
    
    void sample_packet(uint8_t dest_port, uint16_t payload_size, uint8_t channel_type, uint8_t queue_id) {
        dest_port_bins[dest_port]++;
        
        // Categorize packet sizes
        std::string size_category;
        if (payload_size <= 64) size_category = "small";
        else if (payload_size <= 256) size_category = "medium";
        else if (payload_size <= 512) size_category = "large";
        else size_category = "huge";
        
        size_bins[size_category]++;
        channel_type_bins[channel_type]++;
        queue_id_bins[queue_id]++;
        
        // Cross coverage
        cross_dest_size[{dest_port, size_category}]++;
        
        total_samples++;
    }
    
    void print_coverage_report() {
        std::cout << "\n=== SIMPLIFIED FC4SC COVERAGE REPORT ===" << std::endl;
        std::cout << "Total Samples: " << total_samples << std::endl;
        
        // Calculate overall coverage
        double dest_coverage = (double)dest_port_bins.size() / 8.0 * 100.0;  // 8 ports
        double size_coverage = (double)size_bins.size() / 4.0 * 100.0;       // 4 categories
        double channel_coverage = (double)channel_type_bins.size() / 2.0 * 100.0; // 2 types
        double queue_coverage = (double)queue_id_bins.size() / 4.0 * 100.0;  // 4 queues
        
        double overall_coverage = (dest_coverage + size_coverage + channel_coverage + queue_coverage) / 4.0;
        
        std::cout << "Overall Coverage: " << std::fixed << std::setprecision(1) << overall_coverage << "%" << std::endl;
        
        std::cout << "\n--- Coverpoint Coverage ---" << std::endl;
        std::cout << "Destination Ports (" << dest_port_bins.size() << "/8): " << std::fixed << std::setprecision(1) << dest_coverage << "%" << std::endl;
        for (auto& pair : dest_port_bins) {
            std::cout << "  Port " << (int)pair.first << ": " << pair.second << " packets" << std::endl;
        }
        
        std::cout << "Packet Sizes (" << size_bins.size() << "/4): " << std::fixed << std::setprecision(1) << size_coverage << "%" << std::endl;
        for (auto& pair : size_bins) {
            std::cout << "  " << pair.first << ": " << pair.second << " packets" << std::endl;
        }
        
        std::cout << "Channel Types (" << channel_type_bins.size() << "/2): " << std::fixed << std::setprecision(1) << channel_coverage << "%" << std::endl;
        for (auto& pair : channel_type_bins) {
            std::string type = (pair.first == 0) ? "LOW_PRIORITY" : "HIGH_PRIORITY";
            std::cout << "  " << type << ": " << pair.second << " packets" << std::endl;
        }
        
        std::cout << "Queue IDs (" << queue_id_bins.size() << "/4): " << std::fixed << std::setprecision(1) << queue_coverage << "%" << std::endl;
        for (auto& pair : queue_id_bins) {
            std::cout << "  Queue " << (int)pair.first << ": " << pair.second << " packets" << std::endl;
        }
        
        std::cout << "\n--- Cross Coverage ---" << std::endl;
        std::cout << "Destination x Size combinations: " << cross_dest_size.size() << std::endl;
        
        std::cout << "=========================================" << std::endl;
    }
    
    double get_overall_coverage() {
        double dest_coverage = (double)dest_port_bins.size() / 8.0 * 100.0;
        double size_coverage = (double)size_bins.size() / 4.0 * 100.0;
        double channel_coverage = (double)channel_type_bins.size() / 2.0 * 100.0;
        double queue_coverage = (double)queue_id_bins.size() / 4.0 * 100.0;
        return (dest_coverage + size_coverage + channel_coverage + queue_coverage) / 4.0;
    }
    
    void export_xml_report(const std::string& filename) {
        std::ofstream file(filename);
        file << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
        file << "<coverage_report>\n";
        file << "  <overall_coverage>" << std::fixed << std::setprecision(2) << get_overall_coverage() << "</overall_coverage>\n";
        file << "  <total_samples>" << total_samples << "</total_samples>\n";
        
        file << "  <coverpoints>\n";
        file << "    <destination_ports>\n";
        for (auto& pair : dest_port_bins) {
            file << "      <port id=\"" << (int)pair.first << "\" count=\"" << pair.second << "\"/>\n";
        }
        file << "    </destination_ports>\n";
        
        file << "    <packet_sizes>\n";
        for (auto& pair : size_bins) {
            file << "      <size category=\"" << pair.first << "\" count=\"" << pair.second << "\"/>\n";
        }
        file << "    </packet_sizes>\n";
        file << "  </coverpoints>\n";
        
        file << "  <cross_coverage>\n";
        for (auto& pair : cross_dest_size) {
            file << "    <cross dest=\"" << (int)pair.first.first << "\" size=\"" << pair.first.second << "\" count=\"" << pair.second << "\"/>\n";
        }
        file << "  </cross_coverage>\n";
        
        file << "</coverage_report>\n";
        file.close();
        
        std::cout << "[SIMPLIFIED-FC4SC] XML report exported to: " << filename << std::endl;
    }
};

// =============================================================================
// FC4SC-style Transaction Class
// =============================================================================
class fc4sc_style_transaction {
public:
    uint8_t dest_port;
    uint8_t source_port;
    uint16_t payload_size;
    std::vector<uint8_t> payload_data;
    ChannelType channel_type;
    uint8_t queue_id;
    bool expect_crc_pass;
    bool expect_forwarding;
    
    // Transaction metadata
    static int next_id;
    int transaction_id;
    sc_time start_time;
    sc_time end_time;
    int beat_count;
    bool crc_passed;
    
    fc4sc_style_transaction() : dest_port(0), source_port(1), payload_size(64),
                               channel_type(ChannelType::LOW_PRIORITY), queue_id(0), 
                               expect_crc_pass(true), expect_forwarding(true),
                               beat_count(1), crc_passed(true) {
        transaction_id = next_id++;
        start_time = sc_time_stamp();
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
        str << "FC4SC-STYLE-TXN[" << transaction_id << "] dest=" << (int)dest_port 
            << " src=" << (int)source_port << " payload_size=" << payload_size 
            << " channel=" << (int)channel_type << " queue=" << (int)queue_id
            << " beats=" << beat_count;
        return str.str();
    }
    
    void complete_transaction() {
        end_time = sc_time_stamp();
    }
    
    void sample_coverage(simplified_fc4sc_coverage& cov) {
        cov.sample_packet(dest_port, payload_size, static_cast<uint8_t>(channel_type), queue_id);
    }
};

int fc4sc_style_transaction::next_id = 1;

// =============================================================================
// FC4SC-style Driver
// =============================================================================
SC_MODULE(fc4sc_style_driver) {
    // Interface signals
    sc_out<bool> ext_valid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_out<bool> ext_last;
    sc_in<bool> ext_ready;
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Transaction queue
    std::queue<fc4sc_style_transaction*> transaction_queue;
    
    // Coverage reference
    simplified_fc4sc_coverage* coverage;
    
    // Statistics
    int transactions_sent;
    int transactions_completed;
    
    SC_CTOR(fc4sc_style_driver) : coverage(nullptr), 
                                 transactions_sent(0), transactions_completed(0) {
        SC_THREAD(driver_process);
        sensitive << clk.pos();
        
        ext_valid.initialize(false);
        ext_data.initialize(0);
        ext_keep.initialize(0);
        ext_last.initialize(false);
    }
    
    void set_coverage(simplified_fc4sc_coverage* cov) { coverage = cov; }
    
    void add_transaction(fc4sc_style_transaction* txn) {
        transaction_queue.push(txn);
        std::cout << "[FC4SC-STYLE-DRIVER] Queued " << txn->to_string() << std::endl;
    }
    
    void driver_process() {
        // Wait for reset
        while (!rst_n.read()) {
            wait();
        }
        
        std::cout << "[FC4SC-STYLE-DRIVER] Started after reset" << std::endl;
        
        while (true) {
            if (!transaction_queue.empty()) {
                fc4sc_style_transaction* txn = transaction_queue.front();
                transaction_queue.pop();
                
                std::cout << "[FC4SC-STYLE-DRIVER] Driving " << txn->to_string() << std::endl;
                drive_transaction(txn);
                
                txn->complete_transaction();
                transactions_sent++;
                transactions_completed++;
                
                // Sample coverage
                if (coverage) {
                    txn->sample_coverage(*coverage);
                }
                
                delete txn;
                
                // Variable gap between packets
                int gap_cycles = (rand() % 15) + 5;  // 5-19 cycles
                for (int i = 0; i < gap_cycles; i++) {
                    wait();
                }
            } else {
                wait();
            }
        }
    }
    
private:
    void drive_transaction(fc4sc_style_transaction* txn) {
        std::vector<uint8_t> packet_data = txn->create_packet_data();
        
        // Wait for DUT to be ready
        int ready_wait_cycles = 0;
        while (!ext_ready.read() && ready_wait_cycles < 100) {
            wait();
            ready_wait_cycles++;
        }
        
        if (!ext_ready.read()) {
            std::cout << "[FC4SC-STYLE-DRIVER] ERROR: DUT not ready after waiting" << std::endl;
            return;
        }
        
        // Send packet data and count beats
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t total_bytes = packet_data.size();
        size_t bytes_sent = 0;
        int beat_count = 0;
        
        while (bytes_sent < total_bytes) {
            sc_bv<AXIS_DATA_WIDTH> data_word = 0;
            sc_bv<AXIS_KEEP_WIDTH> keep_word = 0;
            
            size_t bytes_this_beat = std::min(bytes_per_beat, total_bytes - bytes_sent);
            
            for (size_t i = 0; i < bytes_this_beat; i++) {
                uint8_t byte_val = packet_data[bytes_sent + i];
                data_word.range(i*8+7, i*8) = byte_val;
                keep_word[i] = 1;
            }
            
            ext_data.write(data_word);
            ext_keep.write(keep_word);
            ext_last.write((bytes_sent + bytes_this_beat) >= total_bytes);
            ext_valid.write(true);
            
            wait();
            beat_count++;
            
            int beat_wait_cycles = 0;
            while (!ext_ready.read() && beat_wait_cycles < 50) {
                wait();
                beat_wait_cycles++;
            }
            
            if (!ext_ready.read()) {
                std::cout << "[FC4SC-STYLE-DRIVER] ERROR: DUT not ready during packet transmission" << std::endl;
                break;
            }
            
            bytes_sent += bytes_this_beat;
        }
        
        // Update transaction with actual beat count
        txn->beat_count = beat_count;
        
        ext_valid.write(false);
        ext_last.write(false);
        
        std::cout << "[FC4SC-STYLE-DRIVER] " << txn->to_string() << " sent successfully (" 
                  << total_bytes << " bytes, " << beat_count << " beats)" << std::endl;
    }
};

// =============================================================================
// FC4SC-style Monitor
// =============================================================================
SC_MODULE(fc4sc_style_monitor) {
    // Interface signals
    sc_in<bool> axis_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_in<bool> axis_tlast;
    sc_in<bool> axis_tready;
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Coverage reference
    simplified_fc4sc_coverage* coverage;
    
    // Observed transactions
    std::vector<fc4sc_style_transaction*> observed_transactions;
    
    // Statistics
    int packets_observed;
    int beats_observed;
    
    SC_CTOR(fc4sc_style_monitor) : coverage(nullptr), packets_observed(0), beats_observed(0) {
        SC_THREAD(monitor_process);
        sensitive << clk.pos();
    }
    
    void set_coverage(simplified_fc4sc_coverage* cov) { coverage = cov; }
    
    void monitor_process() {
        // Wait for reset
        while (!rst_n.read()) {
            wait();
        }
        
        std::cout << "[FC4SC-STYLE-MONITOR] Started after reset" << std::endl;
        
        while (true) {
            if (axis_tvalid.read() && axis_tready.read()) {
                fc4sc_style_transaction* observed_txn = monitor_axis_transaction();
                if (observed_txn) {
                    packets_observed++;
                    observed_transactions.push_back(observed_txn);
                    
                    // Sample coverage from observed transaction
                    if (coverage) {
                        observed_txn->sample_coverage(*coverage);
                    }
                    
                    std::cout << "[FC4SC-STYLE-MONITOR] Observed " << observed_txn->to_string() << std::endl;
                }
            }
            wait();
        }
    }
    
private:
    fc4sc_style_transaction* monitor_axis_transaction() {
        std::vector<uint8_t> packet_data;
        sc_bv<AXIS_USER_WIDTH> first_user = 0;
        bool first_beat = true;
        int beat_count = 0;
        
        do {
            if (axis_tvalid.read() && axis_tready.read()) {
                sc_bv<AXIS_DATA_WIDTH> data = axis_tdata.read();
                sc_bv<AXIS_KEEP_WIDTH> keep = axis_tkeep.read();
                sc_bv<AXIS_USER_WIDTH> user = axis_tuser.read();
                bool last = axis_tlast.read();
                
                beats_observed++;
                beat_count++;
                
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
            
            wait();
        } while (true);
        
        // Create transaction from observed data
        if (packet_data.size() >= 9) {
            fc4sc_style_transaction* txn = new fc4sc_style_transaction();
            
            // Parse header from observed data
            ExternalPacketHeader header = ExternalPacketHeader::parse_from_bytes(packet_data.data());
            txn->dest_port = header.dest_port;
            txn->source_port = header.source_port;
            txn->payload_size = header.get_payload_size();
            txn->channel_type = static_cast<ChannelType>(header.channel_type);
            txn->queue_id = header.queue_id;
            txn->beat_count = beat_count;
            txn->crc_passed = header.is_crc_valid();
            
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
// FC4SC-style Sequence Generator
// =============================================================================
SC_MODULE(fc4sc_style_sequence_generator) {
    fc4sc_style_driver* driver;
    simplified_fc4sc_coverage* coverage;
    
    SC_CTOR(fc4sc_style_sequence_generator) : driver(nullptr), coverage(nullptr) {
        SC_THREAD(generate_fc4sc_style_sequences);
    }
    
    void set_driver(fc4sc_style_driver* drv) { driver = drv; }
    void set_coverage(simplified_fc4sc_coverage* cov) { coverage = cov; }
    
    void generate_fc4sc_style_sequences() {
        wait(100, SC_NS);
        
        std::cout << "[FC4SC-STYLE-SEQ] Starting FC4SC-style coverage-driven test sequences" << std::endl;
        
        // Phase 1: Basic coverage for all destination ports
        generate_dest_port_coverage();
        
        // Phase 2: Packet size coverage
        generate_packet_size_coverage();
        
        // Phase 3: Channel type coverage
        generate_channel_type_coverage();
        
        // Phase 4: Queue ID coverage
        generate_queue_id_coverage();
        
        // Phase 5: Cross coverage scenarios
        generate_cross_coverage_scenarios();
        
        // Phase 6: Random coverage
        generate_random_coverage();
        
        std::cout << "[FC4SC-STYLE-SEQ] All FC4SC-style coverage sequences generated" << std::endl;
    }
    
private:
    void generate_dest_port_coverage() {
        std::cout << "[FC4SC-STYLE-SEQ] Generating destination port coverage (FC4SC style)" << std::endl;
        
        for (int dest = 1; dest <= 8; dest++) {
            fc4sc_style_transaction* txn = new fc4sc_style_transaction();
            txn->dest_port = dest;
            txn->source_port = 1;
            txn->payload_size = 32;
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = 0;
            txn->generate_default_payload();
            
            if (driver) {
                driver->add_transaction(txn);
            }
        }
    }
    
    void generate_packet_size_coverage() {
        std::cout << "[FC4SC-STYLE-SEQ] Generating packet size coverage (FC4SC style)" << std::endl;
        
        std::vector<uint16_t> sizes = {32, 64, 128, 256, 512, 1024};
        for (uint16_t size : sizes) {
            fc4sc_style_transaction* txn = new fc4sc_style_transaction();
            txn->dest_port = 2;
            txn->source_port = 1;
            txn->payload_size = size;
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = 0;
            txn->generate_default_payload();
            
            if (driver) {
                driver->add_transaction(txn);
            }
        }
    }
    
    void generate_channel_type_coverage() {
        std::cout << "[FC4SC-STYLE-SEQ] Generating channel type coverage (FC4SC style)" << std::endl;
        
        for (int ch = 0; ch <= 1; ch++) {
            fc4sc_style_transaction* txn = new fc4sc_style_transaction();
            txn->dest_port = 3;
            txn->source_port = 1;
            txn->payload_size = 96;
            txn->channel_type = static_cast<ChannelType>(ch);
            txn->queue_id = 0;
            txn->generate_default_payload();
            
            if (driver) {
                driver->add_transaction(txn);
            }
        }
    }
    
    void generate_queue_id_coverage() {
        std::cout << "[FC4SC-STYLE-SEQ] Generating queue ID coverage (FC4SC style)" << std::endl;
        
        for (int qid = 0; qid <= 3; qid++) {
            fc4sc_style_transaction* txn = new fc4sc_style_transaction();
            txn->dest_port = 4;
            txn->source_port = 1;
            txn->payload_size = 64;
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = qid;
            txn->generate_default_payload();
            
            if (driver) {
                driver->add_transaction(txn);
            }
        }
    }
    
    void generate_cross_coverage_scenarios() {
        std::cout << "[FC4SC-STYLE-SEQ] Generating cross coverage scenarios (FC4SC style)" << std::endl;
        
        // Different dest x size combinations
        std::vector<std::pair<uint8_t, uint16_t>> dest_size_pairs = {
            {5, 32}, {5, 256}, {6, 64}, {6, 512}, {7, 128}, {7, 1024}, {8, 256}
        };
        
        for (auto& pair : dest_size_pairs) {
            fc4sc_style_transaction* txn = new fc4sc_style_transaction();
            txn->dest_port = pair.first;
            txn->source_port = 1;
            txn->payload_size = pair.second;
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = 1;
            txn->generate_default_payload();
            
            if (driver) {
                driver->add_transaction(txn);
            }
        }
        
        // Different dest x channel combinations
        std::vector<std::pair<uint8_t, ChannelType>> dest_channel_pairs = {
            {1, ChannelType::HIGH_PRIORITY}, {2, ChannelType::HIGH_PRIORITY},
            {3, ChannelType::HIGH_PRIORITY}, {4, ChannelType::HIGH_PRIORITY}
        };
        
        for (auto& pair : dest_channel_pairs) {
            fc4sc_style_transaction* txn = new fc4sc_style_transaction();
            txn->dest_port = pair.first;
            txn->source_port = 1;
            txn->payload_size = 80;
            txn->channel_type = pair.second;
            txn->queue_id = 2;
            txn->generate_default_payload();
            
            if (driver) {
                driver->add_transaction(txn);
            }
        }
    }
    
    void generate_random_coverage() {
        std::cout << "[FC4SC-STYLE-SEQ] Generating random coverage scenarios (FC4SC style)" << std::endl;
        
        for (int i = 0; i < 12; i++) {
            fc4sc_style_transaction* txn = new fc4sc_style_transaction();
            txn->dest_port = (rand() % 8) + 1;
            txn->source_port = 1;
            txn->payload_size = 32 + (rand() % 300);  // 32-331 bytes
            txn->channel_type = static_cast<ChannelType>(rand() % 2);
            txn->queue_id = rand() % 4;
            txn->randomize_payload();
            
            if (driver) {
                driver->add_transaction(txn);
            }
        }
    }
};

// =============================================================================
// FC4SC-style Testbench
// =============================================================================
SC_MODULE(fc4sc_style_testbench) {
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
    fc4sc_style_driver* driver;
    fc4sc_style_monitor* monitor;
    fc4sc_style_sequence_generator* sequence_gen;
    simplified_fc4sc_coverage* coverage;
    
    SC_CTOR(fc4sc_style_testbench) : clk("clk", 10, SC_NS) {
        // Create simplified FC4SC coverage
        coverage = new simplified_fc4sc_coverage();
        
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
        driver = new fc4sc_style_driver("fc4sc_style_driver");
        monitor = new fc4sc_style_monitor("fc4sc_style_monitor");
        sequence_gen = new fc4sc_style_sequence_generator("fc4sc_style_sequence_gen");
        
        // Connect driver
        driver->ext_valid(ext_valid);
        driver->ext_data(ext_data);
        driver->ext_keep(ext_keep);
        driver->ext_last(ext_last);
        driver->ext_ready(ext_ready);
        driver->clk(clk);
        driver->rst_n(rst_n);
        driver->set_coverage(coverage);
        
        // Connect monitor
        monitor->axis_tvalid(axis_tvalid);
        monitor->axis_tdata(axis_tdata);
        monitor->axis_tkeep(axis_tkeep);
        monitor->axis_tuser(axis_tuser);
        monitor->axis_tlast(axis_tlast);
        monitor->axis_tready(axis_tready);
        monitor->clk(clk);
        monitor->rst_n(rst_n);
        monitor->set_coverage(coverage);
        
        // Connect sequence generator
        sequence_gen->set_driver(driver);
        sequence_gen->set_coverage(coverage);
        
        // Control processes
        SC_THREAD(reset_process);
        SC_THREAD(control_signals_process);
        SC_THREAD(test_controller);
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[FC4SC-STYLE-TB] Reset sequence completed" << std::endl;
    }
    
    void control_signals_process() {
        axis_tready.write(true);
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        credit_return_valid.write(false);
    }
    
    void test_controller() {
        // Wait for test completion
        wait(10000, SC_NS);
        
        std::cout << "\n[FC4SC-STYLE-TB] Test completed - generating FC4SC-style coverage report" << std::endl;
        
        // Print final statistics
        std::cout << "\n=== FC4SC-Style Test Final Statistics ===" << std::endl;
        std::cout << "Driver transactions sent: " << driver->transactions_sent << std::endl;
        std::cout << "Monitor packets observed: " << monitor->packets_observed << std::endl;
        std::cout << "Monitor beats observed: " << monitor->beats_observed << std::endl;
        std::cout << "DUT packets received: " << dut->get_packets_received() << std::endl;
        std::cout << "DUT packets forwarded: " << dut->get_packets_forwarded() << std::endl;
        
        // Print FC4SC-style coverage report
        coverage->print_coverage_report();
        
        // Export coverage to XML
        coverage->export_xml_report("build/fc4sc_style_coverage_report.xml");
        
        // Final verification
        double coverage_pct = coverage->get_overall_coverage();
        bool test_passed = (driver->transactions_sent == monitor->packets_observed) &&
                          (driver->transactions_sent == (int)dut->get_packets_received()) &&
                          (driver->transactions_sent == (int)dut->get_packets_forwarded()) &&
                          (coverage_pct >= 75.0);  // Coverage goal: 75%
        
        if (test_passed) {
            std::cout << "\n🎉 ✅ FC4SC-STYLE TEST PASSED!" << std::endl;
            std::cout << "Simplified FC4SC Coverage: " << std::fixed << std::setprecision(1) 
                      << coverage_pct << "% (Goal: 75%)" << std::endl;
        } else {
            std::cout << "\n❌ FC4SC-STYLE TEST FAILED!" << std::endl;
            std::cout << "Simplified FC4SC Coverage: " << std::fixed << std::setprecision(1) 
                      << coverage_pct << "% (Goal: 75%)" << std::endl;
        }
        
        std::cout << "Note: This is a simplified FC4SC-style implementation for demonstration" << std::endl;
        std::cout << "Real FC4SC would provide more advanced features and UCIS integration" << std::endl;
        std::cout << "=========================================" << std::endl;
        
        sc_stop();
    }
    
    ~fc4sc_style_testbench() {
        delete dut;
        delete driver;
        delete monitor;
        delete sequence_gen;
        delete coverage;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Simplified FC4SC-style SystemC Verification Environment ===" << std::endl;
    std::cout << "Demonstrating FC4SC-like functional coverage methodology" << std::endl;
    std::cout << "Note: This uses a simplified implementation, not the actual FC4SC library" << std::endl;
    
    // Create testbench
    fc4sc_style_testbench tb("fc4sc_style_testbench");
    
    // Run simulation
    sc_start();
    
    std::cout << "=== FC4SC-Style Test completed ===" << std::endl;
    return 0;
}