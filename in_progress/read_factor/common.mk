
CPPFLAGS=-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
	-D_XOPEN_SOURCE=600

SRCS = filepath_ptr.c pathname_trim.c read_factors.c readline.c \
	../../stat_test/file_stat_err.c

OBJS = ${SRCS:.c=.o}

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

read_factors: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

clean:
	rm -f $(OBJS) read_factors
