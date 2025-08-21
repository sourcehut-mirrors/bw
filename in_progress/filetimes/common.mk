
CC?=	/usr/bin/cc

CPPFLAGS?=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
			-D_XOPEN_SOURCE=600

LIBS?=		-lrt -lm

LDIR?=		/opt/bw/lib
IDIR?=		/opt/bw/include

OBJS=		../sysinfo/sysinfo.o ../sysinfo/endian.o \
		../stat_test/file_stat_err.o

.PHONY: all
all: filetimes

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

filetimes: filetimes.o $(OBJS)
	$(CC) -o filetimes filetimes.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) filetimes.o filetimes

