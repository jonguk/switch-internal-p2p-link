#include <systemc.h>
#include <iostream>
#include <vector>
#include <cassert>
#include "../../systemc/common/switch_types.h"

using namespace switch_internal_p2p;

// =============================================================================
// External Packet Format Test
// Tests new external packet format and header parsing
// =============================================================================

int sc_main(int argc, char* argv[]) {
    (void)argc; (void)argv; // Suppress unused warnings
    
    std::cout << "=== External Packet Format Test ===" << std::endl;
    
    // Test 1: ExternalPacketHeader basic functionality
    std::cout << "\n--- Test 1: ExternalPacketHeader Basic Operations ---" << std::endl;
    
    ExternalPacketHeader ext_header;
    ext_header.channel_type = 1;        // HIGH_PRIORITY
    ext_header.queue_id = 3;
    ext_header.dest_port = 0x234;       // 564 in decimal (12-bit range)
    ext_header.source_port = 0x678;     // 1656 in decimal (12-bit range)
    ext_header.total_packet_size = 64;  // 9 byte header + 55 byte payload
    ext_header.header_crc = ext_header.calculate_crc();
    
    std::cout << "✅ Created external header:" << std::endl;
    std::cout << "   Channel Type: " << (int)ext_header.channel_type << std::endl;
    std::cout << "   Queue ID: " << (int)ext_header.queue_id << std::endl;
    std::cout << "   Dest Port: 0x" << std::hex << ext_header.dest_port << std::dec << std::endl;
    std::cout << "   Source Port: 0x" << std::hex << ext_header.source_port << std::dec << std::endl;
    std::cout << "   Total Size: " << ext_header.total_packet_size << std::endl;
    std::cout << "   Header CRC: 0x" << std::hex << (int)ext_header.header_crc << std::dec << std::endl;
    std::cout << "   Payload Size: " << ext_header.get_payload_size() << std::endl;
    
    // Test 2: Serialization and parsing
    std::cout << "\n--- Test 2: Serialization and Parsing ---" << std::endl;
    
    uint8_t raw_bytes[EXTERNAL_HEADER_SIZE];
    ext_header.serialize_to_bytes(raw_bytes);
    
    std::cout << "✅ Serialized header to bytes:" << std::endl;
    std::cout << "   Raw bytes: ";
    for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
        std::cout << "0x" << std::hex << (int)raw_bytes[i] << " ";
    }
    std::cout << std::dec << std::endl;
    
    // Parse back from bytes
    ExternalPacketHeader parsed_header = ExternalPacketHeader::parse_from_bytes(raw_bytes);
    
    std::cout << "✅ Parsed header from bytes:" << std::endl;
    std::cout << "   Channel Type: " << (int)parsed_header.channel_type << std::endl;
    std::cout << "   Queue ID: " << (int)parsed_header.queue_id << std::endl;
    std::cout << "   Dest Port: 0x" << std::hex << parsed_header.dest_port << std::dec << std::endl;
    std::cout << "   Source Port: 0x" << std::hex << parsed_header.source_port << std::dec << std::endl;
    std::cout << "   Total Size: " << parsed_header.total_packet_size << std::endl;
    std::cout << "   Header CRC: 0x" << std::hex << (int)parsed_header.header_crc << std::dec << std::endl;
    
    // Verify parsing accuracy
    assert(parsed_header.channel_type == ext_header.channel_type);
    assert(parsed_header.queue_id == ext_header.queue_id);
    assert(parsed_header.dest_port == ext_header.dest_port);
    assert(parsed_header.source_port == ext_header.source_port);
    assert(parsed_header.total_packet_size == ext_header.total_packet_size);
    assert(parsed_header.header_crc == ext_header.header_crc);
    
    std::cout << "✅ Serialization/parsing accuracy verified" << std::endl;
    
    // Test 3: CRC validation
    std::cout << "\n--- Test 3: CRC Validation ---" << std::endl;
    
    assert(parsed_header.is_crc_valid());
    std::cout << "✅ CRC validation passed" << std::endl;
    
    // Test corrupt CRC
    parsed_header.header_crc ^= 0xFF; // Corrupt CRC
    assert(!parsed_header.is_crc_valid());
    std::cout << "✅ Corrupted CRC correctly detected" << std::endl;
    
    // Test 4: InternalHeader conversion
    std::cout << "\n--- Test 4: InternalHeader Conversion ---" << std::endl;
    
    InternalHeader internal_header(ext_header);
    
    std::cout << "✅ Created internal header from external:" << std::endl;
    std::cout << "   Channel Type: " << (int)internal_header.channel_type << std::endl;
    std::cout << "   Queue ID: " << (int)internal_header.queue_id << std::endl;
    std::cout << "   Dest Port: " << internal_header.dest_port << std::endl;
    std::cout << "   Source Port: " << internal_header.source_port << std::endl;
    std::cout << "   Packet Length: " << internal_header.packet_length << std::endl;
    std::cout << "   Header CRC: 0x" << std::hex << (int)internal_header.header_crc << std::dec << std::endl;
    
    // Test conversion back to external
    ExternalPacketHeader converted_back = internal_header.to_external_header();
    assert(converted_back.channel_type == ext_header.channel_type);
    assert(converted_back.queue_id == ext_header.queue_id);
    assert(converted_back.dest_port == ext_header.dest_port);
    assert(converted_back.source_port == ext_header.source_port);
    assert(converted_back.total_packet_size == ext_header.total_packet_size);
    
    std::cout << "✅ External ↔ Internal conversion verified" << std::endl;
    
    // Test 5: AXIS tuser encoding/decoding
    std::cout << "\n--- Test 5: AXIS tuser Encoding/Decoding ---" << std::endl;
    
    sc_bv<AXIS_USER_WIDTH> tuser_bits = internal_header.to_sc_bv();
    std::cout << "✅ AXIS tuser bits: 0x" << std::hex << tuser_bits.to_uint64() << std::dec << std::endl;
    
    InternalHeader decoded_header = InternalHeader::from_sc_bv(tuser_bits);
    
    std::cout << "✅ Decoded from tuser:" << std::endl;
    std::cout << "   Queue ID: " << (int)decoded_header.queue_id << std::endl;
    std::cout << "   Dest Port: " << decoded_header.dest_port << std::endl;
    std::cout << "   Source Port: " << decoded_header.source_port << std::endl;
    std::cout << "   Packet Length: " << decoded_header.packet_length << std::endl;
    std::cout << "   Header CRC: 0x" << std::hex << (int)decoded_header.header_crc << std::dec << std::endl;
    
    // Verify essential fields are preserved in tuser
    assert(decoded_header.queue_id == internal_header.queue_id);
    assert(decoded_header.dest_port == internal_header.dest_port);
    assert(decoded_header.source_port == internal_header.source_port);
    assert(decoded_header.packet_length == internal_header.packet_length);
    assert(decoded_header.header_crc == internal_header.header_crc);
    
    std::cout << "✅ AXIS tuser encoding/decoding verified" << std::endl;
    
    // Test 6: Full packet simulation
    std::cout << "\n--- Test 6: Full External Packet Simulation ---" << std::endl;
    
    // Create a complete external packet
    std::vector<uint8_t> full_packet;
    
    // Add header
    uint8_t header_bytes[EXTERNAL_HEADER_SIZE];
    ext_header.serialize_to_bytes(header_bytes);
    for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
        full_packet.push_back(header_bytes[i]);
    }
    
    // Add payload
    std::vector<uint8_t> payload = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};
    for (uint8_t byte : payload) {
        full_packet.push_back(byte);
    }
    
    // Update total packet size to reflect actual size
    ext_header.total_packet_size = full_packet.size();
    ext_header.header_crc = ext_header.calculate_crc();
    ext_header.serialize_to_bytes(header_bytes);
    
    // Update header in full packet
    for (int i = 0; i < EXTERNAL_HEADER_SIZE; i++) {
        full_packet[i] = header_bytes[i];
    }
    
    std::cout << "✅ Created full external packet:" << std::endl;
    std::cout << "   Total Size: " << full_packet.size() << " bytes" << std::endl;
    std::cout << "   Header Size: " << EXTERNAL_HEADER_SIZE << " bytes" << std::endl;
    std::cout << "   Payload Size: " << (full_packet.size() - EXTERNAL_HEADER_SIZE) << " bytes" << std::endl;
    
    // Parse header from full packet
    ExternalPacketHeader final_header = ExternalPacketHeader::parse_from_bytes(full_packet.data());
    assert(final_header.is_crc_valid());
    assert(final_header.get_payload_size() == payload.size());
    
    std::cout << "✅ Full packet header parsing verified" << std::endl;
    
    std::cout << "\n=== All External Packet Format tests PASSED ===" << std::endl;
    
    return 0;
}