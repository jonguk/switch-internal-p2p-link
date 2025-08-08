#include <systemc>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/common/switch_types.h"
#include "../fc4sc/includes/fc4sc.hpp"
#include <queue>
#include <vector>
#include <iomanip>
#include <fstream>
#include <unistd.h>  // for sync()

using namespace sc_core;
using namespace switch_internal_p2p;
using namespace fc4sc;

// =============================================================================
// FC4SC-based Transaction Class
// =============================================================================
class fc4sc_packet_transaction {
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
    bool back_to_back;
    bool crc_passed;
    
    fc4sc_packet_transaction() : dest_port(0), source_port(1), payload_size(64),
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
        str << "FC4SC-TXN[" << transaction_id << "] dest=" << (int)dest_port 
            << " src=" << (int)source_port << " payload_size=" << payload_size 
            << " channel=" << (int)channel_type << " queue=" << (int)queue_id
            << " beats=" << beat_count;
        return str.str();
    }
    
    void complete_transaction() {
        end_time = sc_time_stamp();
    }
};

int fc4sc_packet_transaction::next_id = 1;

// =============================================================================
// FC4SC Coverage Model
// =============================================================================
SC_MODULE(fc4sc_coverage_model) {
    // Coverage signals - these will be sampled by FC4SC
    sc_signal<int> dest_port_sig;
    sc_signal<int> payload_size_sig;
    sc_signal<int> channel_type_sig;
    sc_signal<int> queue_id_sig;
    sc_signal<int> source_port_sig;
    sc_signal<bool> single_beat_sig;
    sc_signal<bool> multi_beat_sig;
    sc_signal<bool> crc_passed_sig;
    
    // FC4SC Coverage Objects
    fc4sc::global_coverage_db* cov_db;
    
    // Covergroup and coverpoints
    covergroup* packet_cg;
    coverpoint<int>* cp_dest_port;
    coverpoint<int>* cp_payload_size;
    coverpoint<int>* cp_channel_type;
    coverpoint<int>* cp_queue_id;
    coverpoint<int>* cp_source_port;
    coverpoint<bool>* cp_single_beat;
    coverpoint<bool>* cp_multi_beat;
    coverpoint<bool>* cp_crc_passed;
    
    // Cross coverage
    cross<int, int>* cross_dest_size;
    cross<int, int>* cross_dest_channel;
    
    // Statistics
    int total_samples;
    int packets_sampled;
    
    SC_CTOR(fc4sc_coverage_model) : total_samples(0), packets_sampled(0) {
        // Initialize FC4SC coverage database
        cov_db = fc4sc::global_coverage_db::get_instance();
        
        // Create covergroup
        packet_cg = new covergroup("packet_covergroup");
        
        // Create coverpoints with bins
        cp_dest_port = new coverpoint<int>("dest_port_cp", &dest_port_sig);
        cp_dest_port->add_bins("port_1", fc4sc::bin<int>(1));
        cp_dest_port->add_bins("port_2", fc4sc::bin<int>(2));
        cp_dest_port->add_bins("port_3", fc4sc::bin<int>(3));
        cp_dest_port->add_bins("port_4", fc4sc::bin<int>(4));
        cp_dest_port->add_bins("port_5", fc4sc::bin<int>(5));
        cp_dest_port->add_bins("port_6", fc4sc::bin<int>(6));
        cp_dest_port->add_bins("port_7", fc4sc::bin<int>(7));
        cp_dest_port->add_bins("port_8", fc4sc::bin<int>(8));
        
        cp_payload_size = new coverpoint<int>("payload_size_cp", &payload_size_sig);
        cp_payload_size->add_bins("small_packets", fc4sc::bin_range<int>(32, 64));
        cp_payload_size->add_bins("medium_packets", fc4sc::bin_range<int>(65, 256));
        cp_payload_size->add_bins("large_packets", fc4sc::bin_range<int>(257, 512));
        cp_payload_size->add_bins("huge_packets", fc4sc::bin_range<int>(513, 1024));
        
        cp_channel_type = new coverpoint<int>("channel_type_cp", &channel_type_sig);
        cp_channel_type->add_bins("low_priority", fc4sc::bin<int>(0));
        cp_channel_type->add_bins("high_priority", fc4sc::bin<int>(1));
        
        cp_queue_id = new coverpoint<int>("queue_id_cp", &queue_id_sig);
        cp_queue_id->add_bins("queue_0", fc4sc::bin<int>(0));
        cp_queue_id->add_bins("queue_1", fc4sc::bin<int>(1));
        cp_queue_id->add_bins("queue_2", fc4sc::bin<int>(2));
        cp_queue_id->add_bins("queue_3", fc4sc::bin<int>(3));
        
        cp_source_port = new coverpoint<int>("source_port_cp", &source_port_sig);
        cp_source_port->add_bins("source_port_1", fc4sc::bin<int>(1));
        
        cp_single_beat = new coverpoint<bool>("single_beat_cp", &single_beat_sig);
        cp_single_beat->add_bins("single_beat_true", fc4sc::bin<bool>(true));
        cp_single_beat->add_bins("single_beat_false", fc4sc::bin<bool>(false));
        
        cp_multi_beat = new coverpoint<bool>("multi_beat_cp", &multi_beat_sig);
        cp_multi_beat->add_bins("multi_beat_true", fc4sc::bin<bool>(true));
        cp_multi_beat->add_bins("multi_beat_false", fc4sc::bin<bool>(false));
        
        cp_crc_passed = new coverpoint<bool>("crc_passed_cp", &crc_passed_sig);
        cp_crc_passed->add_bins("crc_pass", fc4sc::bin<bool>(true));
        cp_crc_passed->add_bins("crc_fail", fc4sc::bin<bool>(false));
        
        // Add coverpoints to covergroup
        packet_cg->add_coverpoint(cp_dest_port);
        packet_cg->add_coverpoint(cp_payload_size);
        packet_cg->add_coverpoint(cp_channel_type);
        packet_cg->add_coverpoint(cp_queue_id);
        packet_cg->add_coverpoint(cp_source_port);
        packet_cg->add_coverpoint(cp_single_beat);
        packet_cg->add_coverpoint(cp_multi_beat);
        packet_cg->add_coverpoint(cp_crc_passed);
        
        // Create cross coverage
        cross_dest_size = new cross<int, int>("dest_size_cross", *cp_dest_port, *cp_payload_size);
        cross_dest_channel = new cross<int, int>("dest_channel_cross", *cp_dest_port, *cp_channel_type);
        
        packet_cg->add_cross(cross_dest_size);
        packet_cg->add_cross(cross_dest_channel);
        
        // Add covergroup to global database
        cov_db->add_covergroup(packet_cg);
        
        std::cout << "[FC4SC-COV] Coverage model initialized with FC4SC library" << std::endl;
        std::cout << "[FC4SC-COV] Covergroup: " << packet_cg->get_name() << std::endl;
        std::cout << "[FC4SC-COV] Coverpoints: " << packet_cg->get_coverpoints().size() << std::endl;
        std::cout << "[FC4SC-COV] Cross coverage: " << packet_cg->get_crosses().size() << std::endl;
    }
    
    void sample_transaction(fc4sc_packet_transaction* txn) {
        // Update coverage signals
        dest_port_sig.write(txn->dest_port);
        payload_size_sig.write(txn->payload_size);
        channel_type_sig.write(static_cast<int>(txn->channel_type));
        queue_id_sig.write(txn->queue_id);
        source_port_sig.write(txn->source_port);
        single_beat_sig.write(txn->beat_count == 1);
        multi_beat_sig.write(txn->beat_count > 1);
        crc_passed_sig.write(txn->crc_passed);
        
        // Sample the covergroup
        packet_cg->sample();
        
        total_samples++;
        packets_sampled++;
        
        std::cout << "[FC4SC-COV] Sampled " << txn->to_string() << std::endl;
    }
    
    void print_coverage_report() {
        std::cout << "\n=== FC4SC COVERAGE REPORT ===" << std::endl;
        std::cout << "Total Samples: " << total_samples << std::endl;
        std::cout << "Packets Sampled: " << packets_sampled << std::endl;
        
        // Print covergroup coverage
        double overall_coverage = packet_cg->get_coverage();
        std::cout << "Overall Coverage: " << std::fixed << std::setprecision(2) 
                  << overall_coverage << "%" << std::endl;
        
        // Print individual coverpoint coverage
        std::cout << "\n--- Coverpoint Coverage ---" << std::endl;
        auto coverpoints = packet_cg->get_coverpoints();
        for (auto cp : coverpoints) {
            std::cout << cp->get_name() << ": " << std::fixed << std::setprecision(2) 
                      << cp->get_coverage() << "%" << std::endl;
        }
        
        // Print cross coverage
        std::cout << "\n--- Cross Coverage ---" << std::endl;
        auto crosses = packet_cg->get_crosses();
        for (auto cross : crosses) {
            std::cout << cross->get_name() << ": " << std::fixed << std::setprecision(2) 
                      << cross->get_coverage() << "%" << std::endl;
        }
        
        std::cout << "=============================" << std::endl;
        
        // Auto-generate XML report when printing coverage
        std::cout << "[SIMPLIFIED-FC4SC] Auto-generating XML report..." << std::endl;
        
        // Direct XML generation to avoid function call issues
        std::string xml_path = "build/fc4sc_style_coverage_report.xml";
        std::ofstream xml_file(xml_path);
        if (xml_file.is_open()) {
            xml_file << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
            xml_file << "<fc4sc_coverage_report>\n";
            xml_file << "  <metadata>\n";
            xml_file << "    <generation_time>" << sc_time_stamp() << "</generation_time>\n";
            xml_file << "    <test_name>FC4SC Ingress Port Manager Test</test_name>\n";
            xml_file << "  </metadata>\n";
            xml_file << "  <overall_coverage>" << std::fixed << std::setprecision(2) 
                      << get_overall_coverage() << "</overall_coverage>\n";
            xml_file << "  <total_samples>" << total_samples << "</total_samples>\n";
            xml_file << "</fc4sc_coverage_report>\n";
            xml_file.flush();  // Force immediate write
            xml_file.close();
            sync();  // Force filesystem sync
            std::cout << "[SIMPLIFIED-FC4SC] XML coverage report successfully exported to: " << xml_path << std::endl;
        } else {
            std::cerr << "[SIMPLIFIED-FC4SC] Failed to create XML file: " << xml_path << std::endl;
        }
    }
    
    void export_coverage_xml(const std::string& filename) {
        std::cout << "[FC4SC-COV] Exporting coverage to XML: " << filename << std::endl;
        
        // Create XML file with actual coverage data
        std::cout << "[FC4SC-COV] Creating XML file: " << filename << std::endl;
        std::ofstream xml_file(filename);
        if (!xml_file.is_open()) {
            std::cerr << "[FC4SC-COV] Error: Could not create XML file: " << filename << std::endl;
            std::cerr << "[FC4SC-COV] Current working directory check..." << std::endl;
            system("pwd");
            std::cerr << "[FC4SC-COV] Build directory check..." << std::endl;
            system("ls -la build/");
            return;
        }
        std::cout << "[FC4SC-COV] XML file opened successfully" << std::endl;
        
        xml_file << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
        xml_file << "<fc4sc_coverage_report>\n";
        xml_file << "  <metadata>\n";
        xml_file << "    <generation_time>" << sc_time_stamp() << "</generation_time>\n";
        xml_file << "    <test_name>FC4SC Ingress Port Manager Test</test_name>\n";
        xml_file << "    <dut>IngressPortManager</dut>\n";
        xml_file << "    <library>FC4SC (Functional Coverage for SystemC)</library>\n";
        xml_file << "  </metadata>\n";
        xml_file << "  <overall_coverage>" << std::fixed << std::setprecision(2) 
                  << get_overall_coverage() << "</overall_coverage>\n";
        xml_file << "  <total_samples>" << total_samples << "</total_samples>\n";
        
        xml_file << "  <coverpoints>\n";
        
        // Destination ports coverage
        xml_file << "    <destination_ports>\n";
        for (const auto& entry : dest_port_bins) {
            xml_file << "      <port id=\"" << (int)entry.first 
                     << "\" count=\"" << entry.second << "\"/>\n";
        }
        xml_file << "    </destination_ports>\n";
        
        // Packet sizes coverage  
        xml_file << "    <packet_sizes>\n";
        for (const auto& entry : payload_size_bins) {
            std::string size_name;
            if (entry.first <= 64) size_name = "small";
            else if (entry.first <= 256) size_name = "medium"; 
            else if (entry.first <= 1024) size_name = "large";
            else size_name = "huge";
            
            xml_file << "      <size category=\"" << size_name 
                     << "\" bytes=\"" << entry.first 
                     << "\" count=\"" << entry.second << "\"/>\n";
        }
        xml_file << "    </packet_sizes>\n";
        
        // Channel types coverage
        xml_file << "    <channel_types>\n";
        for (const auto& entry : channel_type_bins) {
            std::string channel_name = (entry.first == 0) ? "LOW_PRIORITY" : "HIGH_PRIORITY";
            xml_file << "      <channel type=\"" << channel_name 
                     << "\" count=\"" << entry.second << "\"/>\n";
        }
        xml_file << "    </channel_types>\n";
        
        // Queue IDs coverage
        xml_file << "    <queue_ids>\n";
        for (const auto& entry : queue_id_bins) {
            xml_file << "      <queue id=\"" << (int)entry.first 
                     << "\" count=\"" << entry.second << "\"/>\n";
        }
        xml_file << "    </queue_ids>\n";
        
        xml_file << "  </coverpoints>\n";
        
        // Cross coverage
        xml_file << "  <cross_coverage>\n";
        for (const auto& entry : cross_dest_size_bins) {
            xml_file << "    <cross dest=\"" << (int)entry.first.first 
                     << "\" size=\"" << entry.first.second 
                     << "\" count=\"" << entry.second << "\"/>\n";
        }
        xml_file << "  </cross_coverage>\n";
        
        xml_file << "</fc4sc_coverage_report>\n";
        xml_file.close();
        
        std::cout << "[FC4SC-COV] XML coverage report successfully exported to: " << filename << std::endl;
    }
    
    double get_overall_coverage() {
        return packet_cg->get_coverage();
    }
    
    ~fc4sc_coverage_model() {
        delete packet_cg;
        delete cp_dest_port;
        delete cp_payload_size;
        delete cp_channel_type;
        delete cp_queue_id;
        delete cp_source_port;
        delete cp_single_beat;
        delete cp_multi_beat;
        delete cp_crc_passed;
        delete cross_dest_size;
        delete cross_dest_channel;
    }
};

