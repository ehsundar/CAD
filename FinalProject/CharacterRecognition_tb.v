// `timescale 1ns / 1ns

module CharacterRecognitionTB ();

reg clock, reset;
reg [7:0] char;
wire start_car;
wire heater;
wire cooler;
wire music;

CharacterRecognition inst(
  clock, 
  reset, 
  char,
  start_car, 
  heater,
  cooler,
  music
);

initial begin
clock = 0;
forever #10 clock = ~clock;
end 

initial begin
// Initialize Inputs
  $dumpfile("CharacterRecognitionTB.vcd");
  $dumpvars(0, CharacterRecognitionTB);
  char = 0;
  reset = 1;
  // Wait 100 ns for global reset to finish
  #30;
  reset = 0;

  char = "R"; #20;
  char = "U"; #20;
  char = "N"; #20;
  
  #20

  char = "I"; #20;
  char = "T"; #20;
  char = "I"; #20;
  char = "S"; #20;
  char = "C"; #20;
  char = "O"; #20;
  char = "L"; #20;
  char = "D"; #20;
  
  #20

  char = "P"; #20;
  char = "L"; #20;
  char = "A"; #20;
  char = "Y"; #20;
  char = "M"; #20;
  char = "U"; #20;
  char = "S"; #20;
  char = "I"; #20;
  char = "C"; #20;
  

  #50 $finish;
 end

endmodule
