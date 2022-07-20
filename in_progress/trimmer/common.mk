
CPPFLAGS=-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
	-D_XOPEN_SOURCE=500

SRCS = test.c strtrim.c

OBJS = ${SRCS:.c=.o}

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

test: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(CPPFLAGS)

clean:
	rm -f $(OBJS) test
