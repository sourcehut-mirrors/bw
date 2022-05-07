
CPPFLAGS= -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE

SRCS = filetimes.c ../sysinfo/sysinfo.c
OBJS = filetimes.o ../sysinfo/sysinfo.o

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

filetimes: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(CPPFLAGS)

clean:
	rm -f $(OBJS) filetimes
