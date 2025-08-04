#ifndef SWITCH_TYPES_H
#define SWITCH_TYPES_H

#include <systemc.h>
#include <cstdint>

namespace switch_internal_p2p {

// =============================================================================
// AXIS Interface Parameters
// =============================================================================

static const int AXIS_DATA_WIDTH = 512;    // 512-bit data width
static const int AXIS_USER_WIDTH = 64;     // User field for Internal Header
static const int AXIS_DEST_WIDTH = 8;      // Destination field for routing (local port number)
static const int AXIS_KEEP_WIDTH = AXIS_DATA_WIDTH / 8;

// =============================================================================
// Packet Types
// =============================================================================

enum class PacketType : uint8_t {
    DATA = 0,
    CONTROL = 1,
    CREDIT = 2,
    BROADCAST = 3,
    MULTICAST = 4
};

enum class ChannelType : uint8_t {
    LOW_PRIORITY = 0,
    HIGH_PRIORITY = 1,
    CONTROL_CHANNEL = 2,
    MANAGEMENT = 3
};

enum class Priority : uint8_t {
    LOW = 0,
    MEDIUM = 1,
    HIGH = 2,
    CRITICAL = 3
};

// String conversion function for Priority
inline std::string priority_to_string(Priority priority) {
    switch (priority) {
        case Priority::LOW: return "LOW";
        case Priority::MEDIUM: return "MEDIUM";
        case Priority::HIGH: return "HIGH";
        case Priority::CRITICAL: return "CRITICAL";
        default: return "UNKNOWN";
    }
}

// =============================================================================
// Internal Header Structure
// =============================================================================

// =============================================================================
// External Packet Header Structure (9 bytes total)
// Matches external packet format specification
// =============================================================================

struct ExternalPacketHeader {
    uint8_t channel_type;       // Channel type (1 byte, offset 0)
    uint8_t queue_id;           // Queue ID (1 byte, offset 1)
    uint16_t dest_port;         // Global destination port ID (12-bit, stored in 2 bytes, offset 2-3)
    uint16_t source_port;       // Global source port ID (12-bit, stored in 2 bytes, offset 4-5)
    uint16_t total_packet_size; // Total packet size including header (2 bytes, offset 6-7)
    uint8_t header_crc;         // Header CRC (1 byte, offset 8)
    
    // Constructor
    ExternalPacketHeader() : channel_type(0), queue_id(0), dest_port(0), 
                            source_port(0), total_packet_size(9), header_crc(0) {}
    
    // Parse from raw bytes (network byte order)
    static ExternalPacketHeader parse_from_bytes(const uint8_t* data) {
        ExternalPacketHeader header;
        header.channel_type = data[0];
        header.queue_id = data[1];
        header.dest_port = ((data[2] << 8) | data[3]) & 0xFFF;      // Big-endian, 12-bit mask
        header.source_port = ((data[4] << 8) | data[5]) & 0xFFF;    // Big-endian, 12-bit mask
        header.total_packet_size = (data[6] << 8) | data[7]; // Big-endian
        header.header_crc = data[8];
        return header;
    }
    
    // Serialize to raw bytes (network byte order)
    void serialize_to_bytes(uint8_t* data) const {
        data[0] = channel_type;
        data[1] = queue_id;
        uint16_t masked_dest = dest_port & 0xFFF;     // 12-bit mask
        uint16_t masked_src = source_port & 0xFFF;    // 12-bit mask
        data[2] = (masked_dest >> 8) & 0xFF;          // Big-endian MSB
        data[3] = masked_dest & 0xFF;                 // Big-endian LSB
        data[4] = (masked_src >> 8) & 0xFF;           // Big-endian MSB
        data[5] = masked_src & 0xFF;                  // Big-endian LSB
        data[6] = (total_packet_size >> 8) & 0xFF;    // Big-endian MSB
        data[7] = total_packet_size & 0xFF;           // Big-endian LSB
        data[8] = header_crc;
    }
    
