`timescale 1ns / 1ns

module WarnGas (clock, reset, gas, warn_gas);

input clock;
input reset;
input wire signed [31:0] gas;
output reg warn_gas;

parameter SIZE  = 2;
reg   [SIZE-1:0] state;

always @ (posedge clock)
begin
if (reset == 1) 
  state <= #1 8'd0;
else
 case(state)
    2'd0 : begin
              if (gas < 10)
                state <= 2'd1;
              else 
                state <= 2'd2;
           end
    2'd1 : begin
            warn_gas <= 1;
            state <= 2'd0;
           end
    2'd2 : begin
            warn_gas <= 0;
            state <= 2'd0;
           end
   default : state <= 2'd0;
endcase
end

endmodule
