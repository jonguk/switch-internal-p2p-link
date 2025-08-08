// =============================================================================
// Bus Interface Type Definitions
// Common struct definitions for AXIS and AXI interfaces
// =============================================================================

`ifndef BUS_INTERFACES_SV
`define BUS_INTERFACES_SV

package bus_interfaces_pkg;

    // =============================================================================
    // AXIS Interface Structures
    // =============================================================================
    
    // Default width parameters
    parameter int AXIS_DATA_WIDTH_DEFAULT = 64;
    parameter int AXIS_KEEP_WIDTH_DEFAULT = 8;  
    parameter int AXIS_USER_WIDTH_DEFAULT = 64;
    parameter int AXI_ADDR_WIDTH_DEFAULT = 32;
    parameter int AXI_DATA_WIDTH_DEFAULT = 32;
    
    // AXIS Interface structs (Master-to-Slave / Slave-to-Master)
    typedef struct packed {
        logic tvalid;
        logic [AXIS_DATA_WIDTH_DEFAULT-1:0] tdata;
        logic [AXIS_KEEP_WIDTH_DEFAULT-1:0] tkeep;
        logic [AXIS_USER_WIDTH_DEFAULT-1:0] tuser;
        logic tlast;
    } axis_m2s_t;
    
    typedef struct packed {
        logic tready;
    } axis_s2m_t;
    
    // External Interface structs (Master-to-Slave / Slave-to-Master)
    typedef struct packed {
        logic valid;
        logic [AXIS_DATA_WIDTH_DEFAULT-1:0] data;
        logic [AXIS_KEEP_WIDTH_DEFAULT-1:0] keep;
        logic last;
    } external_m2s_t;
    
    typedef struct packed {
        logic ready;
    } external_s2m_t;
    
    // =============================================================================
    // AXI Interface Structures  
    // =============================================================================
    
    // AXI Interface structs (Master-to-Slave / Slave-to-Master)
    typedef struct packed {
        logic valid;
        logic [AXI_ADDR_WIDTH_DEFAULT-1:0] addr;
        logic [AXI_DATA_WIDTH_DEFAULT-1:0] data;
    } axi_m2s_t;
    
    typedef struct packed {
        logic ready;
    } axi_s2m_t;
    
    // External interface structures already defined above via macros

endpackage

`endif // BUS_INTERFACES_SV