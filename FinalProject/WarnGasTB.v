`timescale 1ns / 1ps

module WarnGasTB ();

reg clock, reset;
reg signed [31:0] gas;
wire warn_gas;

WarnGas inst(
  clock, 
  reset, 
  gas, 
  warn_gas);

initial begin
clock = 0;
forever #1 clock = ~clock;
end 

initial begin
  $dumpfile("WarnGasTest.vcd");
  $dumpvars(0, WarnGasTB);
  
  gas = 0;
  reset = 1;
  
  #30;
  
  reset = 0;
  #40;
  
  gas = 10;
  #10;
  
  gas = 9;
  #10;

  gas = 10; 
  #20;

  gas = 30; 

  #500 $finish;
 end
      
endmodule
