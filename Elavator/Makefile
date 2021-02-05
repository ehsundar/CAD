CC = iverilog
FLAGS = -Wall -Winfloop

all: clean Elevator.o

Elevator.o: Elevator.v Elevator_tb.v
	$(CC) $(FLAGS) -o Elevator.o Elevator.v Elevator_tb.v

test: clean Elevator.o
	vvp Elevator.o

clean:
	rm *.o 2>/dev/null || true
	rm *.vcd 2>/dev/null || true
