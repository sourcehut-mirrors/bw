
CC?=	/usr/bin/cc

CPPFLAGS=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
			-D_XOPEN_SOURCE=600

LIBS=		-lm

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		./read_mbrot_data.o ./file_pointer.o \
		./array_index.o \
		../trimmer/strtrim.o \
		../data_dump/rot4.o \
		../data_dump/rot8.o \
		../../sysinfo/sysinfo.o \
		../../stat_test/file_stat_err.o

.PHONY: all
all: xmand_read

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

xmand_read: xmand_read.o $(OBJS)
	$(CC) -o xmand_read xmand_read.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) xmand_read.o xmand_read
