
CC?=		/usr/bin/cc
CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600 \
		-D_FILE_OFFSET_BITS=64

LIBS?=		-lX11 -lm

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		../../../xwin/x_error_handler.o \
		../../../xwin/create_gc.o \
		../../../xwin/create_borderless_topwin.o \
		../../../sysinfo/sysinfo.o \
		../../../sysinfo/endian.o

.PHONY: all
all: push

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

push: push.o $(OBJS)
	$(CC) -o push push.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) push.o push

