module smart_house_function (
clock,
reset,
music_req,
light_req,
curtain_req,
temp_req,
char_req,
);

input   clock, reset, isday, ring_req, music_req, light_req, curtain_req;
integer temp_req;
input   string char_req;
output  music, curtain, light, window, cooler, heater;
wire    clock, reset, music_req, light_req, curtain_req, temp_req;
reg     music, curtain, light, window;

parameter SIZE  = 20;
parameter IDLE  = 5'b00001;
parameter Init  = 5'b00010;
parameter Q2    = 5'b00011;
parameter Q3    = 5'b00100;
parameter Q4    = 5'b00101;
parameter Q5    = 5'b00110;
parameter Q6    = 5'b00111;
parameter Q7    = 5'b01000;
parameter Q8    = 5'b01010;
parameter Q9    = 5'b01001;
parameter Q10   = 5'b01011;
parameter Q11   = 5'b01100;
parameter Q12   = 5'b01101;
parameter Q13   = 5'b01110;
parameter Q14   = 5'b01111;
parameter Q15   = 5'b10000;
parameter Q16   = 5'b10001;
parameter Q17   = 5'b10010;
parameter Q18   = 5'b10011;
parameter Q19   = 5'b10100;

reg   [SIZE-1:0] state;

always @ (posedge clock)
begin : FSM
if (reset == 1'b1) 
    begin
        state <= #1 Init;
    end 
else
 case(state)
    Init : 
        begin
            music <= 0;
            curtain <= 0;
            light <= 0;
            window <= 0;
            cooler <= 0;
            heater <= 0;
            state <= #1 IDLE;
        end
    IDLE : if (isday == 1'b1)
            begin
                state <= #1 Q2;
            end
          else
            begin
                state <= #1 Q3;
            end
    Q2 : begin
            curtain <= 1;
            music <= 1;
            light <= 0;
            if (ring_req == 1'b1) 
                begin
                    state <= #1 Q4;
                end
            else 
                begin
                    state <= #1 Q5;
                end
         end
    Q3 : begin
            curtain <= 0;
            music <= 0;
            light <= 1;
            state <= #1 Q5;
         end
    Q4 : begin
            music <= 0;
            state <= #1 Q5;
         end
    Q5 : if (temp_req == 24)
            begin
                state <= #1 Q6;
            end
          else if (temp_req >= 30)
            begin
                state <= #1 Q7;
            end
          else if (temp_req <= 16)
            begin
                state <= #1 Q8;
            end
    Q6 : begin
            cooler <= 0;
            heater <= 0;
            state <= #1 Q9;
         end
    Q7 : begin
            cooler <= 1;
            state <= #1 Q9;
         end
    Q8 : begin
            heater <= 1;
            state <= #1 Q9;
         end
    Q9 : if (char_req == "o") 
            begin
                state <= #1 Q10;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q10 : if (char_req == "p") 
            begin
                state <= #1 Q11;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q11 : if (char_req == "e") 
            begin
                state <= #1 Q12;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q12 : if (char_req == "n") 
            begin
                state <= #1 Q13;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q13 : if (char_req == "w") 
            begin
                state <= #1 Q14;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q14 : if (char_req == "i") 
            begin
                state <= #1 Q15;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q15 : if (char_req == "n") 
            begin
                state <= #1 Q16;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q16 : if (char_req == "d") 
            begin
                state <= #1 Q17;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q17 : if (char_req == "o") 
            begin
                state <= #1 Q18;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q18 : if (char_req == "w") 
            begin
                state <= #1 Q19;
            end
          else 
            begin
                state <= #1 IDLE;
            end
    Q19 : begin
            state <= #1 IDLE;
            window <= 1;
          end
   default : state <= #1 IDLE;
endcase
end

endmodule
