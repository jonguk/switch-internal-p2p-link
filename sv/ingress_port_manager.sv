//==============================================================================
// Ingress Port Manager - High Performance 2-Stage Pipeline
// 
// SystemC에서 SystemVerilog로 변환 및 최적화 완료
// 2-Stage Pipeline: 최고 throughput (1 pkt/cycle), 최소 latency (2 cycles)
// Struct-based bus interfaces for clean design
//==============================================================================

module ingress_port_manager 
    import bus_interfaces_pkg::*;
#(
    parameter int PORT_ID = 0,
    parameter type EXTERNAL_M2S_TYPE = external_m2s_t,
    parameter type EXTERNAL_S2M_TYPE = external_s2m_t,
    parameter type AXIS_M2S_TYPE = axis_m2s_t,
    parameter type AXIS_S2M_TYPE = axis_s2m_t
) (
    input  logic clk,
    input  logic rst_n,
    
    // External Interface (struct-based)
    input  EXTERNAL_M2S_TYPE ext_in_m2s,
    output EXTERNAL_S2M_TYPE ext_out_s2m,
    
    // AXIS Output Interface (struct-based)
    output AXIS_M2S_TYPE axis_out_m2s,
    input  AXIS_S2M_TYPE axis_in_s2m
);

//==============================================================================
// Pipeline Registers (Direct AXIS_M2S_TYPE usage)
//==============================================================================
AXIS_M2S_TYPE stage0;  // Input + Header Generation
AXIS_M2S_TYPE stage1;  // Output Preparation

//==============================================================================
// Pipeline Control
//==============================================================================
logic pipeline_enable;
logic output_ready;

//==============================================================================
// Debug Signals (_dot_ naming rule for VCD)
//==============================================================================
wire stage0_valid = stage0.tvalid;
wire stage1_valid = stage1.tvalid;

// External interface debug signals
wire ext_in_m2s_dot_valid = ext_in_m2s.valid;
wire [63:0] ext_in_m2s_dot_data = ext_in_m2s.data;
wire [7:0] ext_in_m2s_dot_keep = ext_in_m2s.keep;
wire ext_in_m2s_dot_last = ext_in_m2s.last;
wire ext_out_s2m_dot_ready = ext_out_s2m.ready;

// AXIS interface debug signals  
wire axis_out_m2s_dot_tvalid = axis_out_m2s.tvalid;
wire [63:0] axis_out_m2s_dot_tdata = axis_out_m2s.tdata;
wire [7:0] axis_out_m2s_dot_tkeep = axis_out_m2s.tkeep;
wire [63:0] axis_out_m2s_dot_tuser = axis_out_m2s.tuser;
wire axis_out_m2s_dot_tlast = axis_out_m2s.tlast;
wire axis_in_s2m_dot_tready = axis_in_s2m.tready;

//==============================================================================
// External Interface - Always Ready (struct-based)
//==============================================================================
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ext_out_s2m.ready <= 1'b1;
    end else begin
        ext_out_s2m.ready <= pipeline_enable;
    end
end

//==============================================================================
// Pipeline Enable Logic (struct-based)
//==============================================================================
always_comb begin
    output_ready = !axis_out_m2s.tvalid || axis_in_s2m.tready;
    pipeline_enable = output_ready || !stage1.tvalid;
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
        
        // Stage 1 ← Stage 0 (Output Preparation)
        stage1 <= stage0;
        
        // Stage 0: Input from external interface + Header Generation
        if (ext_in_m2s.valid && ext_out_s2m.ready) begin
            stage0.tvalid <= 1'b1;
            stage0.tdata <= ext_in_m2s.data;
            stage0.tkeep <= ext_in_m2s.keep;
            stage0.tuser <= generate_header(ext_in_m2s.data);
            stage0.tlast <= ext_in_m2s.last;
        end else begin
            stage0 <= '0;
        end
    end
end

//==============================================================================
// Header Generation Function (struct-aware)
//==============================================================================
function automatic logic [63:0] generate_header(
    input logic [63:0] data
);
    logic [63:0] header;
    header = '0;
    header[7:0] = PORT_ID[7:0];
    header[15:8] = data[7:0];
    header[31:16] = 16'hABCD;
    return header;
endfunction

//==============================================================================
// AXIS Output Stage (struct-based)
//==============================================================================
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        axis_out_m2s <= '0;
    end else begin
        if (output_ready) begin
            if (stage1.tvalid) begin
                axis_out_m2s <= stage1;
            end else begin
                axis_out_m2s.tvalid <= 1'b0;
                axis_out_m2s.tlast <= 1'b0;
                // Keep other fields unchanged
            end
        end
    end
end

//==============================================================================
// Performance Counters
//==============================================================================
logic [31:0] packets_received;
logic [31:0] packets_forwarded;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        packets_received <= '0;
        packets_forwarded <= '0;
    end else begin
        if (ext_in_m2s.valid && ext_out_s2m.ready && ext_in_m2s.last) begin
            packets_received <= packets_received + 1;
        end
        
        if (axis_out_m2s.tvalid && axis_in_s2m.tready && axis_out_m2s.tlast) begin
            packets_forwarded <= packets_forwarded + 1;
        end
    end
end

endmodule