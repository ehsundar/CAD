module SmartHouse (
    input clock,
    input reset,
    input isday,
    input music_req,
    input light_req,
    input curtain_req,
    input ring_req,
    input [31:0]temp_req,
    input [7:0]char_req,
    output reg music,
    output reg curtain,
    output reg light,
    output reg window,
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
        window <= 0;
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
    Q3 :
    begin
        curtain <= 0;
        music <= 0;
        light <= 1;
        state <= Q5;
    end
    Q4 :
    begin
        music <= 0;
        state <= Q5;
    end
    Q5 : 
        if (temp_req >= 30)
            state <= Q7;
        else if (temp_req <= 16)
            state <= Q8;
        else if (temp_req == 24)
            state <= Q6;
        else
            ;
                
    Q6 : 
    begin
        cooler <= 0;
        heater <= 0;
        state <= Q9;
    end
    Q7 : 
    begin
        cooler <= 1;
        state <= Q9;
    end
    Q8 :
    begin
        heater <= 1;
        state <= Q9;
    end
    Q9: 
        if (char_req == "O")
            state <= Q10;
        else 
            state <= IDLE;
    Q10: 
        if (char_req == "P")
            state <= Q11;
        else 
            state <= IDLE;
    Q11: 
        if (char_req == "E")
            state <= Q12;
        else 
            state <= IDLE;
    Q12: 
        if (char_req == "N")
            state <= Q13;
        else 
            state <= IDLE;
    Q13 : 
        if (char_req == "W")
            state <= Q14;
        else 
            state <= IDLE;
    Q14 : 
        if (char_req == "I")
            state <= Q15;
        else 
            state <= IDLE;
    Q15: 
        if (char_req == "N")
            state <= Q16;
        else 
            state <= IDLE;
    Q16 :
        if (char_req == "D")
            state <= Q17;
        else 
            state <= IDLE;
    Q17:
        if (char_req == "O")
                state <= Q18;
          else 
                state <= IDLE;
    Q18: 
        if (char_req == "W")
            state <= Q19;
        else 
            state <= IDLE;
    Q19:
    begin
        state <= IDLE;
        window <= 1;
    end
    default: 
        state <= IDLE;
    endcase
end

endmodule
