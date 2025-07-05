module motion_control_fsm (
    input wire clock,
    input wire reset,
    input wire [2:0] motion_cmd,
    output reg [4:0] state,
    output reg product_complete
);
// State encoding
localparam state_reset = 5'b00001;
localparam move_to_conveyor1 = 5'b00010;
localparam picking_metal = 5'b00011;
localparam move_to_moulding = 5'b00100;
localparam place_in_moulding = 5'b00101; 
localparam moulding_complete = 5'b00110;
localparam placing_metal = 5'b00111;   // TWO ERRORS ARE THERE  PLACING_IN_COOLING_STATION AND PICKING_TRIMMED 
localparam picking_rubber = 5'b01000;
localparam move_to_cooling = 5'b01001;
localparam placing_in_cooling = 5'b01010;
localparam cooling_complete = 5'b01011;
localparam picking_cooled_metal = 5'b01100;
localparam move_to_trimming = 5'b01101;
localparam placing_in_trimming = 5'b01110;
localparam trimming_complete = 5'b01111;
localparam picking_trimmed = 5'b10000;
localparam move_to_conveyor2 = 5'b10001;
localparam placed = 5'b10010;

reg [4:0] next_state;
reg [4:0] present_state;
// State output
always @(posedge clock) begin
    if (reset) begin
        state <= state_reset;
    end else begin
        state <= present_state;
    end
end

// Next state logic
always @(posedge clock) begin
    if (reset) begin
        present_state <= state_reset;
    end else begin
        present_state <= next_state;
    end
end


//cmd_move = 000
//cmd_pick = 001
//cmd_place = 010
//cmd_home = 011
//cmd_stop = 100
//cmd_invalid = 111


// State machine logic
always @(motion_cmd,present_state) begin
    case (present_state)
        state_reset: begin
            if (motion_cmd == 3'b000) begin // CMD_MOVE
                next_state = move_to_conveyor1;
            end else begin
                next_state = state_reset;
            end
        end
        move_to_conveyor1: begin
            if (motion_cmd == 3'b001) begin // CMD_PICK
                next_state = picking_metal;
            end else begin
                next_state = move_to_conveyor1;
            end
        end 
        picking_metal: begin
            if (motion_cmd == 3'b000) begin // CMD_MOVE
                next_state = move_to_moulding;
            end else begin
                next_state = picking_metal;
            end
        end
        move_to_moulding: begin
            if (motion_cmd == 3'b010) begin // CMD_PLACE
                next_state = place_in_moulding;
            end else begin
                next_state = move_to_moulding;
            end
        end
        place_in_moulding: begin
            if (motion_cmd == 3'b001) begin // CMD_PICK
                next_state = picking_rubber;
            end else begin
                next_state = place_in_moulding;
            end
        end
        picking_rubber: begin
            if (motion_cmd == 3'b000) begin // CMD_MOVE
                next_state = move_to_cooling;
            end else begin
                next_state = picking_rubber;
            end
        end
        move_to_cooling: begin
            if (motion_cmd == 3'b010) begin // CMD_PLACE
                next_state = placing_in_cooling;
            end else begin
                next_state = move_to_cooling;
            end
        end

        placing_in_cooling: begin
            next_state = cooling_complete;
        end

        cooling_complete: begin
            if (motion_cmd == 3'b001) begin // CMD_PICK
                next_state = picking_cooled_metal;
            end else begin
                next_state = cooling_complete;
            end
        end
        picking_cooled_metal: begin
            if (motion_cmd == 3'b000) begin // CMD_MOVE
                next_state = move_to_trimming;
            end else begin
                next_state = picking_cooled_metal;
            end
        end
        move_to_trimming: begin
            if (motion_cmd == 3'b010) begin // CMD_PLACE
                next_state = placing_in_trimming;
            end else begin
                next_state = move_to_trimming;
            end
        end
        placing_in_trimming: begin
            next_state = trimming_complete;
        end

        trimming_complete: begin
            if (motion_cmd == 3'b001) begin // CMD_PICK
                next_state = picking_trimmed;
            end else begin
                next_state = trimming_complete;
            end
        end

        picking_trimmed: begin 
            if(motion_cmd==3'b000) begin  // CMD_MOVE
                next_state = move_to_conveyor2;
            end else begin
                next_state = picking_trimmed;
            end
        end


        move_to_conveyor2: begin
            if (motion_cmd == 3'b010) begin // CMD_PLACE
                next_state = placed;
            end else begin
                next_state = move_to_conveyor2;
            end
        end
        placed: begin
            if (motion_cmd == 3'b011) begin // CMD_HOME
                next_state = state_reset;
            end else if (motion_cmd == 3'b000) begin
                next_state = move_to_conveyor1;
            end else begin
                next_state = placed;
            end
        end
        default: begin
            next_state = state_reset; // Default to reset state
        end
    endcase
end

// Output logic
always@(present_state) begin
    case(present_state)
        state_reset: product_complete = 1'b0;
        move_to_conveyor1: product_complete = 1'b0;
        picking_metal: product_complete = 1'b0;
        move_to_moulding: product_complete = 1'b0;
        place_in_moulding: product_complete = 1'b0;
        moulding_complete: product_complete = 1'b0;
        placing_metal: product_complete = 1'b0; 
        picking_rubber: product_complete = 1'b0;
        move_to_cooling: product_complete = 1'b0;
        placing_in_cooling: product_complete = 1'b0;
        cooling_complete: product_complete = 1'b0;
        picking_cooled_metal: product_complete = 1'b0;
        move_to_trimming: product_complete = 1'b0;
        placing_in_trimming: product_complete = 1'b0;
        trimming_complete: product_complete = 1'b0;
        picking_trimmed: product_complete = 1'b0;
        move_to_conveyor2: product_complete = 1'b0;
        placed: product_complete = 1'b1; // Product is complete when in placed state
        default: product_complete = 1'b0;
    endcase
end
endmodule

    


