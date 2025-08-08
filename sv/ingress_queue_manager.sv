// =============================================================================
// Ingress Queue Manager - SystemVerilog Implementation
// Converted from SystemC to SystemVerilog with M2S/S2M interfaces
// =============================================================================

// bus_interfaces.sv will be included during compilation

module ingress_queue_manager
    import bus_interfaces_pkg::*;
#(
    // Interface type parameters (Master-to-Slave / Slave-to-Master)
    parameter type AXIS_M2S_TYPE = axis_m2s_t,
    parameter type AXIS_S2M_TYPE = axis_s2m_t,
    parameter type AXI_M2S_TYPE = axi_m2s_t,
    parameter type AXI_S2M_TYPE = axi_s2m_t,
    
    // Configuration parameters
    parameter AXIS_DATA_WIDTH = 64,
    parameter AXIS_KEEP_WIDTH = 8,
    parameter AXIS_USER_WIDTH = 64,
    parameter AXIS_DEST_WIDTH = 8,
    parameter MAX_QUEUES_PER_PORT = 8,
    parameter QUEUE_DEPTH = 256,
    parameter MAX_PACKET_SIZE = 1500,
    parameter DEFAULT_CREDITS = 64,
    parameter MAX_CREDITS_PER_QUEUE = 1024,
    parameter MAX_GLOBAL_PORTS = 4096,
    parameter BUFFER_SIZE = 512,
    parameter BUFFER_ADDR_WIDTH = 9
) (
    // Clock and Reset
    input  logic clk,
    input  logic rst_n,
    
    // AXIS Slave Interface (from Ingress Port Manager)
    input  AXIS_M2S_TYPE axis_in_m2s,   // Ingress Port Manager → Queue Manager
    output AXIS_S2M_TYPE axis_in_s2m,   // Queue Manager → Ingress Port Manager
    
    // Internal AXIS Master Interface (to Router/Egress Queue Manager)
    output AXIS_M2S_TYPE internal_out_m2s,  // Queue Manager → Router
    input  AXIS_S2M_TYPE internal_out_s2m,  // Router → Queue Manager
    
    // AXI Master Interface (Queue Manager initiates transactions)
    output AXI_M2S_TYPE axi_out_m2s,    // Queue Manager → AXI Slave
    input  AXI_S2M_TYPE axi_out_s2m,    // AXI Slave → Queue Manager
    
    // AXI Slave Interface (Queue Manager receives transactions)
    input  AXI_M2S_TYPE axi_in_m2s,     // AXI Master → Queue Manager
    output AXI_S2M_TYPE axi_in_s2m,     // Queue Manager → AXI Master
    
    // Configuration
    input  logic [7:0] port_id
);

    // =============================================================================
    // Signal Aliases for Backward Compatibility
    // =============================================================================
    
    // AXIS input signals (M2S: Ingress Port Manager → Queue Manager)
    wire axis_tvalid = axis_in_m2s.tvalid;
    wire [AXIS_DATA_WIDTH-1:0] axis_tdata = axis_in_m2s.tdata;
    wire [AXIS_KEEP_WIDTH-1:0] axis_tkeep = axis_in_m2s.tkeep;
    wire [AXIS_USER_WIDTH-1:0] axis_tuser = axis_in_m2s.tuser;
    wire axis_tlast = axis_in_m2s.tlast;
    
    // AXIS output signals (S2M: Queue Manager → Ingress Port Manager)
    logic axis_tready;
    assign axis_in_s2m.tready = axis_tready;
    
    // Internal AXIS output signals (M2S: Queue Manager → Router)
    logic internal_tvalid;
    logic [AXIS_DATA_WIDTH-1:0] internal_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] internal_tkeep;
    logic [AXIS_USER_WIDTH-1:0] internal_tuser;
    logic [AXIS_DEST_WIDTH-1:0] internal_tdest;
    logic internal_tlast;
    assign internal_out_m2s.tvalid = internal_tvalid;
    assign internal_out_m2s.tdata = internal_tdata;
    assign internal_out_m2s.tkeep = internal_tkeep;
    assign internal_out_m2s.tuser = internal_tuser;
    assign internal_out_m2s.tlast = internal_tlast;
    
    // Internal AXIS input signals (S2M: Router → Queue Manager)
    wire internal_tready = internal_out_s2m.tready;
    
    // =============================================================================
    // VCD 디버깅을 위한 개별 신호 분해 (Struct Flatten 방지)
    // =============================================================================
    
    // AXIS Input M2S 신호 분해 (for VCD debugging - _dot_ naming rule)
    wire axis_in_m2s_dot_tvalid = axis_in_m2s.tvalid;
    wire [AXIS_DATA_WIDTH-1:0] axis_in_m2s_dot_tdata = axis_in_m2s.tdata;
    wire [AXIS_KEEP_WIDTH-1:0] axis_in_m2s_dot_tkeep = axis_in_m2s.tkeep;
    wire [AXIS_USER_WIDTH-1:0] axis_in_m2s_dot_tuser = axis_in_m2s.tuser;
    wire axis_in_m2s_dot_tlast = axis_in_m2s.tlast;
    
    // AXIS Input S2M 신호 분해 (for VCD debugging - _dot_ naming rule)
    wire axis_in_s2m_dot_tready = axis_in_s2m.tready;
    
    // Internal AXIS Output M2S 신호 분해 (for VCD debugging - _dot_ naming rule)
    wire internal_out_m2s_dot_tvalid = internal_out_m2s.tvalid;
    wire [AXIS_DATA_WIDTH-1:0] internal_out_m2s_dot_tdata = internal_out_m2s.tdata;
    wire [AXIS_KEEP_WIDTH-1:0] internal_out_m2s_dot_tkeep = internal_out_m2s.tkeep;
    wire [AXIS_USER_WIDTH-1:0] internal_out_m2s_dot_tuser = internal_out_m2s.tuser;
    wire internal_out_m2s_dot_tlast = internal_out_m2s.tlast;
    
    // Internal AXIS Output S2M 신호 분해 (for VCD debugging - _dot_ naming rule)
    wire internal_out_s2m_dot_tready = internal_out_s2m.tready;
    
    // AXI Input M2S 신호 분해 (for VCD debugging - _dot_ naming rule)
    wire axi_in_m2s_dot_valid = axi_in_m2s.valid;
    wire [31:0] axi_in_m2s_dot_addr = axi_in_m2s.addr;
    wire [31:0] axi_in_m2s_dot_data = axi_in_m2s.data;
    
    // AXI Input S2M 신호 분해 (for VCD debugging - _dot_ naming rule)
    wire axi_in_s2m_dot_ready = axi_in_s2m.ready;
    
    // AXI Output M2S 신호 분해 (for VCD debugging - _dot_ naming rule)
    wire axi_out_m2s_dot_valid = axi_out_m2s.valid;
    wire [31:0] axi_out_m2s_dot_addr = axi_out_m2s.addr;
    wire [31:0] axi_out_m2s_dot_data = axi_out_m2s.data;
    
    // AXI Output S2M 신호 분해 (for VCD debugging - _dot_ naming rule)
    wire axi_out_s2m_dot_ready = axi_out_s2m.ready;
    
    // FSM 상태 디버깅을 위한 별칭 (for VCD debugging)
    wire [1:0] fsm_axis_rx_state = axis_rx_state;
    wire [1:0] fsm_processing_state = processing_state;
    wire [1:0] fsm_internal_tx_state = internal_tx_state;
    
    // FSM 상태 이름 (디버깅용)
    wire fsm_rx_idle = (axis_rx_state == IDLE);
    wire fsm_rx_receiving = (axis_rx_state == RECEIVING);
    wire fsm_rx_processing = (axis_rx_state == PROCESSING);
    wire fsm_tx_idle = (internal_tx_state == IDLE);
    wire fsm_tx_transmitting = (internal_tx_state == TRANSMITTING);
    
    // 패킷 처리 상태 (디버깅용)
    wire packet_assembly_active = packet_in_assembly;
    wire tx_active = tx_packet_valid;
    
    // =============================================================================
    // Internal Types and Constants
    // =============================================================================
    
    // FSM States
    parameter IDLE = 2'b00;
    parameter RECEIVING = 2'b01;
    parameter PROCESSING = 2'b10;
    parameter TRANSMITTING = 2'b11;
    
    // Packet Types
    parameter PKT_DATA = 2'b00;
    parameter PKT_CREDIT = 2'b01;
    parameter PKT_CONTROL = 2'b10;
    
    // =============================================================================  
    // Internal Signals and Registers
    // =============================================================================
    
    // FSM states
    logic [1:0] axis_rx_state;
    logic [1:0] processing_state;
    logic [1:0] internal_tx_state;
    
    // Packet assembly
    logic packet_in_assembly;
    logic [15:0] current_packet_size;
    /* verilator tracing_off */
    logic [MAX_PACKET_SIZE*8-1:0] current_packet_buffer;
    /* verilator tracing_on */
    logic [AXIS_USER_WIDTH-1:0] current_header;
    
    // Queue management (거대한 배열들 - VCD 트레이싱 비활성화)
    /* verilator tracing_off */
    logic [MAX_QUEUES_PER_PORT-1:0][QUEUE_DEPTH-1:0][MAX_PACKET_SIZE*8-1:0] packet_queues_data;
    logic [MAX_QUEUES_PER_PORT-1:0][QUEUE_DEPTH-1:0][15:0] packet_queues_size;
    logic [MAX_QUEUES_PER_PORT-1:0][QUEUE_DEPTH-1:0][AXIS_USER_WIDTH-1:0] packet_queues_header;
    logic [MAX_QUEUES_PER_PORT-1:0][QUEUE_DEPTH-1:0] packet_queues_valid;
    logic [MAX_QUEUES_PER_PORT-1:0][$clog2(QUEUE_DEPTH)-1:0] queue_head;
    logic [MAX_QUEUES_PER_PORT-1:0][$clog2(QUEUE_DEPTH)-1:0] queue_tail;
    logic [MAX_QUEUES_PER_PORT-1:0][$clog2(QUEUE_DEPTH+1)-1:0] queue_count;
    
    // Credits
    logic [MAX_QUEUES_PER_PORT-1:0][15:0] available_credits;
    
    // Global to Local mapping
    logic [MAX_GLOBAL_PORTS-1:0][7:0] global_to_local_lookup;
    /* verilator tracing_on */
    logic lookup_table_initialized;
    
    // Statistics
    logic [63:0] total_packets_processed;
    logic [63:0] total_credits_added;
    
    // Internal transmission
    /* verilator tracing_off */
    logic [MAX_PACKET_SIZE*8-1:0] tx_packet_data;
    /* verilator tracing_on */
    logic [15:0] tx_packet_size;
    logic [AXIS_USER_WIDTH-1:0] tx_packet_header;
    logic tx_packet_valid;
    logic [15:0] tx_beat_count;
    logic [15:0] tx_total_beats;
    
    // Task output variables
    logic beat_tvalid;
    logic [AXIS_DATA_WIDTH-1:0] beat_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] beat_tkeep;
    logic [AXIS_USER_WIDTH-1:0] beat_tuser;
    
    integer i, j;
    
    // =============================================================================
    // AXIS Receive Process (FSM)
    // =============================================================================
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            axis_rx_state <= IDLE;
            axis_tready <= 1'b1;
            packet_in_assembly <= 1'b0;
            current_packet_size <= 16'h0;
            current_packet_buffer <= {MAX_PACKET_SIZE*8{1'b0}};
            current_header <= {AXIS_USER_WIDTH{1'b0}};
        end else begin
            case (axis_rx_state)
                IDLE: begin
                    axis_tready <= 1'b1;  // Always ready
                    
                    if (axis_tvalid && axis_tready) begin
                        // Start packet assembly
                        packet_in_assembly <= 1'b1;
                        current_packet_size <= 16'h0;
                        current_packet_buffer <= {MAX_PACKET_SIZE*8{1'b0}};
                        current_header <= axis_tuser;
                        
                        // Extract valid bytes from first beat
                        for (i = 0; i < AXIS_KEEP_WIDTH; i = i + 1) begin
                            if (axis_tkeep[i] && (current_packet_size + i < MAX_PACKET_SIZE)) begin
                                current_packet_buffer[((current_packet_size + i + 1) * 8 - 1) -: 8] <= 
                                    axis_tdata[(i * 8) +: 8];
                            end
                        end
                        current_packet_size <= count_keep_bits(axis_tkeep);
                        
                        if (axis_tlast) begin
                            axis_rx_state <= PROCESSING;
                        end else begin
                            axis_rx_state <= RECEIVING;
                        end
                    end
                end
                
                RECEIVING: begin
                    if (axis_tvalid && axis_tready) begin
                        // Extract valid bytes based on keep signal
                        for (i = 0; i < AXIS_KEEP_WIDTH; i = i + 1) begin
                            if (axis_tkeep[i] && (current_packet_size + i < MAX_PACKET_SIZE)) begin
                                current_packet_buffer[((current_packet_size + i + 1) * 8 - 1) -: 8] <= 
                                    axis_tdata[(i * 8) +: 8];
                            end
                        end
                        
                        current_packet_size <= current_packet_size + count_keep_bits(axis_tkeep);
                        
                        if (axis_tlast) begin
                            axis_rx_state <= PROCESSING;
                        end
                    end
                end
                
                PROCESSING: begin
                    // Process received packet - enqueue to appropriate queue
                    process_received_packet();
                    
                    // Reset for next packet
                    packet_in_assembly <= 1'b0;
                    axis_rx_state <= IDLE;
                end
                
                default: axis_rx_state <= IDLE;
            endcase
        end
    end
    
    // =============================================================================
    // Packet Processing and Queue Management
    // =============================================================================
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            processing_state <= IDLE;
            
            // Reset all queues
            for (i = 0; i < MAX_QUEUES_PER_PORT; i = i + 1) begin
                queue_head[i] <= 0;
                queue_tail[i] <= 0;
                queue_count[i] <= 0;
                available_credits[i] <= DEFAULT_CREDITS;
                for (j = 0; j < QUEUE_DEPTH; j = j + 1) begin
                    packet_queues_valid[i][j] <= 1'b0;
                end
            end
            
            total_packets_processed <= 64'h0;
            total_credits_added <= 64'h0;
            lookup_table_initialized <= 1'b0;
        end else begin
            // Initialize lookup table
            if (!lookup_table_initialized) begin
                initialize_lookup_table();
                lookup_table_initialized <= 1'b1;
            end
            
            // Continuous packet dequeuing for internal transmission
            for (i = 0; i < MAX_QUEUES_PER_PORT; i = i + 1) begin
                if (queue_count[i] > 0 && !tx_packet_valid) begin
                    // Dequeue packet for transmission
                    dequeue_packet(i);
                    break;  // Process one packet per cycle
                end
            end
        end
    end
    
    // =============================================================================
    // Internal Transmission Process (FSM)
    // =============================================================================
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            internal_tx_state <= IDLE;
            internal_tvalid <= 1'b0;
            internal_tdata <= {AXIS_DATA_WIDTH{1'b0}};
            internal_tkeep <= {AXIS_KEEP_WIDTH{1'b0}};
            internal_tuser <= {AXIS_USER_WIDTH{1'b0}};
            internal_tlast <= 1'b0;
            tx_packet_valid <= 1'b0;
            tx_beat_count <= 16'h0;
            tx_total_beats <= 16'h0;
        end else begin
            case (internal_tx_state)
                IDLE: begin
                    internal_tvalid <= 1'b0;
                    internal_tlast <= 1'b0;
                    
                    if (tx_packet_valid) begin
                        // Calculate total beats needed
                        tx_total_beats <= (tx_packet_size + AXIS_KEEP_WIDTH - 1) / AXIS_KEEP_WIDTH;
                        tx_beat_count <= 16'h0;
                        internal_tx_state <= TRANSMITTING;
                    end
                end
                
                TRANSMITTING: begin
                    if (internal_tready || !internal_tvalid) begin
                        if (tx_beat_count < tx_total_beats) begin
                            // Call task to get beat data
                            send_internal_beat(tx_beat_count, beat_tvalid, beat_tdata, beat_tkeep, beat_tuser);
                            
                            // Assign to internal signals using non-blocking
                            internal_tvalid <= beat_tvalid;
                            internal_tdata <= beat_tdata;
                            internal_tkeep <= beat_tkeep;
                            internal_tuser <= beat_tuser;
                            
                            tx_beat_count <= tx_beat_count + 1;
                            
                            if (tx_beat_count == tx_total_beats - 1) begin
                                internal_tlast <= 1'b1;
                                internal_tx_state <= IDLE;
                                tx_packet_valid <= 1'b0;
                            end
                        end
                    end
                end
                
                default: internal_tx_state <= IDLE;
            endcase
        end
    end
    
    // =============================================================================
    // AXI Slave Process (Configuration/Monitoring)
    // =============================================================================
    
    always @(*) begin
        if (axi_in_m2s.valid) begin
            axi_in_s2m.ready = 1'b1;
            
            // Simple register map (read-only for now)
            case (axi_in_m2s.addr[7:0])
                8'h00: begin  // Statistics - packets processed
                    // Read-only register
                end
                8'h04: begin  // Statistics - credits added
                    // Read-only register  
                end
                8'h08: begin  // Queue utilization
                    // Read-only register
                end
                default: begin
                    // Unknown register
                end
            endcase
        end else begin
            axi_in_s2m.ready = 1'b0;
        end
    end
    
    // AXI Master interface (unused for now)
    assign axi_out_m2s.valid = 1'b0;
    assign axi_out_m2s.addr = 32'h0;
    assign axi_out_m2s.data = 32'h0;
    
    // =============================================================================
    // Helper Functions and Tasks
    // =============================================================================
    
    // Count valid bytes in keep signal
    function automatic [15:0] count_keep_bits;
        input [AXIS_KEEP_WIDTH-1:0] keep;
        integer k;
        begin
            count_keep_bits = 16'h0;
            for (k = 0; k < AXIS_KEEP_WIDTH; k = k + 1) begin
                if (keep[k]) count_keep_bits = count_keep_bits + 16'h1;
            end
        end
    endfunction
    
    // Process received packet
    task process_received_packet;
        logic [7:0] queue_id;
        logic [7:0] local_dest_port;
        logic [11:0] global_dest_port;
        begin
            // Extract header information
            global_dest_port = current_header[11:0];  // Assume dest port in lower 12 bits
            queue_id = current_header[19:16];         // Assume queue ID in bits 19:16
            
            // Global to local port mapping
            local_dest_port = global_to_local_lookup[global_dest_port];
            
            // Validate queue ID
            if (queue_id >= MAX_QUEUES_PER_PORT) begin
                queue_id = 0;  // Fallback to queue 0
            end
            
            // Enqueue packet if queue not full
            if (queue_count[queue_id] < QUEUE_DEPTH) begin
                enqueue_packet(queue_id, current_packet_buffer, current_packet_size, current_header);
                total_packets_processed <= total_packets_processed + 1;
            end
        end
    endtask
    
    // Enqueue packet to specified queue
    task enqueue_packet;
        input [7:0] queue_id;
        input [MAX_PACKET_SIZE*8-1:0] packet_data;
        input [15:0] packet_size;
        input [AXIS_USER_WIDTH-1:0] packet_header;
        logic [$clog2(QUEUE_DEPTH)-1:0] tail_idx;
        begin
            tail_idx = queue_tail[queue_id];
            packet_queues_data[queue_id][tail_idx] = packet_data;
            packet_queues_size[queue_id][tail_idx] = packet_size;
            packet_queues_header[queue_id][tail_idx] = packet_header;
            packet_queues_valid[queue_id][tail_idx] = 1'b1;
            
            queue_tail[queue_id] = (queue_tail[queue_id] + 1) % QUEUE_DEPTH;
            queue_count[queue_id] = queue_count[queue_id] + 1;
        end
    endtask
    
    // Dequeue packet from specified queue
    task dequeue_packet;
        input [7:0] queue_id;
        logic [$clog2(QUEUE_DEPTH)-1:0] head_idx;
        begin
            head_idx = queue_head[queue_id];
            tx_packet_data = packet_queues_data[queue_id][head_idx];
            tx_packet_size = packet_queues_size[queue_id][head_idx];
            tx_packet_header = packet_queues_header[queue_id][head_idx];
            tx_packet_valid = 1'b1;
            
            packet_queues_valid[queue_id][head_idx] = 1'b0;
            queue_head[queue_id] = (queue_head[queue_id] + 1) % QUEUE_DEPTH;
            queue_count[queue_id] = queue_count[queue_id] - 1;
        end
    endtask
    
    // Send internal AXIS beat - 모든 신호를 직접 FSM에서 설정
    task send_internal_beat;
        input [15:0] beat_index;
        output logic internal_beat_tvalid;
        output logic [AXIS_DATA_WIDTH-1:0] internal_beat_tdata;
        output logic [AXIS_KEEP_WIDTH-1:0] internal_beat_tkeep;
        output logic [AXIS_USER_WIDTH-1:0] internal_beat_tuser;
        logic [15:0] byte_offset;
        logic [15:0] bytes_remaining;
        logic [15:0] bytes_in_beat;
        integer b;
        begin
            byte_offset = beat_index * AXIS_KEEP_WIDTH;
            bytes_remaining = tx_packet_size - byte_offset;
            bytes_in_beat = (bytes_remaining > AXIS_KEEP_WIDTH) ? AXIS_KEEP_WIDTH : bytes_remaining;
            
            internal_beat_tvalid = 1'b1;
            internal_beat_tkeep = {AXIS_KEEP_WIDTH{1'b0}};
            internal_beat_tdata = {AXIS_DATA_WIDTH{1'b0}};
            
            // Set header on first beat
            if (beat_index == 0) begin
                internal_beat_tuser = tx_packet_header;
            end else begin
                internal_beat_tuser = {AXIS_USER_WIDTH{1'b0}};
            end
            
            // Pack data and keep signals
            for (b = 0; b < AXIS_KEEP_WIDTH; b = b + 1) begin
                if (b < bytes_in_beat) begin
                    internal_beat_tkeep[b] = 1'b1;
                    internal_beat_tdata[(b * 8) +: 8] = tx_packet_data[((byte_offset + b + 1) * 8 - 1) -: 8];
                end
            end
        end
    endtask
    
    // Initialize global to local lookup table
    task initialize_lookup_table;
        begin
            // Default 1:1 mapping for first few ports
            for (i = 0; i < MAX_GLOBAL_PORTS; i = i + 1) begin
                if (i < 8) begin
                    global_to_local_lookup[i] = i[7:0];
                end else begin
                    global_to_local_lookup[i] = 8'h0;  // Default to port 0
                end
            end
        end
    endtask
    
    // Additional debug signals (non-duplicate)
    wire [7:0] current_port_id_dot_debug = port_id;
    wire [31:0] total_packets_processed_dot_debug = total_packets_processed;
    wire [31:0] total_credits_added_dot_debug = total_credits_added;

endmodule