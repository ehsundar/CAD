`timescale 1ns / 1ns

module WarnDoorOpenTB ();

reg clock, reset;
reg door_open;
wire warn_door_open;

WarnDoorOpen inst(
  clock, 
  reset, 
  door_open, 
  warn_door_open);

initial begin
clock = 0;
forever #1 clock = ~clock;
end 

initial begin
  $dumpfile("WarnDoorOpenTest.vcd");
  $dumpvars(0, WarnDoorOpenTB);
  
  door_open = 0;
  reset = 1;
  
  #30;
  
  reset = 0;
  #40;
  
  door_open = 1;
  #10;
  
  if (warn_door_open != 1)
    $display("Assert Error: warn_door_open must be on");
  else
    $display("Assert Correct: warn_door_open is on");
  #20;

  door_open = 0;
  #10;

  if (warn_door_open != 0)
    $display("Assert Error: warn_door_open must be off");
  else
    $display("Assert Correct: warn_door_open is off");
  #20;

  door_open = 1; 
  #20;

  door_open = 0; 

  #50 $finish;
 end
      
endmodule
