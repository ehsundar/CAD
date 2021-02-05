`timescale 1ns / 1ns

module SmartHouseTB ();

reg clock, reset, isday, music_req, light_req, curtain_req, ring_req;
reg signed [31:0]temp_req;
reg [7:0]char_req;
wire music, curtain, light, window, cooler, heater;

SmartHouse inst(
    clock,
    reset,
    isday,
    music_req,
    light_req,
    curtain_req,
    ring_req,
    temp_req,
    char_req,
    music,
    curtain,
    light,
    window,
    cooler,
    heater
);

initial begin
    clock = 0;
    forever #10 clock = ~clock;
end 

initial begin
    $dumpfile("SmartHouseTB.vcd");
    $dumpvars(0, SmartHouseTB);
    
    reset = 1;
    #30;
    reset = 0;
    temp_req = 25;

    isday = 0;
    #20;

    if (curtain != 0)
        $display("Assert Error: curtain must be close");
    else
        $display("Assert Correct: curtain is close");

    
    temp_req = 35;
    #20;
    if (cooler != 0)
        $display("Assert Error: cooler must be on");
    else
        $display("Assert Correct: cooler is on");

    #100;
    if (window != 0)
        $display("Assert Error: window must be closed");
    else
        $display("Assert Correct: window is closed");
    
    char_req = "O"; #20;
    char_req = "P"; #20;
    char_req = "E"; #20;
    char_req = "N"; #20;
    char_req = "W"; #20;
    char_req = "I"; #20;
    char_req = "N"; #20;
    char_req = "D"; #20;
    char_req = "O"; #20;
    char_req = "W"; #20;

    if (window != 1)
        $display("Assert Error: window must be open");
    else
        $display("Assert Correct: window is open");

    #50 $finish;
end

endmodule