    // Calculate CRC for header (simple XOR for now)
    uint8_t calculate_crc() const {
        uint8_t crc = 0;
        crc ^= channel_type;
        crc ^= queue_id;
        crc ^= (dest_port >> 8) & 0xFF;
        crc ^= dest_port & 0xFF;
        crc ^= (source_port >> 8) & 0xFF;
        crc ^= source_port & 0xFF;
        crc ^= (total_packet_size >> 8) & 0xFF;
        crc ^= total_packet_size & 0xFF;
        return crc;
    }
    
    // Validate CRC
    bool is_crc_valid() const {
        return header_crc == calculate_crc();
    }
    
    // Get payload size
    uint16_t get_payload_size() const {
        return (total_packet_size > 9) ? (total_packet_size - 9) : 0;
    }
};

// =============================================================================
// Internal Header Structure (for AXIS tuser)
// Derived from External Packet Header with additional internal fields
// =============================================================================

struct InternalHeader {
    uint8_t channel_type;       // Channel type from external header
    uint8_t queue_id;           // Queue ID from external header  
    uint16_t dest_port;         // Global destination port ID (12-bit, stored in 16 bits)
    uint16_t source_port;       // Global source port ID (12-bit, stored in 16 bits)
    uint16_t packet_length;     // Total packet length including header (16 bits)
    uint8_t header_crc;         // Header CRC from external header
    
    // Additional internal fields
    PacketType packet_type;     // Internal packet classification
    uint16_t sequence_number;   // Sequence number for ordering
    uint8_t hop_count;          // Hop counter for TTL
    uint8_t reserved;           // Reserved for future use
    
    // Constructor
    InternalHeader() : channel_type(0), queue_id(0), dest_port(0), source_port(0),
                      packet_length(0), header_crc(0), packet_type(PacketType::DATA),
                      sequence_number(0), hop_count(0), reserved(0) {}
                      
    // Constructor from external header
    InternalHeader(const ExternalPacketHeader& ext_header) :
        channel_type(ext_header.channel_type), queue_id(ext_header.queue_id),
        dest_port(ext_header.dest_port & 0xFFF), source_port(ext_header.source_port & 0xFFF),
        packet_length(ext_header.total_packet_size), header_crc(ext_header.header_crc),
        packet_type(PacketType::DATA), sequence_number(0), hop_count(0), reserved(0) {}
    
    // Convert to external header
    ExternalPacketHeader to_external_header() const {
        ExternalPacketHeader ext_header;
        ext_header.channel_type = channel_type;
        ext_header.queue_id = queue_id;
        ext_header.dest_port = dest_port & 0xFFF;      // 12-bit mask
        ext_header.source_port = source_port & 0xFFF;  // 12-bit mask
        ext_header.total_packet_size = packet_length;
        ext_header.header_crc = header_crc;
        return ext_header;
    }
    
    // Convert to SystemC bit vector for AXIS tuser (64-bit)
    sc_bv<AXIS_USER_WIDTH> to_sc_bv() const {
        sc_bv<AXIS_USER_WIDTH> result;
        
        // Pack essential fields into 64-bit user field
        // Layout: [header_crc:8][queue_id:8][dest_port:16][source_port:16][packet_length:16]
        result.range(15, 0)   = packet_length;      // Bits 0-15: Packet length
        result.range(31, 16)  = source_port;        // Bits 16-31: Source port
        result.range(47, 32)  = dest_port;          // Bits 32-47: Destination port  
        result.range(55, 48)  = queue_id;           // Bits 48-55: Queue ID
        result.range(63, 56)  = header_crc;         // Bits 56-63: Header CRC
        
        // Note: channel_type, packet_type, sequence_number, hop_count are not transmitted
        // in tuser due to 64-bit limit. They can be derived or set by receiving module.
        
        return result;
    }
    
    // Create from SystemC bit vector
    static InternalHeader from_sc_bv(const sc_bv<AXIS_USER_WIDTH>& bv) {
        InternalHeader header;
        
        header.packet_length = bv.range(15, 0).to_uint();
        header.source_port = bv.range(31, 16).to_uint();
        header.dest_port = bv.range(47, 32).to_uint();
        header.queue_id = bv.range(55, 48).to_uint();
        header.header_crc = bv.range(63, 56).to_uint();
        
        // Set default values for fields not transmitted in tuser
        header.channel_type = 0;  // Will be derived from original packet
        header.packet_type = PacketType::DATA;
        header.sequence_number = 0;
        header.hop_count = 0;
        header.reserved = 0;
        
        return header;
    }
};

// =============================================================================
// Packet Entry Structures
// =============================================================================

struct RawPacketEntry {
    std::vector<uint8_t> data;      // Raw packet data
    uint32_t size;                  // Size in bytes
    sc_time timestamp;              // Arrival timestamp
    
