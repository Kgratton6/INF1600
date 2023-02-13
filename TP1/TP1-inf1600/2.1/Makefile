CC=gcc
CFLAGS=-g -g -Wall
RM=rm -f
TARGET=exec
OBJECTS=exo1.o
LDLIBS = -lm

.PHONY: clean

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

all: exec

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $(LDLIBS) -o $@ $^

clean:
	$(RM) *.o $(TARGET)
	
