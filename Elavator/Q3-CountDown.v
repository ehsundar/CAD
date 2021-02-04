module CountDown (
	input position,
	input reg [0:1][0:9] pressed,
	output cnt,
);

initial begin
	cnt = 0;
end


always @ (posedge clock)
begin
	integer i;
	for (i = 0; i < 10; i = i + 1) begin
		if (pressed[0][i]) begin
			cnt <= cnt + 1;
		end
	end
end

endmodule

