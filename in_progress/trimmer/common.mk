
CPPFLAGS=-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
	-D_XOPEN_SOURCE=600

SRCS = test.c strtrim.c ../../sysinfo/sysinfo.c

OBJS = ${SRCS:.c=.o}

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

test: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(CPPFLAGS)

clean:
	rm -f $(OBJS) test
