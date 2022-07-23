
CC?=	/usr/bin/cc

CPPFLAGS=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
			-D_XOPEN_SOURCE=600

LIBS=		-lm

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		../../sysinfo/sysinfo.o \
		../trimmer/strtrim.o \
		../data_dump/rot4.o \
		../data_dump/rot8.o \
		../../stat_test/file_stat_err.o

.PHONY: all
all: dumpread

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

dumpread: dumpread.o $(OBJS)
	$(CC) -o dumpread dumpread.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) dumpread.o dumpread
