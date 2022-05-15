
CPPFLAGS=-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE

SRCS = timedump.c ../../sysinfo/sysinfo.c

OBJS = timedump.o ../../sysinfo/sysinfo.o

LIBS = -lrt

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

timedump: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

clean:
	rm -f $(OBJS) timedump
