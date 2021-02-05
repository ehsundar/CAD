`timescale 1ns / 1ns

module CharacterRecognitionTB ();

reg clock, reset;
reg [7:0] char;
wire window;

CharacterRecognition inst(
  clock, 
  reset, 
  char,
  window
);

initial begin
clock = 0;
forever #10 clock = ~clock;
end 

initial begin
    $dumpfile("CharacterRecognitionTB.vcd");
    $dumpvars(0, CharacterRecognitionTB);
    char = 0;
    reset = 1;
    #30;
    reset = 0;

    char = "O"; #20;
    char = "P"; #20;
    char = "E"; #20;
    char = "N"; #20;
    char = "W"; #20;
    char = "I"; #20;
    char = "N"; #20;
    char = "D"; #20;
    char = "O"; #20;
    char = "W"; #20;

    #50 $finish;
 end

endmodule
