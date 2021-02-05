module NearestDown (
	input position,
	input reg [0:1][0:9] pressed,
	output nearest_floor,
);

integer i;

initial begin
	nearest_floor = -100;
end


always @ (posedge clock)
begin
	for (i = position; i >= 0; i = i - 1) begin
		if (pressed[0][i]) begin
			nearest_floor <= (position - 1);
			i <= -100;
		end
	end
end

endmodule
