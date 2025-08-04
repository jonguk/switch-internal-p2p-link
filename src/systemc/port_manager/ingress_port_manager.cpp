#include "ingress_port_manager.h"
#include <iostream>
#include <cstring>

namespace switch_internal_p2p {

// =============================================================================
// Process Implementations
// =============================================================================

void IngressPortManager::external_receive_process() {
    // Reset behavior
    ext_ready.write(false);
    current_packet_buffer.clear();
    packet_in_progress = false;
    
    wait();  // Wait for clock edge after reset
    
    while (true) {
        // Signal ready to receive when buffer is not full
        ext_ready.write(!is_buffer_full());
        
        wait();  // Wait for clock edge
        
        // Check for incoming data
        if (ext_valid.read() && ext_ready.read()) {
            // Read data from external interface
            sc_bv<AXIS_DATA_WIDTH> data = ext_data.read();
            sc_bv<AXIS_KEEP_WIDTH> keep = ext_keep.read();
            bool last = ext_last.read();
            
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
                    store_raw_packet(current_packet_buffer);
                    packets_received++;
                }
                current_packet_buffer.clear();
                packet_in_progress = false;
            } else {
                packet_in_progress = true;
            }
        }
    }
}

void IngressPortManager::internal_transmit_process() {
    // Reset behavior
    axis_tvalid.write(false);
    axis_tdata.write(0);
    axis_tkeep.write(0);
    axis_tuser.write(0);
    axis_tlast.write(false);
    
    wait();  // Wait for clock edge after reset
    
    while (true) {
        // Check if there's data to transmit and AXIS is ready
        if (!is_buffer_empty() && axis_tready.read()) {
            std::vector<uint8_t> packet_data;
            if (retrieve_raw_packet(packet_data)) {
                // Generate internal header
                InternalHeader header = generate_internal_header(packet_data);
                
                // Send packet through AXIS interface
                send_axis_packet(packet_data, header);
                
                packets_forwarded++;
            }
        }
        
        wait();  // Wait for clock edge
    }
}

void IngressPortManager::credit_management_process() {
    // Reset behavior
    credit_return_ready.write(true);
    total_credits_available = DEFAULT_CREDITS;
    
    wait();  // Wait for clock edge after reset
    
    while (true) {
        // Handle credit returns
        if (credit_return_valid.read() && credit_return_ready.read()) {
            // Simple credit increment for testing
            total_credits_available++;
            std::cout << "[Port " << (int)port_id << "] Credit returned, total: " 
                      << total_credits_available << std::endl;
        }
        
        wait();  // Wait for clock edge
    }
}

