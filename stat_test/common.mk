
CC?=	/usr/bin/cc

CPPFLAGS=	-D_LARGEFILE64_SOURCE \
		-D_FILE_OFFSET_BITS=64 \
		-D_XOPEN_SOURCE=600

LIBS=		-lm

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		./file_stat_err.o ../sysinfo/sysinfo.o

.PHONY: all
all: check_file_stat

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

check_file_stat: check_file_stat.o $(OBJS)
	$(CC) -o check_file_stat check_file_stat.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) check_file_stat.o check_file_stat
