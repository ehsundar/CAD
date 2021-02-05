`timescale 1ns / 1ns

module MusicOffWhenPhoneRingsTB ();

reg clock, reset, is_ringing, is_playing;
wire music;

MusicOffWhenPhoneRings inst(
  clock, reset, is_ringing, is_playing,
  music
);

initial begin
    clock = 0;
    forever #10 clock = ~clock;
end 

initial begin
    $dumpfile("MusicOffWhenPhoneRingsTB.vcd");
    $dumpvars(0, MusicOffWhenPhoneRingsTB);
    reset = 1;
    
    #30;
    reset = 0;

    is_playing = 0;
    is_ringing = 0;
    #30;

    is_playing = 1;
    is_ringing = 1;
    #50;

    if (music != 0)
      $display("Assert Error: music must be off");

    #50 $finish;
end

endmodule
