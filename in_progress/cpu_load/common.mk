CC?=		/usr/bin/cc
CPPFLAGS=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600 -D_REENTRANT

LIBS=		-lpthread -lrt

OBJS=		main.o fib_sleep.o dispatch.o \
		../../sysinfo/sysinfo.o \
		../../time_and_date/timediff.o \
		../../pthread/fib.o

.PHONY: all
all: main

main: $(OBJS)
	$(CC) -o main $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) main
