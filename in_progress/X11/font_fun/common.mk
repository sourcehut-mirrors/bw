CC?=		/usr/bin/cc
CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

LIBS?=		-lX11 -lm

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		../../../xwin/create_gc.o \
		../../../xwin/create_borderless_topwin.o \
		../../../sysinfo/sysinfo.o

.PHONY: all
all: font_err

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

font_err: font_err.o $(OBJS)
	$(CC) -o font_err font_err.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) font_err.o font_err
