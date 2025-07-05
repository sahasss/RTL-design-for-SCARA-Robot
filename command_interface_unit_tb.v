`timescale 1ns/1ps
module command_interface_unit_tb;
    reg clock;
    reg reset;
    reg [7:0] cmd_data;
    reg cmd_val;
    wire [2:0] motion_cmd;
    wire cmd_ack;

    // Instantiate the DUT
    command_interface_unit dut (
        .clock(clock),
        .reset(reset),
        .cmd_data(cmd_data),
        .cmd_val(cmd_val),
        .motion_cmd(motion_cmd),
        .cmd_ack(cmd_ack)
    );

    // Clock generation
    initial clock = 0;
    always #5 clock = ~clock;

    initial begin
        // Initialize inputs
        reset = 1;
        cmd_data = 8'b0;
        cmd_val = 0;
        #10;
        reset = 0;
        #10;

        // Test CMD_MOVE_X
        cmd_data = 8'b00000100;
        cmd_val = 1;
        #10;
        cmd_val = 0;
        #10;

        // Test CMD_MOVE_Y
        cmd_data = 8'b00010100;
        cmd_val = 1;
        #10;
        cmd_val = 0;
        #10;

        // Test CMD_HOME
        cmd_data = 8'b01010000;
        cmd_val = 1;
        #10;
        cmd_val = 0;
        #10;

        // Test CMD_STOP
        cmd_data = 8'b01010100;
        cmd_val = 1;
        #10;
        cmd_val = 0;
        #10;

        // Test invalid command
        cmd_data = 8'b11111111;
        cmd_val = 1;
        #10;
        cmd_val = 0;
        #10;

        $finish;
    end
endmodule
