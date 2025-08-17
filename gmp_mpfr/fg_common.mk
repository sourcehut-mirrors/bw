
CPPFLAGS?= -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=600

LDIR?=	/opt/bw/lib
IDIR?=	/opt/bw/include
ITIME?=	../time_and_date

LIBS?=	-lgmp -lmpfr

SRCS = ../sysinfo/sysinfo.c ../sysinfo/endian.c \
	../time_and_date/tdiff.c gmp_mpfr_ver.c fgruenberger.c

OBJS = ../sysinfo/sysinfo.o ../sysinfo/endian.o \
	../time_and_date/tdiff.o gmp_mpfr_ver.o fgruenberger.o

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) -I$(ITIME) $(CPPFLAGS)

fgruenberger: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR) \
	-Wl,-enable-new-dtags $(CPPFLAGS) -L$(LDIR) $(LIBS)

clean:
	rm -f $(OBJS) fgruenberger
