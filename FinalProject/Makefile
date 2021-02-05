CC = iverilog
FLAGS = -Wall -Winfloop

WarnBreakOil.o: clean WarnBreakOil.v WarnBreakOilTB.v
	$(CC) $(FLAGS) -o WarnBreakOil.o WarnBreakOil.v WarnBreakOilTB.v

WarnEngineOil.o: clean WarnEngineOil.v WarnEngineOilTB.v
	$(CC) $(FLAGS) -o WarnEngineOil.o WarnEngineOil.v WarnEngineOilTB.v

test: clean WarnEngineOil.o WarnBreakOil.o
	vvp WarnEngineOil.o
	vvp WarnBreakOil.o

clean:
	rm WarnEngineOil.o 2>/dev/null || true
	rm WarnBreakOil.o 2>/dev/null || true