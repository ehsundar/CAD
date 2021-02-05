all: smartHouse.o CharacterRecognition.o

smartHouse.o: smartHouse.v smartHouse_tb.v
	iverilog -o smartHouse.o smartHouse.v smartHouse_tb.v

CharacterRecognition.o: CharacterRecognition.v CharacterRecognition_tb.v
	iverilog -o CharacterRecognition.o CharacterRecognition.v CharacterRecognition_tb.v

test: clean smartHouse.o CharacterRecognition.o
	vvp smartHouse.o
	vvp CharacterRecognition.o

clean:
	rm *.o 2>/dev/null || true
	rm *.vcd 2>/dev/null || true
