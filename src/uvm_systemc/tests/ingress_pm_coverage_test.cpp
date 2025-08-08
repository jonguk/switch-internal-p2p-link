#include <systemc>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/common/switch_types.h"
#include <queue>
#include <vector>
#include <map>
#include <set>
#include <iomanip>
#include <fstream>

using namespace sc_core;
using namespace switch_internal_p2p;

// =============================================================================
// Coverage Database Classes
// =============================================================================

class functional_coverage {
private:
    // Coverage bins for different packet attributes
    std::map<uint8_t, int> dest_port_coverage;      // Destination ports
    std::map<uint16_t, int> packet_size_coverage;   // Packet sizes
    std::map<uint8_t, int> channel_type_coverage;   // Channel types
    std::map<uint8_t, int> queue_id_coverage;       // Queue IDs
    std::map<uint8_t, int> source_port_coverage;    // Source ports
    
    // Cross coverage
    std::map<std::pair<uint8_t, uint16_t>, int> dest_size_cross_coverage;  // dest x size
    std::map<std::pair<uint8_t, uint8_t>, int> dest_channel_cross_coverage; // dest x channel
    
    // Protocol coverage
    int single_beat_packets;
    int multi_beat_packets;
    int back_to_back_packets;
    int packets_with_gaps;
    
    // Error coverage
    int crc_pass_count;
    int crc_fail_count;
    
    // Total samples
    int total_samples;
    
public:
    functional_coverage() : single_beat_packets(0), multi_beat_packets(0), 
                           back_to_back_packets(0), packets_with_gaps(0),
                           crc_pass_count(0), crc_fail_count(0), total_samples(0) {
    }
    
    void sample_packet(uint8_t dest_port, uint16_t packet_size, uint8_t channel_type, 
                      uint8_t queue_id, uint8_t source_port, int beat_count, 
                      bool crc_passed, bool back_to_back) {
        
        // Basic coverage
        dest_port_coverage[dest_port]++;
        packet_size_coverage[packet_size]++;
        channel_type_coverage[channel_type]++;
        queue_id_coverage[queue_id]++;
        source_port_coverage[source_port]++;
        
        // Cross coverage
        dest_size_cross_coverage[{dest_port, packet_size}]++;
        dest_channel_cross_coverage[{dest_port, channel_type}]++;
        
        // Protocol coverage
        if (beat_count == 1) {
            single_beat_packets++;
        } else {
            multi_beat_packets++;
        }
        
        if (back_to_back) {
            back_to_back_packets++;
        } else {
            packets_with_gaps++;
        }
        
        // Error coverage
        if (crc_passed) {
            crc_pass_count++;
        } else {
            crc_fail_count++;
        }
        
        total_samples++;
    }
    
    double calculate_coverage_percentage() {
        if (total_samples == 0) return 0.0;
        
        // Define coverage goals
        int dest_port_goal = 8;        // Ports 1-8
        int packet_size_goal = 6;      // Different size categories
        int channel_type_goal = 2;     // LOW_PRIORITY, HIGH_PRIORITY
        int queue_id_goal = 4;         // Queue IDs 0-3
        int protocol_goal = 2;         // Single and multi-beat
        
        // Calculate hit counts
        int dest_port_hits = dest_port_coverage.size();
        int packet_size_hits = packet_size_coverage.size();
        int channel_type_hits = channel_type_coverage.size();
        int queue_id_hits = queue_id_coverage.size();
        int protocol_hits = (single_beat_packets > 0 ? 1 : 0) + (multi_beat_packets > 0 ? 1 : 0);
        
        // Calculate overall coverage
        double coverage = 0.0;
        coverage += (double)dest_port_hits / dest_port_goal * 20;      // 20%
        coverage += (double)packet_size_hits / packet_size_goal * 20;  // 20%
        coverage += (double)channel_type_hits / channel_type_goal * 15; // 15%
        coverage += (double)queue_id_hits / queue_id_goal * 15;        // 15%
        coverage += (double)protocol_hits / protocol_goal * 20;        // 20%
        coverage += (crc_pass_count > 0 ? 10 : 0);                     // 10%
        
        return std::min(coverage, 100.0);
    }
    
