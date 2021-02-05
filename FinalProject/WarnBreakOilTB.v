`timescale 1ns / 1ps

module WarnBreakOilTB ();

reg clock, reset;
reg signed [31:0] break_oil;
wire warn_break_oil;

WarnBreakOil inst(
  clock, 
  reset, 
  break_oil, 
  warn_break_oil);

initial begin
clock = 0;
forever #1 clock = ~clock;
end 

initial begin
  $dumpfile("WarnBreakOilTest.vcd");
  $dumpvars(0, WarnBreakOilTB);
  
  break_oil = 0;
  reset = 1;
  
  #30;
  
  reset = 0;
  #40;
  
  break_oil = 10;
  #10;
  
  break_oil = 9;
  #10;

  break_oil = 10; 
  #20;

  break_oil = 30; 

  #500 $finish;
 end
      
endmodule
