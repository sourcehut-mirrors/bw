CC?=		/usr/bin/cc
CPPFLAGS=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600

LIBS=		-lX11 -lrt -lm -lpthread

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

OBJS=	./tt800.o \
	../time_and_date/timediff.o \
	../sysinfo/sysinfo.o

.PHONY: all
all: schadenfreude

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

schadenfreude: schadenfreude.o $(OBJS)
	$(CC) -o schadenfreude schadenfreude.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) schadenfreude.o schadenfreude
