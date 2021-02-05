CC = iverilog
FLAGS = -Wall -Winfloop

all: clean WarnEngineOil.o WarnBreakOil.o WarnDoorOpen.o CharacterRecognition.o MusicOffWhenPhoneRings.o

WarnDoorOpen.o: clean WarnDoorOpen.v WarnDoorOpenTB.v
	$(CC) $(FLAGS) -o WarnDoorOpen.o WarnDoorOpen.v WarnDoorOpenTB.v

WarnBreakOil.o: clean WarnBreakOil.v WarnBreakOilTB.v
	$(CC) $(FLAGS) -o WarnBreakOil.o WarnBreakOil.v WarnBreakOilTB.v

WarnEngineOil.o: WarnEngineOil.v WarnEngineOilTB.v
	$(CC) $(FLAGS) -o WarnEngineOil.o WarnEngineOil.v WarnEngineOilTB.v

CharacterRecognition.o: CharacterRecognition.v CharacterRecognition_tb.v
	$(CC) $(FLAGS) -o CharacterRecognition.o CharacterRecognition.v CharacterRecognition_tb.v

MusicOffWhenPhoneRings.o: MusicOffWhenPhoneRings.v MusicOffWhenPhoneRings_tb.v
	$(CC) $(FLAGS) -o MusicOffWhenPhoneRings.o MusicOffWhenPhoneRings.v MusicOffWhenPhoneRings_tb.v

test: clean WarnEngineOil.o WarnBreakOil.o WarnDoorOpen.o CharacterRecognition.o MusicOffWhenPhoneRings.o
	vvp WarnEngineOil.o
	vvp WarnBreakOil.o
	vvp WarnDoorOpen.o
	vvp CharacterRecognition.o
	vvp MusicOffWhenPhoneRings.o

clean:
	rm *.o 2>/dev/null || true
	rm *.vcd 2>/dev/null || true
