#ifndef AXIS_AGENT_H
#define AXIS_AGENT_H

#include <systemc.h>
#include <uvm>
#include "../common/uvm_types.h"

namespace uvm_switch_verification {

using namespace uvm;

// =============================================================================
// AXIS Interface Driver (Slave - provides tready)
// =============================================================================

class axis_driver : public uvm_driver<axis_transaction> {
public:
    // Interface to DUT
    sc_in<bool> axis_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_in<bool> axis_tlast;
    sc_out<bool> axis_tready;
    
    // Clock reference
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    UVM_COMPONENT_UTILS(axis_driver)
    
    axis_driver(uvm_component_name name) : uvm_driver<axis_transaction>(name) {
        SC_CTHREAD(drive_process, clk.pos());
        reset_signal_is(rst_n, false);
    }
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_driver<axis_transaction>::build_phase(phase);
        UVM_INFO(get_name(), "AXIS driver build phase", UVM_LOW);
    }
    
protected:
    void drive_process() {
        // Reset behavior
        axis_tready.write(false);
        
        wait(); // Wait for reset deassertion
        
        while (true) {
            // Get next transaction from sequencer (for ready control)
            axis_transaction* trans;
            seq_item_port.get_next_item(trans);
            
            UVM_INFO(get_name(), 
                     ("Driving ready control: " + trans->convert2string()).c_str(), 
                     UVM_MEDIUM);
            
            // Apply ready delay
            if (trans->ready_delay > 0) {
                axis_tready.write(false);
                for (int i = 0; i < trans->ready_delay; i++) {
                    wait();
                }
            }
            
            // Assert ready
            axis_tready.write(true);
            
            // Wait for transaction completion (tlast and handshake)
            while (true) {
                wait();
                if (axis_tvalid.read() && axis_tready.read() && axis_tlast.read()) {
                    break;
                }
            }
            
            // Complete the transaction
            seq_item_port.item_done();
        }
    }
};

// =============================================================================
// AXIS Interface Monitor
// =============================================================================

class axis_monitor : public uvm_monitor {
public:
    // Interface to DUT
    sc_in<bool> axis_tvalid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_in<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_in<bool> axis_tlast;
    sc_in<bool> axis_tready;
    
    // Clock reference
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Analysis port
    uvm_analysis_port<axis_transaction> analysis_port;
    
    UVM_COMPONENT_UTILS(axis_monitor)
    
    axis_monitor(uvm_component_name name) : uvm_monitor(name), analysis_port("analysis_port") {
        SC_CTHREAD(monitor_process, clk.pos());
        reset_signal_is(rst_n, false);
    }
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_monitor::build_phase(phase);
        UVM_INFO(get_name(), "AXIS monitor build phase", UVM_LOW);
    }
    
protected:
    void monitor_process() {
        wait(); // Wait for reset deassertion
        
        while (true) {
            // Wait for valid transaction
            while (!axis_tvalid.read()) {
                wait();
            }
            
            // Collect transaction
            axis_transaction* trans = new axis_transaction("monitored_axis_trans");
            collect_transaction(*trans);
            
            UVM_INFO(get_name(), 
                     ("Monitored AXIS transaction: " + trans->convert2string()).c_str(), 
                     UVM_MEDIUM);
            
            // Send to analysis port
            analysis_port.write(*trans);
        }
    }
    
    void collect_transaction(axis_transaction& trans) {
        const int bytes_per_beat = AXIS_DATA_WIDTH / 8;
        trans.tdata.clear();
        trans.tkeep.clear();
        
        while (axis_tvalid.read()) {
            if (axis_tready.read()) {
                // Collect data from current beat
                sc_bv<AXIS_DATA_WIDTH> tdata_beat = axis_tdata.read();
                sc_bv<AXIS_KEEP_WIDTH> tkeep_beat = axis_tkeep.read();
                
                for (int i = 0; i < bytes_per_beat; i++) {
                    uint8_t byte_data = tdata_beat.range(i*8+7, i*8).to_uint();
                    uint8_t keep_byte = tkeep_beat[i] ? 1 : 0;
                    
                    trans.tdata.push_back(byte_data);
                    trans.tkeep.push_back(keep_byte);
                }
                
                // Capture tuser on first beat
                if (trans.tdata.size() <= bytes_per_beat) {
                    trans.tuser = axis_tuser.read().to_uint64();
                }
                
                trans.tlast = axis_tlast.read();
                
                if (axis_tlast.read()) {
                    break;
                }
            }
            wait();
        }
    }
};

// =============================================================================
// AXIS Interface Sequencer
// =============================================================================

class axis_sequencer : public uvm_sequencer<axis_transaction> {
public:
    UVM_COMPONENT_UTILS(axis_sequencer)
    
    axis_sequencer(uvm_component_name name) : uvm_sequencer<axis_transaction>(name) {}
};

// =============================================================================
// AXIS Interface Agent
// =============================================================================

class axis_agent : public uvm_agent {
public:
    axis_driver* driver;
    axis_monitor* monitor;
    axis_sequencer* sequencer;
    
    UVM_COMPONENT_UTILS(axis_agent)
    
    axis_agent(uvm_component_name name) : uvm_agent(name) {}
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_agent::build_phase(phase);
        
        UVM_INFO(get_name(), "AXIS agent build phase", UVM_LOW);
        
        // Create components
        monitor = axis_monitor::type_id::create("monitor", this);
        
        if (get_is_active() == UVM_ACTIVE) {
            driver = axis_driver::type_id::create("driver", this);
            sequencer = axis_sequencer::type_id::create("sequencer", this);
        }
    }
    
    virtual void connect_phase(uvm_phase& phase) override {
        uvm_agent::connect_phase(phase);
        
        if (get_is_active() == UVM_ACTIVE) {
            // Connect driver to sequencer
            driver->seq_item_port.connect(sequencer->seq_item_export);
        }
    }
};

} // namespace uvm_switch_verification

#endif // AXIS_AGENT_H