#ifndef INGRESS_PM_SCOREBOARD_H
#define INGRESS_PM_SCOREBOARD_H

#include <systemc.h>
#include <uvm>
#include <queue>
#include <map>
#include "../common/uvm_types.h"

namespace uvm_switch_verification {

using namespace uvm;

// =============================================================================
// Ingress Port Manager Scoreboard
// =============================================================================

class ingress_pm_scoreboard : public uvm_scoreboard {
public:
    // Analysis imports from monitors
    uvm_analysis_imp<external_transaction, ingress_pm_scoreboard> external_analysis_imp;
    uvm_analysis_imp<axis_transaction, ingress_pm_scoreboard> axis_analysis_imp;
    
    UVM_COMPONENT_UTILS(ingress_pm_scoreboard)
    
    ingress_pm_scoreboard(uvm_component_name name) 
        : uvm_scoreboard(name),
          external_analysis_imp("external_analysis_imp", this),
          axis_analysis_imp("axis_analysis_imp", this),
          packets_received(0),
          packets_transmitted(0),
          packets_matched(0),
          packets_mismatched(0) {}
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_scoreboard::build_phase(phase);
        UVM_INFO(get_name(), "Ingress PM Scoreboard build phase", UVM_LOW);
    }
    
    // Write method for external transactions (expected)
    virtual void write(const external_transaction& trans) {
        UVM_INFO(get_name(), 
                 ("Received external transaction: " + trans.convert2string()).c_str(), 
                 UVM_MEDIUM);
        
        // Store expected transaction
        expected_queue.push(create_expected_axis_transaction(trans));
        packets_received++;
        
        // Check for immediate match
        check_transactions();
    }
    
    // Write method for AXIS transactions (actual)
    virtual void write(const axis_transaction& trans) {
        UVM_INFO(get_name(), 
                 ("Received AXIS transaction: " + trans.convert2string()).c_str(), 
                 UVM_MEDIUM);
        
        // Store actual transaction
        actual_queue.push(trans);
        packets_transmitted++;
        
        // Check for match
        check_transactions();
    }
    
    virtual void report_phase(uvm_phase& phase) override {
        UVM_INFO(get_name(), "=== SCOREBOARD REPORT ===", UVM_LOW);
        UVM_INFO(get_name(), ("Packets received (external): " + std::to_string(packets_received)).c_str(), UVM_LOW);
        UVM_INFO(get_name(), ("Packets transmitted (AXIS): " + std::to_string(packets_transmitted)).c_str(), UVM_LOW);
        UVM_INFO(get_name(), ("Packets matched: " + std::to_string(packets_matched)).c_str(), UVM_LOW);
        UVM_INFO(get_name(), ("Packets mismatched: " + std::to_string(packets_mismatched)).c_str(), UVM_LOW);
        UVM_INFO(get_name(), ("Expected queue size: " + std::to_string(expected_queue.size())).c_str(), UVM_LOW);
        UVM_INFO(get_name(), ("Actual queue size: " + std::to_string(actual_queue.size())).c_str(), UVM_LOW);
        
        if (packets_mismatched > 0) {
            UVM_ERROR(get_name(), "Packet mismatches detected!");
        } else if (expected_queue.size() > 0 || actual_queue.size() > 0) {
            UVM_WARNING(get_name(), "Unmatched transactions remaining in queues");
        } else {
            UVM_INFO(get_name(), "All packets matched successfully!", UVM_LOW);
        }
        
        UVM_INFO(get_name(), "========================", UVM_LOW);
    }
    
protected:
    // Transaction queues
    std::queue<axis_transaction> expected_queue;
    std::queue<axis_transaction> actual_queue;
    
    // Statistics
    int packets_received;
    int packets_transmitted;
    int packets_matched;
    int packets_mismatched;
    
