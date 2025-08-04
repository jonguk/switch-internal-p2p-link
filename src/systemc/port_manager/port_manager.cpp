#include "port_manager.h"
#include <iostream>
#include <algorithm>

namespace switch_internal_p2p {

// =============================================================================
// Static Constants
// =============================================================================

const sc_time PortManager::THROUGHPUT_WINDOW(1000, SC_NS);  // 1us window for throughput calculation

// =============================================================================
// Process Implementations
// =============================================================================

void PortManager::axi_master_arbitration() {
    // Priority-based arbitration: Ingress has higher priority than Egress
    // This ensures that incoming packet processing is prioritized
    
    bool ingress_requests = ingress_axi_master_valid.read();
    bool egress_requests = egress_axi_master_valid.read();
    
    if (ingress_requests) {
        // Grant to Ingress (higher priority)
        axi_master_valid.write(true);
        axi_master_addr.write(ingress_axi_master_addr.read());
        axi_master_data.write(ingress_axi_master_data.read());
        
        ingress_axi_master_ready.write(axi_master_ready.read());
        egress_axi_master_ready.write(false);  // Block Egress
        
    } else if (egress_requests) {
        // Grant to Egress (when Ingress is idle)
        axi_master_valid.write(true);
        axi_master_addr.write(egress_axi_master_addr.read());
        axi_master_data.write(egress_axi_master_data.read());
        
        ingress_axi_master_ready.write(false);  // Ingress not requesting
        egress_axi_master_ready.write(axi_master_ready.read());
        
    } else {
        // No requests
        axi_master_valid.write(false);
        axi_master_addr.write(0);
        axi_master_data.write(0);
        
        ingress_axi_master_ready.write(false);
        egress_axi_master_ready.write(false);
    }
}

void PortManager::axi_slave_arbitration() {
    // Combine AXI Slave responses using OR logic
    // Both ingress and egress can respond to AXI slave requests
    // The combination allows either one to acknowledge the request
    
    bool ingress_ready = ingress_axi_slave_ready.read();
    bool egress_ready = egress_axi_slave_ready.read();
    
    // OR combination: ready if either component is ready
    axi_slave_ready.write(ingress_ready || egress_ready);
}

sc_time PortManager::calculate_average_latency() const {
    // Calculate estimated average latency based on buffer utilizations
    // This is a simplified calculation for monitoring purposes
    
    uint32_t ingress_util = ingress_port->get_buffer_utilization();
    uint32_t egress_util = egress_port->get_buffer_utilization();
    
    // Base latency for processing (observed from back-to-back tests)
    sc_time base_latency(20, SC_NS);
    
    // Additional latency due to buffering
    // Each buffered packet adds approximately 10ns processing delay
    sc_time buffer_latency = sc_time((ingress_util + egress_util) * 10, SC_NS);
    
    return base_latency + buffer_latency;
}

// =============================================================================
// Tracing Process Implementation
// =============================================================================

void PortManager::tracing_monitor_process() {
    static bool packet_valid_state = false;
    
    while (true) {
        wait(metrics_update_interval);
        
        if (tracing_enabled) {
            // Update all metrics
            update_throughput_metrics();
            update_buffer_metrics();
            
            // Update VCD signals
            trace_system_healthy.write(is_healthy());
            trace_buffer_usage.write(
                (ingress_port->get_buffer_utilization() + egress_port->get_buffer_utilization()) / 2
            );
            trace_throughput.write(current_metrics.instantaneous_throughput);
            
            // Toggle packet valid signal to show activity
            if (packets_in_current_window > 0) {
                packet_valid_state = !packet_valid_state;
                trace_packet_valid.write(packet_valid_state);
            } else {
                trace_packet_valid.write(false);
            }
            
            // Check for system health issues
            if (!is_healthy()) {
                log_error("System health degraded");
            }
        }
    }
}

// =============================================================================
// Tracing Helper Functions Implementation
// =============================================================================

void PortManager::setup_vcd_tracing() {
    if (!tf) return;
    
    // Trace system-level signals
    sc_trace(tf, clk, "clk");
    sc_trace(tf, rst_n, "rst_n");
    
    // External interface signals
    sc_trace(tf, ext_in_valid, "ext_in_valid");
    sc_trace(tf, ext_in_ready, "ext_in_ready");
    sc_trace(tf, ext_out_valid, "ext_out_valid");
    sc_trace(tf, ext_out_ready, "ext_out_ready");
    
    // Internal AXIS signals
    sc_trace(tf, ingress_axis_tvalid, "ingress_axis_tvalid");
    sc_trace(tf, ingress_axis_tready, "ingress_axis_tready");
    sc_trace(tf, egress_axis_tvalid, "egress_axis_tvalid");
    sc_trace(tf, egress_axis_tready, "egress_axis_tready");
    
    // Tracing-specific signals
    sc_trace(tf, trace_packet_valid, "trace_packet_valid");
    sc_trace(tf, trace_packet_id, "trace_packet_id");
    sc_trace(tf, trace_packet_size, "trace_packet_size");
    sc_trace(tf, trace_buffer_usage, "trace_buffer_usage");
    sc_trace(tf, trace_throughput, "trace_throughput");
    sc_trace(tf, trace_system_healthy, "trace_system_healthy");
    
    std::cout << "[Tracing] VCD setup completed with " << 12 << " signals" << std::endl;
}

void PortManager::update_ingress_metrics(uint32_t packet_size) {
    packets_in_current_window++;
    
    // Only update packet data, not the valid signal (to avoid multiple drivers)
    trace_packet_id.write(next_packet_id - 1);  // Latest packet ID
    trace_packet_size.write(packet_size);
}

void PortManager::update_egress_metrics(const PacketTrace& trace) {
    // Update latency metrics
    update_latency_metrics(trace.processing_latency);
    
    // Calculate current efficiency
    if (total_packets_traced > 0) {
        current_metrics.instantaneous_throughput = 
            (double)completed_packets.size() / (sc_time_stamp().to_seconds() + 1e-9);
    }
}

void PortManager::update_throughput_metrics() {
    sc_time current_time = sc_time_stamp();
    
    // Calculate instantaneous throughput over the window
    if (current_time - throughput_window_start >= THROUGHPUT_WINDOW) {
        current_metrics.instantaneous_throughput = 
            (double)packets_in_current_window / THROUGHPUT_WINDOW.to_seconds();
        
        // Update peak throughput
        if (current_metrics.instantaneous_throughput > current_metrics.peak_throughput) {
            current_metrics.peak_throughput = current_metrics.instantaneous_throughput;
        }
        
        // Update average throughput
        static uint32_t measurement_count = 0;
        measurement_count++;
        current_metrics.average_throughput = 
            (current_metrics.average_throughput * (measurement_count - 1) + 
             current_metrics.instantaneous_throughput) / measurement_count;
        
        // Reset window
        packets_in_current_window = 0;
        throughput_window_start = current_time;
    }
}

void PortManager::update_latency_metrics(const sc_time& latency) {
    current_metrics.current_latency = latency;
    
    // Update min/max latency
    if (current_metrics.min_latency == SC_ZERO_TIME || latency < current_metrics.min_latency) {
        current_metrics.min_latency = latency;
    }
    if (latency > current_metrics.max_latency) {
        current_metrics.max_latency = latency;
    }
    
    // Update average latency
    static uint32_t latency_count = 0;
    static sc_time total_latency(SC_ZERO_TIME);
    
    latency_count++;
    total_latency += latency;
    current_metrics.avg_latency = total_latency / latency_count;
}

void PortManager::update_buffer_metrics() {
    uint32_t ingress_util = ingress_port->get_buffer_utilization();
    uint32_t egress_util = egress_port->get_buffer_utilization();
    
    // Update peak usage
    if (ingress_util > current_metrics.ingress_peak_usage) {
        current_metrics.ingress_peak_usage = ingress_util;
    }
    if (egress_util > current_metrics.egress_peak_usage) {
        current_metrics.egress_peak_usage = egress_util;
    }
    
    // Update average utilization (simple moving average)
    static uint32_t buffer_measurement_count = 0;
    buffer_measurement_count++;
    
    current_metrics.ingress_avg_utilization = 
        (current_metrics.ingress_avg_utilization * (buffer_measurement_count - 1) + 
         ingress_util) / buffer_measurement_count;
    
    current_metrics.egress_avg_utilization = 
        (current_metrics.egress_avg_utilization * (buffer_measurement_count - 1) + 
         egress_util) / buffer_measurement_count;
}

void PortManager::log_error(const std::string& error_msg) {
    current_metrics.last_error = error_msg;
    current_metrics.last_error_time = sc_time_stamp();
    current_metrics.is_healthy = false;
    
    std::cerr << "[Tracing ERROR] " << error_msg << " at " << sc_time_stamp() << std::endl;
}

} // namespace switch_internal_p2p