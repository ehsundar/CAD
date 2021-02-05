all: SmartHouse.o CharacterRecognition.o

SmartHouse.o: SmartHouse.v SmartHouse_tb.v
	iverilog -o SmartHouse.o SmartHouse.v SmartHouse_tb.v

CharacterRecognition.o: CharacterRecognition.v CharacterRecognition_tb.v
	iverilog -o CharacterRecognition.o CharacterRecognition.v CharacterRecognition_tb.v

test: clean SmartHouse.o CharacterRecognition.o
	vvp SmartHouse.o
	vvp CharacterRecognition.o

clean:
	rm *.o 2>/dev/null || true
	rm *.vcd 2>/dev/null || true