    // Convert external transaction to expected AXIS transaction
    axis_transaction create_expected_axis_transaction(const external_transaction& ext_trans) {
        axis_transaction axis_trans("expected_axis");
        
        // Copy data payload
        axis_trans.tdata = ext_trans.data;
        
        // Generate expected tkeep (all valid bytes)
        const int bytes_per_beat = AXIS_DATA_WIDTH / 8;
        int total_bytes = ext_trans.data.size();
        int num_beats = (total_bytes + bytes_per_beat - 1) / bytes_per_beat;
        
        axis_trans.tkeep.clear();
        for (int beat = 0; beat < num_beats; beat++) {
            int bytes_in_beat = std::min(bytes_per_beat, total_bytes - beat * bytes_per_beat);
            for (int i = 0; i < bytes_per_beat; i++) {
                axis_trans.tkeep.push_back(i < bytes_in_beat ? 1 : 0);
            }
        }
        
        // Set tuser (header) and tlast
        axis_trans.tuser = ext_trans.header;
        axis_trans.tlast = true; // Always true for single packet
        
        return axis_trans;
    }
    
    // Check for transaction matches
    void check_transactions() {
        while (!expected_queue.empty() && !actual_queue.empty()) {
            axis_transaction expected = expected_queue.front();
            axis_transaction actual = actual_queue.front();
            
            if (compare_transactions(expected, actual)) {
                UVM_INFO(get_name(), "Transaction MATCH", UVM_HIGH);
                packets_matched++;
                expected_queue.pop();
                actual_queue.pop();
            } else {
                UVM_ERROR(get_name(), 
                         ("Transaction MISMATCH!\n"
                          "Expected: " + expected.convert2string() + "\n"
                          "Actual:   " + actual.convert2string()).c_str());
                packets_mismatched++;
                expected_queue.pop();
                actual_queue.pop();
            }
        }
    }
    
    // Compare two AXIS transactions
    bool compare_transactions(const axis_transaction& expected, const axis_transaction& actual) {
        // Compare data payload
        if (expected.tdata.size() != actual.tdata.size()) {
            UVM_INFO(get_name(), 
                     ("Data size mismatch: expected=" + std::to_string(expected.tdata.size()) + 
                      " actual=" + std::to_string(actual.tdata.size())).c_str(), 
                     UVM_HIGH);
            return false;
        }
        
        for (size_t i = 0; i < expected.tdata.size(); i++) {
            if (expected.tdata[i] != actual.tdata[i]) {
                UVM_INFO(get_name(), 
                         ("Data mismatch at byte " + std::to_string(i) + 
                          ": expected=0x" + std::to_string(expected.tdata[i]) + 
                          " actual=0x" + std::to_string(actual.tdata[i])).c_str(), 
                         UVM_HIGH);
                return false;
            }
        }
        
        // Compare tuser (header)
        if (expected.tuser != actual.tuser) {
            UVM_INFO(get_name(), 
                     ("TUser mismatch: expected=0x" + std::to_string(expected.tuser) + 
                      " actual=0x" + std::to_string(actual.tuser)).c_str(), 
                     UVM_HIGH);
            return false;
        }
        
        // Compare tlast
        if (expected.tlast != actual.tlast) {
            UVM_INFO(get_name(), 
                     ("TLast mismatch: expected=" + (expected.tlast ? "true" : "false") + 
                      " actual=" + (actual.tlast ? "true" : "false")).c_str(), 
                     UVM_HIGH);
            return false;
        }
        
        // Compare tkeep (only valid bytes)
        size_t valid_bytes = 0;
        for (size_t i = 0; i < actual.tkeep.size(); i++) {
            if (actual.tkeep[i]) valid_bytes++;
        }
        
        if (valid_bytes != expected.tdata.size()) {
            UVM_INFO(get_name(), 
                     ("TKeep valid bytes mismatch: expected=" + std::to_string(expected.tdata.size()) + 
                      " actual=" + std::to_string(valid_bytes)).c_str(), 
                     UVM_HIGH);
            return false;
        }
        
        return true;
    }
};

} // namespace uvm_switch_verification

#endif // INGRESS_PM_SCOREBOARD_H