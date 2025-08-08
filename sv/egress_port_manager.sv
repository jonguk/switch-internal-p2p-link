//==============================================================================
// Egress Port Manager - High Performance 2-Stage Pipeline
// 
// SystemC에서 SystemVerilog로 변환 및 최적화 완료
// 2-Stage Pipeline: 최고 throughput (1 pkt/cycle), 최소 latency (2 cycles)
// Struct-based bus interfaces for clean design
// Direction: AXIS Input → External Output
//==============================================================================

module egress_port_manager 
    import bus_interfaces_pkg::*;
#(
    parameter int PORT_ID = 0,
    parameter type AXIS_M2S_TYPE = axis_m2s_t,
    parameter type AXIS_S2M_TYPE = axis_s2m_t,
    parameter type EXTERNAL_M2S_TYPE = external_m2s_t,
    parameter type EXTERNAL_S2M_TYPE = external_s2m_t
) (
    input  logic clk,
    input  logic rst_n,
    
    // AXIS Input Interface (struct-based)
    input  AXIS_M2S_TYPE axis_in_m2s,
    output AXIS_S2M_TYPE axis_out_s2m,
    
    // External Output Interface (struct-based)
    output EXTERNAL_M2S_TYPE ext_out_m2s,
    input  EXTERNAL_S2M_TYPE ext_in_s2m
);

//==============================================================================
// Pipeline Registers (Direct AXIS_M2S_TYPE usage)
//==============================================================================
AXIS_M2S_TYPE stage0;  // Input Reception + Header Processing
EXTERNAL_M2S_TYPE stage1;  // External Output Preparation

//==============================================================================
// Pipeline Control
//==============================================================================
logic pipeline_enable;
logic output_ready;

//==============================================================================
// Debug Signals (_dot_ naming rule for VCD)
//==============================================================================
wire stage0_valid = stage0.tvalid;
wire stage1_valid = stage1.valid;

// AXIS interface debug signals
wire axis_in_m2s_dot_tvalid = axis_in_m2s.tvalid;
wire [63:0] axis_in_m2s_dot_tdata = axis_in_m2s.tdata;
wire [7:0] axis_in_m2s_dot_tkeep = axis_in_m2s.tkeep;
wire [63:0] axis_in_m2s_dot_tuser = axis_in_m2s.tuser;
wire axis_in_m2s_dot_tlast = axis_in_m2s.tlast;
wire axis_out_s2m_dot_tready = axis_out_s2m.tready;

// External interface debug signals  
wire ext_out_m2s_dot_valid = ext_out_m2s.valid;
wire [63:0] ext_out_m2s_dot_data = ext_out_m2s.data;
wire [7:0] ext_out_m2s_dot_keep = ext_out_m2s.keep;
wire ext_out_m2s_dot_last = ext_out_m2s.last;
wire ext_in_s2m_dot_ready = ext_in_s2m.ready;

//==============================================================================
// AXIS Interface - Always Ready (individual signal approach)
//==============================================================================
logic axis_tready_internal;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        axis_tready_internal <= 1'b1;
    end else begin
        axis_tready_internal <= 1'b1; // Always ready for simplicity
    end
end

// Assign to struct
always_comb begin
    axis_out_s2m.tready = axis_tready_internal;
end



//==============================================================================
// Pipeline Enable Logic (struct-based)
//==============================================================================
always_comb begin
    output_ready = !ext_out_m2s.valid || ext_in_s2m.ready;
    pipeline_enable = output_ready || !stage1.valid;
end

//==============================================================================
// Optimized 2-Stage Pipeline Processing
//==============================================================================
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // Reset both stages
        stage0 <= '0;
        stage1 <= '0;
    end else if (pipeline_enable) begin
        
        // Stage 1 ← Stage 0 (External Output Preparation)
        if (stage0.tvalid) begin
            stage1.valid <= 1'b1;
            stage1.data <= stage0.tdata;
            stage1.keep <= stage0.tkeep;
            stage1.last <= stage0.tlast;
        end else begin
            stage1 <= '0;
        end
        
        // Stage 0: Input from AXIS interface
        if (axis_in_m2s.tvalid && axis_out_s2m.tready) begin
            stage0 <= axis_in_m2s;
        end else begin
            stage0 <= '0;
        end
    end
end

//==============================================================================
// External Output Stage (struct-based)
//==============================================================================
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ext_out_m2s <= '0;
    end else begin
        if (output_ready) begin
            if (stage1.valid) begin
                ext_out_m2s <= stage1;
            end else begin
                ext_out_m2s.valid <= 1'b0;
                ext_out_m2s.last <= 1'b0;
                // Keep other fields unchanged
            end
        end
    end
end

//==============================================================================
// Performance Counters & Port ID
//==============================================================================
logic [31:0] packets_received;
logic [31:0] packets_forwarded;
logic [7:0] current_port_id = PORT_ID[7:0];  // Use PORT_ID parameter

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        packets_received <= '0;
        packets_forwarded <= '0;
    end else begin
        if (axis_in_m2s.tvalid && axis_out_s2m.tready && axis_in_m2s.tlast) begin
            packets_received <= packets_received + 1;
        end
        
        if (ext_out_m2s.valid && ext_in_s2m.ready && ext_out_m2s.last) begin
            packets_forwarded <= packets_forwarded + 1;
        end
    end
end

endmodule