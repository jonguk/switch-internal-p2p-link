#ifndef INGRESS_PM_TESTBENCH_H
#define INGRESS_PM_TESTBENCH_H

#include <systemc.h>
#include <uvm>
#include "../common/uvm_types.h"
#include "../agents/external_agent.h"
#include "../agents/axis_agent.h"
#include "../scoreboards/ingress_pm_scoreboard.h"
#include "../../systemc/port_manager/ingress_port_manager.h"

namespace uvm_switch_verification {

using namespace uvm;
using namespace switch_internal_p2p;

// =============================================================================
// Ingress Port Manager Environment
// =============================================================================

class ingress_pm_env : public uvm_env {
public:
    // Agents
    external_agent* ext_agent;
    axis_agent* axis_agt;
    
    // Scoreboard
    ingress_pm_scoreboard* scoreboard;
    
    // Configuration
    ingress_pm_config* cfg;
    
    UVM_COMPONENT_UTILS(ingress_pm_env)
    
    ingress_pm_env(uvm_component_name name) : uvm_env(name) {}
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_env::build_phase(phase);
        
        UVM_INFO(get_name(), "Ingress PM Environment build phase", UVM_LOW);
        
        // Get configuration
        if (!uvm_config_db<ingress_pm_config*>::get(this, "", "cfg", cfg)) {
            UVM_FATAL(get_name(), "Configuration object not found!");
        }
        
        // Create agents
        if (cfg->enable_external_agent) {
            ext_agent = external_agent::type_id::create("ext_agent", this);
        }
        
        if (cfg->enable_axis_agent) {
            axis_agt = axis_agent::type_id::create("axis_agt", this);
        }
        
        // Create scoreboard
        if (cfg->enable_scoreboard) {
            scoreboard = ingress_pm_scoreboard::type_id::create("scoreboard", this);
        }
    }
    
    virtual void connect_phase(uvm_phase& phase) override {
        uvm_env::connect_phase(phase);
        
        UVM_INFO(get_name(), "Ingress PM Environment connect phase", UVM_LOW);
        
        // Connect monitors to scoreboard
        if (cfg->enable_scoreboard) {
            if (ext_agent && ext_agent->monitor) {
                ext_agent->monitor->analysis_port.connect(scoreboard->external_analysis_imp);
            }
            
            if (axis_agt && axis_agt->monitor) {
                axis_agt->monitor->analysis_port.connect(scoreboard->axis_analysis_imp);
            }
        }
    }
};

// =============================================================================
// Ingress Port Manager Testbench
// =============================================================================

SC_MODULE(ingress_pm_testbench) {
public:
    // Clock and reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // DUT
    IngressPortManager* dut;
    
    // Interface signals
    // External interface
    sc_signal<bool> ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_signal<bool> ext_last;
    sc_signal<bool> ext_ready;
    
    // AXIS interface
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // AXI interface (simplified)
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    
    // Credit interface
    sc_signal<bool> credit_return_valid;
    sc_signal<bool> credit_return_ready;
    
    // UVM Environment
    ingress_pm_env* env;
    
    SC_CTOR(ingress_pm_testbench) : clk("clk", 10, SC_NS) {
        // Create DUT
        dut = new IngressPortManager("dut");
        
        // Connect DUT
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // External interface
        dut->ext_valid(ext_valid);
        dut->ext_data(ext_data);
        dut->ext_keep(ext_keep);
        dut->ext_last(ext_last);
        dut->ext_ready(ext_ready);
        
        // AXIS interface
        dut->axis_tvalid(axis_tvalid);
        dut->axis_tdata(axis_tdata);
        dut->axis_tkeep(axis_tkeep);
        dut->axis_tuser(axis_tuser);
        dut->axis_tlast(axis_tlast);
        dut->axis_tready(axis_tready);
        
        // AXI interface
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Credit interface
        dut->credit_return_valid(credit_return_valid);
        dut->credit_return_ready(credit_return_ready);
        
        // Configure DUT
        dut->set_port_id(1);
        
        // Initialize signals
        SC_CTHREAD(reset_process, clk.pos());
        SC_CTHREAD(axi_slave_process, clk.pos());
    }
    
    void connect_agents(ingress_pm_env* environment) {
        env = environment;
        
        if (env->ext_agent) {
            // Connect external agent
            if (env->ext_agent->driver) {
                env->ext_agent->driver->clk(clk);
                env->ext_agent->driver->rst_n(rst_n);
                env->ext_agent->driver->ext_valid(ext_valid);
                env->ext_agent->driver->ext_data(ext_data);
                env->ext_agent->driver->ext_keep(ext_keep);
                env->ext_agent->driver->ext_last(ext_last);
                env->ext_agent->driver->ext_ready(ext_ready);
            }
            
            if (env->ext_agent->monitor) {
                env->ext_agent->monitor->clk(clk);
                env->ext_agent->monitor->rst_n(rst_n);
                env->ext_agent->monitor->ext_valid(ext_valid);
                env->ext_agent->monitor->ext_data(ext_data);
                env->ext_agent->monitor->ext_keep(ext_keep);
                env->ext_agent->monitor->ext_last(ext_last);
                env->ext_agent->monitor->ext_ready(ext_ready);
            }
        }
        
        if (env->axis_agt) {
            // Connect AXIS agent
            if (env->axis_agt->driver) {
                env->axis_agt->driver->clk(clk);
                env->axis_agt->driver->rst_n(rst_n);
                env->axis_agt->driver->axis_tvalid(axis_tvalid);
                env->axis_agt->driver->axis_tdata(axis_tdata);
                env->axis_agt->driver->axis_tkeep(axis_tkeep);
                env->axis_agt->driver->axis_tuser(axis_tuser);
                env->axis_agt->driver->axis_tlast(axis_tlast);
                env->axis_agt->driver->axis_tready(axis_tready);
            }
            
            if (env->axis_agt->monitor) {
                env->axis_agt->monitor->clk(clk);
                env->axis_agt->monitor->rst_n(rst_n);
                env->axis_agt->monitor->axis_tvalid(axis_tvalid);
                env->axis_agt->monitor->axis_tdata(axis_tdata);
                env->axis_agt->monitor->axis_tkeep(axis_tkeep);
                env->axis_agt->monitor->axis_tuser(axis_tuser);
                env->axis_agt->monitor->axis_tlast(axis_tlast);
                env->axis_agt->monitor->axis_tready(axis_tready);
            }
        }
    }
    
private:
    void reset_process() {
        rst_n.write(false);
        wait(5);
        rst_n.write(true);
        wait();
    }
    
    void axi_slave_process() {
        // Simple AXI slave behavior
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
        axi_slave_ready.write(true);
        credit_return_valid.write(false);
        credit_return_ready.write(true);
        
        wait();
        
        while (true) {
            wait();
            // Could implement more sophisticated AXI behavior here
        }
    }
};

} // namespace uvm_switch_verification

#endif // INGRESS_PM_TESTBENCH_H