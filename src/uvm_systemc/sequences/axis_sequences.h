#ifndef AXIS_SEQUENCES_H
#define AXIS_SEQUENCES_H

#include <systemc.h>
#include <uvm>
#include <random>
#include "../common/uvm_types.h"

namespace uvm_switch_verification {

using namespace uvm;

// =============================================================================
// Base AXIS Sequence (for ready control)
// =============================================================================

class axis_base_sequence : public uvm_sequence<axis_transaction> {
public:
    UVM_OBJECT_UTILS(axis_base_sequence)
    
    axis_base_sequence(const std::string& name = "axis_base_sequence") 
        : uvm_sequence<axis_transaction>(name), 
          rng(std::random_device{}()) {}
    
protected:
    std::mt19937 rng;
};

// =============================================================================
// Always Ready Sequence
// =============================================================================

class axis_always_ready_sequence : public axis_base_sequence {
public:
    int num_transactions;
    
    UVM_OBJECT_UTILS(axis_always_ready_sequence)
    
    axis_always_ready_sequence(const std::string& name = "axis_always_ready_sequence") 
        : axis_base_sequence(name), num_transactions(20) {}
    
    virtual void body() override {
        UVM_INFO(get_name(), "Starting always ready sequence", UVM_LOW);
        
        for (int i = 0; i < num_transactions; i++) {
            axis_transaction* trans = new axis_transaction("ready_control");
            trans->ready_delay = 0; // Always ready
            
            start_item(trans);
            finish_item(trans);
        }
        
        UVM_INFO(get_name(), "Always ready sequence completed", UVM_LOW);
    }
};

// =============================================================================
// Random Ready Sequence
// =============================================================================

class axis_random_ready_sequence : public axis_base_sequence {
public:
    int num_transactions;
    int max_delay;
    
    UVM_OBJECT_UTILS(axis_random_ready_sequence)
    
    axis_random_ready_sequence(const std::string& name = "axis_random_ready_sequence") 
        : axis_base_sequence(name), num_transactions(20), max_delay(10) {}
    
    virtual void body() override {
        UVM_INFO(get_name(), "Starting random ready sequence", UVM_LOW);
        
        for (int i = 0; i < num_transactions; i++) {
            axis_transaction* trans = new axis_transaction("ready_control");
            trans->ready_delay = std::uniform_int_distribution<int>(0, max_delay)(rng);
            
            UVM_INFO(get_name(), 
                     ("Setting ready delay: " + std::to_string(trans->ready_delay)).c_str(), 
                     UVM_HIGH);
            
            start_item(trans);
            finish_item(trans);
        }
        
        UVM_INFO(get_name(), "Random ready sequence completed", UVM_LOW);
    }
};

// =============================================================================
// Slow Ready Sequence (for backpressure testing)
// =============================================================================

class axis_slow_ready_sequence : public axis_base_sequence {
public:
    int num_transactions;
    int min_delay;
    int max_delay;
    
    UVM_OBJECT_UTILS(axis_slow_ready_sequence)
    
    axis_slow_ready_sequence(const std::string& name = "axis_slow_ready_sequence") 
        : axis_base_sequence(name), 
          num_transactions(10), 
          min_delay(5), 
          max_delay(20) {}
    
    virtual void body() override {
        UVM_INFO(get_name(), "Starting slow ready sequence (backpressure test)", UVM_LOW);
        
        for (int i = 0; i < num_transactions; i++) {
            axis_transaction* trans = new axis_transaction("slow_ready_control");
            trans->ready_delay = std::uniform_int_distribution<int>(min_delay, max_delay)(rng);
            
            UVM_INFO(get_name(), 
                     ("Setting slow ready delay: " + std::to_string(trans->ready_delay)).c_str(), 
                     UVM_MEDIUM);
            
            start_item(trans);
            finish_item(trans);
        }
        
        UVM_INFO(get_name(), "Slow ready sequence completed", UVM_LOW);
    }
};

// =============================================================================
// Intermittent Ready Sequence
// =============================================================================

class axis_intermittent_ready_sequence : public axis_base_sequence {
public:
    int num_transactions;
    
    UVM_OBJECT_UTILS(axis_intermittent_ready_sequence)
    
    axis_intermittent_ready_sequence(const std::string& name = "axis_intermittent_ready_sequence") 
        : axis_base_sequence(name), num_transactions(15) {}
    
    virtual void body() override {
        UVM_INFO(get_name(), "Starting intermittent ready sequence", UVM_LOW);
        
        for (int i = 0; i < num_transactions; i++) {
            axis_transaction* trans = new axis_transaction("intermittent_ready_control");
            
            // Alternate between ready and not ready
            if (i % 3 == 0) {
                trans->ready_delay = std::uniform_int_distribution<int>(3, 8)(rng); // Delay
            } else {
                trans->ready_delay = 0; // Immediate ready
            }
            
            UVM_INFO(get_name(), 
                     ("Transaction " + std::to_string(i+1) + 
                      " ready delay: " + std::to_string(trans->ready_delay)).c_str(), 
                     UVM_HIGH);
            
            start_item(trans);
            finish_item(trans);
        }
        
        UVM_INFO(get_name(), "Intermittent ready sequence completed", UVM_LOW);
    }
};

} // namespace uvm_switch_verification

#endif // AXIS_SEQUENCES_H