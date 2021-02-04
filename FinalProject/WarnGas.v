module WarnGas ();

input   clock, reset, integer gas_level;
output reg warn_gas;

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
              if (gas_level < 10)
                state <= 8'd1;
              else 
                state <= 8'd2;
           end
    8'd1 : begin
            warn_gas <= 1;
            state <= 8'd0;
           end

    8'd2 : begin
            warn_gas <= 0;
            state <= 8'd0;
           end
   default : state <= 8'd0;
endcase
end

endmodule