    RawPacketEntry() : size(0), timestamp(SC_ZERO_TIME) {}
    RawPacketEntry(const std::vector<uint8_t>& packet_data) : 
        data(packet_data), size(packet_data.size()), timestamp(sc_time_stamp()) {}
};

struct UnifiedPacketEntry {
    InternalHeader header;          // Internal routing header
    std::vector<uint8_t> payload;   // Packet payload
    uint32_t total_size;            // Total size (header + payload)
    sc_time timestamp;              // Processing timestamp
    
    UnifiedPacketEntry() : total_size(0), timestamp(SC_ZERO_TIME) {}
    UnifiedPacketEntry(const InternalHeader& hdr, const std::vector<uint8_t>& data) :
        header(hdr), payload(data), total_size(sizeof(InternalHeader) + data.size()),
        timestamp(sc_time_stamp()) {}
        
    // Equality operator for SystemC signal comparison
    bool operator==(const UnifiedPacketEntry& other) const {
        return (header.source_port == other.header.source_port &&
                header.dest_port == other.header.dest_port &&
                header.packet_type == other.header.packet_type &&
                header.packet_length == other.header.packet_length &&
                payload == other.payload);
    }
    
    bool operator!=(const UnifiedPacketEntry& other) const {
        return !(*this == other);
    }
};

// Alias for backward compatibility
using PacketEntry = UnifiedPacketEntry;

// =============================================================================
// Port and Queue Management Constants  
// =============================================================================

static const uint8_t MAX_QUEUES_PER_PORT = 8;        // Maximum queues per port
static const uint16_t MAX_CREDITS_PER_QUEUE = 256;   // Maximum credits per queue
static const uint16_t DEFAULT_CREDITS = 16;          // Default credit count per port

// =============================================================================
// External Packet Format Constants
// =============================================================================

static const uint8_t EXTERNAL_HEADER_SIZE = 9;      // External header size in bytes
static const uint8_t CHANNEL_TYPE_OFFSET = 0;       // Channel type offset
static const uint8_t QUEUE_ID_OFFSET = 1;           // Queue ID offset
static const uint8_t DEST_PORT_OFFSET = 2;          // Destination port offset (2 bytes)
static const uint8_t SOURCE_PORT_OFFSET = 4;        // Source port offset (2 bytes)
static const uint8_t PACKET_SIZE_OFFSET = 6;        // Packet size offset (2 bytes)
static const uint8_t HEADER_CRC_OFFSET = 8;         // Header CRC offset
static const uint8_t PAYLOAD_OFFSET = 9;            // Payload start offset

// Global Port ID Constants (12-bit)
static const uint16_t GLOBAL_PORT_MASK = 0xFFF;     // 12-bit mask for Global Port IDs
static const uint16_t MAX_GLOBAL_PORT_ID = 4095;    // Maximum Global Port ID (2^12 - 1)

// =============================================================================
// Queue Statistics
// =============================================================================

struct QueueStats {
    uint64_t packets_received;      // Total packets received
    uint64_t packets_transmitted;   // Total packets transmitted  
    uint64_t bytes_received;        // Total bytes received
    uint64_t bytes_transmitted;     // Total bytes transmitted
    uint32_t current_depth;         // Current queue depth
    uint32_t peak_depth;            // Peak queue depth
    uint16_t available_credits;     // Current available credits
    sc_time last_activity;          // Last activity timestamp
    
    QueueStats() : packets_received(0), packets_transmitted(0),
                   bytes_received(0), bytes_transmitted(0),
                   current_depth(0), peak_depth(0),
                   available_credits(DEFAULT_CREDITS),
                   last_activity(SC_ZERO_TIME) {}
};

// =============================================================================
// Credit Management
// =============================================================================

struct CreditInfo {
    uint8_t port_id;               // Target port ID
    uint16_t available_credits;    // Current available credits
    uint16_t max_credits;          // Maximum credits for this port
    sc_time last_update;           // Last credit update time
    
