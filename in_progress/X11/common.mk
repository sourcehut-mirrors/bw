CC?=		/usr/bin/cc
CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

LIBS?=		-lX11

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		../../xwin/x_error_handler.o \
		../../xwin/create_gc.o \
		../../xwin/create_borderless_topwin.o \
		../../sysinfo/sysinfo.o

.PHONY: all
all: cursor

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

cursor: cursor.o $(OBJS)
	$(CC) -o cursor cursor.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) cursor.o cursor
