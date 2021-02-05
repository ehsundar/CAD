`timescale 1ns / 1ns

module Elevator (
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

parameter FLOOR_COUNT = 10;

reg direction; // internal track of cabin direction
reg [31:0]floor; // internal track of floor position

reg [FLOOR_COUNT-1:0]floor_up_pressed; // internal track of upper buttons
reg [FLOOR_COUNT-1:0]floor_down_pressed; // internal track of lower buttons
reg [7:0]count_up; // internal count upper buttons count
reg [7:0]count_down; // internal count lower buttons count
reg [7:0]nearest_up; // internal
reg [7:0]nearest_down; // internal

reg [7:0]i;

parameter SIZE  = 5;
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

reg [SIZE-1:0] state;

initial begin
    floor <= position;
    direction <= 0;
    state <= Init;
    floor_down_pressed <= 0;
    floor_up_pressed <= 0;
end

always @ (floor_press_event)
begin
    if (floor_press_event > position) begin
        floor_up_pressed[floor_press_event] <= 1;
    end
    else if (floor_press_event < position) begin
        floor_down_pressed[floor_press_event] <= 1;
    end
end

always @ (cabin_press_event)
begin
    if (cabin_press_event > position) begin
        floor_up_pressed[cabin_press_event] <= 1;
    end
    else if (cabin_press_event < position) begin
        floor_down_pressed[cabin_press_event] <= 1;
    end
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
            floor <= position;

            count_up = 0;
            count_down = 0;
            for (i = 0; i < FLOOR_COUNT; i = i+1) begin
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

            nearest_down = position;
            for (i = 0; i < position; i = i + 1) begin
                if (floor_down_pressed[i]) begin
                    nearest_down = i;
                end
            end

            state <= Q1;
        end

        Q1 : if (count_up == count_down) 
                begin
                    if (count_up == 0)
                        state <= IDLE;
                    else
                        state <= Q3;
                end
            else 
                begin
                    state <= Q2;
                end

        Q2 : if (count_up > count_down) 
                begin
                    state <= Q5;
                end
            else 
                begin
                    state <= Q4;
                end
        Q3 : if (nearest_up == nearest_down) 
                begin
                    state <= Q4;
                end
            else 
                begin
                    state <= Q6;
                end
        Q4  : begin
                direction <= 0;
                motor_up <= 0;
                motor_down <= 1;
                state <= Q7;
            end
        Q5  : begin
                direction <= 1;
                motor_up <= 1;
                motor_down <= 0;
                state <= Q8;
            end
        Q6 : if (nearest_up > nearest_down) 
                begin
                    state <= Q4;
                end
            else 
                begin
                    state <= Q5;
                end
        Q7 : begin
                if ((floor-1) == position) begin
                    floor <= floor - 1;
                    state <= Q9;
                end
                else
                    state <= Q7;
            end
        Q8 : begin
                if ((floor+1) == position) begin
                    floor <= floor + 1;
                    state <= Q10;
                end
                else
                    state <= Q8;
            end
        Q9 : if (floor_down_pressed[position] == 1)
                begin
                    state <= Q11;
                end
            else 
                begin
                    state <= Q7;
                end
        Q10 : if (floor_up_pressed[position] == 1)
                begin
                    state <= Q12;
                end
            else 
                begin
                    state <= Q7;
                end
        Q11 : begin
                door = 1;
                motor_down = 0;
                motor_up = 0;
                #2;
                door = 0;

                floor_down_pressed[position] = 0;
                count_down = count_down - 1;
                state = Q13;
            end
        Q12 : begin
                door = 1;
                motor_down = 0;
                motor_up = 0;
                #2;
                door = 0;

                floor_up_pressed[position] = 0;
                count_up = count_up - 1;
                state = Q14;
            end
        Q13 : if (count_down == 0) 
                begin
                    state <= IDLE;
                end
            else 
                begin
                    state <= Q4;
                end
        Q14 : if (count_up == 0) 
                begin
                    state <= IDLE;
                end
            else 
                begin
                    state <= Q5;
                end
        default : state <= IDLE;
        endcase
end
endmodule
