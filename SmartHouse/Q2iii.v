module fsm_mealy (
clock,
reset,
req_0,
gnt_0,
);

input   clock,reset,req_0;
output  gnt_0;
wire    clock,reset,req_0;
reg     gnt_0;

parameter SIZE  = 8;
parameter IDLE  = 8'b00000001;
parameter Q1    = 8'b00000010;
parameter Q2    = 8'b00000100;
parameter Q3    = 8'b00001000;
parameter Q4    = 8'b00010000;
parameter Q5    = 8'b00100000;
parameter Q6    = 8'b01000000;
parameter QF    = 8'b10000000;

reg   [SIZE-1:0] state;

always @ (posedge clock)
begin : FSM
if (reset == 1'b1) 
    begin
        state <= #1 IDLE;
        gnt_0 <= 0;
    end 
else
 case(state)
    IDLE : if (req_0 == 1'b1)
            begin
                state <= #1 Q1;
                gnt_0 <= 0;
            end
          else
            begin
                state <= #1 IDLE;
                gnt_0 <= 0;
            end
    Q1 : if (req_0 == 1'b1) 
            begin
                state <= #1 Q2;
                gnt_0 <= 0;
            end
          else 
            begin
                state <= #1 IDLE;
                gnt_0 <= 0;
            end
    Q2 : if (req_0 == 0'b1) 
            begin
                state <= #1 Q3;
                gnt_0 <= 0;
            end
          else 
            begin
                state <= #1 IDLE;
                gnt_0 <= 0;
            end
    Q3 : if (req_0 == 1'b1) 
            begin
                state <= #1 Q4;
                gnt_0 <= 0;
            end
          else 
            begin
                state <= #1 IDLE;
                gnt_0 <= 0;
            end
    Q4 : if (req_0 == 0'b1) 
            begin
                state <= #1 Q5;
                gnt_0 <= 0;
            end
          else 
            begin
                state <= #1 IDLE;
                gnt_0 <= 0;
            end
    Q5 : if (req_0 == 1'b1) 
            begin
                state <= #1 Q6;
                gnt_0 <= 0;
            end
          else 
            begin
                state <= #1 IDLE;
                gnt_0 <= 0;
            end
    Q6 : if (req_0 == 1'b1) 
            begin
                state <= #1 Q7;
                gnt_0 <= 1;
            end
          else 
            begin
                state <= #1 IDLE;
                gnt_0 <= 0;
            end
    QF : 
            begin
                state <= #1 IDLE;
                gnt_0 <= 0;
            end
   default : state <= #1 IDLE;
endcase
end

endmodule
