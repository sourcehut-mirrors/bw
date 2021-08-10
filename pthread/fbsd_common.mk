CC?=		/usr/bin/cc
CPPFLAGS=	-D_TS_ERRNO -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600 -D_REENTRANT

LIBS=		-lpthread -lrt

OBJS=		../sysinfo/sysmem.o \
		../sysinfo/sysinfo.o \
		../sysinfo/ru.o \
		q_work.o enqueue.o dequeue.o q_create.o \
		q_destroy.o do_work.o fib.o

.PHONY: all
all: q_work

q_work: $(OBJS)
	$(CC) -o q_work $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) q_work
