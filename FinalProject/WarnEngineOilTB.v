`timescale 1ns / 1ps

module WarnEngineOilTB ();

reg clock, reset;
reg signed [31:0] engine_oil;
wire warn_engine_oil;

WarnEngineOil1 inst(
  clock, 
  reset, 
  engine_oil, 
  warn_engine_oil);

initial begin
clock = 0;
forever #1 clock = ~clock;
end 

initial begin
  $dumpfile("WarnEngineOilTest.vcd");
  $dumpvars(0, WarnEngineOilTB);
  
  engine_oil = 0;
  reset = 1;
  
  #30;
  
  reset = 0;
  #40;
  
  engine_oil = 10;
  #10;
  
  engine_oil = 9;
  #10;

  engine_oil = 10; 
  #20;

  engine_oil = 30; 

  #500 $finish;
 end
      
endmodule
