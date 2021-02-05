`timescale 1ns / 1ns

module elevator_function (
  input clock,
  input reset,
  input off_btn,
  input [31:0]position,
  input [31:0]floor_press_event,
  input [31:0]cabin_press_event,
  input signed [31:0]temp,
  output reg door,
  output reg cooler,
  output reg heater,
  output reg motor_up,
  output reg motor_down
);

// direction down = 0 , direction up = 1

parameter FLOOR_COUNT = 10;

reg direction;

reg floor_up_pressed[FLOOR_COUNT-1:0];
reg floor_down_pressed[FLOOR_COUNT-1:0];
reg cabin_pressed[FLOOR_COUNT-1:0];
reg [7:0]count_up;
reg [7:0]count_down;
reg [7:0]nearest_up;
reg [7:0]nearest_down;

reg [7:0]i;

parameter SIZE  = 21;
parameter Off   = 5'b00001;
parameter IDLE  = 5'b00010;
parameter Init  = 5'b00011;
parameter Q1    = 5'b00100;
parameter Q2    = 5'b00101;
parameter Q3    = 5'b00110;
parameter Q4    = 5'b00111;
parameter Q5    = 5'b01000;
parameter Q6    = 5'b01010;
parameter Q7    = 5'b01001;
parameter Q8    = 5'b01011;
parameter Q9    = 5'b01100;
parameter Q10   = 5'b01101;
parameter Q11   = 5'b01110;
parameter Q12   = 5'b01111;
parameter Q13   = 5'b10000;
parameter Q14   = 5'b10001;
parameter Q15   = 5'b10010;
parameter Q16   = 5'b10011;
parameter Q17   = 5'b10100;
parameter Q18   = 5'b10101;

reg   [SIZE-1:0] state;

initial begin
    floor_up_pressed[2] = 1;
    floor_up_pressed[5] = 1;
    floor_up_pressed[8] = 1;
end


always @ (posedge clock)
begin : FSM
if (off_btn == 1'b1) 
        state <= Off;
else
    if (reset == 1'b1)
        state <= IDLE;
// direction down = 0 , direction up = 1
    else
        case(state)
        Init : 
            begin
                direction <= 0;
                state <= IDLE;
            end
        IDLE: begin
            count_up = 0;
            count_down = 0;
            for (i=0; i < FLOOR_COUNT; i = i+1) begin
                if (floor_up_pressed[i] == 1)
                    count_up = count_up + 1;
                if (floor_down_pressed[i] == 1)
                    count_down = count_down + 1;
            end

            nearest_up = position;
            for (i = FLOOR_COUNT - 1; i > position; i = i - 1) begin
                if (floor_up_pressed[i]) begin
                    nearest_up = i;
                end
            end

            //state <= IDLE;
        end
        // Q1 : if (24 <= temp <= 26)
        //         begin
        //             state <= #1 Q2;
        //         end
        //     else if (temp > 26)
        //         begin
        //             state <= #1 Q3;
        //         end
        //     else if (temp < 24)
        //         begi
        //             state <= #1 Q4;
        //         end
        // Q2 : begin
        //         cooler <= 0;
        //         heater <= 0;
        //         state <= #1 Q5;
        //     end
        // Q3 : begin
        //         cooler <= 1;
        //         state <= #1 Q5;
        //     end
        // Q4 : begin
        //         heater <= 1;
        //         state <= #1 Q5;
        //     end
        // Q5 : if (count_up == count_down) 
        //         begin
        //             state <= #1 Q7;
        //         end
        //     else 
        //         begin
        //             state <= #1 Q6;
        //         end
        // Q6 : if (count_up > count_down) 
        //         begin
        //             state <= #1 Q9;
        //         end
        //     else 
        //         begin
        //             state <= #1 Q8;
        //         end
        // Q7 : if (nearest_up == nearest_down) 
        //         begin
        //             state <= #1 Q8;
        //         end
        //     else 
        //         begin
        //             state <= #1 Q10;
        //         end
        // Q8  : begin
        //         direction <= 0;
        //         state <= #1 Q11;
        //     end
        // Q9  : begin
        //         direction <= 1;
        //         state <= #1 Q12;
        //     end
        // Q10 : if (nearest_up > nearest_down) 
        //         begin
        //             state <= #1 Q8;
        //         end
        //     else 
        //         begin
        //             state <= #1 Q9;
        //         end
        // Q11 : begin
        //         position = position - 1
        //         state <= #1 Q13
        //     end
        // Q12 : begin
        //         position = position + 1
        //         state <= #1 Q14
        //     end
        // Q13 : if (pressed[direction][position] == 1 || destination[position] == 1) 
        //         begin
        //             state <= #1 Q15;
        //         end
        //     else 
        //         begin
        //             state <= #1 Q11;
        //         end
        // Q14 : if (pressed[direction][position] == 1 || destination[position] == 1) 
        //         begin
        //             state <= #1 Q16;
        //         end
        //     else 
        //         begin
        //             state <= #1 Q11;
        //         end
        // Q15 : begin
        //         door <= 1;
        //         pressed[direction][position] <= 0;
        //         destination[position] <= 0;
        //         count_down = count_down - 1;
        //         state <= #1 Q17;
        //     end
        // Q16 : begin
        //         door <= 1;
        //         pressed[direction][position] <= 0;
        //         destination[position] <= 0;
        //         count_up = count_up - 1;
        //         state <= #1 Q18;
        //     end
        // Q17 : if (count_down == 0) 
        //         begin
        //             state <= #1 IDLE;
        //         end
        //     else 
        //         begin
        //             state <= #1 Q11;
        //         end
        // Q18 : if (count_up == 0) 
        //         begin
        //             state <= #1 IDLE;
        //         end
        //     else 
        //         begin
        //             state <= #1 Q12;
        //         end
        default : state <= #1 IDLE;
        endcase
end

endmodule
