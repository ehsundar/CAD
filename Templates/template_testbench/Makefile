CC = iverilog 
FLAGS = -Wall -Winfloop
library_input: one.v one_tb.v
	$(CC) $(FLAGS) -o test one.v one_tb.v 
	vvp	test