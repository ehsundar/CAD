`timescale 1ns / 1ns

module TemperatureTB ();

reg clock, reset, off_btn;
reg signed [31:0]temp;
wire cooler, heater;

Temperature inst(
  clock, 
  reset,
  off_btn,
  temp,
  cooler,
  heater
);

initial begin
clock = 0;
forever #10 clock = ~clock;
end 

initial begin
  $dumpfile("TemperatureTB.vcd");
  $dumpvars(0, TemperatureTB);
  
  reset = 1;  
  #30;
  reset = 0;
  #40;
  
  temp = 100;
  #20;

  if (cooler != 1)
    $display("Assert Error: warn_engine_oil must be on");
  else
    $display("Assert Correct: warn_engine_oil is on");
  #20;
  
  temp = 9;
  #10;

  #50 $finish;
 end
      
endmodule
