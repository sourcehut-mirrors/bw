
CPPFLAGS= -D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

CC?=/usr/bin/cc
LDIR?=	/usr/local/lib
IDIR?=	/usr/local/include
LIBS?=	-lgmp -lmpfr

SRCS = ../sysinfo/sysinfo.c ../time_and_date/timediff.c \
	mpfr_info.c

OBJS = ../sysinfo/sysinfo.o ../time_and_date/timediff.o \
	mpfr_info.o

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) $(CPPFLAGS)

mpfr_info: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR) $(CPPFLAGS) -L$(LDIR) $(LIBS)

clean:
	rm -f $(OBJS) mpfr_info
