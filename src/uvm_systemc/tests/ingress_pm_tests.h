#ifndef INGRESS_PM_TESTS_H
#define INGRESS_PM_TESTS_H

#include <systemc.h>
#include <uvmsc/base/uvm_base.h>
#include <uvmsc/macros/uvm_macros.h>
#include <uvmsc/comps/uvm_comps.h>
#include <uvmsc/phasing/uvm_phasing.h>
#include "../common/uvm_types.h"
#include "../testbench/ingress_pm_testbench.h"
#include "../sequences/external_sequences.h"
#include "../sequences/axis_sequences.h"

namespace uvm_switch_verification {

using namespace uvm;

// =============================================================================
// Base Test Class
// =============================================================================

class ingress_pm_base_test : public uvm_test {
public:
    ingress_pm_env* env;
    ingress_pm_testbench* tb;
    ingress_pm_config* cfg;
    
    UVM_COMPONENT_UTILS(ingress_pm_base_test)
    
    ingress_pm_base_test(uvm_component_name name) : uvm_test(name) {}
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_test::build_phase(phase);
        
        UVM_INFO(get_name(), "Base test build phase", UVM_LOW);
        
        // Create configuration
        cfg = new ingress_pm_config("cfg");
        configure_test();
        
        // Set configuration in database
        uvm_config_db<ingress_pm_config*>::set(this, "*", "cfg", cfg);
        
        // Create environment
        env = ingress_pm_env::type_id::create("env", this);
        
        // Create testbench (SystemC module)
        tb = new ingress_pm_testbench("tb");
    }
    
    virtual void connect_phase(uvm_phase& phase) override {
        uvm_test::connect_phase(phase);
        
        // Connect testbench to environment
        tb->connect_agents(env);
    }
    
    virtual void end_of_elaboration_phase(uvm_phase& phase) override {
        uvm_test::end_of_elaboration_phase(phase);
        UVM_INFO(get_name(), "Test elaboration completed", UVM_LOW);
    }
    
protected:
    virtual void configure_test() {
        // Default configuration - override in derived classes
        cfg->enable_external_agent = true;
        cfg->enable_axis_agent = true;
        cfg->enable_axi_agent = false; // Simplified for now
        cfg->enable_scoreboard = true;
        
        cfg->port_id = 1;
        cfg->num_packets = 5;
        cfg->max_delay_cycles = 3;
        cfg->randomize_delays = false;
    }
};

// =============================================================================
// Basic Functionality Test
// =============================================================================

class basic_test : public ingress_pm_base_test {
public:
    UVM_COMPONENT_UTILS(basic_test)
    
    basic_test(uvm_component_name name) : ingress_pm_base_test(name) {}
    
    virtual void run_phase(uvm_phase& phase) override {
        UVM_INFO(get_name(), "=== Starting Basic Functionality Test ===", UVM_LOW);
        
        phase.raise_objection(this);
        
        // Start AXIS ready sequence (always ready)
        axis_always_ready_sequence* axis_seq = new axis_always_ready_sequence("axis_ready_seq");
        axis_seq->num_transactions = 10;
        axis_seq->start(env->axis_agt->sequencer);
        
        // Wait a bit for setup
        wait_cycles(10);
        
        // Start external packet sequence
        single_packet_sequence* ext_seq = new single_packet_sequence("single_pkt_seq");
        ext_seq->packet_size = 64;
        ext_seq->source_port = 1;
        ext_seq->dest_port = 2;
        ext_seq->start(env->ext_agent->sequencer);
        
        // Wait for completion
        wait_cycles(100);
        
        UVM_INFO(get_name(), "=== Basic Functionality Test Completed ===", UVM_LOW);
        phase.drop_objection(this);
    }
    
protected:
    virtual void configure_test() override {
        ingress_pm_base_test::configure_test();
        cfg->num_packets = 1;
    }
    
private:
    void wait_cycles(int cycles) {
        for (int i = 0; i < cycles; i++) {
            wait(tb->clk.posedge_event());
        }
    }
};

// =============================================================================
// Multiple Packets Test
// =============================================================================

class multiple_packets_test : public ingress_pm_base_test {
public:
    UVM_COMPONENT_UTILS(multiple_packets_test)
    
    multiple_packets_test(uvm_component_name name) : ingress_pm_base_test(name) {}
    
    virtual void run_phase(uvm_phase& phase) override {
        UVM_INFO(get_name(), "=== Starting Multiple Packets Test ===", UVM_LOW);
        
        phase.raise_objection(this);
        
        // Start AXIS ready sequence
        axis_always_ready_sequence* axis_seq = new axis_always_ready_sequence("axis_ready_seq");
        axis_seq->num_transactions = 20;
        axis_seq->start(env->axis_agt->sequencer);
        
        wait_cycles(10);
        
        // Start multiple packets sequence
        multiple_packets_sequence* ext_seq = new multiple_packets_sequence("multi_pkt_seq");
        ext_seq->num_packets = 10;
        ext_seq->min_size = 32;
        ext_seq->max_size = 128;
        ext_seq->randomize_size = true;
        ext_seq->randomize_delay = false; // Keep simple for now
        ext_seq->start(env->ext_agent->sequencer);
        
        // Wait for completion
        wait_cycles(500);
        
        UVM_INFO(get_name(), "=== Multiple Packets Test Completed ===", UVM_LOW);
        phase.drop_objection(this);
    }
    
protected:
    virtual void configure_test() override {
        ingress_pm_base_test::configure_test();
        cfg->num_packets = 10;
    }
    
private:
    void wait_cycles(int cycles) {
        for (int i = 0; i < cycles; i++) {
            wait(tb->clk.posedge_event());
        }
    }
};

