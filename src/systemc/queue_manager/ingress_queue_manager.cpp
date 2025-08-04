#include "ingress_queue_manager.h"
#include <iostream>
#include <iomanip>
#include <algorithm>

namespace switch_internal_p2p {

// Define static const member
const uint32_t IngressQueueManager::MAX_GLOBAL_PORTS;

// =============================================================================
// AXIS Receive Process
// =============================================================================

void IngressQueueManager::axis_receive_process() {
    // Initialize signals
    axis_tready.write(true);  // Always ready - no backpressure
    
    // Process started
    
    while (true) {
        wait();  // Wait for clock edge
        
        if (!rst_n.read()) {
            // Reset state
            axis_tready.write(true);
            current_packet_data.clear();
            packet_in_assembly = false;
            continue;
        }
        
        // Always ready to receive - no backpressure guarantee
        axis_tready.write(true);
        
        // Check for AXIS activity
        bool tvalid = axis_tvalid.read();
        if (tvalid) {
            // Extract data from AXIS beat
            sc_bv<AXIS_DATA_WIDTH> tdata = axis_tdata.read();
            sc_bv<AXIS_KEEP_WIDTH> tkeep = axis_tkeep.read();
            sc_bv<AXIS_USER_WIDTH> tuser = axis_tuser.read();
            bool tlast = axis_tlast.read();
            
            // Extract bytes from this beat
            std::vector<uint8_t> beat_data;
            for (int i = 0; i < AXIS_KEEP_WIDTH; i++) {
                if (tkeep[i] == 1) {
                    uint8_t byte_val = (tdata.range(i*8+7, i*8)).to_uint();
                    beat_data.push_back(byte_val);
                }
            }
            
            if (!packet_in_assembly) {
                // Start new packet assembly
                current_packet_data.clear();
                current_header = InternalHeader::from_sc_bv(tuser);
                packet_in_assembly = true;
                
                std::cout << "[IngressQueueMgr] Starting packet assembly, header: "
                          << "src=" << (int)current_header.source_port 
                          << ", dst=" << (int)current_header.dest_port 
                          << ", queue=" << (int)current_header.queue_id
                          << ", len=" << current_header.packet_length
                          << ", crc=0x" << std::hex << (int)current_header.header_crc << std::dec << std::endl;
            }
            
            // Append beat data to current packet
            current_packet_data.insert(current_packet_data.end(), 
                                     beat_data.begin(), beat_data.end());
            
            if (tlast) {
                // Packet assembly complete
                std::cout << "[IngressQueueMgr] Packet assembly complete, size: " 
                          << current_packet_data.size() << " bytes" << std::endl;
                
                // Process the completed packet
                process_received_packet(current_packet_data, current_header);
                
                // Reset assembly state
                packet_in_assembly = false;
                current_packet_data.clear();
            }
        }
    }
}

// =============================================================================
// Packet Processing Process  
// =============================================================================

void IngressQueueManager::packet_processing_process() {
    while (true) {
        wait();  // Wait for clock edge
        
        if (!rst_n.read()) {
            // Reset queues
            for (int i = 0; i < MAX_QUEUES_PER_PORT; i++) {
                while (!packet_queues[i].empty()) {
                    packet_queues[i].pop();
                }
                queue_stats[i] = QueueStats();
            }
            continue;
        }
        
        // Continuous packet processing - dequeue and forward packets
        for (int q = 0; q < MAX_QUEUES_PER_PORT; q++) {
            if (!packet_queues[q].empty()) {
                PacketEntry packet;
                if (dequeue_packet(q, packet)) {
                    // Add to internal transmission queue
                    internal_tx_queue.push(packet);
                    
                    std::cout << "[IngressQueueMgr] Dequeued packet from queue " << q 
                              << ", size: " << packet.payload.size() 
                              << ", remaining in queue: " << packet_queues[q].size() << std::endl;
                }
                
                // Process only one packet per cycle to avoid blocking
                break;
            }
        }
    }
}

// =============================================================================
// Internal Transmission Process
// =============================================================================

void IngressQueueManager::internal_transmit_process() {
    // Initialize AXIS signals
    internal_tvalid.write(false);
    internal_tdata.write(0);
    internal_tkeep.write(0);
    internal_tuser.write(0);
    internal_tdest.write(0);
    internal_tlast.write(false);
    
    bool transmission_in_progress = false;
    size_t current_beat = 0;
    PacketEntry current_packet;
    
    while (true) {
        wait();  // Wait for clock edge
        
        if (!rst_n.read()) {
            internal_tvalid.write(false);
            internal_tdata.write(0);
            internal_tkeep.write(0);
            internal_tuser.write(0);
            internal_tdest.write(0);
            internal_tlast.write(false);
            transmission_in_progress = false;
            current_beat = 0;
            // Clear transmission queue
            while (!internal_tx_queue.empty()) {
                internal_tx_queue.pop();
            }
            continue;
        }
        
        if (transmission_in_progress) {
            // Wait for ready to complete handshake for current beat
            if (internal_tready.read()) {
                // Move to next beat or complete transmission
                current_beat++;
                size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;  // 64 bytes per beat
                size_t total_bytes = current_packet.payload.size();
                size_t total_beats = (total_bytes + bytes_per_beat - 1) / bytes_per_beat;
                
                if (current_beat >= total_beats) {
                    // Transmission complete
                    internal_tvalid.write(false);
                    internal_tlast.write(false);
                    transmission_in_progress = false;
                    current_beat = 0;
                    std::cout << "[IngressQueueMgr] Completed AXIS transmission: "
                              << "src=" << (int)current_packet.header.source_port
                              << ", dst=" << (int)current_packet.header.dest_port
                              << ", size=" << total_bytes << " bytes in " << total_beats << " beats" << std::endl;
                } else {
                    // Send next beat
                    send_axis_beat(current_packet, current_beat);
                }
            }
        } else if (!internal_tx_queue.empty()) {
            // Start new transmission
            current_packet = internal_tx_queue.front();
            internal_tx_queue.pop();
            current_beat = 0;
            transmission_in_progress = true;
            
            // Send first beat
            send_axis_beat(current_packet, current_beat);
            
            std::cout << "[IngressQueueMgr] Started AXIS transmission to internal bus: "
                      << "src=" << (int)current_packet.header.source_port
                      << ", dst=" << (int)current_packet.header.dest_port
                      << ", size=" << current_packet.payload.size() << " bytes" << std::endl;
        }
    }
}

// =============================================================================
// AXI Slave Process
// =============================================================================

void IngressQueueManager::axi_slave_process() {
    axi_slave_ready.write(true);  // Always ready for configuration
    
    if (axi_slave_valid.read()) {
        uint32_t addr = axi_slave_addr.read().to_uint();
        uint32_t data = axi_slave_data.read().to_uint();
        
        std::cout << "[IngressQueueMgr] AXI write: addr=0x" << std::hex << addr 
                  << ", data=0x" << data << std::dec << std::endl;
        
        // Handle different register addresses
        switch (addr & 0xFF) {
            case 0x00:  // Port configuration
                // Handle port-level configuration
                break;
            case 0x10:  // Queue 0 configuration  
            case 0x14:  // Queue 1 configuration
            case 0x18:  // Queue 2 configuration
            case 0x1C:  // Queue 3 configuration
                {
                    uint8_t queue_id = (addr - 0x10) / 4;
                    if (queue_id < MAX_QUEUES_PER_PORT) {
                        // Configure queue parameters
                        std::cout << "[IngressQueueMgr] Configuring queue " << (int)queue_id 
                                  << " with value: " << data << std::endl;
                    }
                }
                break;
            // 🚀 Global Port ID Mapping Registers (0x80-0x87)
            case 0x80:  // Lookup table control
                if (data == 0x1) {
                    initialize_lookup_table();
                    std::cout << "[IngressQueueMgr] 🔄 Lookup table re-initialized by CPU" << std::endl;
                } else if (data == 0x2) {
                    // Clear all mappings
                    for (size_t i = 0; i < MAX_GLOBAL_PORTS; i++) {
                        global_to_local_lookup[i] = 0xFF;
                    }
                    lookup_table_initialized = false;
                    std::cout << "[IngressQueueMgr] 🗑️  Lookup table cleared by CPU" << std::endl;
                }
                break;
            case 0x84:  // Global ID to set (lower 16 bits)
                // Store for next mapping operation (not implemented in simple version)
                break;
            case 0x88:  // Set mapping: [31:16] = global_id, [7:0] = local_port
                {
                    uint16_t global_id = (data >> 16) & 0xFFFF;
                    uint8_t local_port = data & 0xFF;
                    set_global_to_local_mapping(global_id, local_port);
                    std::cout << "[IngressQueueMgr] 🔧 CPU set mapping: Global " << global_id 
                              << " → Local " << (int)local_port << std::endl;
                }
                break;
            case 0x8C:  // Lookup table status (read-only in real implementation)
                std::cout << "[IngressQueueMgr] 📊 Lookup table status: " 
                          << (lookup_table_initialized ? "Ready" : "Not Ready") << std::endl;
                break;
            default:
                std::cout << "[IngressQueueMgr] Unknown AXI address: 0x" << std::hex << addr 
                          << std::dec << std::endl;
                break;
        }
    }
}

// =============================================================================
// Helper Functions
// =============================================================================

void IngressQueueManager::process_received_packet(const std::vector<uint8_t>& packet_data, 
                                                 const InternalHeader& header) {
    // 🚀 NEW FORMAT: Header CRC validation (optional - already done in Ingress Port Manager)
    std::cout << "[IngressQueueMgr] Processing packet with header CRC: 0x" 
              << std::hex << (int)header.header_crc << std::dec 
              << ", queue_id: " << (int)header.queue_id << std::endl;
    
    // Extract and process credits first
    extract_and_process_credits(header);
    
    // Convert raw packet to internal format
    PacketEntry packet_entry;
    convert_raw_to_internal(packet_data, header, packet_entry);
    
    // 🚀 GLOBAL PORT MAPPING: Convert global dest_port to local port
    uint8_t local_dest_port = lookup_global_to_local(header.dest_port);
    
    // Update packet entry with mapped local destination
    packet_entry.header.dest_port = local_dest_port;
    
    std::cout << "[IngressQueueMgr] 🌐 Global routing: " 
              << "Global Port " << header.dest_port 
              << " → Local Port " << (int)local_dest_port << std::endl;
    
    // 🚀 NEW FORMAT: Use queue_id directly from header (9-byte external format)
    uint8_t queue_id = header.queue_id;
    
    // Validate queue_id range
    if (queue_id >= MAX_QUEUES_PER_PORT) {
        std::cout << "[IngressQueueMgr] ❌ INVALID QUEUE ID: " << (int)queue_id 
                  << " (max: " << (MAX_QUEUES_PER_PORT-1) << "), using queue 0" << std::endl;
        queue_id = 0;  // Fallback to default queue
    }
    
    // Enqueue the packet
    if (enqueue_packet(queue_id, packet_entry)) {
        total_packets_processed++;
        std::cout << "[IngressQueueMgr] Packet enqueued to queue " << (int)queue_id 
                  << ", total processed: " << total_packets_processed << std::endl;
    } else {
        std::cout << "[IngressQueueMgr] ERROR: Failed to enqueue packet to queue " 
                  << (int)queue_id << " (queue full)" << std::endl;
    }
}

void IngressQueueManager::convert_raw_to_internal(const std::vector<uint8_t>& raw_data,
                                                 const InternalHeader& header,
                                                 PacketEntry& packet_entry) {
    // Create unified packet entry with header and payload
    packet_entry.header = header;
    packet_entry.payload = raw_data;
    packet_entry.total_size = sizeof(InternalHeader) + raw_data.size();
    packet_entry.timestamp = sc_time_stamp();
    
    // Update header with actual payload size
    packet_entry.header.packet_length = raw_data.size();
    
    std::cout << "[IngressQueueMgr] Converted raw packet to internal format: "
              << "header_size=" << sizeof(InternalHeader) 
              << ", payload_size=" << raw_data.size()
              << ", total_size=" << packet_entry.total_size << std::endl;
}

void IngressQueueManager::extract_and_process_credits(const InternalHeader& header) {
    // For now, assume credits are embedded in packet_type field for CREDIT packets
    if (header.packet_type == PacketType::CREDIT) {
        // Extract credit information from packet length field (temporary approach)
        uint16_t credits = header.packet_length;  // Use packet_length as credit count
        uint8_t target_queue = header.queue_id;   // 🚀 NEW FORMAT: Use queue_id directly
        
        if (credits > 0) {
            add_credits(target_queue, credits);
            std::cout << "[IngressQueueMgr] Processed " << credits 
                      << " credits for queue " << (int)target_queue 
                      << ", new total: " << get_available_credits(target_queue) << std::endl;
        }
    }
}

bool IngressQueueManager::enqueue_packet(uint8_t queue_id, const PacketEntry& packet) {
    if (queue_id >= MAX_QUEUES_PER_PORT) {
        return false;
    }
    
    if (packet_queues[queue_id].size() >= QUEUE_DEPTH) {
        return false;  // Queue full
    }
    
    packet_queues[queue_id].push(packet);
    update_queue_stats(queue_id, packet, true);
    
    return true;
}

bool IngressQueueManager::dequeue_packet(uint8_t queue_id, PacketEntry& packet) {
    if (queue_id >= MAX_QUEUES_PER_PORT || packet_queues[queue_id].empty()) {
        return false;
    }
    
    packet = packet_queues[queue_id].front();
    packet_queues[queue_id].pop();
    update_queue_stats(queue_id, packet, false);
    
    return true;
}

// =============================================================================
// 🚀 Global Port ID Mapping Functions
// =============================================================================

void IngressQueueManager::initialize_lookup_table() {
    // Initialize with invalid port (0xFF means no mapping)
    for (uint32_t i = 0; i < MAX_GLOBAL_PORTS; i++) {
        global_to_local_lookup[i] = 0xFF;  // Invalid port marker
    }
    
    // Set default identity mapping for first few ports (for testing)
    for (uint32_t i = 0; i < std::min(uint32_t(8), MAX_GLOBAL_PORTS); i++) {
        global_to_local_lookup[i] = static_cast<uint8_t>(i);
    }
    
    lookup_table_initialized = true;
    
    std::cout << "[IngressQueueMgr] Lookup table initialized with default mappings" << std::endl;
}

void IngressQueueManager::set_global_to_local_mapping(uint16_t global_id, uint8_t local_port) {
    // No bounds checking needed since uint16_t range (0-65535) exactly matches our array size
    global_to_local_lookup[global_id] = local_port;
    
    std::cout << "[IngressQueueMgr] ✅ Mapping set: Global ID " << global_id 
              << " → Local Port " << (int)local_port << std::endl;
}

uint8_t IngressQueueManager::lookup_global_to_local(uint16_t global_id) const {
    // No bounds checking needed since uint16_t range (0-65535) exactly matches our array size
    uint8_t local_port = global_to_local_lookup[global_id];
    
    if (local_port == 0xFF) {
        std::cout << "[IngressQueueMgr] ❌ No mapping for Global ID " << global_id 
                  << ", using fallback port 0" << std::endl;
        return 0;  // Fallback to port 0
    }
    
    std::cout << "[IngressQueueMgr] 🔍 Lookup: Global ID " << global_id 
              << " → Local Port " << (int)local_port << std::endl;
    
    return local_port;
}

void IngressQueueManager::update_queue_stats(uint8_t queue_id, const PacketEntry& packet, bool is_enqueue) {
    if (queue_id >= MAX_QUEUES_PER_PORT) {
        return;
    }
    
    QueueStats& stats = queue_stats[queue_id];
    
    if (is_enqueue) {
        stats.packets_received++;
        stats.bytes_received += packet.payload.size();
        stats.current_depth = packet_queues[queue_id].size();
        stats.peak_depth = std::max(stats.peak_depth, stats.current_depth);
    } else {
        stats.packets_transmitted++;
        stats.bytes_transmitted += packet.payload.size();
        stats.current_depth = packet_queues[queue_id].size();
    }
    
    stats.last_activity = sc_time_stamp();
    
    // Update shared credit variable
    stats.available_credits = shared_available_credits[queue_id].read();
}

void IngressQueueManager::send_axis_beat(const PacketEntry& packet, size_t beat_index) {
    size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;  // 64 bytes per beat
    size_t total_bytes = packet.payload.size();
    size_t start_byte = beat_index * bytes_per_beat;
    size_t bytes_this_beat = std::min(bytes_per_beat, total_bytes - start_byte);
    bool is_last_beat = (start_byte + bytes_this_beat >= total_bytes);
    
    // Prepare AXIS data
    sc_bv<AXIS_DATA_WIDTH> tdata = 0;
    sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
    
    // Pack payload data into tdata
    for (size_t i = 0; i < bytes_this_beat; i++) {
        if (start_byte + i < packet.payload.size()) {
            uint8_t byte_val = packet.payload[start_byte + i];
            tdata.range((i+1)*8-1, i*8) = byte_val;
            tkeep[i] = 1;  // Mark this byte as valid
        }
    }
    
    // Set tuser with local port mapping info (ALL beats need header)
    sc_bv<AXIS_USER_WIDTH> tuser = packet.header.to_sc_bv();  // 🔥 모든 beat에서 헤더 설정!
    
    // Set tdest with local destination port for routing
    sc_bv<AXIS_DEST_WIDTH> tdest = 0;
    tdest.range(7, 0) = packet.header.dest_port & 0xFF;  // Local destination port
    
    // Write to AXIS signals
    internal_tdata.write(tdata);
    internal_tkeep.write(tkeep);
    internal_tuser.write(tuser);
    internal_tdest.write(tdest);
    internal_tlast.write(is_last_beat);
    internal_tvalid.write(true);
    
    std::cout << "[IngressQueueMgr] 🚀 AXIS Beat " << beat_index 
              << ": bytes=" << bytes_this_beat 
              << ", tdest=" << (int)(packet.header.dest_port & 0xFF)
              << ", last=" << (is_last_beat ? "true" : "false") << std::endl;
}

} // namespace switch_internal_p2p