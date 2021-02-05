CC = iverilog
FLAGS = -Wall -Winfloop

all: clean Elevator.o Temperature.o

Elevator.o: Elevator.v Elevator_tb.v
	$(CC) $(FLAGS) -o Elevator.o Elevator.v Elevator_tb.v

Temperature.o: Temperature.v Temperature_tb.v
	$(CC) $(FLAGS) -o Temperature.o Temperature.v Temperature_tb.v

test: clean Elevator.o Temperature.o
	vvp Elevator.o
	vvp Temperature.o

clean:
	rm *.o 2>/dev/null || true
	rm *.vcd 2>/dev/null || true