    void print_coverage_report() {
        std::cout << "\n=== FUNCTIONAL COVERAGE REPORT ===" << std::endl;
        std::cout << "Total Samples: " << total_samples << std::endl;
        std::cout << "Overall Coverage: " << std::fixed << std::setprecision(1) 
                  << calculate_coverage_percentage() << "%" << std::endl;
        
        std::cout << "\n--- Basic Coverage ---" << std::endl;
        
        std::cout << "Destination Ports (" << dest_port_coverage.size() << " unique):" << std::endl;
        for (auto& pair : dest_port_coverage) {
            std::cout << "  Port " << (int)pair.first << ": " << pair.second << " packets" << std::endl;
        }
        
        std::cout << "Packet Sizes (" << packet_size_coverage.size() << " unique):" << std::endl;
        for (auto& pair : packet_size_coverage) {
            std::cout << "  Size " << pair.first << ": " << pair.second << " packets" << std::endl;
        }
        
        std::cout << "Channel Types (" << channel_type_coverage.size() << " unique):" << std::endl;
        for (auto& pair : channel_type_coverage) {
            std::string type = (pair.first == 0) ? "LOW_PRIORITY" : "HIGH_PRIORITY";
            std::cout << "  " << type << ": " << pair.second << " packets" << std::endl;
        }
        
        std::cout << "\n--- Protocol Coverage ---" << std::endl;
        std::cout << "Single-beat packets: " << single_beat_packets << std::endl;
        std::cout << "Multi-beat packets: " << multi_beat_packets << std::endl;
        std::cout << "Back-to-back packets: " << back_to_back_packets << std::endl;
        std::cout << "Packets with gaps: " << packets_with_gaps << std::endl;
        
        std::cout << "\n--- Error Coverage ---" << std::endl;
        std::cout << "CRC passed: " << crc_pass_count << std::endl;
        std::cout << "CRC failed: " << crc_fail_count << std::endl;
        
        std::cout << "\n--- Cross Coverage ---" << std::endl;
        std::cout << "Destination x Size combinations: " << dest_size_cross_coverage.size() << std::endl;
        std::cout << "Destination x Channel combinations: " << dest_channel_cross_coverage.size() << std::endl;
        
        std::cout << "===================================" << std::endl;
    }
    
    void export_coverage_html(const std::string& filename) {
        std::ofstream file(filename);
        file << "<!DOCTYPE html>\n<html>\n<head>\n";
        file << "<title>Functional Coverage Report</title>\n";
        file << "<style>\n";
        file << "body { font-family: Arial, sans-serif; margin: 20px; }\n";
        file << "table { border-collapse: collapse; width: 100%; margin: 10px 0; }\n";
        file << "th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }\n";
        file << "th { background-color: #f2f2f2; }\n";
        file << ".coverage-high { background-color: #d4edda; }\n";
        file << ".coverage-med { background-color: #fff3cd; }\n";
        file << ".coverage-low { background-color: #f8d7da; }\n";
        file << "</style>\n</head>\n<body>\n";
        
        file << "<h1>Functional Coverage Report</h1>\n";
        file << "<p>Total Samples: " << total_samples << "</p>\n";
        file << "<p>Overall Coverage: " << std::fixed << std::setprecision(1) 
             << calculate_coverage_percentage() << "%</p>\n";
        
        // Destination ports table
        file << "<h2>Destination Port Coverage</h2>\n<table>\n";
        file << "<tr><th>Port</th><th>Count</th><th>Percentage</th></tr>\n";
        for (auto& pair : dest_port_coverage) {
            double pct = (double)pair.second / total_samples * 100;
            std::string css_class = (pct > 15) ? "coverage-high" : (pct > 5) ? "coverage-med" : "coverage-low";
            file << "<tr class=\"" << css_class << "\"><td>" << (int)pair.first 
                 << "</td><td>" << pair.second << "</td><td>" << std::fixed 
                 << std::setprecision(1) << pct << "%</td></tr>\n";
        }
        file << "</table>\n";
        
        // Packet sizes table
        file << "<h2>Packet Size Coverage</h2>\n<table>\n";
        file << "<tr><th>Size (bytes)</th><th>Count</th><th>Percentage</th></tr>\n";
        for (auto& pair : packet_size_coverage) {
            double pct = (double)pair.second / total_samples * 100;
            std::string css_class = (pct > 15) ? "coverage-high" : (pct > 5) ? "coverage-med" : "coverage-low";
            file << "<tr class=\"" << css_class << "\"><td>" << pair.first 
                 << "</td><td>" << pair.second << "</td><td>" << std::fixed 
                 << std::setprecision(1) << pct << "%</td></tr>\n";
        }
        file << "</table>\n";
        
        file << "</body>\n</html>";
        file.close();
        
        std::cout << "[COVERAGE] HTML report exported to: " << filename << std::endl;
    }
    
