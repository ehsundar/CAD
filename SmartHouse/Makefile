smartHouse: smartHouse.v smartHouse_tb.v
	iverilog -o smartHouse smartHouse.v smartHouse_tb.v

test: smartHouse
	vvp smartHouse

clean:
	rm smartHouse
