#include "egress_port_manager.h"
#include <iostream>
#include <cstring>

namespace switch_internal_p2p {

// =============================================================================
// Process Implementations
// =============================================================================

void EgressPortManager::axis_receive_process() {
    // Reset behavior
    axis_tready.write(false);
    current_packet_buffer.clear();
    packet_in_progress = false;
    
    wait();  // Wait for clock edge after reset
    
    while (true) {
        // 🚫 TEMPORARY FIX: Disable reception to prevent infinite loops
        // Signal ready to receive when buffer is not full
        axis_tready.write(!is_buffer_full());
        
        wait();  // Wait for clock edge
        
        // ✅ TEST: Re-enable packet reception to check if loop actually exists
        // Current architecture may not have direct loop at EgressPortManager level  
        if (axis_tvalid.read() && axis_tready.read()) {
            // Read data from AXIS interface
            sc_bv<AXIS_DATA_WIDTH> data = axis_tdata.read();
            sc_bv<AXIS_KEEP_WIDTH> keep = axis_tkeep.read();
            sc_bv<AXIS_USER_WIDTH> user = axis_tuser.read();
            bool last = axis_tlast.read();
            
            // Extract internal header from first beat (tuser field)
            if (!packet_in_progress && user != 0) {
                current_header = InternalHeader::from_sc_bv(user);
                packet_in_progress = true;
                std::cout << "[Egress Port " << (int)port_id 
                          << "] 🚫 LOOP BLOCKED: Would start packet reception, header source: " 
                          << (int)current_header.source_port << std::endl;
            }
            
            // Extract valid bytes based on keep signal
            size_t bytes_per_word = AXIS_DATA_WIDTH / 8;
            for (size_t i = 0; i < bytes_per_word; i++) {
                if (keep[i] == 1) {
                    uint8_t byte_val = data.range(i*8+7, i*8).to_uint();
                    current_packet_buffer.push_back(byte_val);
                }
            }
            
            // If this is the last beat, complete the packet
            if (last) {
                if (!current_packet_buffer.empty()) {
                    store_packet(current_packet_buffer, current_header);
                    packets_buffered++;
                }
                current_packet_buffer.clear();
                packet_in_progress = false;
                
                // Reset header for next packet
                current_header = InternalHeader();
            }
        }
    }
}

void EgressPortManager::external_transmit_process() {
    // Reset behavior
    ext_valid.write(false);
    ext_data.write(0);
    ext_keep.write(0);
    ext_last.write(false);
    ext_transmission_active = false;
    ext_tx_offset = 0;
    
    wait();  // Wait for clock edge after reset
    
    while (true) {
        // Check if there's data to transmit and external interface is ready
        if (!ext_transmission_active && !is_buffer_empty()) {
            if (retrieve_packet(current_tx_packet)) {
                std::cout << "[Egress Port " << (int)port_id 
                          << "] Starting external transmission, packet size: " 
                          << current_tx_packet.packet_data.size() << " bytes" << std::endl;
                ext_transmission_active = true;
                ext_tx_offset = 0;
            }
        }
        
        // Transmit packet if active and ready
        if (ext_transmission_active && ext_ready.read()) {
            send_external_packet(current_tx_packet);
        } else {
            // Clear valid signal when not transmitting or not ready
            // This ensures proper AXI Stream protocol compliance
            if (!ext_transmission_active) {
                ext_valid.write(false);
                ext_last.write(false);
            }
        }
        
        wait();  // Wait for clock edge
    }
}

void EgressPortManager::axi_slave_process() {
    // Handle AXI slave interface for configuration/monitoring
    if (axi_slave_valid.read()) {
        axi_slave_ready.write(true);
        
        uint32_t addr = axi_slave_addr.read().to_uint();
        uint32_t data = axi_slave_data.read().to_uint();
        (void)data; // Suppress unused variable warning
        
        // Simple register map (placeholder implementation)
        switch (addr) {
            case 0x00:  // Statistics - packets transmitted
                // Read-only register
                break;
            case 0x04:  // Statistics - packets buffered  
                // Read-only register
                break;
            case 0x08:  // Buffer utilization
                // Read-only register
                break;
            default:
                // Unknown register
                break;
        }
    } else {
        axi_slave_ready.write(false);
    }
}

// =============================================================================
// Helper Function Implementations
// =============================================================================

void EgressPortManager::store_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header) {
    if (!is_buffer_full()) {
        UnifiedPacketEntry& entry = circular_buffer[buffer_tail];
        
        // Convert internal format to external format
        convert_internal_to_external(packet_data, header, entry.packet_data);
        entry.header = header;
        entry.timestamp = sc_time_stamp().to_default_time_units();
        entry.valid = true;
        
        buffer_tail = (buffer_tail + 1) % BUFFER_SIZE;
        buffer_count++;
        
        std::cout << "[Egress Port " << (int)port_id << "] Stored packet, size: " 
                  << entry.packet_data.size() << " bytes, buffer count: " << buffer_count << std::endl;
    } else {
        std::cout << "[Egress Port " << (int)port_id << "] Buffer full, dropping packet!" << std::endl;
    }
}

