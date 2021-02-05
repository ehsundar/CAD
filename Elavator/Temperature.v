`timescale 1ns / 1ns

module Temperature(
  input clock, 
  input reset,
  input off_btn,
  input signed[7:0] temp,
  output reg cooler,
  output reg heater
);

reg [2:0] state;


initial begin
    state <= 1;
end

always @ (posedge clock)
begin
    if (off_btn == 1'b1) 
        state <= 3'd0;
    else
    begin
        if (reset == 1'b1)
            state <= 3'd1;
        else
        begin
            case(state)
            3'd1:
            begin
                if (temp == 25)
                    state <= 3'd2;
                else if (temp >= 26)
                    state <= 3'd3;
                else
                    state <= 3'd4;
            end
            3'd2:
            begin
                state <= 3'd1;
                cooler <= 1'b0;
                heater <= 1'b0;
            end 
            3'd3:
            begin
                state <= 3'd1;
                cooler <= 1'b1;
            end 
            3'd4:
            begin
                state <= 3'd1;
                heater <= 1'b1;
            end 
            default:
                state <= 3'd1;
        end
    end
end

endmodule
