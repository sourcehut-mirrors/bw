
CC?=	/usr/bin/cc

CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
		-D_XOPEN_SOURCE=500

OBJS=	blake2s.o blake2b.o

.PHONY:	all
all:	test_code

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

test_code:	test_code.o $(OBJS)
		$(CC) -o test_code test_code.o $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY:	clean
clean:
	rm -f $(OBJS) test_code.o test_code

