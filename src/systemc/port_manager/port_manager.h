#ifndef PORT_MANAGER_H
#define PORT_MANAGER_H

#include <systemc.h>
#include <fstream>
#include <vector>
#include <map>
#include <string>
#include <chrono>
#include "ingress_port_manager.h"
#include "egress_port_manager.h"
#include "../common/switch_types.h"

namespace switch_internal_p2p {

// =============================================================================
// Unified Port Manager
// =============================================================================
// 
// 이 모듈은 IngressPortManager와 EgressPortManager를 내부적으로 통합하여
// 단일 Port Manager 인터페이스를 제공합니다.
//
// 주요 기능:
// - 외부 패킷 수신 (External Input → Ingress)
// - 내부 AXIS 처리 (자동 연결)
// - 외부 패킷 전송 (Egress → External Output)
// - 통합된 AXI 인터페이스
// - 통합된 크레딧 관리
// - 통합된 설정 및 모니터링

SC_MODULE(PortManager) {
public:
    // =============================================================================
    // External Interfaces
    // =============================================================================
    
    // Clock and Reset
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // External Input Interface (to Ingress side)
    sc_in<bool> ext_in_valid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> ext_in_data;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> ext_in_keep;
    sc_in<bool> ext_in_last;
    sc_out<bool> ext_in_ready;
    
    // External Output Interface (from Egress side)
    sc_out<bool> ext_out_valid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> ext_out_data;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> ext_out_keep;
    sc_out<bool> ext_out_last;
    sc_in<bool> ext_out_ready;
    
    // Internal AXIS Interface (to/from Queue Managers)
    // Ingress side (Master to Queue Manager)
    sc_out<bool> ingress_axis_tvalid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> ingress_axis_tdata;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> ingress_axis_tkeep;
    sc_out<sc_bv<AXIS_USER_WIDTH>> ingress_axis_tuser;
    sc_out<bool> ingress_axis_tlast;
    sc_in<bool> ingress_axis_tready;
    
    // Egress side (Slave from Queue Manager)
    sc_in<bool> egress_axis_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> egress_axis_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> egress_axis_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> egress_axis_tuser;
    sc_in<bool> egress_axis_tlast;
    sc_out<bool> egress_axis_tready;
    
    // Unified AXI Master Interface
    sc_out<bool> axi_master_valid;
    sc_out<sc_bv<32>> axi_master_addr;
    sc_out<sc_bv<32>> axi_master_data;
    sc_in<bool> axi_master_ready;
    
    // Unified AXI Slave Interface
    sc_in<bool> axi_slave_valid;
    sc_in<sc_bv<32>> axi_slave_addr;
    sc_in<sc_bv<32>> axi_slave_data;
    sc_out<bool> axi_slave_ready;
    
    // Unified Credit Interface
    sc_in<bool> credit_return_valid;
    sc_out<bool> credit_return_ready;
    
    // =============================================================================
    // Constructor
    // =============================================================================
    
    SC_CTOR(PortManager) {
        // Create internal components
        ingress_port = new IngressPortManager("ingress_port");
        egress_port = new EgressPortManager("egress_port");
        
        // Connect clock and reset
        ingress_port->clk(clk);
        ingress_port->rst_n(rst_n);
        egress_port->clk(clk);
        egress_port->rst_n(rst_n);
        
        // Connect external input interface (to Ingress)
        ingress_port->ext_valid(ext_in_valid);
        ingress_port->ext_data(ext_in_data);
        ingress_port->ext_keep(ext_in_keep);
        ingress_port->ext_last(ext_in_last);
        ingress_port->ext_ready(ext_in_ready);
        
        // Connect external output interface (from Egress)
        egress_port->ext_valid(ext_out_valid);
        egress_port->ext_data(ext_out_data);
        egress_port->ext_keep(ext_out_keep);
        egress_port->ext_last(ext_out_last);
        egress_port->ext_ready(ext_out_ready);
        
        // Connect internal AXIS interfaces
        // Ingress → External (to Queue Manager)
        ingress_port->axis_tvalid(ingress_axis_tvalid);
        ingress_port->axis_tdata(ingress_axis_tdata);
        ingress_port->axis_tkeep(ingress_axis_tkeep);
        ingress_port->axis_tuser(ingress_axis_tuser);
        ingress_port->axis_tlast(ingress_axis_tlast);
        ingress_port->axis_tready(ingress_axis_tready);
        
        // External → Egress (from Queue Manager)
        egress_port->axis_tvalid(egress_axis_tvalid);
        egress_port->axis_tdata(egress_axis_tdata);
        egress_port->axis_tkeep(egress_axis_tkeep);
        egress_port->axis_tuser(egress_axis_tuser);
        egress_port->axis_tlast(egress_axis_tlast);
        egress_port->axis_tready(egress_axis_tready);
        
        // Connect AXI interfaces - need arbitration logic
        ingress_port->axi_master_valid(ingress_axi_master_valid);
        ingress_port->axi_master_addr(ingress_axi_master_addr);
        ingress_port->axi_master_data(ingress_axi_master_data);
        ingress_port->axi_master_ready(ingress_axi_master_ready);
        
        egress_port->axi_master_valid(egress_axi_master_valid);
        egress_port->axi_master_addr(egress_axi_master_addr);
        egress_port->axi_master_data(egress_axi_master_data);
        egress_port->axi_master_ready(egress_axi_master_ready);
        
        ingress_port->axi_slave_valid(axi_slave_valid);
        ingress_port->axi_slave_addr(axi_slave_addr);
        ingress_port->axi_slave_data(axi_slave_data);
        ingress_port->axi_slave_ready(ingress_axi_slave_ready);
        
        egress_port->axi_slave_valid(axi_slave_valid);
        egress_port->axi_slave_addr(axi_slave_addr);
        egress_port->axi_slave_data(axi_slave_data);
        egress_port->axi_slave_ready(egress_axi_slave_ready);
        
        // Connect credit interface (primarily for Ingress)
        ingress_port->credit_return_valid(credit_return_valid);
        ingress_port->credit_return_ready(credit_return_ready);
        
        // Register processes for AXI arbitration
        SC_METHOD(axi_master_arbitration);
        sensitive << ingress_axi_master_valid << egress_axi_master_valid;
        
        SC_METHOD(axi_slave_arbitration);
        sensitive << ingress_axi_slave_ready << egress_axi_slave_ready;
        
        // Initialize tracing system
        tracing_enabled = false;
        vcd_file_open = false;
        tf = nullptr;
        next_packet_id = 1;
        total_packets_traced = 0;
        metrics_update_interval = sc_time(100, SC_NS);  // Update every 100ns
        last_metrics_update = SC_ZERO_TIME;
        packets_in_current_window = 0;
        throughput_window_start = SC_ZERO_TIME;
        
        // Initialize tracing signals
        trace_packet_valid.write(false);
        trace_packet_id.write(0);
        trace_packet_size.write(0);
        trace_buffer_usage.write(0);
        trace_throughput.write(0.0);
        trace_system_healthy.write(true);
        
        // Register tracing process
        SC_THREAD(tracing_monitor_process);
        sensitive << clk.pos();
    }
    
    // =============================================================================
    // Destructor
    // =============================================================================
    
    ~PortManager() {
        // Clean up tracing
        if (vcd_file_open) {
            close_vcd_file();
        }
        
        delete ingress_port;
        delete egress_port;
    }
    
    // =============================================================================
    // Configuration Interface
    // =============================================================================
    
    void configure_port(uint8_t port_id) {
        ingress_port->set_port_id(port_id);
        egress_port->set_port_id(port_id);
        unified_port_id = port_id;
    }
    
    uint8_t get_port_id() const {
        return unified_port_id;
    }
    
    // =============================================================================
    // Packet Tracing System
    // =============================================================================
    
    // Individual packet tracking information
    struct PacketTrace {
        uint64_t packet_id;              // Unique packet identifier
        sc_time ingress_timestamp;       // When packet arrived at ingress
        sc_time egress_timestamp;        // When packet left at egress
        sc_time processing_latency;      // Total processing time
        uint32_t packet_size;            // Size in bytes
        uint8_t source_port;             // Source port number
        uint8_t dest_port;               // Destination port number
        PacketType packet_type;          // Packet type (DATA, CONTROL, etc.)
        uint8_t priority;                // QoS priority level
        std::string route_path;          // Path through the system
        bool completed;                  // Whether packet completed processing
        
        PacketTrace() : packet_id(0), processing_latency(SC_ZERO_TIME), 
                       packet_size(0), source_port(0), dest_port(0), 
                       packet_type(PacketType::DATA), priority(0), 
                       completed(false) {}
    };
    
    // Real-time performance metrics
    struct TracingMetrics {
        // Throughput metrics
        double instantaneous_throughput;    // packets/second (current)
        double average_throughput;          // packets/second (average)
        double peak_throughput;             // packets/second (maximum)
        
        // Latency metrics  
        sc_time min_latency;               // Minimum packet latency
        sc_time max_latency;               // Maximum packet latency
        sc_time avg_latency;               // Average packet latency
        sc_time current_latency;           // Latest packet latency
        
        // Buffer metrics
        uint32_t ingress_peak_usage;       // Peak ingress buffer usage
        uint32_t egress_peak_usage;        // Peak egress buffer usage
        double ingress_avg_utilization;    // Average ingress utilization
        double egress_avg_utilization;     // Average egress utilization
        
        // Error metrics
        uint64_t dropped_packets;          // Total dropped packets
        uint64_t timeout_events;           // Total timeout events
        uint64_t backpressure_events;      // Total backpressure events
        
        // System health
        bool is_healthy;                   // Overall system health
        std::string last_error;            // Last error message
        sc_time last_error_time;           // When last error occurred
        
        TracingMetrics() : instantaneous_throughput(0.0), average_throughput(0.0), 
                          peak_throughput(0.0), min_latency(SC_ZERO_TIME), 
                          max_latency(SC_ZERO_TIME), avg_latency(SC_ZERO_TIME),
                          current_latency(SC_ZERO_TIME), ingress_peak_usage(0),
                          egress_peak_usage(0), ingress_avg_utilization(0.0),
                          egress_avg_utilization(0.0), dropped_packets(0),
                          timeout_events(0), backpressure_events(0),
                          is_healthy(true), last_error_time(SC_ZERO_TIME) {}
    };
    
    // =============================================================================
    // Unified Statistics Interface
    // =============================================================================
    
    struct PortStats {
        // Ingress statistics
        uint64_t packets_received;
        uint64_t packets_forwarded;
        uint32_t ingress_buffer_utilization;
        uint16_t available_credits;
        
        // Egress statistics  
        uint64_t packets_transmitted;
        uint64_t packets_buffered;
        uint32_t egress_buffer_utilization;
        
        // Unified statistics
        uint64_t total_packets_processed;
        double processing_efficiency;
        sc_time average_latency;
    };
    
    PortStats get_unified_statistics() const {
        PortStats stats;
        
        // Ingress statistics
        stats.packets_received = ingress_port->get_packets_received();
        stats.packets_forwarded = ingress_port->get_packets_forwarded();
        stats.ingress_buffer_utilization = ingress_port->get_buffer_utilization();
        stats.available_credits = ingress_port->get_available_credits();
        
        // Egress statistics
        stats.packets_transmitted = egress_port->get_packets_transmitted();
        stats.packets_buffered = egress_port->get_packets_buffered();
        stats.egress_buffer_utilization = egress_port->get_buffer_utilization();
        
        // Unified calculations
        stats.total_packets_processed = stats.packets_received;
        stats.processing_efficiency = (stats.packets_received > 0) ? 
            (double)stats.packets_transmitted / stats.packets_received * 100.0 : 0.0;
        stats.average_latency = calculate_average_latency();
        
        return stats;
    }
    
    // =============================================================================
    // Debug and Monitoring
    // =============================================================================
    
    void print_status() const {
        PortStats stats = get_unified_statistics();
        
        std::cout << "\n=== Port Manager Status (Port " << (int)unified_port_id << ") ===" << std::endl;
        std::cout << "Ingress  - RX: " << stats.packets_received 
                  << ", TX: " << stats.packets_forwarded 
                  << ", Buf: " << stats.ingress_buffer_utilization << std::endl;
        std::cout << "Egress   - Buffered: " << stats.packets_buffered 
                  << ", TX: " << stats.packets_transmitted 
                  << ", Buf: " << stats.egress_buffer_utilization << std::endl;
        std::cout << "Overall  - Processed: " << stats.total_packets_processed 
                  << ", Efficiency: " << stats.processing_efficiency << "%" << std::endl;
        std::cout << "Credits  - Available: " << stats.available_credits << std::endl;
    }
    
    bool is_healthy() const {
        PortStats stats = get_unified_statistics();
        return stats.processing_efficiency > 95.0 && 
               stats.ingress_buffer_utilization < 90 &&
               stats.egress_buffer_utilization < 90;
    }
    
    // =============================================================================
    // Tracing Interface
    // =============================================================================
    
    // Enable/Disable tracing
    void enable_tracing(bool enable = true) {
        tracing_enabled = enable;
        if (enable && !vcd_file_open) {
            open_vcd_file();
        }
    }
    
    void disable_tracing() {
        tracing_enabled = false;
        if (vcd_file_open) {
            close_vcd_file();
        }
    }
    
    // VCD file management
    void open_vcd_file(const std::string& filename = "port_manager_trace.vcd") {
        if (!vcd_file_open) {
            vcd_filename = filename;
            tf = sc_create_vcd_trace_file(vcd_filename.c_str());
            if (tf) {
                setup_vcd_tracing();
                vcd_file_open = true;
                std::cout << "[Tracing] VCD file opened: " << vcd_filename << ".vcd" << std::endl;
            }
        }
    }
    
    void close_vcd_file() {
        if (vcd_file_open && tf) {
            sc_close_vcd_trace_file(tf);
            tf = nullptr;
            vcd_file_open = false;
            std::cout << "[Tracing] VCD file closed: " << vcd_filename << ".vcd" << std::endl;
        }
    }
    
    // Packet journey tracking
    uint64_t start_packet_trace(uint32_t packet_size, uint8_t source_port = 0, 
                               uint8_t dest_port = 0, PacketType type = PacketType::DATA) {
        if (!tracing_enabled) return 0;
        
        uint64_t packet_id = next_packet_id++;
        PacketTrace trace;
        trace.packet_id = packet_id;
        trace.ingress_timestamp = sc_time_stamp();
        trace.packet_size = packet_size;
        trace.source_port = source_port;
        trace.dest_port = dest_port;
        trace.packet_type = type;
        trace.route_path = "INGRESS";
        
        active_packets[packet_id] = trace;
        total_packets_traced++;
        
        // Update real-time metrics
        update_ingress_metrics(packet_size);
        
        return packet_id;
    }
    
    void update_packet_trace(uint64_t packet_id, const std::string& checkpoint) {
        if (!tracing_enabled || active_packets.find(packet_id) == active_packets.end()) return;
        
        active_packets[packet_id].route_path += " -> " + checkpoint;
    }
    
    void complete_packet_trace(uint64_t packet_id) {
        if (!tracing_enabled || active_packets.find(packet_id) == active_packets.end()) return;
        
        PacketTrace& trace = active_packets[packet_id];
        trace.egress_timestamp = sc_time_stamp();
        trace.processing_latency = trace.egress_timestamp - trace.ingress_timestamp;
        trace.route_path += " -> EGRESS";
        trace.completed = true;
        
        // Update metrics
        update_egress_metrics(trace);
        
        // Move to completed packets
        completed_packets.push_back(trace);
        active_packets.erase(packet_id);
        
        // Keep only recent completed packets (last 1000)
        if (completed_packets.size() > 1000) {
            completed_packets.erase(completed_packets.begin());
        }
    }
    
    // Get tracing metrics
    TracingMetrics get_tracing_metrics() const {
        return current_metrics;
    }
    
    // Get packet journey information
    std::vector<PacketTrace> get_completed_packets(uint32_t limit = 100) const {
        std::vector<PacketTrace> result;
        uint32_t start = completed_packets.size() > limit ? completed_packets.size() - limit : 0;
        
        for (uint32_t i = start; i < completed_packets.size(); i++) {
            result.push_back(completed_packets[i]);
        }
        return result;
    }
    
    std::vector<PacketTrace> get_active_packets() const {
        std::vector<PacketTrace> result;
        for (const auto& pair : active_packets) {
            result.push_back(pair.second);
        }
        return result;
    }
    
    // Real-time monitoring
    void print_tracing_summary() const {
        std::cout << "\n=== Port Manager Tracing Summary ===" << std::endl;
        std::cout << "Total packets traced: " << total_packets_traced << std::endl;
        std::cout << "Active packets: " << active_packets.size() << std::endl;
        std::cout << "Completed packets: " << completed_packets.size() << std::endl;
        std::cout << "Average throughput: " << current_metrics.average_throughput << " pps" << std::endl;
        std::cout << "Peak throughput: " << current_metrics.peak_throughput << " pps" << std::endl;
        std::cout << "Average latency: " << current_metrics.avg_latency << std::endl;
        std::cout << "Min/Max latency: " << current_metrics.min_latency << " / " << current_metrics.max_latency << std::endl;
        std::cout << "System health: " << (current_metrics.is_healthy ? "HEALTHY" : "UNHEALTHY") << std::endl;
        
        if (!current_metrics.last_error.empty()) {
            std::cout << "Last error: " << current_metrics.last_error 
                      << " at " << current_metrics.last_error_time << std::endl;
        }
        std::cout << "======================================" << std::endl;
    }
    
    // Export tracing data
    void export_packet_journey(const std::string& filename = "packet_journey.csv") const {
        std::ofstream file(filename);
        if (!file.is_open()) {
            std::cerr << "[Tracing] Failed to open " << filename << " for writing" << std::endl;
            return;
        }
        
        // CSV header
        file << "PacketID,IngressTime,EgressTime,Latency,Size,SourcePort,DestPort,Type,Priority,Route\n";
        
        // Write completed packets
        for (const auto& packet : completed_packets) {
            file << packet.packet_id << ","
                 << packet.ingress_timestamp << ","
                 << packet.egress_timestamp << ","
                 << packet.processing_latency << ","
                 << packet.packet_size << ","
                 << (int)packet.source_port << ","
                 << (int)packet.dest_port << ","
                 << (int)packet.packet_type << ","
                 << (int)packet.priority << ","
                 << packet.route_path << "\n";
        }
        
        file.close();
        std::cout << "[Tracing] Packet journey exported to: " << filename << std::endl;
    }

private:
    // =============================================================================
    // Internal Components
    // =============================================================================
    
    IngressPortManager* ingress_port;
    EgressPortManager* egress_port;
    
    // =============================================================================
    // Internal Signals for AXI Arbitration
    // =============================================================================
    
    sc_signal<bool> ingress_axi_master_valid;
    sc_signal<sc_bv<32>> ingress_axi_master_addr;
    sc_signal<sc_bv<32>> ingress_axi_master_data;
    sc_signal<bool> ingress_axi_master_ready;
    
    sc_signal<bool> egress_axi_master_valid;
    sc_signal<sc_bv<32>> egress_axi_master_addr;
    sc_signal<sc_bv<32>> egress_axi_master_data;
    sc_signal<bool> egress_axi_master_ready;
    
    sc_signal<bool> ingress_axi_slave_ready;
    sc_signal<bool> egress_axi_slave_ready;
    
    // =============================================================================
    // Internal State
    // =============================================================================
    
    uint8_t unified_port_id;
    
    // =============================================================================
    // Tracing State
    // =============================================================================
    
    // Tracing control
    bool tracing_enabled;
    bool vcd_file_open;
    std::string vcd_filename;
    sc_trace_file* tf;
    
    // Packet tracking
    uint64_t next_packet_id;
    uint64_t total_packets_traced;
    std::map<uint64_t, PacketTrace> active_packets;
    std::vector<PacketTrace> completed_packets;
    
    // Performance metrics
    mutable TracingMetrics current_metrics;
    sc_time metrics_update_interval;
    sc_time last_metrics_update;
    
    // Throughput calculation
    uint64_t packets_in_current_window;
    sc_time throughput_window_start;
    static const sc_time THROUGHPUT_WINDOW;
    
    // VCD tracing signals
    sc_signal<bool> trace_packet_valid;
    sc_signal<uint64_t> trace_packet_id;
    sc_signal<uint32_t> trace_packet_size;
    sc_signal<uint32_t> trace_buffer_usage;
    sc_signal<double> trace_throughput;
    sc_signal<bool> trace_system_healthy;
    
    // =============================================================================
    // Process Declarations
    // =============================================================================
    
    void axi_master_arbitration();
    void axi_slave_arbitration();
    void tracing_monitor_process();  // New tracing process
    
    // =============================================================================
    // Helper Functions
    // =============================================================================
    
    sc_time calculate_average_latency() const;
    
    // =============================================================================
    // Tracing Helper Functions
    // =============================================================================
    
    void setup_vcd_tracing();
    void update_ingress_metrics(uint32_t packet_size);
    void update_egress_metrics(const PacketTrace& trace);
    void update_throughput_metrics();
    void update_latency_metrics(const sc_time& latency);
    void update_buffer_metrics();
    void log_error(const std::string& error_msg);
};

} // namespace switch_internal_p2p

#endif // PORT_MANAGER_H