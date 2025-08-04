/*!
 * \file riscv_cpu_wrapper.cpp
 * \brief RISC-V CPU Wrapper Implementation
 * \author Switch Development Team
 * \date August 2024
 */

#include "riscv_cpu_wrapper.h"
#include <iostream>

namespace switch_internal_p2p {

// =============================================================================
// Static Member Definitions
// =============================================================================

const sc_time RISCVCpuWrapper::CPU_PROCESSING_DELAY = sc_time(5, SC_NS);
const sc_time RISCVCpuWrapper::CPU_MEMORY_ACCESS_TIME = sc_time(1, SC_NS);

// =============================================================================
// Constructor and Destructor
// =============================================================================

RISCVCpuWrapper::RISCVCpuWrapper(sc_module_name name) 
    : sc_module(name),
      axis_in_tvalid("axis_in_tvalid"),
      axis_in_tdata("axis_in_tdata"),
      axis_in_tkeep("axis_in_tkeep"),
      axis_in_tuser("axis_in_tuser"),
      axis_in_tlast("axis_in_tlast"),
      axis_in_tready("axis_in_tready"),
      axis_out_tvalid("axis_out_tvalid"),
      axis_out_tdata("axis_out_tdata"),
      axis_out_tkeep("axis_out_tkeep"),
      axis_out_tuser("axis_out_tuser"),
      axis_out_tlast("axis_out_tlast"),
      axis_out_tready("axis_out_tready"),
      clk("clk"),
      rst_n("rst_n"),
      axi_slave_valid("axi_slave_valid"),
      axi_slave_addr("axi_slave_addr"),
      axi_slave_data("axi_slave_data"),
      axi_slave_ready("axi_slave_ready"),
      // Internal state initialization
      riscv_cpu(nullptr),
      riscv_memory(nullptr),
      riscv_bus(nullptr),
      riscv_timer(nullptr),
      riscv_trace(nullptr),
      current_credits(CPU_QUEUE_SIZE),
      max_credits(CPU_QUEUE_SIZE),
      packets_processed(0),
      packets_dropped(0),
      total_bytes_processed(0),
      packet_in_progress(false)
{
    std::cout << "[RISCVCpuWrapper] Creating RISC-V CPU Wrapper..." << std::endl;
    
    // Initialize RISC-V components (stub for now)
    create_riscv_components();
    connect_riscv_components();
    
    // Register SystemC processes
    SC_THREAD(axis_input_process);
    
    SC_THREAD(axis_output_process);
    
    SC_THREAD(credit_management_process);
    
    SC_THREAD(axi_slave_process);
    
    SC_THREAD(cpu_processing_thread);
    
    std::cout << "[RISCVCpuWrapper] ✅ RISC-V CPU Wrapper created successfully" << std::endl;
}

RISCVCpuWrapper::~RISCVCpuWrapper() {
    std::cout << "[RISCVCpuWrapper] Destroying RISC-V CPU Wrapper..." << std::endl;
    
    // Clean up RISC-V components
    if (riscv_trace) delete riscv_trace;
    if (riscv_timer) delete riscv_timer;
    if (riscv_bus) delete riscv_bus;
    if (riscv_memory) delete riscv_memory;
    if (riscv_cpu) delete riscv_cpu;
    
    std::cout << "[RISCVCpuWrapper] ✅ RISC-V CPU Wrapper destroyed" << std::endl;
}

// =============================================================================
// Public Methods
// =============================================================================

bool RISCVCpuWrapper::is_ready_for_packets() const {
    return current_credits > 0 && input_packet_queue.size() < CPU_QUEUE_SIZE;
}

// =============================================================================
// SystemC Processes
// =============================================================================

void RISCVCpuWrapper::axis_input_process() {
    // Initialize AXIS ready signal
    axis_in_tready.write(false);
    
    while (true) {
        wait(clk.posedge_event()); // Wait for clock edge
        
        if (!rst_n.read()) {
            // Reset state
            axis_in_tready.write(false);
            while (!input_packet_queue.empty()) {
                input_packet_queue.pop();
            }
            current_packet_data.clear();
            packet_in_progress = false;
            current_header = InternalHeader();
            continue;
        }
        
        // Set ready signal based on queue availability
        bool can_accept = (input_packet_queue.size() < CPU_QUEUE_SIZE) && (current_credits > 0);
        axis_in_tready.write(can_accept);
        
        // Process incoming AXIS data
        if (axis_in_tvalid.read() && axis_in_tready.read()) {
            std::cout << "[RISCVCpuWrapper] 📨 Received AXIS beat" << std::endl;
            
            // Extract packet data
            sc_bv<AXIS_DATA_WIDTH> tdata = axis_in_tdata.read();
            sc_bv<AXIS_DATA_WIDTH/8> tkeep = axis_in_tkeep.read();
            sc_bv<AXIS_USER_WIDTH> tuser = axis_in_tuser.read();
            bool tlast = axis_in_tlast.read();
            
            // Convert to byte vector
            std::vector<uint8_t> beat_data;
            for (int i = 0; i < AXIS_DATA_WIDTH/8; i++) {
                if (tkeep[i]) {
                    uint8_t byte_val = ((tdata >> (i * 8)) & 0xFF).to_uint();
                    beat_data.push_back(byte_val);
                }
            }
            
            // Add to current packet
            current_packet_data.insert(current_packet_data.end(), beat_data.begin(), beat_data.end());
            
            // If this is the first beat, extract header from tuser
            if (!packet_in_progress) {
                current_header = InternalHeader::from_sc_bv(tuser);
                packet_in_progress = true;
                
                std::cout << "[RISCVCpuWrapper] 📋 Started new packet:" << std::endl;
                std::cout << "  Channel: " << (int)current_header.channel_type << std::endl;
                std::cout << "  Queue: " << (int)current_header.queue_id << std::endl;
                std::cout << "  Dest: " << current_header.dest_port << std::endl;
                std::cout << "  Source: " << current_header.source_port << std::endl;
            }
            
            // If this is the last beat, finalize packet
            if (tlast) {
                PacketEntry packet;
                packet.header = current_header;
                packet.payload = current_packet_data;
                packet.total_size = current_packet_data.size();
                packet.timestamp = sc_time_stamp();
                
                input_packet_queue.push(packet);
                packets_processed++;
                total_bytes_processed += packet.total_size;
                current_credits--; // Consume one credit
                
                std::cout << "[RISCVCpuWrapper] ✅ Packet completed, size=" << packet.total_size 
                          << ", credits=" << current_credits << std::endl;
                
                // Reset for next packet
                packet_in_progress = false;
                current_packet_data.clear();
                current_header = InternalHeader();
            }
        }
    }
}

void RISCVCpuWrapper::axis_output_process() {
    // Initialize AXIS output signals
    axis_out_tvalid.write(false);
            axis_out_tdata.write(sc_bv<AXIS_DATA_WIDTH>("0"));
        axis_out_tkeep.write(sc_bv<AXIS_DATA_WIDTH/8>("0"));
    axis_out_tuser.write(0);
    axis_out_tlast.write(false);
    
    while (true) {
        wait(clk.posedge_event()); // Wait for clock edge
        
        if (!rst_n.read()) {
            // Reset state
            axis_out_tvalid.write(false);
            axis_out_tdata.write(sc_bv<AXIS_DATA_WIDTH>("0"));
            axis_out_tkeep.write(sc_bv<AXIS_DATA_WIDTH/8>("0"));
            axis_out_tuser.write(0);
            axis_out_tlast.write(false);
            while (!output_packet_queue.empty()) {
                output_packet_queue.pop();
            }
            continue;
        }
        
        // For now, just acknowledge that we can transmit
        // Real implementation will send processed packets back to switch
        if (!output_packet_queue.empty() && axis_out_tready.read()) {
            std::cout << "[RISCVCpuWrapper] 📤 Could send output packet (not implemented yet)" << std::endl;
            output_packet_queue.pop();
        }
    }
}

void RISCVCpuWrapper::credit_management_process() {
    while (true) {
        wait(100, SC_NS); // Check credits periodically
        
        if (!rst_n.read()) {
            current_credits = max_credits;
            continue;
        }
        
        // Request more credits if running low
        if (current_credits <= CPU_CREDIT_WATERMARK) {
            uint32_t credits_to_request = max_credits - current_credits;
            std::cout << "[RISCVCpuWrapper] 🔄 Requesting " << credits_to_request 
                      << " credits (current=" << current_credits << ")" << std::endl;
            
            // For now, just simulate getting credits back
            // Real implementation will send credit request to source port
            current_credits = max_credits;
        }
    }
}

void RISCVCpuWrapper::axi_slave_process() {
    axi_slave_ready.write(false);
    
    while (true) {
        wait(clk.posedge_event()); // Wait for clock edge
        
        if (!rst_n.read()) {
            axi_slave_ready.write(false);
            continue;
        }
        
        // Simple AXI slave response
        if (axi_slave_valid.read()) {
            axi_slave_ready.write(true);
            
            uint32_t addr = axi_slave_addr.read();
            uint32_t data = axi_slave_data.read();
            
            std::cout << "[RISCVCpuWrapper] 🔧 AXI Config: addr=0x" << std::hex << addr 
                      << ", data=0x" << data << std::dec << std::endl;
            
            // Basic configuration handling (stub)
            if (addr == 0x0000) {
                // Reset command
                std::cout << "[RISCVCpuWrapper] 🔄 CPU Reset requested" << std::endl;
            } else if (addr == 0x0004) {
                // Credit configuration
                max_credits = std::min(data, 32U); // Limit to reasonable value
                std::cout << "[RISCVCpuWrapper] 🎯 Max credits set to " << max_credits << std::endl;
            }
        } else {
            axi_slave_ready.write(false);
        }
    }
}

void RISCVCpuWrapper::cpu_processing_thread() {
    while (true) {
        wait(CPU_PROCESSING_DELAY); // Simulate CPU processing time
        
        if (!rst_n.read()) continue;
        
        // Process packets from input queue
        if (!input_packet_queue.empty()) {
            PacketEntry packet = input_packet_queue.front();
            input_packet_queue.pop();
            
            std::cout << "[RISCVCpuWrapper] 🔍 Processing packet: " 
                      << "channel=" << (int)packet.header.channel_type
                      << ", size=" << packet.total_size << std::endl;
            
            // Simulate packet processing
            process_received_packet(packet);
            
            std::cout << "[RISCVCpuWrapper] ✅ Packet processed" << std::endl;
        }
    }
}

// =============================================================================
// Helper Methods (Stubs for prototype)
// =============================================================================

void RISCVCpuWrapper::create_riscv_components() {
    // For prototype, just log that we would create RISC-V components
    std::cout << "[RISCVCpuWrapper] 🏗️  Creating RISC-V components (stub)" << std::endl;
    
    // TODO: Actual RISC-V component creation will be added in next steps
    // riscv_memory = new riscv_tlm::Memory("cpu_memory", "");
    // riscv_cpu = new riscv_tlm::CPURV32("cpu_core", 0, false);
    // riscv_bus = new riscv_tlm::BusCtrl("cpu_bus");
    // riscv_timer = new riscv_tlm::peripherals::Timer("cpu_timer");
    // riscv_trace = new riscv_tlm::peripherals::Trace("cpu_trace");
}

void RISCVCpuWrapper::connect_riscv_components() {
    std::cout << "[RISCVCpuWrapper] 🔗 Connecting RISC-V components (stub)" << std::endl;
    
    // TODO: Actual component connections will be added in next steps
}

void RISCVCpuWrapper::axis_to_tlm_conversion(const PacketEntry& packet) {
    std::cout << "[RISCVCpuWrapper] 🔄 AXIS->TLM conversion (stub)" << std::endl;
    
    // TODO: Convert AXIS packet to TLM transaction
}

void RISCVCpuWrapper::process_received_packet(const PacketEntry& packet) {
    // Basic packet classification
    switch (static_cast<ChannelType>(packet.header.channel_type)) {
        case ChannelType::HIGH_PRIORITY:
            std::cout << "[RISCVCpuWrapper] 🚨 Processing high priority packet (error/urgent)" << std::endl;
            // TODO: Handle high priority/error packet
            break;
            
        case ChannelType::CONTROL_CHANNEL:
            std::cout << "[RISCVCpuWrapper] 🎛️  Processing control packet" << std::endl;
            // TODO: Handle control packet
            break;
            
        case ChannelType::LOW_PRIORITY:
            std::cout << "[RISCVCpuWrapper] 📦 Processing low priority data packet" << std::endl;
            // TODO: Handle low priority data packet
            break;
            
        case ChannelType::MANAGEMENT:
            std::cout << "[RISCVCpuWrapper] 🔧 Processing management packet" << std::endl;
            // TODO: Handle management packet
            break;
            
        default:
            std::cout << "[RISCVCpuWrapper] ❓ Unknown packet type: " 
                      << (int)packet.header.channel_type << std::endl;
            packets_dropped++;
            break;
    }
}

void RISCVCpuWrapper::update_credits() {
    // Credit update logic (stub)
    std::cout << "[RISCVCpuWrapper] 🔄 Updating credits (stub)" << std::endl;
}

void RISCVCpuWrapper::send_credit_return(uint8_t source_port, uint32_t credits) {
    std::cout << "[RISCVCpuWrapper] 💳 Returning " << credits 
              << " credits to port " << (int)source_port << " (stub)" << std::endl;
}

} // namespace switch_internal_p2p