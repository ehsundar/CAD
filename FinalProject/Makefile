CC = iverilog
FLAGS = -Wall -Winfloop

all: WarnEngineOil.o CharacterRecognition.o WarnBreakOil.o

WarnEngineOil.o: WarnEngineOil.v WarnEngineOilTB.v
	$(CC) $(FLAGS) -o WarnEngineOil.o WarnEngineOil.v WarnEngineOilTB.v

WarnBreakOil.o: clean WarnBreakOil.v WarnBreakOilTB.v
	$(CC) $(FLAGS) -o WarnBreakOil.o WarnBreakOil.v WarnBreakOilTB.v

CharacterRecognition.o: CharacterRecognition.v CharacterRecognition_tb.v
	$(CC) $(FLAGS) -o CharacterRecognition.o CharacterRecognition.v CharacterRecognition_tb.v
 
test: clean WarnEngineOil.o CharacterRecognition.o WarnBreakOil.o
	vvp WarnEngineOil.o
	vvp CharacterRecognition.o
  vvp WarnBreakOil.o

clean:
	rm *.o 2>/dev/null || true
