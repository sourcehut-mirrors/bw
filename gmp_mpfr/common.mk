
CPPFLAGS= -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=600

CC?=/usr/bin/cc
LDIR?=	/opt/bw/lib
IDIR?=	/opt/bw/include
LIBS?=	-lgmp -lmpfr

SRCS = ../sysinfo/sysinfo.c ../sysinfo/endian.c \
	../time_and_date/timediff.c mpfr_info.c

OBJS = ../sysinfo/sysinfo.o ../sysinfo/endian.o \
	../time_and_date/timediff.o mpfr_info.o

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) -I../sysinfo $(CPPFLAGS)

mpfr_info: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR) $(CPPFLAGS) -L$(LDIR) $(LIBS)

clean:
	rm -f $(OBJS) mpfr_info

