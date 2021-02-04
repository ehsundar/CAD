smartHouse: clean smartHouse.v smartHouse_tb.v
	iverilog -o smartHouse smartHouse.v smartHouse_tb.v

test: clean smartHouse
	vvp smartHouse

clean:
	rm smartHouse || true