    // Coverage-driven test suggestions
    std::vector<std::string> get_coverage_holes() {
        std::vector<std::string> holes;
        
        // Check for missing destination ports
        for (int port = 1; port <= 8; port++) {
            if (dest_port_coverage.find(port) == dest_port_coverage.end()) {
                holes.push_back("Missing destination port: " + std::to_string(port));
            }
        }
        
        // Check for missing packet size categories
        std::vector<uint16_t> target_sizes = {32, 64, 128, 256, 512, 1024};
        for (uint16_t size : target_sizes) {
            if (packet_size_coverage.find(size) == packet_size_coverage.end()) {
                holes.push_back("Missing packet size: " + std::to_string(size));
            }
        }
        
        // Check protocol coverage
        if (single_beat_packets == 0) {
            holes.push_back("Missing single-beat packet coverage");
        }
        if (multi_beat_packets == 0) {
            holes.push_back("Missing multi-beat packet coverage");
        }
        if (back_to_back_packets == 0) {
            holes.push_back("Missing back-to-back packet coverage");
        }
        
        // Check channel types
        if (channel_type_coverage.find(0) == channel_type_coverage.end()) {
            holes.push_back("Missing LOW_PRIORITY channel coverage");
        }
        if (channel_type_coverage.find(1) == channel_type_coverage.end()) {
            holes.push_back("Missing HIGH_PRIORITY channel coverage");
        }
        
        return holes;
    }
};

// =============================================================================
// Enhanced Transaction with Coverage Sampling
// =============================================================================
class coverage_packet_transaction {
public:
    uint8_t dest_port;
    uint8_t source_port;
    uint16_t payload_size;
    std::vector<uint8_t> payload_data;
    ChannelType channel_type;
    uint8_t queue_id;
    bool expect_crc_pass;
    bool expect_forwarding;
    
    // Coverage-related fields
    static int next_id;
    int transaction_id;
    sc_time start_time;
    sc_time end_time;
    int beat_count;
    bool back_to_back;
    bool crc_passed;
    
    coverage_packet_transaction() : dest_port(0), source_port(1), payload_size(64),
                                   channel_type(ChannelType::LOW_PRIORITY), queue_id(0), 
                                   expect_crc_pass(true), expect_forwarding(true),
                                   beat_count(1), back_to_back(false), crc_passed(true) {
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
        str << "TXN[" << transaction_id << "] dest=" << (int)dest_port 
            << " src=" << (int)source_port << " payload_size=" << payload_size 
            << " channel=" << (int)channel_type << " queue=" << (int)queue_id
            << " beats=" << beat_count;
        return str.str();
    }
    
    void complete_transaction() {
        end_time = sc_time_stamp();
    }
    
    void sample_coverage(functional_coverage& cov) {
        cov.sample_packet(dest_port, payload_size, static_cast<uint8_t>(channel_type),
                         queue_id, source_port, beat_count, crc_passed, back_to_back);
    }
};

int coverage_packet_transaction::next_id = 1;

