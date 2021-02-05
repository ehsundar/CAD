`timescale 1ns / 1ps

module WarnEngineOil1 (clock, reset, engine_oil, warn_engine_oil);

input clock;
input reset;
input wire signed [31:0] engine_oil;
output reg warn_engine_oil;

parameter SIZE  = 2;
reg   [SIZE-1:0] state;

always @ (posedge clock)
begin
if (reset == 1) 
  state <= #1 8'd0;
else
 case(state)
    2'd0 : begin
              if (engine_oil < 10)
                state <= 2'd1;
              else 
                state <= 2'd2;
           end
    2'd1 : begin
            warn_engine_oil <= 1;
            state <= 2'd0;
           end
    2'd2 : begin
            warn_engine_oil <= 0;
            state <= 2'd0;
           end
   default : state <= 2'd0;
endcase
end

endmodule
