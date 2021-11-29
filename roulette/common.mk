
CC?=		/usr/bin/cc
CPPFLAGS=	-D_TS_ERRNO -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600

OBJS=		schmuck.o tt800.o ../sysinfo/sysinfo.o

.PHONY: all
all: schmuck

schmuck: $(OBJS)
	$(CC) -o schmuck $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) schmuck
