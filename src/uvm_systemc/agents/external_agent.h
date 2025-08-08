#ifndef EXTERNAL_AGENT_H
#define EXTERNAL_AGENT_H

#include <systemc.h>
#include <uvm>
#include "../common/uvm_types.h"

namespace uvm_switch_verification {

using namespace uvm;

// =============================================================================
// External Interface Driver
// =============================================================================

class external_driver : public uvm_driver<external_transaction> {
public:
    // Interface to DUT
    sc_out<bool> ext_valid;
    sc_out<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_out<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_out<bool> ext_last;
    sc_in<bool> ext_ready;
    
    // Clock reference
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    UVM_COMPONENT_UTILS(external_driver)
    
    external_driver(uvm_component_name name) : uvm_driver<external_transaction>(name) {
        SC_CTHREAD(drive_process, clk.pos());
        reset_signal_is(rst_n, false);
    }
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_driver<external_transaction>::build_phase(phase);
        UVM_INFO(get_name(), "External driver build phase", UVM_LOW);
    }
    
protected:
    void drive_process() {
        // Reset behavior
        ext_valid.write(false);
        ext_data.write(0);
        ext_keep.write(0);
        ext_last.write(false);
        
        wait(); // Wait for reset deassertion
        
        while (true) {
            // Get next transaction from sequencer
            external_transaction* trans;
            seq_item_port.get_next_item(trans);
            
            UVM_INFO(get_name(), 
                     ("Driving transaction: " + trans->convert2string()).c_str(), 
                     UVM_MEDIUM);
            
            // Apply pre-transaction delay
            if (trans->delay_cycles > 0) {
                for (int i = 0; i < trans->delay_cycles; i++) {
                    wait();
                }
            }
            
            // Drive the transaction
            drive_transaction(*trans);
            
            // Complete the transaction
            seq_item_port.item_done();
        }
    }
    
    void drive_transaction(const external_transaction& trans) {
        const int bytes_per_beat = AXIS_DATA_WIDTH / 8;
        int total_bytes = trans.data.size();
        int num_beats = (total_bytes + bytes_per_beat - 1) / bytes_per_beat;
        
        for (int beat = 0; beat < num_beats; beat++) {
            // Prepare beat data
            sc_bv<AXIS_DATA_WIDTH> data_beat = 0;
            sc_bv<AXIS_KEEP_WIDTH> keep_beat = 0;
            
            int bytes_in_beat = std::min(bytes_per_beat, total_bytes - beat * bytes_per_beat);
            
            for (int i = 0; i < bytes_in_beat; i++) {
                int byte_idx = beat * bytes_per_beat + i;
                if (byte_idx < trans.data.size()) {
                    data_beat.range(i*8+7, i*8) = trans.data[byte_idx];
                    keep_beat[i] = true;
                }
            }
            
            // Drive signals
            ext_valid.write(true);
            ext_data.write(data_beat);
            ext_keep.write(keep_beat);
            ext_last.write(beat == num_beats - 1);
            
            // Wait for ready handshake
            do {
                wait();
            } while (!ext_ready.read());
            
            UVM_INFO(get_name(), 
                     ("Drove beat " + std::to_string(beat+1) + "/" + std::to_string(num_beats)).c_str(), 
                     UVM_HIGH);
        }
        
        // Deassert valid after transaction
        wait();
        ext_valid.write(false);
        ext_last.write(false);
    }
};

// =============================================================================
// External Interface Monitor
// =============================================================================

class external_monitor : public uvm_monitor {
public:
    // Interface to DUT
    sc_in<bool> ext_valid;
    sc_in<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_in<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_in<bool> ext_last;
    sc_in<bool> ext_ready;
    
    // Clock reference
    sc_in<bool> clk;
    sc_in<bool> rst_n;
    
    // Analysis port
    uvm_analysis_port<external_transaction> analysis_port;
    
    UVM_COMPONENT_UTILS(external_monitor)
    
    external_monitor(uvm_component_name name) : uvm_monitor(name), analysis_port("analysis_port") {
        SC_CTHREAD(monitor_process, clk.pos());
        reset_signal_is(rst_n, false);
    }
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_monitor::build_phase(phase);
        UVM_INFO(get_name(), "External monitor build phase", UVM_LOW);
    }
    
protected:
    void monitor_process() {
        wait(); // Wait for reset deassertion
        
        while (true) {
            // Wait for valid transaction
            while (!ext_valid.read()) {
                wait();
            }
            
            // Collect transaction
            external_transaction* trans = new external_transaction("monitored_trans");
            collect_transaction(*trans);
            
            UVM_INFO(get_name(), 
                     ("Monitored transaction: " + trans->convert2string()).c_str(), 
                     UVM_MEDIUM);
            
            // Send to analysis port
            analysis_port.write(*trans);
        }
    }
    
    void collect_transaction(external_transaction& trans) {
        const int bytes_per_beat = AXIS_DATA_WIDTH / 8;
        trans.data.clear();
        
        while (ext_valid.read()) {
            if (ext_ready.read()) {
                // Collect data from current beat
                sc_bv<AXIS_DATA_WIDTH> data_beat = ext_data.read();
                sc_bv<AXIS_KEEP_WIDTH> keep_beat = ext_keep.read();
                
                for (int i = 0; i < bytes_per_beat; i++) {
                    if (keep_beat[i]) {
                        uint8_t byte_data = data_beat.range(i*8+7, i*8).to_uint();
                        trans.data.push_back(byte_data);
                    }
                }
                
                trans.last = ext_last.read();
                
                if (ext_last.read()) {
                    break;
                }
            }
            wait();
        }
    }
};

// =============================================================================
// External Interface Sequencer
// =============================================================================

class external_sequencer : public uvm_sequencer<external_transaction> {
public:
    UVM_COMPONENT_UTILS(external_sequencer)
    
    external_sequencer(uvm_component_name name) : uvm_sequencer<external_transaction>(name) {}
};

// =============================================================================
// External Interface Agent
// =============================================================================

class external_agent : public uvm_agent {
public:
    external_driver* driver;
    external_monitor* monitor;
    external_sequencer* sequencer;
    
    UVM_COMPONENT_UTILS(external_agent)
    
    external_agent(uvm_component_name name) : uvm_agent(name) {}
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_agent::build_phase(phase);
        
        UVM_INFO(get_name(), "External agent build phase", UVM_LOW);
        
        // Create components
        monitor = external_monitor::type_id::create("monitor", this);
        
        if (get_is_active() == UVM_ACTIVE) {
            driver = external_driver::type_id::create("driver", this);
            sequencer = external_sequencer::type_id::create("sequencer", this);
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

#endif // EXTERNAL_AGENT_H