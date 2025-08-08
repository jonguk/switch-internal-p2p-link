#ifndef UVM_TYPES_H
#define UVM_TYPES_H

#include <systemc.h>
#include <uvm>
#include "../../systemc/common/switch_types.h"

namespace uvm_switch_verification {

using namespace uvm;
using namespace switch_internal_p2p;

// =============================================================================
// UVM Transaction Types
// =============================================================================

// External Interface Transaction (from external source to ingress port manager)
class external_transaction : public uvm_transaction {
public:
    // Packet data
    std::vector<uint8_t> data;
    uint64_t header;
    bool last;
    
    // Timing control
    int delay_cycles;
    
    // Constructor
    external_transaction(const std::string& name = "external_transaction") 
        : uvm_transaction(name), last(false), delay_cycles(0) {}
    
    // UVM utilities
    UVM_OBJECT_UTILS(external_transaction)
    
    virtual void do_copy(const uvm_object& rhs) override {
        const external_transaction* trans = dynamic_cast<const external_transaction*>(&rhs);
        if (trans) {
            data = trans->data;
            header = trans->header;
            last = trans->last;
            delay_cycles = trans->delay_cycles;
        }
    }
    
    virtual std::string convert2string() const override {
        std::ostringstream oss;
        oss << "external_transaction: data_size=" << data.size() 
            << " header=0x" << std::hex << header 
            << " last=" << (last ? "true" : "false")
            << " delay=" << std::dec << delay_cycles;
        return oss.str();
    }
};

// AXIS Interface Transaction (from ingress port manager to queue manager)
class axis_transaction : public uvm_transaction {
public:
    // AXIS fields
    std::vector<uint8_t> tdata;
    std::vector<uint8_t> tkeep;
    uint64_t tuser;
    bool tlast;
    
    // Timing
    int ready_delay;
    
    // Constructor
    axis_transaction(const std::string& name = "axis_transaction") 
        : uvm_transaction(name), tuser(0), tlast(false), ready_delay(0) {}
    
    UVM_OBJECT_UTILS(axis_transaction)
    
    virtual void do_copy(const uvm_object& rhs) override {
        const axis_transaction* trans = dynamic_cast<const axis_transaction*>(&rhs);
        if (trans) {
            tdata = trans->tdata;
            tkeep = trans->tkeep;
            tuser = trans->tuser;
            tlast = trans->tlast;
            ready_delay = trans->ready_delay;
        }
    }
    
    virtual std::string convert2string() const override {
        std::ostringstream oss;
        oss << "axis_transaction: data_size=" << tdata.size() 
            << " tuser=0x" << std::hex << tuser 
            << " tlast=" << (tlast ? "true" : "false")
            << " ready_delay=" << std::dec << ready_delay;
        return oss.str();
    }
};

// AXI Interface Transaction (for configuration and status)
class axi_transaction : public uvm_transaction {
public:
    bool is_write;
    uint32_t addr;
    uint32_t data;
    
    // Constructor
    axi_transaction(const std::string& name = "axi_transaction") 
        : uvm_transaction(name), is_write(false), addr(0), data(0) {}
    
    UVM_OBJECT_UTILS(axi_transaction)
    
    virtual void do_copy(const uvm_object& rhs) override {
        const axi_transaction* trans = dynamic_cast<const axi_transaction*>(&rhs);
        if (trans) {
            is_write = trans->is_write;
            addr = trans->addr;
            data = trans->data;
        }
    }
    
    virtual std::string convert2string() const override {
        std::ostringstream oss;
        oss << "axi_transaction: " << (is_write ? "WRITE" : "READ") 
            << " addr=0x" << std::hex << addr 
            << " data=0x" << data;
        return oss.str();
    }
};

// =============================================================================
// UVM Configuration Object
// =============================================================================

class ingress_pm_config : public uvm_object {
public:
    // Test configuration
    bool enable_external_agent;
    bool enable_axis_agent;
    bool enable_axi_agent;
    bool enable_scoreboard;
    
    // DUT configuration
    uint8_t port_id;
    uint32_t buffer_size;
    uint16_t max_packet_size;
    
    // Test parameters
    int num_packets;
    int max_delay_cycles;
    bool randomize_delays;
    
    // Constructor
    ingress_pm_config(const std::string& name = "ingress_pm_config") 
        : uvm_object(name),
          enable_external_agent(true),
          enable_axis_agent(true),
          enable_axi_agent(true),
          enable_scoreboard(true),
          port_id(1),
          buffer_size(1024),
          max_packet_size(1500),
          num_packets(10),
          max_delay_cycles(5),
          randomize_delays(true) {}
    
    UVM_OBJECT_UTILS(ingress_pm_config)
};

} // namespace uvm_switch_verification

#endif // UVM_TYPES_H