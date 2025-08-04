#include "../../systemc/port_manager/ingress_port_manager.h"

using namespace switch_internal_p2p;

// =============================================================================
// Stub implementations for testing
// =============================================================================

void IngressPortManager::external_receive_process() {
    while (true) {
        wait();
        
        if (rst_n.read() == false) {
            ext_ready.write(false);
            packets_received = 0;
            continue;
        }
        
        ext_ready.write(true);
        
        if (ext_valid.read() && ext_ready.read()) {
            packets_received++;
            buffer_count = (buffer_count < BUFFER_SIZE - 1) ? buffer_count + 1 : buffer_count;
        }
    }
}

void IngressPortManager::internal_transmit_process() {
    while (true) {
        wait();
        
        if (rst_n.read() == false) {
            axis_tvalid.write(false);
            packets_forwarded = 0;
            continue;
        }
        
        if (buffer_count > 0 && axis_tready.read()) {
            axis_tvalid.write(true);
            axis_tdata.write(0x12345678);  // Dummy data
            axis_tkeep.write(0xFF);
            axis_tuser.write(0xABCD);      // Dummy header
            axis_tlast.write(true);
            
            packets_forwarded++;
            buffer_count = (buffer_count > 0) ? buffer_count - 1 : 0;
            
            wait();
            axis_tvalid.write(false);
            axis_tlast.write(false);
        } else {
            axis_tvalid.write(false);
            axis_tlast.write(false);
        }
    }
}

void IngressPortManager::credit_management_process() {
    while (true) {
        wait();
        
        if (rst_n.read() == false) {
            total_credits_available = DEFAULT_CREDITS;
            continue;
        }
        
        if (credit_return_valid.read() && credit_return_ready.read()) {
            total_credits_available += 1;  // Simple increment
        }
    }
}

void IngressPortManager::axi_slave_process() {
    axi_slave_ready.write(true);
    
    if (axi_slave_valid.read()) {
        // Simple AXI slave response
        // In real implementation, would handle register reads/writes
    }
}