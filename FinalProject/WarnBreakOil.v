`timescale 1ns / 1ps

module WarnBreakOil (clock, reset, break_oil, warn_break_oil);

input clock;
input reset;
input wire signed [31:0] break_oil;
output reg warn_break_oil;

parameter SIZE  = 2;
reg   [SIZE-1:0] state;

always @ (posedge clock)
begin
if (reset == 1) 
  state <= #1 8'd0;
else
 case(state)
    2'd0 : begin
              if (break_oil < 10)
                state <= 2'd1;
              else 
                state <= 2'd2;
           end
    2'd1 : begin
            warn_break_oil <= 1;
            state <= 2'd0;
           end
    2'd2 : begin
            warn_break_oil <= 0;
            state <= 2'd0;
           end
   default : state <= 2'd0;
endcase
end

endmodule