bool EgressPortManager::retrieve_packet(UnifiedPacketEntry& packet) {
    if (!is_buffer_empty()) {
        const UnifiedPacketEntry& entry = circular_buffer[buffer_head];
        if (entry.valid) {
            packet = entry;
            
            // Mark entry as consumed
            circular_buffer[buffer_head].valid = false;
            buffer_head = (buffer_head + 1) % BUFFER_SIZE;
            buffer_count--;
            
            std::cout << "[Egress Port " << (int)port_id << "] Retrieved packet, size: " 
                      << packet.packet_data.size() << " bytes, buffer count: " << buffer_count << std::endl;
            return true;
        }
    }
    return false;
}

void EgressPortManager::convert_internal_to_external(const std::vector<uint8_t>& internal_data,
                                                   const InternalHeader& header,
                                                   std::vector<uint8_t>& external_data) {
    // Simple conversion: For now, just copy the internal data
    // In real implementation, this would handle format conversion based on channel type
    external_data = internal_data;
    
    // Add any external header information if needed
    // For example, add external protocol headers, adjust for bandwidth differences, etc.
    
    std::cout << "[Egress Port " << (int)port_id 
              << "] Converted packet, internal size: " << internal_data.size()
              << ", external size: " << external_data.size()
              << ", channel type: " << (int)header.channel_type << std::endl;
}

void EgressPortManager::send_external_packet(const UnifiedPacketEntry& packet) {
    size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
    size_t total_bytes = packet.packet_data.size();
    
    // Calculate current beat (for future use in multi-beat packets)
    size_t current_beat = ext_tx_offset / bytes_per_beat;
    (void)current_beat; // Suppress unused variable warning
    size_t byte_offset_in_beat = ext_tx_offset % bytes_per_beat;
    
    // Prepare data beat
    sc_bv<AXIS_DATA_WIDTH> tdata = 0;
    sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
    
    size_t bytes_in_beat = std::min(total_bytes - ext_tx_offset, bytes_per_beat - byte_offset_in_beat);
    bool is_last_beat = (ext_tx_offset + bytes_in_beat >= total_bytes);
    
    for (size_t i = 0; i < bytes_in_beat; i++) {
        size_t byte_idx = ext_tx_offset + i;
        if (byte_idx < total_bytes) {
            size_t bit_offset = (byte_offset_in_beat + i) * 8;
            tdata.range(bit_offset + 7, bit_offset) = packet.packet_data[byte_idx];
            tkeep[byte_offset_in_beat + i] = 1;
        }
    }
    
    // Set external interface signals
    ext_valid.write(true);
    ext_data.write(tdata);
    ext_keep.write(tkeep);
    ext_last.write(is_last_beat);
    
    // Update transmission state
    ext_tx_offset += bytes_in_beat;
    
    if (is_last_beat) {
        // Packet transmission complete
        ext_transmission_active = false;
        packets_transmitted++;
        
        std::cout << "[Egress Port " << (int)port_id 
                  << "] Completed external transmission, total packets: " 
                  << packets_transmitted << std::endl;
    }
}

void EgressPortManager::handle_bandwidth_mismatch() {
    // Handle bandwidth differences between internal and external interfaces
    // This is a placeholder for future implementation
    // Could include rate limiting, buffering strategies, etc.
}

void EgressPortManager::process_latency_hiding() {
    // Implement latency hiding techniques
    // This is a placeholder for future implementation
    // Could include prefetching, pipelining, etc.
}

} // namespace switch_internal_p2p