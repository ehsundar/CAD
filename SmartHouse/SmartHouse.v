module SmartHouse (
    input clock,
    input reset,
    input isday,
    input ring_req,
    input [31:0]temp_req,
    output reg music,
    output reg curtain,
    output reg light,
    output reg cooler,
    output reg heater
);

parameter SIZE  = 5;
parameter IDLE  = 5'b00001;
parameter Init  = 5'b00010;
parameter Q2    = 5'b00011;
parameter Q3    = 5'b00100;
parameter Q4    = 5'b00101;
parameter Q5    = 5'b00110;
parameter Q6    = 5'b00111;
parameter Q7    = 5'b01000;
parameter Q8    = 5'b01010;

reg   [SIZE-1:0] state;

initial begin
    state = IDLE;
end

always @ (posedge clock)
begin : FSM
if (reset == 1'b1) 
    begin
        state <= Init;
    end 
else
    case(state)
    Init : 
    begin
        music <= 0;
        curtain <= 0;
        light <= 0;
        cooler <= 0;
        heater <= 0;
        state <= IDLE;
    end
    IDLE : 
        if (isday == 1'b1)
            state <= Q2;
        else
            state <= Q3;
    Q2: 
    begin
        curtain <= 1;
        music <= 1;
        light <= 0;
        if (ring_req == 1'b1) 
            state <= Q4;
        else 
            state <= Q5;
    end
    Q3:
    begin
        curtain <= 0;
        music <= 0;
        light <= 1;
        state <= Q5;
    end
    Q4:
    begin
        music <= 0;
        state <= Q5;
    end
    Q5: 
        if (temp_req >= 30)
            state <= Q7;
        else if (temp_req <= 16)
            state <= Q8;
        else if (temp_req == 24)
            state <= Q6;
        else
            ;
    Q6: 
    begin
        cooler <= 0;
        heater <= 0;
        state <= IDLE;
    end
    Q7: 
    begin
        cooler <= 1;
        state <= IDLE;
    end
    Q8:
    begin
        heater <= 1;
        state <= IDLE;
    end
    default: 
        state <= IDLE;
    endcase
end

endmodule
