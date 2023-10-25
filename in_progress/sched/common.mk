CC?=		/usr/bin/cc
CPPFLAGS=	-D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600 -D_REENTRANT

LIBS?=		-lpthread -lrt -lm

OBJS=	../../sysinfo/sysinfo.o \
	../../time_and_date/timediff.o \
	sched.o

.PHONY: all
all: sched

sched: $(OBJS)
	$(CC) -o sched $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) sched
