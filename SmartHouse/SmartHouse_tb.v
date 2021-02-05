`timescale 1ns / 1ns

module SmartHouseTB ();

reg clock, reset, isday, ring_req;
reg signed [31:0]temp_req;
wire music, curtain, light, cooler, heater;

SmartHouse inst(
    clock,
    reset,
    isday,
    ring_req,
    temp_req,
    music,
    curtain,
    light,
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

    #50 $finish;
end

endmodule