// =============================================================================
// Backpressure Test
// =============================================================================

class backpressure_test : public ingress_pm_base_test {
public:
    UVM_COMPONENT_UTILS(backpressure_test)
    
    backpressure_test(uvm_component_name name) : ingress_pm_base_test(name) {}
    
    virtual void run_phase(uvm_phase& phase) override {
        UVM_INFO(get_name(), "=== Starting Backpressure Test ===", UVM_LOW);
        
        phase.raise_objection(this);
        
        // Start slow AXIS ready sequence (creates backpressure)
        axis_slow_ready_sequence* axis_seq = new axis_slow_ready_sequence("slow_ready_seq");
        axis_seq->num_transactions = 15;
        axis_seq->min_delay = 3;
        axis_seq->max_delay = 10;
        axis_seq->start(env->axis_agt->sequencer);
        
        wait_cycles(20);
        
        // Send burst of packets while AXIS is slow
        burst_packets_sequence* ext_seq = new burst_packets_sequence("burst_seq");
        ext_seq->burst_size = 5;
        ext_seq->packet_size = 96;
        ext_seq->start(env->ext_agent->sequencer);
        
        // Wait longer for backpressure handling
        wait_cycles(1000);
        
        UVM_INFO(get_name(), "=== Backpressure Test Completed ===", UVM_LOW);
        phase.drop_objection(this);
    }
    
private:
    void wait_cycles(int cycles) {
        for (int i = 0; i < cycles; i++) {
            wait(tb->clk.posedge_event());
        }
    }
};

// =============================================================================
// Mixed Packet Types Test
// =============================================================================

class mixed_types_test : public ingress_pm_base_test {
public:
    UVM_COMPONENT_UTILS(mixed_types_test)
    
    mixed_types_test(uvm_component_name name) : ingress_pm_base_test(name) {}
    
    virtual void run_phase(uvm_phase& phase) override {
        UVM_INFO(get_name(), "=== Starting Mixed Packet Types Test ===", UVM_LOW);
        
        phase.raise_objection(this);
        
        // Start intermittent AXIS ready sequence
        axis_intermittent_ready_sequence* axis_seq = new axis_intermittent_ready_sequence("intermittent_ready_seq");
        axis_seq->num_transactions = 10;
        axis_seq->start(env->axis_agt->sequencer);
        
        wait_cycles(15);
        
        // Send mixed packet types
        mixed_packet_types_sequence* ext_seq = new mixed_packet_types_sequence("mixed_types_seq");
        ext_seq->start(env->ext_agent->sequencer);
        
        wait_cycles(300);
        
        UVM_INFO(get_name(), "=== Mixed Packet Types Test Completed ===", UVM_LOW);
        phase.drop_objection(this);
    }
    
private:
    void wait_cycles(int cycles) {
        for (int i = 0; i < cycles; i++) {
            wait(tb->clk.posedge_event());
        }
    }
};

// =============================================================================
// Stress Test
// =============================================================================

class stress_test : public ingress_pm_base_test {
public:
    UVM_COMPONENT_UTILS(stress_test)
    
    stress_test(uvm_component_name name) : ingress_pm_base_test(name) {}
    
    virtual void run_phase(uvm_phase& phase) override {
        UVM_INFO(get_name(), "=== Starting Stress Test ===", UVM_LOW);
        
        phase.raise_objection(this);
        
        // Start random AXIS ready sequence
        axis_random_ready_sequence* axis_seq = new axis_random_ready_sequence("random_ready_seq");
        axis_seq->num_transactions = 50;
        axis_seq->max_delay = 5;
        axis_seq->start(env->axis_agt->sequencer);
        
        wait_cycles(20);
        
        // Start stress test sequence
        stress_test_sequence* ext_seq = new stress_test_sequence("stress_seq");
        ext_seq->total_packets = 50;
        ext_seq->max_burst_size = 8;
        ext_seq->start(env->ext_agent->sequencer);
        
        // Wait for completion (longer timeout for stress test)
        wait_cycles(2000);
        
        UVM_INFO(get_name(), "=== Stress Test Completed ===", UVM_LOW);
        phase.drop_objection(this);
    }
    
protected:
    virtual void configure_test() override {
        ingress_pm_base_test::configure_test();
        cfg->num_packets = 50;
        cfg->randomize_delays = true;
        cfg->max_delay_cycles = 5;
    }
    
private:
    void wait_cycles(int cycles) {
        for (int i = 0; i < cycles; i++) {
            wait(tb->clk.posedge_event());
        }
    }
};

} // namespace uvm_switch_verification

#endif // INGRESS_PM_TESTS_H