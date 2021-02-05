// `timescale 1ns / 1ps

module WarnDoorOpenTB;

wire  clock, reset, door_open;
reg warn_door_open;

WarnDoorOpen inst(
  clock, 
  reset, 
  door_open, 
  warn_door_open
  );

initial begin
 clock = 0;
 forever #1 clock = ~clock;
 end 

initial begin
// Initialize Inputs
  $dumpfile("WarnDoorOpen.vcd");
  $dumpvars(0, WarnDoorOpenTB);
  door_open = 0;
  reset = 1;
  // Wait 100 ns for global reset to finish
  #30;
      reset = 0;
  #40;
  door_open = 1;
  #10; // wait for period 
  door_open = 0;
  #500 $finish;
 end
      
endmodule