    CreditInfo() : port_id(0), available_credits(0), max_credits(16), 
                   last_update(SC_ZERO_TIME) {}
    CreditInfo(uint8_t id, uint16_t initial_credits = 16) :
        port_id(id), available_credits(initial_credits), max_credits(initial_credits),
        last_update(sc_time_stamp()) {}
        
    // Equality operator for SystemC signal comparison
    bool operator==(const CreditInfo& other) const {
        return (port_id == other.port_id &&
                available_credits == other.available_credits &&
                max_credits == other.max_credits);
    }
    
    // Inequality operator
    bool operator!=(const CreditInfo& other) const {
        return !(*this == other);
    }
};

// Stream output operator for CreditInfo (required for SystemC signals and tracing)
inline std::ostream& operator<<(std::ostream& os, const CreditInfo& info) {
    os << "CreditInfo{port=" << (int)info.port_id 
       << ", avail=" << info.available_credits
       << ", max=" << info.max_credits << "}";
    return os;
}

// Tracing function for SystemC VCD output
inline void sc_trace(sc_trace_file* tf, const CreditInfo& info, const std::string& name) {
    sc_trace(tf, info.port_id, name + "_port_id");
    sc_trace(tf, info.available_credits, name + "_available_credits");
    sc_trace(tf, info.max_credits, name + "_max_credits");
}

// =============================================================================
// Buffer Management
// =============================================================================

static const uint32_t DEFAULT_BUFFER_SIZE = 256;    // Default buffer size in packets
static const uint32_t MAX_PACKET_SIZE = 1518;       // Maximum Ethernet frame size
static const uint32_t MIN_PACKET_SIZE = 64;         // Minimum Ethernet frame size

// =============================================================================
// Credit Management Constants
// =============================================================================

// =============================================================================
// Helper Functions
// =============================================================================

inline std::string packet_type_to_string(PacketType type) {
    switch (type) {
        case PacketType::DATA: return "DATA";
        case PacketType::CONTROL: return "CONTROL";
        case PacketType::CREDIT: return "CREDIT";
        case PacketType::BROADCAST: return "BROADCAST";
        case PacketType::MULTICAST: return "MULTICAST";
        default: return "UNKNOWN";
    }
}

inline std::string channel_type_to_string(ChannelType type) {
    switch (type) {
        case ChannelType::LOW_PRIORITY: return "LOW_PRIORITY";
        case ChannelType::HIGH_PRIORITY: return "HIGH_PRIORITY";
        case ChannelType::CONTROL_CHANNEL: return "CONTROL_CHANNEL";
        case ChannelType::MANAGEMENT: return "MANAGEMENT";
        default: return "UNKNOWN";
    }
}

// Stream output operator for UnifiedPacketEntry (required for SystemC signals)
inline std::ostream& operator<<(std::ostream& os, const UnifiedPacketEntry& entry) {
    os << "PacketEntry{src=" << (int)entry.header.source_port 
       << ", dst=" << (int)entry.header.dest_port
       << ", type=" << packet_type_to_string(entry.header.packet_type)
       << ", len=" << entry.header.packet_length
       << ", payload_size=" << entry.payload.size() << "}";
    return os;
}

// SystemC trace function for UnifiedPacketEntry (required for VCD tracing)
inline void sc_trace(sc_trace_file* tf, const UnifiedPacketEntry& entry, const std::string& name) {
    // Trace individual header fields for visibility in VCD viewer
    sc_trace(tf, entry.header.source_port, name + "_src_port");
    sc_trace(tf, entry.header.dest_port, name + "_dst_port");
    sc_trace(tf, static_cast<uint8_t>(entry.header.packet_type), name + "_pkt_type");
    sc_trace(tf, static_cast<uint8_t>(entry.header.channel_type), name + "_ch_type");
    sc_trace(tf, entry.header.packet_length, name + "_pkt_len");
    sc_trace(tf, static_cast<uint32_t>(entry.payload.size()), name + "_payload_size"); 
    sc_trace(tf, entry.total_size, name + "_total_size");
}

} // namespace switch_internal_p2p

#endif // SWITCH_TYPES_H