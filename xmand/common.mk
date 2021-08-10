CC?=		/usr/bin/cc
CPPFLAGS=	-D_TS_ERRNO -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600

LIBS=		-lX11 -lrt -lm -lpthread

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=		./mandel_col.o \
		./linear_inter.o \
		./mbrot.o \
		./mbrot_vbox_pthread.o \
		../xwin/x_error_handler.o \
		../xwin/create_gc.o \
		../xwin/create_borderless_topwin.o \
		../time_and_date/timediff.o \
		../sysinfo/sysmem.o \
		../sysinfo/sysinfo.o

.PHONY: all
all: xmand

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

xmand: xmand.o $(OBJS)
	$(CC) -o xmand xmand.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) xmand.o xmand
