#Makefile: Project 2 Computer Systems 
#Name: Rishabh Sharma 
#Username: rishabhs
#Student number: 694739

## CC  = Compiler.
## CFLAGS = Compiler flags.

CC	= gcc
CFLAGS 	=  -Wall
OBJ = connect.o server.o client.o mastermind.o
EXE = client server 
all: server client connect.o mastermind.o logger.o

connect.o:
	$(CC) $(CFLAGS) -c connect.c

mastermind.o:
	$(CC) $(CFLAGS) -c mastermind.c

logger.o:
	$(CC) $(CFLAGS) -c logger.c -pthread


server: connect.o mastermind.o logger.o
	$(CC) $(CFLAGS) -o server server.c connect.o mastermind.o logger.o -pthread


client: connect.o mastermind.o logger.o
	$(CC) $(CFLAGS) -o client client.c connect.o mastermind.o logger.o


## Clean: Remove object files and core dump files.
clean:
		bin/rm $(OBJ)

## Clobber: Performs Clean and removes executable file.

clobber: clean
		/bin/rm $(EXE)
