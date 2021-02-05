CC = iverilog
FLAGS = -Wall -Winfloop

all: WarnEngineOil.o CharacterRecognition.o

WarnEngineOil.o: WarnEngineOil.v WarnEngineOilTB.v
	$(CC) $(FLAGS) -o WarnEngineOil.o WarnEngineOil.v WarnEngineOilTB.v

CharacterRecognition.o: CharacterRecognition.v CharacterRecognition_tb.v
	$(CC) $(FLAGS) -o CharacterRecognition.o CharacterRecognition.v CharacterRecognition_tb.v
 
test: clean WarnEngineOil.o CharacterRecognition.o
	vvp WarnEngineOil.o
	vvp CharacterRecognition.o

clean:
	rm *.o 2>/dev/null || true
