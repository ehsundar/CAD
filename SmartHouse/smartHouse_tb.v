module test();

reg clock;
wire reset, music_req, light_req, curtain_req;
wire [31:0]temp_req;
wire [7:0]char_req;
wire music, curtain, light, window, cooler, heater;

smart_house_function smart(
    clock, reset, music_req, light_req, curtain_req, temp_req, char_req,
    music, curtain, light, window, cooler, heater
);

initial begin
    $monitor("%b", clock);
    
    forever #10 clock = ~clock;
end

endmodule
