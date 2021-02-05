`timescale 1ns / 1ns

module ElevatorTB ();

reg clock;
reg reset;
reg off_btn;
reg [31:0]position;
reg [31:0]floor_press_event;
reg [31:0]cabin_press_event;
reg signed [31:0]temp;
wire door;
wire cooler;
wire heater;
wire motor_up;
wire motor_down;

Elevator inst(
  clock,
  reset,
  off_btn,
  position,
  floor_press_event,
  cabin_press_event,
  temp,
  door,
  cooler,
  heater,
  motor_up,
  motor_down
);

initial begin
clock = 0;
forever #1 clock = ~clock;
end 

initial begin
// Initialize Inputs
  $dumpfile("ElevatorTB.vcd");
  $dumpvars(0, ElevatorTB);

  reset = 1;
  off_btn = 0;
  #10;

  reset = 0;
  position = 1;
  #10

  cabin_press_event = 2;
  #5;

  position = 2;
  #5;

  #50 $finish;
 end

endmodule
