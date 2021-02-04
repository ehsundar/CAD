module fsm_mealy_using_function (
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
wire  [SIZE-1:0] next_state;

assign next_state = fsm_function(state, req_0);

function [SIZE-1:0] fsm_function;
  input  [SIZE-1:0]  state ;
  input    req_0 ;
  case(state)
    IDLE : if (req_0 == 1'b1)
            begin
                state <= #1 Q1;
            end
          else
            begin
                state <= #1 IDLE;
            end
    Q1 : if (req_0 == 1'b1) 
            begin
                state <= #1 Q2;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q2 : if (req_0 == 0'b1) 
            begin
                state <= #1 Q3;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q3 : if (req_0 == 1'b1) 
            begin
                state <= #1 Q4;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q4 : if (req_0 == 0'b1) 
            begin
                state <= #1 Q5;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q5 : if (req_0 == 1'b1) 
            begin
                state <= #1 Q6;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q6 : if (req_0 == 1'b1) 
            begin
                state <= #1 Q7;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    QF : 
            begin
                state <= #1 IDLE;
            end
   default : state <= #1 IDLE;
endcase
endfunction

// Seq Logic
always @ (posedge clock)
begin : FSM_SEQ
  if (reset == 1'b1) begin
    state <= #1 IDLE;
  end else begin
    state <= #1 next_state;
  end
end

// Output Logic
always @ (posedge clock)
begin : OUTPUT_LOGIC
if (reset == 1'b1) begin
  gnt_0 <= #1 1'b0;
end
else begin
  case(state)
    IDLE : if (req_0 == 1'b1)
            begin
                gnt_0 <= 0;
            end
          else
            begin
                gnt_0 <= 0;
            end
    Q1 : if (req_0 == 1'b1) 
            begin
                gnt_0 <= 0;
            end
          else 
            begin
                gnt_0 <= 0;
            end
    Q2 : if (req_0 == 0'b1) 
            begin
                gnt_0 <= 0;
            end
          else 
            begin
                gnt_0 <= 0;
            end
    Q3 : if (req_0 == 1'b1) 
            begin
                gnt_0 <= 0;
            end
          else 
            begin
                gnt_0 <= 0;
            end
    Q4 : if (req_0 == 0'b1) 
            begin
                gnt_0 <= 0;
            end
          else 
            begin
                gnt_0 <= 0;
            end
    Q5 : if (req_0 == 1'b1) 
            begin
                gnt_0 <= 0;
            end
          else 
            begin
                gnt_0 <= 0;
            end
    Q6 : if (req_0 == 1'b1) 
            begin
                gnt_0 <= 1;
            end
          else 
            begin
                gnt_0 <= 0;
            end
    QF : 
            begin
                gnt_0 <= 0;
            end
   default : gnt_0 <= #1 0;
endcase
end

endmodule
