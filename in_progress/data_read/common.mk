
CPPFLAGS=-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
	-D_XOPEN_SOURCE=600

SRCS = dumpread.c rot8.c rot4.c ../../sysinfo/sysinfo.c

OBJS = ${SRCS:.c=.o}

LIBS = -lrt -lm

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

dumpread: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

clean:
	rm -f $(OBJS) dumpread
