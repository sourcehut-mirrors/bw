CC?=	/usr/bin/cc

CPPFLAGS?=	-D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600

LIBS?=		-lX11 -lrt -lm -lpthread

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

LD_RUN_PATH?=	/usr/local/lib

OBJS=		mandel_col.o linear_inter.o mbrot.o \
			mbrot_fma.o \
			mbrot_vbox_pthread.o \
			fp_region.o fp_translate.o fp_vbox.o \
			array_offset.o swap_four.o swap_eight.o \
			../xwin/x_error_handler.o \
			../xwin/create_gc.o \
			../xwin/create_borderless_topwin.o \
			../time_and_date/timediff.o \
			../sysinfo/sysinfo.o

.PHONY: all
all: xmand

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

xmand: xmand.o $(OBJS)
	$(CC) -o xmand xmand.o $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR),-enable-new-dtags $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) xmand.o xmand
