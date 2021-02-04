module test();

reg clock=0, is_day, ring_req;
reg reset, music_req, light_req, curtain_req;
reg [31:0]temp_req;
reg [7:0]char_req;
wire music, curtain, light, window, cooler, heater;

smart_house_function smart(
    clock, reset, , music_req, is_day, light_req, curtain_req, temp_req, char_req,
    music, curtain, light, window, cooler, heater
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, test);

    reset = 1;
    // music_req = 0;
    // light_req = 0;
    // curtain_req = 0;
    
    #500 $finish;
end

always #1 clock = !clock;

initial begin
    
    // always @(posedge clock) begin
    //     music_req = 0;
    //     light_req = 0;
    //     curtain_req = 0;
    // end

    //temp_req = 10;

    temp_req = 10;

    #100;
    temp_req = 20;

    #100;
    temp_req = 30;

    #100;
end

endmodule
