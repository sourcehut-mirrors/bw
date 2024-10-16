CC?=		/usr/bin/cc

CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

LIBS?=		-lm

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		../../../sysinfo/sysinfo.o

.PHONY: all
all: rpmread

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

rpmread: rpmread.o $(OBJS)
	$(CC) -o rpmread rpmread.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) rpmread rpmread.o

