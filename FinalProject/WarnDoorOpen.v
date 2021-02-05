module WarnDoorOpen (clock, reset, door_open, warn_door_open);

input  clock, reset, door_open;
output reg warn_door_open;

parameter SIZE  = 2;
reg   [SIZE-1:0] state;

always @ (posedge clock)
begin
if (reset == 1) 
  state <= #1 2'd0;
else
 case(state)
    2'd0 : begin
              if (door_open == 1)
                state <= 2'd1;
              else 
                state <= 2'd2;
           end
    2'd1 : begin
            warn_door_open <= 1;
            state <= 2'd0;
           end
    2'd2 : begin
            warn_door_open <= 0;
            state <= 2'd0;
           end
   default : state <= 2'd0;
endcase
end

endmodule