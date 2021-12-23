
CC?=		/usr/bin/cc
CPPFLAGS=	-D_TS_ERRNO -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600

OBJS=		schadenfreude.o tt800.o ../sysinfo/sysinfo.o \
		../time_and_date/timediff.o

.PHONY: all
all: schadenfreude

schmuck: $(OBJS)
	$(CC) -o schadenfreude $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) schadenfreude
