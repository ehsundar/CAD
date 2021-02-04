module WarnBreakOil ();

input   clock, reset, [7:0] break_oil;
output reg warn_break_oil;

parameter SIZE  = 2;
reg   [SIZE-1:0] state;

always @ (posedge clock)
begin: 
if (reset == 1) 
    begin
        state <= #1 8'd0;
    end 
else
 case(state)
    8'd0 : begin
              if (break_oil < 10)
                state <= 8'd1;
              else 
                state <= 8'd2;
           end
    8'd1 : begin
            warn_break_oil <= 1;
            state <= 8'd0;
           end

    8'd2 : begin
            warn_break_oil <= 0;
            state <= 8'd0;
           end
   default : state <= 8'd0;
endcase
end

endmodule