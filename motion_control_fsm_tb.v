module motion_control_fsm_tb;
    reg clock;
    reg reset;
    reg [2:0] motion_cmd;
    wire [4:0] state;
    wire product_complete;

    // Instantiate the DUT
    motion_control_fsm dut (
        .clock(clock),
        .reset(reset),
        .motion_cmd(motion_cmd),
        .state(state),
        .product_complete(product_complete)
    );

    // Clock generation
    initial clock = 0;
    always #5 clock = ~clock;

    initial begin
        // Initialize inputs
        reset = 1;
        motion_cmd = 3'b111; // Invalid command
        #20;
        reset = 0;
        #20;

        // Test CMD_MOVE
        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;

        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;

        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;

        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;

        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;


        motion_cmd = 3'b000; // Move command
        #20;

        // Test CMD_PICK
        motion_cmd = 3'b001; // Pick command
        #20;

        // Test CMD_PLACE
        motion_cmd = 3'b010; // move command
        #20;

        // Test CMD_HOME
        motion_cmd = 3'b011; // place command
        #20;
        
        $finish;

    end

    initial begin
        $monitor("Time: %0t, State: %b, Product Complete: %b", $time, state, product_complete);
    end

endmodule