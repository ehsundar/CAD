CC = iverilog
FLAGS = -Wall -Winfloop

WarnEngineOil.o: clean WarnEngineOil.v WarnEngineOilTB.v
	$(CC) $(FLAGS) -o WarnEngineOil.o WarnEngineOil.v WarnEngineOilTB.v

test: clean WarnEngineOil.o
	vvp WarnEngineOil.o

clean:
	rm WarnEngineOil.o 2>/dev/null