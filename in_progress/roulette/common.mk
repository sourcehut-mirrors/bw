CC?=		/usr/bin/cc
CPPFLAGS=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=500

OBJS=	./genrand.o ../../sysinfo/sysinfo.o

.PHONY: all
all: schadenfreude

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

schadenfreude: schadenfreude.o $(OBJS)
	$(CC) -o schadenfreude schadenfreude.o $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) schadenfreude.o schadenfreude
