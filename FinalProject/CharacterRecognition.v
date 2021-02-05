module CharacterRecognition (
    input clock,
    input reset,
    input [7:0] char,
    output reg start_car,
    output reg heater,
    output reg cooler,
    output reg music
);

parameter SIZE  = 6;
reg   [SIZE-1:0] state;

always @ (posedge clock)
begin: FSM
if (reset == 1'b1) 
    begin
        state <= 8'd0;
    end 
else
 case(state)
    8'd0 : begin
              if (char == "R")
                state <= 8'd1;
              else if(char == "I")
                state <= 8'd4;
              else if(char  == "G")
                state <= 8'd15;
              else if(char == "P")
                state <= 8'd30;
              else 
                state <= 8'd0;
           end
    8'd1 : if (char == "U")
                state <= 8'd2;
            else 
                state <= 8'd0;
    8'd2 : if (char == "N")
                state <= 8'd3;
            else 
                state <= 8'd0;
    8'd3 : begin
            start_car <= 1;
            state <= 8'd0;
           end
    8'd4 : if (char == "T")
                state <= 8'd5;
            else 
                state <= 8'd0;
    8'd5 : if (char == "I") 
                state <= 8'd6;
            else 
                state <= 8'd0;
    8'd6 : if (char == "S") 
                state <= 8'd7;
            else 
                state <= 8'd0;
    8'd7 : begin
            if (char == "H")
                state <= 8'd8;
            else if (char == "C")
                state <= 8'd11;
            else 
                state <= 8'd0;
           end
    8'd8 : if (char == "O")
                state <= 8'd9;
            else 
                state <= 8'd0;
    8'd9 : if (char == "T")
                state <= 8'd10;
            else 
                state <= 8'd0;
    8'd10 : begin 
                heater <= 1;
                state <= 8'd0;
            end
    8'd11 : if (char == "O")
                state <= 8'd12;
            else 
                state <= 8'd0;
    8'd12 : if (char == "L")
                state <= 8'd13;
            else 
                state <= 8'd0;
    8'd13 : if (char == "D")
                state <= 8'd14;
            else 
                state <= 8'd0;
    8'd14 : begin 
                heater <= 1;
                state <= 8'd0;
            end
    8'd15 : if (char == "O")
                state <= 8'd16;
            else 
                state <= 8'd0;
    8'd16 : if (char == "O")
                state <= 8'd17;
            else 
                state <= 8'd0;
    8'd17 : if (char == "D")
                state <= 8'd18;
            else 
                state <= 8'd0;
    8'd18 : if (char == "T")
                state <= 8'd19;
            else 
                state <= 8'd0;
    8'd19 : if (char == "E")
                state <= 8'd20;
            else 
                state <= 8'd0;
    8'd20 : if (char == "M")
                state <= 8'd21;
            else 
                state <= 8'd0;
    8'd21 : if (char == "P")
                state <= 8'd22;
            else 
                state <= 8'd0;
    8'd22 : if (char == "E")
                state <= 8'd23;
            else 
                state <= 8'd0;
    8'd23 : if (char == "R")
                state <= 8'd24;
            else 
                state <= 8'd0;
    8'd24 : if (char == "A")
                state <= 8'd25;
            else 
                state <= 8'd0;
    8'd25 : if (char == "T")
                state <= 8'd26;
            else 
                state <= 8'd0;
    8'd26 : if (char == "U")
                state <= 8'd27;
            else 
                state <= 8'd0;
    8'd27 : if (char == "R")
                state <= 8'd28;
            else 
                state <= 8'd0;
    8'd28 : if (char == "E")
                state <= 8'd29;
            else 
                state <= 8'd0;
    8'd29 : begin
                cooler <= 0;
                cooler <= 0;
                state <= 8'd0;
            end
    8'd30 : if (char == "L")
                state <= 8'd31;
            else 
                state <= 8'd0;
    8'd31 : if (char == "A")
                state <= 8'd32;
            else 
                state <= 8'd0;
    8'd32 : if (char == "Y")
                state <= 8'd33;
            else 
                state <= 8'd0;
    8'd33 : if (char == "M")
                state <= 8'd34;
            else 
                state <= 8'd0;
    8'd34 : if (char == "U")
                state <= 8'd35;
            else 
                state <= 8'd0;
    8'd35 : if (char == "S")
                state <= 8'd36;
            else 
                state <= 8'd0;
    8'd36 : if (char == "I")
                state <= 8'd37;
            else 
                state <= 8'd0;
    8'd37 : if (char == "C")
                state <= 8'd38;
            else 
                state <= 8'd0;
    8'd38 : begin
                music <= 1;
                state <= 8'd0;
            end
   default : state <= 8'd0;
endcase
end

endmodule
