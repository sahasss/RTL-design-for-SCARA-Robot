module command_interface_unit (
    input wire clock,
    input wire reset,
    input wire [7:0] cmd_data,
    input wire cmd_val,
    output reg [2:0] motion_cmd,
    output reg cmd_ack
);
 
localparam CMD_MOVE = 8'b00000100;
localparam CMD_HOME   = 8'b01010000;
localparam CMD_STOP   = 8'b01010100;
localparam CMD_PICK = 8'b01011000; // Example command for picking
localparam CMD_PLACE = 8'b01011100; // Example command for placing


always @(posedge clock or posedge reset) begin
    if (reset) begin
        motion_cmd <= 3'b111;
        cmd_ack <= 0;
    end else if (cmd_val) begin
        case (cmd_data)
            CMD_MOVE: motion_cmd <= 3'b000;
            CMD_PICK: motion_cmd <= 3'b001;
            CMD_PLACE:   motion_cmd <= 3'b010;
            CMD_HOME:   motion_cmd <= 3'b011;
            CMD_STOP:   motion_cmd <= 3'b100;
            default:    motion_cmd <= 3'b111;
        endcase
        cmd_ack <= 1;
    end else begin
        cmd_ack <= 0;
    end
end
   
endmodule