CC = iverilog
FLAGS = -Wall -Winfloop

all: clean WarnEngineOil.o WarnBreakOil.o WarnDoorOpen.o test

WarnDoorOpen.o: clean WarnDoorOpen.v WarnDoorOpenTB.v
	$(CC) $(FLAGS) -o WarnDoorOpen.o WarnDoorOpen.v WarnDoorOpenTB.v

WarnBreakOil.o: clean WarnBreakOil.v WarnBreakOilTB.v
	$(CC) $(FLAGS) -o WarnBreakOil.o WarnBreakOil.v WarnBreakOilTB.v

WarnEngineOil.o: clean WarnEngineOil.v WarnEngineOilTB.v
	$(CC) $(FLAGS) -o WarnEngineOil.o WarnEngineOil.v WarnEngineOilTB.v

test: clean WarnEngineOil.o WarnBreakOil.o WarnDoorOpen.o
	vvp WarnEngineOil.o
	vvp WarnBreakOil.o
	vvp WarnDoorOpen.o

clean:
	rm WarnEngineOil.o 2>/dev/null || true
	rm WarnBreakOil.o 2>/dev/null || true
	rm WarnDoorOpen.o 2>/dev/null || true