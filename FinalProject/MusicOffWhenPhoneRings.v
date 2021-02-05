module MusicOffWhenPhoneRings (
    input clock,
    input reset,
    input is_ringing,
    input is_playing,
    output reg music
);

parameter SIZE  = 2;
reg [SIZE-1:0] state;

parameter Q0_Init = 8'd0;
parameter Q1_MusicOff = 8'd1;
parameter Q2_MusicResume = 8'd2;

initial begin
    music = 1;
end

always @ (posedge clock)
begin: MusicFSM 
    if (reset == 1) 
        begin
            state <= #1 Q0_Init;
        end 
    else
        case(state)
            Q0_Init: 
            begin
                if ((is_playing == 1) && (is_ringing == 1))
                    state <= Q1_MusicOff;
                else 
                    state <= Q0_Init; 
            end
            Q1_MusicOff:
            begin
                music <= 0;
                if (is_ringing == 0)
                    state <= Q2_MusicResume;
                else 
                    state <= Q1_MusicOff;
            end
            Q2_MusicResume: 
            begin
                music <= 1;
                state <= Q0_Init;
            end
            default:
                state <= Q0_Init;
        endcase
end

endmodule
