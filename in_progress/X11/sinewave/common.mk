
CPPFLAGS=	-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
			-D_XOPEN_SOURCE=600

LIBS?=		-lX11 -lpng -lm

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS = ../../../sysinfo/sysinfo.o \
	   ../../../sysinfo/endian.o

.PHONY: all
all: sinewave

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

sinewave: sinewave.o $(OBJS)
	$(CC) -o sinewave sinewave.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) sinewave.o sinewave