// =============================================================================
// FC4SC-based Driver
// =============================================================================
SC_MODULE(fc4sc_packet_driver) {
    // Interface signals
    sc_out<bool> ext_valid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_out<bool> ext_last;
    sc_in<bool> ext_ready;
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Transaction queue
    std::queue<fc4sc_packet_transaction*> transaction_queue;
    
    // Coverage model reference
    fc4sc_coverage_model* coverage_model;
    
    // Statistics
    int transactions_sent;
    int transactions_completed;
    
    SC_CTOR(fc4sc_packet_driver) : coverage_model(nullptr), 
                                  transactions_sent(0), transactions_completed(0) {
        SC_THREAD(driver_process);
        sensitive << clk.pos();
        
        ext_valid.initialize(false);
        ext_data.initialize(0);
        ext_keep.initialize(0);
        ext_last.initialize(false);
    }
    
    void set_coverage_model(fc4sc_coverage_model* cov_model) { 
        coverage_model = cov_model; 
    }
    
    void add_transaction(fc4sc_packet_transaction* txn) {
        transaction_queue.push(txn);
        std::cout << "[FC4SC-DRIVER] Queued " << txn->to_string() << std::endl;
    }
    
    void driver_process() {
        // Wait for reset
        while (!rst_n.read()) {
            wait();
        }
        
        std::cout << "[FC4SC-DRIVER] Started after reset" << std::endl;
        
        while (true) {
            if (!transaction_queue.empty()) {
                fc4sc_packet_transaction* txn = transaction_queue.front();
                transaction_queue.pop();
                
                std::cout << "[FC4SC-DRIVER] Driving " << txn->to_string() << std::endl;
                drive_transaction(txn);
                
                txn->complete_transaction();
                transactions_sent++;
                transactions_completed++;
                
                // Sample coverage using FC4SC
                if (coverage_model) {
                    coverage_model->sample_transaction(txn);
                }
                
                delete txn;
                
                // Variable gap between packets
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
    void drive_transaction(fc4sc_packet_transaction* txn) {
        std::vector<uint8_t> packet_data = txn->create_packet_data();
        
        // Wait for DUT to be ready
        int ready_wait_cycles = 0;
        while (!ext_ready.read() && ready_wait_cycles < 100) {
            wait();
            ready_wait_cycles++;
        }
        
        if (!ext_ready.read()) {
            std::cout << "[FC4SC-DRIVER] ERROR: DUT not ready after waiting" << std::endl;
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
                std::cout << "[FC4SC-DRIVER] ERROR: DUT not ready during packet transmission" << std::endl;
                break;
            }
            
            bytes_sent += bytes_this_beat;
        }
        
        // Update transaction with actual beat count
        txn->beat_count = beat_count;
        
        ext_valid.write(false);
        ext_last.write(false);
        
        std::cout << "[FC4SC-DRIVER] " << txn->to_string() << " sent successfully (" 
                  << total_bytes << " bytes, " << beat_count << " beats)" << std::endl;
    }
};

// =============================================================================
// FC4SC-based Monitor
// =============================================================================
SC_MODULE(fc4sc_axis_monitor) {
    // Interface signals
    sc_in<bool> axis_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_in<bool> axis_tlast;
    sc_in<bool> axis_tready;
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Coverage model reference
    fc4sc_coverage_model* coverage_model;
    
    // Observed transactions
    std::vector<fc4sc_packet_transaction*> observed_transactions;
    
    // Statistics
    int packets_observed;
    int beats_observed;
    
    SC_CTOR(fc4sc_axis_monitor) : coverage_model(nullptr), packets_observed(0), beats_observed(0) {
        SC_THREAD(monitor_process);
        sensitive << clk.pos();
    }
    
    void set_coverage_model(fc4sc_coverage_model* cov_model) { 
        coverage_model = cov_model; 
    }
    
    void monitor_process() {
        // Wait for reset
        while (!rst_n.read()) {
            wait();
        }
        
        std::cout << "[FC4SC-MONITOR] Started after reset" << std::endl;
        
        while (true) {
            if (axis_tvalid.read() && axis_tready.read()) {
                fc4sc_packet_transaction* observed_txn = monitor_axis_transaction();
                if (observed_txn) {
                    packets_observed++;
                    observed_transactions.push_back(observed_txn);
                    
                    // Sample coverage from observed transaction
                    if (coverage_model) {
                        coverage_model->sample_transaction(observed_txn);
                    }
                    
                    std::cout << "[FC4SC-MONITOR] Observed " << observed_txn->to_string() << std::endl;
                }
            }
            wait();
        }
    }
    
private:
    fc4sc_packet_transaction* monitor_axis_transaction() {
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
            fc4sc_packet_transaction* txn = new fc4sc_packet_transaction();
            
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
// FC4SC Sequence Generator
// =============================================================================
SC_MODULE(fc4sc_sequence_generator) {
    fc4sc_packet_driver* driver;
    fc4sc_coverage_model* coverage_model;
    
    SC_CTOR(fc4sc_sequence_generator) : driver(nullptr), coverage_model(nullptr) {
        SC_THREAD(generate_fc4sc_sequences);
    }
    
    void set_driver(fc4sc_packet_driver* drv) { driver = drv; }
    void set_coverage_model(fc4sc_coverage_model* cov_model) { coverage_model = cov_model; }
    
    void generate_fc4sc_sequences() {
        wait(100, SC_NS);
        
        std::cout << "[FC4SC-SEQ] Starting FC4SC coverage-driven test sequences" << std::endl;
        
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
        
        std::cout << "[FC4SC-SEQ] All FC4SC coverage sequences generated" << std::endl;
    }
    
private:
    void generate_dest_port_coverage() {
        std::cout << "[FC4SC-SEQ] Generating destination port coverage" << std::endl;
        
        for (int dest = 1; dest <= 8; dest++) {
            fc4sc_packet_transaction* txn = new fc4sc_packet_transaction();
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
        std::cout << "[FC4SC-SEQ] Generating packet size coverage" << std::endl;
        
        std::vector<uint16_t> sizes = {32, 64, 128, 256, 512, 1024};
        for (uint16_t size : sizes) {
            fc4sc_packet_transaction* txn = new fc4sc_packet_transaction();
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
        std::cout << "[FC4SC-SEQ] Generating channel type coverage" << std::endl;
        
        for (int ch = 0; ch <= 1; ch++) {
            fc4sc_packet_transaction* txn = new fc4sc_packet_transaction();
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
        std::cout << "[FC4SC-SEQ] Generating queue ID coverage" << std::endl;
        
        for (int qid = 0; qid <= 3; qid++) {
            fc4sc_packet_transaction* txn = new fc4sc_packet_transaction();
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
        std::cout << "[FC4SC-SEQ] Generating cross coverage scenarios" << std::endl;
        
        // Different dest x size combinations
        std::vector<std::pair<uint8_t, uint16_t>> dest_size_pairs = {
            {5, 32}, {5, 256}, {6, 64}, {6, 512}, {7, 128}, {7, 1024}, {8, 256}
        };
        
        for (auto& pair : dest_size_pairs) {
            fc4sc_packet_transaction* txn = new fc4sc_packet_transaction();
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
            fc4sc_packet_transaction* txn = new fc4sc_packet_transaction();
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
        std::cout << "[FC4SC-SEQ] Generating random coverage scenarios" << std::endl;
        
        for (int i = 0; i < 15; i++) {
            fc4sc_packet_transaction* txn = new fc4sc_packet_transaction();
            txn->dest_port = (rand() % 8) + 1;
            txn->source_port = 1;
            txn->payload_size = 32 + (rand() % 400);  // 32-431 bytes
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
// FC4SC-Enhanced Testbench
// =============================================================================
SC_MODULE(fc4sc_testbench) {
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
    fc4sc_packet_driver* driver;
    fc4sc_axis_monitor* monitor;
    fc4sc_sequence_generator* sequence_gen;
    fc4sc_coverage_model* coverage_model;
    
    SC_CTOR(fc4sc_testbench) : clk("clk", 10, SC_NS) {
        // Create FC4SC coverage model
        coverage_model = new fc4sc_coverage_model("fc4sc_coverage_model");
        
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
        driver = new fc4sc_packet_driver("fc4sc_driver");
        monitor = new fc4sc_axis_monitor("fc4sc_monitor");
        sequence_gen = new fc4sc_sequence_generator("fc4sc_sequence_gen");
        
        // Connect driver
        driver->ext_valid(ext_valid);
        driver->ext_data(ext_data);
        driver->ext_keep(ext_keep);
        driver->ext_last(ext_last);
        driver->ext_ready(ext_ready);
        driver->clk(clk);
        driver->rst_n(rst_n);
        driver->set_coverage_model(coverage_model);
        
        // Connect monitor
        monitor->axis_tvalid(axis_tvalid);
        monitor->axis_tdata(axis_tdata);
        monitor->axis_tkeep(axis_tkeep);
        monitor->axis_tuser(axis_tuser);
        monitor->axis_tlast(axis_tlast);
        monitor->axis_tready(axis_tready);
        monitor->clk(clk);
        monitor->rst_n(rst_n);
        monitor->set_coverage_model(coverage_model);
        
        // Connect sequence generator
        sequence_gen->set_driver(driver);
        sequence_gen->set_coverage_model(coverage_model);
        
        // Control processes
        SC_THREAD(reset_process);
        SC_THREAD(control_signals_process);
        SC_THREAD(test_controller);
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[FC4SC-TB] Reset sequence completed" << std::endl;
    }
    
    void control_signals_process() {
        axis_tready.write(true);
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        credit_return_valid.write(false);
    }
    
    void test_controller() {
        // Wait for test completion
        std::cout << "[FC4SC-TB] Test controller started - waiting for test completion..." << std::endl;
        wait(15000, SC_NS);  // Increased wait time
        std::cout << "[FC4SC-TB] Wait period completed - starting cleanup..." << std::endl;
        
        std::cout << "\n[FC4SC-TB] Test completed - generating FC4SC coverage report" << std::endl;
        
        // Print final statistics
        std::cout << "\n=== FC4SC Test Final Statistics ===" << std::endl;
        std::cout << "Driver transactions sent: " << driver->transactions_sent << std::endl;
        std::cout << "Monitor packets observed: " << monitor->packets_observed << std::endl;
        std::cout << "Monitor beats observed: " << monitor->beats_observed << std::endl;
        std::cout << "DUT packets received: " << dut->get_packets_received() << std::endl;
        std::cout << "DUT packets forwarded: " << dut->get_packets_forwarded() << std::endl;
        
        // Print FC4SC coverage report
        coverage_model->print_coverage_report();
        
        // Export FC4SC coverage to XML
        std::string xml_path = "build/fc4sc_coverage_report.xml";
        std::cout << "[FC4SC-COV] Attempting to write XML to: " << xml_path << std::endl;
        
        // Test direct XML file creation first
        std::cout << "[FC4SC-COV] Testing direct XML file creation..." << std::endl;
        std::ofstream test_xml("build/test_direct.xml");
        if (test_xml.is_open()) {
            test_xml << "<?xml version=\"1.0\"?><test>Direct XML creation works</test>";
            test_xml.close();
            std::cout << "[FC4SC-COV] ✅ Direct XML creation successful" << std::endl;
        } else {
            std::cout << "[FC4SC-COV] ❌ Direct XML creation failed" << std::endl;
        }
        
        coverage_model->export_coverage_xml(xml_path);
        
        // Final verification
        double coverage_pct = coverage_model->get_overall_coverage();
        bool test_passed = (driver->transactions_sent == monitor->packets_observed) &&
                          (driver->transactions_sent == (int)dut->get_packets_received()) &&
                          (driver->transactions_sent == (int)dut->get_packets_forwarded()) &&
                          (coverage_pct >= 80.0);  // Coverage goal: 80%
        
        if (test_passed) {
            std::cout << "\n🎉 ✅ FC4SC TEST PASSED!" << std::endl;
            std::cout << "FC4SC Coverage: " << std::fixed << std::setprecision(1) 
                      << coverage_pct << "% (Goal: 80%)" << std::endl;
        } else {
            std::cout << "\n❌ FC4SC TEST FAILED!" << std::endl;
            std::cout << "FC4SC Coverage: " << std::fixed << std::setprecision(1) 
                      << coverage_pct << "% (Goal: 80%)" << std::endl;
        }
        
        std::cout << "=========================================" << std::endl;
        
        sc_stop();
    }
    
    ~fc4sc_testbench() {
        delete dut;
        delete driver;
        delete monitor;
        delete sequence_gen;
        delete coverage_model;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== FC4SC-based SystemC Verification Environment ===" << std::endl;
    std::cout << "Using Accellera FC4SC library for functional coverage" << std::endl;
    
    // Create testbench
    fc4sc_testbench tb("fc4sc_testbench");
    
    // Run simulation
    sc_start();
    
    std::cout << "=== FC4SC Test completed ===" << std::endl;
    
    // Force XML generation at the end
    std::cout << "[FC4SC-MAIN] Forcing XML generation at simulation end..." << std::endl;
    tb.coverage_model->export_coverage_xml("build/fc4sc_coverage_report.xml");
    std::cout << "[FC4SC-MAIN] XML generation completed" << std::endl;
    
    return 0;
}