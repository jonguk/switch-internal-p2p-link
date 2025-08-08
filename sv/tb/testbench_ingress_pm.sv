//==============================================================================
// Testbench for Ingress Port Manager
// Tests packet injection, processing, and AXIS protocol compliance
//==============================================================================

`timescale 1ns/1ps

module testbench_ingress_pm;

//==============================================================================
// Parameters
//==============================================================================
parameter AXIS_DATA_WIDTH = 64;
parameter AXIS_KEEP_WIDTH = 8;
parameter AXIS_USER_WIDTH = 64;
parameter BUFFER_SIZE = 16;
parameter MAX_PACKET_SIZE = 256;
parameter EXTERNAL_HEADER_SIZE = 9;
parameter DEFAULT_CREDITS = 16;

parameter CLK_PERIOD = 10; // 100MHz

//==============================================================================
// Signals
//==============================================================================

// Clock and Reset
logic clk;
logic rst_n;

// External Interface (input to DUT)
logic                      ext_valid;
logic [AXIS_DATA_WIDTH-1:0] ext_data;
logic [AXIS_KEEP_WIDTH-1:0] ext_keep;
logic                      ext_last;
logic                      ext_ready;

// AXIS Master Interface (output from DUT)
logic                      axis_tvalid;
logic [AXIS_DATA_WIDTH-1:0] axis_tdata;
logic [AXIS_KEEP_WIDTH-1:0] axis_tkeep;
logic [AXIS_USER_WIDTH-1:0] axis_tuser;
logic                      axis_tlast;
logic                      axis_tready;

// AXI Interface (simplified)
logic        axi_master_valid;
logic [31:0] axi_master_addr;
logic [31:0] axi_master_data;
logic        axi_master_ready;

logic        axi_slave_valid;
logic [31:0] axi_slave_addr;
logic [31:0] axi_slave_data;
logic        axi_slave_ready;

// Credit Return Interface
logic credit_return_valid;
logic credit_return_ready;

// Configuration
logic [7:0] port_id;

//==============================================================================
// Test Variables
//==============================================================================
integer test_step;
integer packet_count;
integer error_count;
logic [MAX_PACKET_SIZE*8-1:0] test_packet;
logic [15:0] test_packet_size;

//==============================================================================
// DUT Instantiation
//==============================================================================
ingress_port_manager #(
    .AXIS_DATA_WIDTH(AXIS_DATA_WIDTH),
    .AXIS_KEEP_WIDTH(AXIS_KEEP_WIDTH),
    .AXIS_USER_WIDTH(AXIS_USER_WIDTH),
    .BUFFER_SIZE(BUFFER_SIZE),
    .MAX_PACKET_SIZE(MAX_PACKET_SIZE),
    .EXTERNAL_HEADER_SIZE(EXTERNAL_HEADER_SIZE),
    .DEFAULT_CREDITS(DEFAULT_CREDITS)
) dut (
    .clk(clk),
    .rst_n(rst_n),
    
    .ext_valid(ext_valid),
    .ext_data(ext_data),
    .ext_keep(ext_keep),
    .ext_last(ext_last),
    .ext_ready(ext_ready),
    
    .axis_tvalid(axis_tvalid),
    .axis_tdata(axis_tdata),
    .axis_tkeep(axis_tkeep),
    .axis_tuser(axis_tuser),
    .axis_tlast(axis_tlast),
    .axis_tready(axis_tready),
    
    .axi_master_valid(axi_master_valid),
    .axi_master_addr(axi_master_addr),
    .axi_master_data(axi_master_data),
    .axi_master_ready(axi_master_ready),
    
    .axi_slave_valid(axi_slave_valid),
    .axi_slave_addr(axi_slave_addr),
    .axi_slave_data(axi_slave_data),
    .axi_slave_ready(axi_slave_ready),
    
    .credit_return_valid(credit_return_valid),
    .credit_return_ready(credit_return_ready),
    
    .port_id(port_id)
);

//==============================================================================
// Clock Generation
//==============================================================================
initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk = ~clk;
end

//==============================================================================
// VCD Dump
//==============================================================================
initial begin
    $dumpfile("ingress_pm_test.vcd");
    $dumpvars(0, testbench_ingress_pm);
end

//==============================================================================
// Test Stimulus
//==============================================================================
initial begin
    $display("🚀 Starting Ingress Port Manager Test");
    $display("=====================================");
    
    // Initialize signals
    test_step = 0;
    packet_count = 0;
    error_count = 0;
    
    rst_n = 0;
    ext_valid = 0;
    ext_data = 0;
    ext_keep = 0;
    ext_last = 0;
    axis_tready = 1; // Always ready to receive
    axi_master_ready = 1;
    axi_slave_valid = 0;
    axi_slave_addr = 0;
    axi_slave_data = 0;
    credit_return_valid = 0;
    port_id = 8'h00; // Port 0
    
    // Reset sequence
    $display("⏳ Test Step %0d: Reset sequence", test_step++);
    repeat(5) @(posedge clk);
    rst_n = 1;
    repeat(3) @(posedge clk);
    
    // Test 1: Single small packet (fits in one beat)
    $display("📤 Test Step %0d: Single small packet test", test_step++);
    send_test_packet_41_bytes();
    check_packet_output();
    
    // Test 2: Medium packet (requires multiple beats)
    $display("📤 Test Step %0d: Medium packet test", test_step++);
    send_test_packet_73_bytes();
    check_packet_output();
    
    // Test 3: Back-to-back packets
    $display("📤 Test Step %0d: Back-to-back packets test", test_step++);
    send_test_packet_41_bytes();
    send_test_packet_57_bytes();
    check_packet_output();
    check_packet_output();
    
    // Test 4: AXIS protocol compliance test
    $display("🔍 Test Step %0d: AXIS protocol compliance test", test_step++);
    test_axis_backpressure();
    
    // Results
    $display("");
    $display("📊 Test Results:");
    $display("================");
    $display("Packets sent: %0d", packet_count);
    $display("Errors found: %0d", error_count);
    
    if (error_count == 0) begin
        $display("🎉 ALL TESTS PASSED!");
    end else begin
        $display("❌ %0d TESTS FAILED!", error_count);
    end
    
    $display("");
    $display("VCD file: ingress_pm_test.vcd");
    $finish;
end

//==============================================================================
// Test Tasks
//==============================================================================

// Send 41-byte test packet (header + 32-byte payload)
task send_test_packet_41_bytes;
    begin
        $display("  📦 Sending 41-byte packet...");
        test_packet_size = 41;
        
        // Create test packet with 9-byte header + 32-byte payload
        test_packet = 0;
        test_packet[0*8 +: 8] = 8'h01;    // channel_type
        test_packet[1*8 +: 8] = 8'h00;    // queue_id
        test_packet[2*8 +: 8] = 8'h03;    // dest_port
        test_packet[3*8 +: 8] = 8'h00;    // source_port
        test_packet[4*8 +: 16] = 16'd41;  // total_packet_size (little endian)
        test_packet[6*8 +: 16] = 16'h0000; // reserved
        test_packet[8*8 +: 8] = 8'h05;    // header_crc (simplified)
        
        // Add payload pattern
        for (int i = 9; i < 41; i++) begin
            test_packet[i*8 +: 8] = i[7:0] ^ 8'hAA;
        end
        
        send_packet_via_axis(test_packet, test_packet_size);
        packet_count++;
    end
endtask

// Send 73-byte test packet
task send_test_packet_73_bytes;
    begin
        $display("  📦 Sending 73-byte packet...");
        test_packet_size = 73;
        
        // Create test packet with 9-byte header + 64-byte payload
        test_packet = 0;
        test_packet[0*8 +: 8] = 8'h02;    // channel_type
        test_packet[1*8 +: 8] = 8'h01;    // queue_id
        test_packet[2*8 +: 8] = 8'h02;    // dest_port
        test_packet[3*8 +: 8] = 8'h01;    // source_port
        test_packet[4*8 +: 16] = 16'd73;  // total_packet_size
        test_packet[6*8 +: 16] = 16'h0000; // reserved
        test_packet[8*8 +: 8] = 8'h08;    // header_crc
        
        // Add payload pattern
        for (int i = 9; i < 73; i++) begin
            test_packet[i*8 +: 8] = i[7:0] ^ 8'h55;
        end
        
        send_packet_via_axis(test_packet, test_packet_size);
        packet_count++;
    end
endtask

// Send 57-byte test packet
task send_test_packet_57_bytes;
    begin
        $display("  📦 Sending 57-byte packet...");
        test_packet_size = 57;
        
        test_packet = 0;
        test_packet[0*8 +: 8] = 8'h01;    // channel_type
        test_packet[1*8 +: 8] = 8'h02;    // queue_id
        test_packet[2*8 +: 8] = 8'h01;    // dest_port
        test_packet[3*8 +: 8] = 8'h02;    // source_port
        test_packet[4*8 +: 16] = 16'd57;  // total_packet_size
        test_packet[6*8 +: 16] = 16'h0000; // reserved
        test_packet[8*8 +: 8] = 8'h07;    // header_crc
        
        // Add payload pattern
        for (int i = 9; i < 57; i++) begin
            test_packet[i*8 +: 8] = i[7:0] ^ 8'hCC;
        end
        
        send_packet_via_axis(test_packet, test_packet_size);
        packet_count++;
    end
endtask

// Generic packet sending via AXIS interface
task send_packet_via_axis;
    input [MAX_PACKET_SIZE*8-1:0] packet_data;
    input [15:0] packet_size;
    
    integer beats_needed;
    integer current_beat;
    integer bytes_in_beat;
    integer byte_idx;
    
    begin
        beats_needed = (packet_size + AXIS_KEEP_WIDTH - 1) / AXIS_KEEP_WIDTH;
        $display("    📡 Sending %0d bytes in %0d beats", packet_size, beats_needed);
        
        for (current_beat = 0; current_beat < beats_needed; current_beat++) begin
            // Wait for ready
            @(posedge clk);
            while (!ext_ready) @(posedge clk);
            
            // Calculate bytes in this beat
            bytes_in_beat = packet_size - current_beat * AXIS_KEEP_WIDTH;
            if (bytes_in_beat > AXIS_KEEP_WIDTH) bytes_in_beat = AXIS_KEEP_WIDTH;
            
            // Set up beat data
            ext_valid = 1;
            ext_data = 0;
            ext_keep = 0;
            
            for (byte_idx = 0; byte_idx < bytes_in_beat; byte_idx++) begin
                ext_data[byte_idx*8 +: 8] = packet_data[(current_beat*AXIS_KEEP_WIDTH + byte_idx)*8 +: 8];
                ext_keep[byte_idx] = 1;
            end
            
            ext_last = (current_beat == beats_needed - 1);
            
            $display("      Beat %0d: data=0x%016h keep=0x%02h last=%0d", 
                    current_beat, ext_data, ext_keep, ext_last);
            
            @(posedge clk);
        end
        
        // Clear signals
        ext_valid = 0;
        ext_data = 0;
        ext_keep = 0;
        ext_last = 0;
        
        $display("    ✅ Packet sent successfully");
    end
endtask

// Check packet output on AXIS interface
task check_packet_output;
    reg [MAX_PACKET_SIZE*8-1:0] received_packet;
    reg [15:0] received_size;
    integer beat_count;
    integer timeout_count;
    
    begin
        $display("  🔍 Checking packet output...");
        received_packet = 0;
        received_size = 0;
        beat_count = 0;
        timeout_count = 0;
        
        // Wait for output tvalid
        while (!axis_tvalid && timeout_count < 100) begin
            @(posedge clk);
            timeout_count++;
        end
        
        if (timeout_count >= 100) begin
            $display("    ❌ ERROR: Timeout waiting for axis_tvalid");
            error_count++;
            return;
        end
        
        // Receive packet beats
        while (axis_tvalid) begin
            if (axis_tready) begin
                // Extract data from current beat
                for (int i = 0; i < AXIS_KEEP_WIDTH; i++) begin
                    if (axis_tkeep[i]) begin
                        received_packet[received_size*8 +: 8] = axis_tdata[i*8 +: 8];
                        received_size++;
                    end
                end
                
                $display("      Beat %0d: data=0x%016h keep=0x%02h last=%0d user=0x%016h", 
                        beat_count, axis_tdata, axis_tkeep, axis_tlast, axis_tuser);
                
                if (axis_tlast) break;
                beat_count++;
            end
            @(posedge clk);
        end
        
        $display("    📋 Received packet: %0d bytes in %0d beats", received_size, beat_count + 1);
        
        // Basic validation
        if (received_size >= 9) begin
            $display("    ✅ Packet size valid (>= 9 bytes header)");
        end else begin
            $display("    ❌ ERROR: Packet too small (%0d bytes)", received_size);
            error_count++;
        end
        
        // Check header in tuser (first beat only)
        if (axis_tuser != 0) begin
            $display("    ✅ Header present in tuser field");
        end else begin
            $display("    ⚠️  WARNING: No header in tuser field");
        end
    end
endtask

// Test AXIS backpressure handling
task test_axis_backpressure;
    begin
        $display("  🔍 Testing AXIS backpressure...");
        
        // Set axis_tready to 0 (create backpressure)
        axis_tready = 0;
        
        // Send a packet
        send_test_packet_41_bytes();
        
        // Wait a few cycles
        repeat(10) @(posedge clk);
        
        // Check that tvalid is asserted but no data transfer occurs
        if (axis_tvalid && !axis_tready) begin
            $display("    ✅ Backpressure handled correctly - tvalid high, no transfer");
        end else begin
            $display("    ❌ ERROR: Backpressure not handled correctly");
            error_count++;
        end
        
        // Release backpressure
        axis_tready = 1;
        
        // Check that transfer resumes
        @(posedge clk);
        if (axis_tvalid && axis_tready) begin
            $display("    ✅ Transfer resumed after backpressure release");
        end
        
        // Wait for packet completion
        while (axis_tvalid) @(posedge clk);
        
        $display("    ✅ Backpressure test completed");
    end
endtask

//==============================================================================
// Protocol Checker (Simplified for iverilog)
//==============================================================================
reg prev_axis_tvalid;
reg prev_axis_tready;
reg [AXIS_DATA_WIDTH-1:0] prev_axis_tdata;
reg [AXIS_KEEP_WIDTH-1:0] prev_axis_tkeep;
reg prev_axis_tlast;

always @(posedge clk) begin
    if (rst_n) begin
        // Simple protocol checks without $past()
        
        // Rule: tdata, tkeep, tlast should be stable when tvalid is high and tready is low
        if (axis_tvalid && prev_axis_tvalid && !axis_tready) begin
            if (axis_tdata !== prev_axis_tdata) begin
                $display("❌ AXIS PROTOCOL VIOLATION: tdata changed while tvalid high");
                error_count++;
            end
            if (axis_tkeep !== prev_axis_tkeep) begin
                $display("❌ AXIS PROTOCOL VIOLATION: tkeep changed while tvalid high");
                error_count++;
            end
            if (axis_tlast !== prev_axis_tlast) begin
                $display("❌ AXIS PROTOCOL VIOLATION: tlast changed while tvalid high");
                error_count++;
            end
        end
        
        // Store previous values
        prev_axis_tvalid <= axis_tvalid;
        prev_axis_tready <= axis_tready;
        prev_axis_tdata <= axis_tdata;
        prev_axis_tkeep <= axis_tkeep;
        prev_axis_tlast <= axis_tlast;
    end else begin
        prev_axis_tvalid <= 0;
        prev_axis_tready <= 0;
        prev_axis_tdata <= 0;
        prev_axis_tkeep <= 0;
        prev_axis_tlast <= 0;
    end
end

endmodule