// =============================================================================
// Coverage-Aware Driver
// =============================================================================
SC_MODULE(coverage_packet_driver) {
    // Interface signals
    sc_out<bool> ext_valid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_out<bool> ext_last;
    sc_in<bool> ext_ready;
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Transaction queue
    std::queue<coverage_packet_transaction*> transaction_queue;
    
    // Coverage tracking
    functional_coverage* coverage;
    coverage_packet_transaction* last_txn;
    sc_time last_packet_time;
    
    // Statistics
    int transactions_sent;
    int transactions_completed;
    
    SC_CTOR(coverage_packet_driver) : coverage(nullptr), last_txn(nullptr),
                                     transactions_sent(0), transactions_completed(0) {
        SC_THREAD(driver_process);
        sensitive << clk.pos();
        
        ext_valid.initialize(false);
        ext_data.initialize(0);
        ext_keep.initialize(0);
        ext_last.initialize(false);
    }
    
    void set_coverage(functional_coverage* cov) { coverage = cov; }
    
    void add_transaction(coverage_packet_transaction* txn) {
        transaction_queue.push(txn);
        std::cout << "[COVERAGE-DRIVER] Queued " << txn->to_string() << std::endl;
    }
    
    void driver_process() {
        // Wait for reset
        while (!rst_n.read()) {
            wait();
        }
        
        std::cout << "[COVERAGE-DRIVER] Started after reset" << std::endl;
        
        while (true) {
            if (!transaction_queue.empty()) {
                coverage_packet_transaction* txn = transaction_queue.front();
                transaction_queue.pop();
                
                // Check if this is back-to-back
                if (last_txn && (sc_time_stamp() - last_packet_time) < sc_time(50, SC_NS)) {
                    txn->back_to_back = true;
                }
                
                std::cout << "[COVERAGE-DRIVER] Driving " << txn->to_string() << std::endl;
                drive_transaction(txn);
                
                txn->complete_transaction();
                transactions_sent++;
                transactions_completed++;
                
                // Sample coverage
                if (coverage) {
                    txn->sample_coverage(*coverage);
                }
                
                last_txn = txn;
                last_packet_time = sc_time_stamp();
                
                delete txn;
                
                // Variable gap between packets for coverage
                int gap_cycles = (rand() % 20) + 5;  // 5-24 cycles
                for (int i = 0; i < gap_cycles; i++) {
                    wait();
                }
            } else {
                wait();
            }
        }
    }
    
private:
    void drive_transaction(coverage_packet_transaction* txn) {
        std::vector<uint8_t> packet_data = txn->create_packet_data();
        
        // Wait for DUT to be ready
        int ready_wait_cycles = 0;
        while (!ext_ready.read() && ready_wait_cycles < 100) {
            wait();
            ready_wait_cycles++;
        }
        
        if (!ext_ready.read()) {
            std::cout << "[COVERAGE-DRIVER] ERROR: DUT not ready after waiting" << std::endl;
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
                std::cout << "[COVERAGE-DRIVER] ERROR: DUT not ready during packet transmission" << std::endl;
                break;
            }
            
            bytes_sent += bytes_this_beat;
        }
        
        // Update transaction with actual beat count
        txn->beat_count = beat_count;
        
        ext_valid.write(false);
        ext_last.write(false);
        
        std::cout << "[COVERAGE-DRIVER] " << txn->to_string() << " sent successfully (" 
                  << total_bytes << " bytes, " << beat_count << " beats)" << std::endl;
    }
};