void IngressPortManager::axi_slave_process() {
    // Handle AXI slave interface for configuration/monitoring
    if (axi_slave_valid.read()) {
        axi_slave_ready.write(true);
        
        uint32_t addr = axi_slave_addr.read().to_uint();
        uint32_t data = axi_slave_data.read().to_uint();
        (void)data; // Suppress unused variable warning
        
        // Simple register map (placeholder implementation)
        switch (addr) {
            case 0x00:  // Statistics - packets received
                // Read-only register
                break;
            case 0x04:  // Statistics - packets forwarded  
                // Read-only register
                break;
            case 0x08:  // Buffer utilization
                // Read-only register
                break;
            case 0x0C:  // Available credits
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

bool IngressPortManager::is_buffer_full() const {
    return buffer_count >= BUFFER_SIZE;
}

bool IngressPortManager::is_buffer_empty() const {
    return buffer_count == 0;
}

void IngressPortManager::store_raw_packet(const std::vector<uint8_t>& packet_data) {
    if (!is_buffer_full()) {
        // 1번: 외부 데이터 파싱 - 9바이트 헤더 추출
        if (packet_data.size() < EXTERNAL_HEADER_SIZE) {
            std::cout << "[Port " << (int)port_id << "] Packet too small for header (size: " 
                      << packet_data.size() << "), dropping!" << std::endl;
            return;
        }
        
        // 외부 패킷 헤더 파싱
        ExternalPacketHeader ext_header = ExternalPacketHeader::parse_from_bytes(packet_data.data());
        
        std::cout << "[Port " << (int)port_id << "] Parsed external header:" << std::endl;
        std::cout << "   Channel Type: " << (int)ext_header.channel_type << std::endl;
        std::cout << "   Queue ID: " << (int)ext_header.queue_id << std::endl;
        std::cout << "   Dest Port: " << ext_header.dest_port << std::endl;
        std::cout << "   Source Port: " << ext_header.source_port << std::endl;
        std::cout << "   Total Size: " << ext_header.total_packet_size << std::endl;
        std::cout << "   Header CRC: 0x" << std::hex << (int)ext_header.header_crc << std::dec << std::endl;
        
        // 2번: CRC 검증 - 헤더 무결성 확인
        if (!ext_header.is_crc_valid()) {
            std::cout << "[Port " << (int)port_id << "] ❌ CRC validation FAILED!" << std::endl;
            std::cout << "   Expected CRC: 0x" << std::hex << (int)ext_header.calculate_crc() << std::dec << std::endl;
            std::cout << "   Received CRC: 0x" << std::hex << (int)ext_header.header_crc << std::dec << std::endl;
            std::cout << "   Packet dropped due to invalid CRC!" << std::endl;
            error_stats.crc_errors++;
            error_stats.total_dropped_packets++;
            return;  // 4번: 에러 처리 - CRC 오류 시 패킷 드롭
        }
        
        std::cout << "[Port " << (int)port_id << "] ✅ CRC validation PASSED" << std::endl;
        
        // 4번: 에러 처리 - 패킷 크기 검증
        if (ext_header.total_packet_size != packet_data.size()) {
            std::cout << "[Port " << (int)port_id << "] ❌ PACKET SIZE MISMATCH!" << std::endl;
            std::cout << "   Header declares: " << ext_header.total_packet_size << " bytes" << std::endl;
            std::cout << "   Actual received: " << packet_data.size() << " bytes" << std::endl;
            std::cout << "   Packet dropped due to size inconsistency!" << std::endl;
            error_stats.size_mismatch_errors++;
            error_stats.total_dropped_packets++;
            return;
        }
        
        // 4번: 에러 처리 - 추가 유효성 검사
        if (ext_header.total_packet_size < EXTERNAL_HEADER_SIZE) {
            std::cout << "[Port " << (int)port_id << "] ❌ INVALID TOTAL SIZE!" << std::endl;  
            std::cout << "   Total size (" << ext_header.total_packet_size 
                      << ") smaller than header size (" << EXTERNAL_HEADER_SIZE << ")" << std::endl;
            error_stats.invalid_size_errors++;
            error_stats.total_dropped_packets++;
            return;
        }
        
        // 4번: 에러 처리 - 큐 ID 범위 검증  
        if (ext_header.queue_id >= 8) {  // MAX_QUEUES 대신 하드코딩
            std::cout << "[Port " << (int)port_id << "] ❌ INVALID QUEUE ID!" << std::endl;
            std::cout << "   Queue ID: " << (int)ext_header.queue_id 
                      << " (max allowed: 7)" << std::endl;
            error_stats.invalid_queue_errors++;
            error_stats.total_dropped_packets++;
            return;
        }
        
        // 원본 패킷 데이터 저장 (헤더 + 페이로드)
        RawPacketEntry& entry = circular_buffer[buffer_tail];
        entry.data = packet_data;  // 전체 패킷 저장 (헤더 포함)
        entry.timestamp = sc_time_stamp().to_default_time_units();
        entry.valid = true;
        
        buffer_tail = (buffer_tail + 1) % BUFFER_SIZE;
        buffer_count++;
        
        std::cout << "[Port " << (int)port_id << "] Stored packet with parsed header, " 
                  << "total size: " << packet_data.size() << " bytes, "
                  << "payload size: " << ext_header.get_payload_size() << " bytes, "
                  << "buffer count: " << buffer_count << std::endl;
    } else {
        std::cout << "[Port " << (int)port_id << "] Buffer full, dropping packet!" << std::endl;
    }
}

bool IngressPortManager::retrieve_raw_packet(std::vector<uint8_t>& packet_data) {
    if (!is_buffer_empty()) {
        const RawPacketEntry& entry = circular_buffer[buffer_head];
        if (entry.valid) {
            packet_data = entry.data;
            
            // Mark entry as consumed
            circular_buffer[buffer_head].valid = false;
            buffer_head = (buffer_head + 1) % BUFFER_SIZE;
            buffer_count--;
            
            std::cout << "[Port " << (int)port_id << "] Retrieved packet, size: " 
                      << packet_data.size() << " bytes, buffer count: " << buffer_count << std::endl;
            return true;
        }
    }
    return false;
}

InternalHeader IngressPortManager::generate_internal_header(const std::vector<uint8_t>& packet_data) {
    // 3번: AXIS 전송 - tuser에 InternalHeader, tdata에 원본 패킷
    
    // 외부 패킷에서 헤더 파싱
    if (packet_data.size() < EXTERNAL_HEADER_SIZE) {
        std::cout << "[Port " << (int)port_id << "] Warning: packet too small for header parsing" << std::endl;
        return InternalHeader();  // 빈 헤더 반환
    }
    
    ExternalPacketHeader ext_header = ExternalPacketHeader::parse_from_bytes(packet_data.data());
    
    // 외부 헤더에서 내부 헤더로 변환
    InternalHeader internal_header(ext_header);
    
    // 내부 처리용 추가 정보 설정
    internal_header.packet_type = PacketType::DATA;
    internal_header.sequence_number = 0;  // 시퀀스 번호는 상위 레이어에서 설정
    internal_header.hop_count = 0;        // 홉 카운트 초기화
    internal_header.reserved = 0;
    
    std::cout << "[Port " << (int)port_id << "] Generated internal header from external:" << std::endl;
    std::cout << "   Channel Type: " << (int)internal_header.channel_type << std::endl;
    std::cout << "   Queue ID: " << (int)internal_header.queue_id << std::endl;
    std::cout << "   Dest Port: " << internal_header.dest_port << std::endl;
    std::cout << "   Source Port: " << internal_header.source_port << std::endl;
    std::cout << "   Packet Length: " << internal_header.packet_length << std::endl;
    std::cout << "   Header CRC: 0x" << std::hex << (int)internal_header.header_crc << std::dec << std::endl;
    
    return internal_header;
}

void IngressPortManager::extract_credit_info(const std::vector<uint8_t>& packet_data, uint8_t& credits) {
    // Simple credit extraction logic
    // In real implementation, this would parse packet headers
    credits = 1;  // Default: each packet consumes 1 credit
    
    // Example: Check if packet contains credit information
    if (packet_data.size() >= 4) {
        // Look for credit marker pattern (example: 0xCR)
        for (size_t i = 0; i < packet_data.size() - 1; i++) {
            if (packet_data[i] == 0xC0 && packet_data[i+1] == 0xFF) {
                if (i + 2 < packet_data.size()) {
                    credits = packet_data[i+2];
                    break;
                }
            }
        }
    }
}

void IngressPortManager::send_axis_packet(const std::vector<uint8_t>& packet_data, const InternalHeader& header) {
    size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
    size_t total_beats = (packet_data.size() + bytes_per_beat - 1) / bytes_per_beat;
    
    // Send header in tuser field and data beats
    for (size_t beat = 0; beat < total_beats; beat++) {
        // Wait for tready
        while (!axis_tready.read()) {
            wait();
        }
        
        // Prepare data beat
        sc_bv<AXIS_DATA_WIDTH> tdata = 0;
        sc_bv<AXIS_KEEP_WIDTH> tkeep = 0;
        
        size_t bytes_in_beat = std::min(packet_data.size() - beat * bytes_per_beat, bytes_per_beat);
        
        for (size_t i = 0; i < bytes_in_beat; i++) {
            size_t byte_idx = beat * bytes_per_beat + i;
            if (byte_idx < packet_data.size()) {
                tdata.range(i*8+7, i*8) = packet_data[byte_idx];
                tkeep[i] = 1;
            }
        }
        
        // Set AXIS signals
        axis_tvalid.write(true);
        axis_tdata.write(tdata);
        axis_tkeep.write(tkeep);
        axis_tuser.write(beat == 0 ? header.to_sc_bv() : sc_bv<AXIS_USER_WIDTH>(0));  // Header only in first beat
        axis_tlast.write(beat == total_beats - 1);
        
        wait();  // Wait for clock edge
    }
    
    // Clear signals after transmission
    axis_tvalid.write(false);
    axis_tlast.write(false);
    axis_tuser.write(0);
    
    std::cout << "[Port " << (int)port_id << "] Sent AXIS packet, size: " 
              << packet_data.size() << " bytes in " << total_beats << " beats" << std::endl;
}

} // namespace switch_internal_p2p