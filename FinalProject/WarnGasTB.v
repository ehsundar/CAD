`timescale 1ns / 1ns

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

  if (warn_gas != 1)
    $display("Assert Error: warn_gas must be on");
  else
    $display("Assert Correct: warn_gas is on");
  #20;

  gas = 10; 
  #20;

  if (warn_gas != 0)
    $display("Assert Error: warn_gas must be off");
  else
    $display("Assert Correct: warn_gas is off");
  #20;

  gas = 30; 

  #500 $finish;
 end
      
endmodule
