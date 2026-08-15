
CC?=	/usr/bin/cc

CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
		-D_XOPEN_SOURCE=500

OBJS=	blake2s.o

.PHONY:	all
all:	blake2s256_trivial

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

blake2s256_trivial:	blake2s256_trivial.o $(OBJS)
		$(CC) -o blake2s256_trivial blake2s256_trivial.o $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY:	clean
clean:
	rm -f $(OBJS) blake2s256_trivial.o blake2s256_trivial

