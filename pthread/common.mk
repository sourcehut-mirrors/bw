CC?=	/usr/bin/cc

CPPFLAGS?= -D_LARGEFILE64_SOURCE \
        -D_XOPEN_SOURCE=600 -D_REENTRANT \
        -D_FILE_OFFSET_BITS=64

LIBS?=		-lpthread -lrt -lm

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		enqueue.o dequeue.o \
			q_create.o q_destroy.o do_work.o fib.o \
			../sysinfo/sysinfo.o

.PHONY: all
all: q_work

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

q_work: q_work.o $(OBJS)
	$(CC) -o q_work q_work.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) q_work.o q_work