// =============================================================================
// Coverage-Aware Monitor
// =============================================================================
SC_MODULE(coverage_axis_monitor) {
    // Interface signals
    sc_in<bool> axis_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_in<bool> axis_tlast;
    sc_in<bool> axis_tready;
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Coverage tracking
    functional_coverage* coverage;
    
    // Observed transactions
    std::vector<coverage_packet_transaction*> observed_transactions;
    
    // Statistics
    int packets_observed;
    int beats_observed;
    
    SC_CTOR(coverage_axis_monitor) : coverage(nullptr), packets_observed(0), beats_observed(0) {
        SC_THREAD(monitor_process);
        sensitive << clk.pos();
    }
    
    void set_coverage(functional_coverage* cov) { coverage = cov; }
    
    void monitor_process() {
        // Wait for reset
        while (!rst_n.read()) {
            wait();
        }
        
        std::cout << "[COVERAGE-MONITOR] Started after reset" << std::endl;
        
        while (true) {
            if (axis_tvalid.read() && axis_tready.read()) {
                coverage_packet_transaction* observed_txn = monitor_axis_transaction();
                if (observed_txn) {
                    packets_observed++;
                    observed_transactions.push_back(observed_txn);
                    
                    // Sample coverage from observed transaction
                    if (coverage) {
                        observed_txn->sample_coverage(*coverage);
                    }
                    
                    std::cout << "[COVERAGE-MONITOR] Observed " << observed_txn->to_string() << std::endl;
                }
            }
            wait();
        }
    }
    
private:
    coverage_packet_transaction* monitor_axis_transaction() {
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
            coverage_packet_transaction* txn = new coverage_packet_transaction();
            
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
// Coverage-Driven Sequence Generator
// =============================================================================
SC_MODULE(coverage_sequence_generator) {
    coverage_packet_driver* driver;
    functional_coverage* coverage;
    
    SC_CTOR(coverage_sequence_generator) : driver(nullptr), coverage(nullptr) {
        SC_THREAD(generate_coverage_sequences);
    }
    
    void set_driver(coverage_packet_driver* drv) { driver = drv; }
    void set_coverage(functional_coverage* cov) { coverage = cov; }
    
    void generate_coverage_sequences() {
        wait(100, SC_NS);
        
        std::cout << "[COVERAGE-SEQ] Starting coverage-driven test sequences" << std::endl;
        
        // Phase 1: Basic coverage
        generate_basic_coverage_sequence();
        
        // Phase 2: Protocol coverage
        generate_protocol_coverage_sequence();
        
        // Phase 3: Cross coverage
        generate_cross_coverage_sequence();
        
        // Phase 4: Coverage-driven random
        generate_random_coverage_sequence();
        
        std::cout << "[COVERAGE-SEQ] All coverage sequences generated" << std::endl;
    }
    
private:
    void generate_basic_coverage_sequence() {
        std::cout << "[COVERAGE-SEQ] Generating basic coverage sequence" << std::endl;
        
        // Cover all destination ports
        for (int dest = 1; dest <= 8; dest++) {
            coverage_packet_transaction* txn = new coverage_packet_transaction();
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
        
        // Cover different packet sizes
        std::vector<uint16_t> sizes = {32, 64, 128, 256, 512, 1024};
        for (uint16_t size : sizes) {
            coverage_packet_transaction* txn = new coverage_packet_transaction();
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
        
        // Cover different channel types
        for (int ch = 0; ch <= 1; ch++) {
            coverage_packet_transaction* txn = new coverage_packet_transaction();
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
        
        // Cover different queue IDs
        for (int qid = 0; qid <= 3; qid++) {
            coverage_packet_transaction* txn = new coverage_packet_transaction();
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
    
    void generate_protocol_coverage_sequence() {
        std::cout << "[COVERAGE-SEQ] Generating protocol coverage sequence" << std::endl;
        
        // Back-to-back packets (small gap)
        for (int i = 0; i < 3; i++) {
            coverage_packet_transaction* txn = new coverage_packet_transaction();
            txn->dest_port = 5;
            txn->source_port = 1;
            txn->payload_size = 48;
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = 1;
            txn->generate_default_payload();
            
            if (driver) {
                driver->add_transaction(txn);
            }
        }
    }
    
    void generate_cross_coverage_sequence() {
        std::cout << "[COVERAGE-SEQ] Generating cross coverage sequence" << std::endl;
        
        // Different dest x size combinations
        std::vector<std::pair<uint8_t, uint16_t>> dest_size_pairs = {
            {6, 32}, {6, 256}, {7, 64}, {7, 512}, {8, 128}, {8, 1024}
        };
        
        for (auto& pair : dest_size_pairs) {
            coverage_packet_transaction* txn = new coverage_packet_transaction();
            txn->dest_port = pair.first;
            txn->source_port = 1;
            txn->payload_size = pair.second;
            txn->channel_type = ChannelType::LOW_PRIORITY;
            txn->queue_id = 2;
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
            coverage_packet_transaction* txn = new coverage_packet_transaction();
            txn->dest_port = pair.first;
            txn->source_port = 1;
            txn->payload_size = 80;
            txn->channel_type = pair.second;
            txn->queue_id = 3;
            txn->generate_default_payload();
            
            if (driver) {
                driver->add_transaction(txn);
            }
        }
    }
    
    void generate_random_coverage_sequence() {
        std::cout << "[COVERAGE-SEQ] Generating random coverage sequence" << std::endl;
        
        // Generate random packets to fill coverage holes
        for (int i = 0; i < 20; i++) {
            coverage_packet_transaction* txn = new coverage_packet_transaction();
            txn->dest_port = (rand() % 8) + 1;
            txn->source_port = 1;
            txn->payload_size = 32 + (rand() % 500);  // 32-531 bytes
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
// Coverage-Enhanced Testbench
// =============================================================================
SC_MODULE(coverage_testbench) {
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
    coverage_packet_driver* driver;
    coverage_axis_monitor* monitor;
    coverage_sequence_generator* sequence_gen;
    functional_coverage* coverage;
    
    SC_CTOR(coverage_testbench) : clk("clk", 10, SC_NS) {
        // Create coverage database
        coverage = new functional_coverage();
        
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
        driver = new coverage_packet_driver("coverage_driver");
        monitor = new coverage_axis_monitor("coverage_monitor");
        sequence_gen = new coverage_sequence_generator("coverage_sequence_gen");
        
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
        std::cout << "[COVERAGE-TB] Reset sequence completed" << std::endl;
    }
    
    void control_signals_process() {
        axis_tready.write(true);
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        credit_return_valid.write(false);
    }
    
    void test_controller() {
        // Wait for test completion
        wait(15000, SC_NS);  // Longer simulation for coverage
        
        std::cout << "\n[COVERAGE-TB] Test completed - generating coverage report" << std::endl;
        
        // Print final statistics
        std::cout << "\n=== Coverage Test Final Statistics ===" << std::endl;
        std::cout << "Driver transactions sent: " << driver->transactions_sent << std::endl;
        std::cout << "Monitor packets observed: " << monitor->packets_observed << std::endl;
        std::cout << "Monitor beats observed: " << monitor->beats_observed << std::endl;
        std::cout << "DUT packets received: " << dut->get_packets_received() << std::endl;
        std::cout << "DUT packets forwarded: " << dut->get_packets_forwarded() << std::endl;
        
        // Print coverage report
        coverage->print_coverage_report();
        
        // Export HTML report
        coverage->export_coverage_html("build/coverage_report.html");
        
        // Check for coverage holes
        std::vector<std::string> holes = coverage->get_coverage_holes();
        if (!holes.empty()) {
            std::cout << "\n=== Coverage Holes Detected ===" << std::endl;
            for (const auto& hole : holes) {
                std::cout << "⚠️  " << hole << std::endl;
            }
        } else {
            std::cout << "\n✅ No coverage holes detected!" << std::endl;
        }
        
        // Final verification
        double coverage_pct = coverage->calculate_coverage_percentage();
        bool test_passed = (driver->transactions_sent == monitor->packets_observed) &&
                          (driver->transactions_sent == (int)dut->get_packets_received()) &&
                          (driver->transactions_sent == (int)dut->get_packets_forwarded()) &&
                          (coverage_pct >= 80.0);  // Coverage goal: 80%
        
        if (test_passed) {
            std::cout << "\n🎉 ✅ COVERAGE TEST PASSED!" << std::endl;
            std::cout << "Coverage: " << std::fixed << std::setprecision(1) 
                      << coverage_pct << "% (Goal: 80%)" << std::endl;
        } else {
            std::cout << "\n❌ COVERAGE TEST FAILED!" << std::endl;
            std::cout << "Coverage: " << std::fixed << std::setprecision(1) 
                      << coverage_pct << "% (Goal: 80%)" << std::endl;
        }
        
        std::cout << "=========================================" << std::endl;
        
        sc_stop();
    }
    
    ~coverage_testbench() {
        delete dut;
        delete driver;
        delete monitor;
        delete sequence_gen;
        delete coverage;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Coverage-Driven SystemC Verification Environment ===" << std::endl;
    std::cout << "Advanced UVM-style methodology with functional coverage" << std::endl;
    
    // Create testbench
    coverage_testbench tb("coverage_testbench");
    
    // Run simulation
    sc_start();
    
    std::cout << "=== Coverage Test completed ===" << std::endl;
    return 0;
}