
CC?=	/usr/bin/cc

CPPFLAGS=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
			-D_XOPEN_SOURCE=600

LIBS=		-lm -lpthread

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		../read_dump/read_mbrot_data.o \
			./parse_pthread_limit.o \
			../parse_num/parse_double.o \
		../read_dump/file_pointer.o \
		../read_dump/array_index.o \
		../trimmer/strtrim.o \
		../data_dump/rot4.o \
		../data_dump/rot8.o \
		../../sysinfo/sysinfo.o \
		../../stat_test/file_stat_err.o

.PHONY: all
all: mandelbrot

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -D_REENTRANT -I$(IDIR)

mandelbrot: mandelbrot.o $(OBJS)
	$(CC) -o mandelbrot mandelbrot.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -D_REENTRANT -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) mandelbrot mandelbrot.o
