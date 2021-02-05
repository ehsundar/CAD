
`timescale 1ns / 1ns

module CharacterRecognition (
    input clock,
    input reset,
    input [7:0] char,
    output reg window
);

parameter SIZE  = 6;
reg   [SIZE-1:0] state;

always @ (posedge clock)
begin: FSM
    if (reset == 1'b1) 
    begin
        state <= 8'd0;
    end 
    else
        case(state)
        8'd0:
            if (char == "O")
                state <= 8'd1;
            else 
                state <= 8'd0;
        8'd1 :
            if (char == "P")
                state <= 8'd2;
            else 
                state <= 8'd0;
        8'd2 : 
            if (char == "E")
                state <= 8'd3;
            else 
                state <= 8'd0;
        8'd3 : 
            if (char == "N")
                state <= 8'd4;
            else 
                state <= 8'd0;
        8'd4 : 
            if (char == "W")
                state <= 8'd5;
            else 
                state <= 8'd0;
        8'd5 : 
            if (char == "I") 
                state <= 8'd6;
            else 
                state <= 8'd0;
        8'd6 : 
            if (char == "N") 
                state <= 8'd7;
            else 
                state <= 8'd0;
        8'd7 : 
            if (char == "D") 
                state <= 8'd8;
            else 
                state <= 8'd0;
        8'd8 : 
            if (char == "O")
                state <= 8'd9;
            else 
                state <= 8'd0;
        8'd9 : 
        begin
            if (char == "W")
                window = 1;
            state <= 8'd0;
        end
        default: 
            state <= 8'd0;
        endcase
end

endmodule
