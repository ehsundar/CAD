CC = iverilog
FLAGS = -Wall -Winfloop

all: clean WarnEngineOil.o WarnBreakOil.o WarnGas.o WarnDoorOpen.o CharacterRecognition.o

WarnDoorOpen.o: clean WarnDoorOpen.v WarnDoorOpenTB.v
	$(CC) $(FLAGS) -o WarnDoorOpen.o WarnDoorOpen.v WarnDoorOpenTB.v

WarnGas.o: clean WarnGas.v WarnGasTB.v
	$(CC) $(FLAGS) -o WarnGas.o WarnGas.v WarnGasTB.v

WarnBreakOil.o: clean WarnBreakOil.v WarnBreakOilTB.v
	$(CC) $(FLAGS) -o WarnBreakOil.o WarnBreakOil.v WarnBreakOilTB.v

WarnEngineOil.o: WarnEngineOil.v WarnEngineOilTB.v
	$(CC) $(FLAGS) -o WarnEngineOil.o WarnEngineOil.v WarnEngineOilTB.v

CharacterRecognition.o: CharacterRecognition.v CharacterRecognition_tb.v
	$(CC) $(FLAGS) -o CharacterRecognition.o CharacterRecognition.v CharacterRecognition_tb.v

test: clean WarnEngineOil.o WarnBreakOil.o WarnGas.o WarnDoorOpen.o CharacterRecognition.o
	vvp WarnEngineOil.o
	vvp WarnBreakOil.o
	vvp WarnGas.o
	vvp WarnDoorOpen.o
	vvp CharacterRecognition.o

clean:
	rm *.o 2>/dev/null || true