module MusicOffWhenPhoneRings ();

input   clock, reset, is_ringing;
output reg music;

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
              if (music == 1 and is_rining == 1)
                state <= 8'd1;
              else 
               state <= 8'd0     
           end
    8'd1 : begin
            music <= 0;
            if (chais_ringing == 0)
                state <= 8'd2;
            else 
                state <= 8'd1;
           end
    8'd2 : begin
            music <= 1;
            state <= 8'd0;
    end
   default : state <= 8'd0;
endcase
end

endmodule
