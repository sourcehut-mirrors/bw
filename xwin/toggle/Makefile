

CC=gcc
CFLAGS=-Wall -O2 `pkg-config --cflags x11`
LDFLAGS=`pkg-config --libs x11`

SOURCES=toggle-decorations.c
EXECUTABLE=$(patsubst %.c,%,$(SOURCES))

all: $(EXECUTABLE)

clean: $(EXECUTABLE)
	rm $(EXECUTABLE)

.PHONY: all clean

