
CC?=	/usr/bin/cc

CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=600

OBJS=		./popcount.o

.PHONY: all
all: test_popcount

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I.

test_popcount: test_popcount.o $(OBJS)
	$(CC) -o test_popcount test_popcount.o $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) test_popcount.o test_popcount
