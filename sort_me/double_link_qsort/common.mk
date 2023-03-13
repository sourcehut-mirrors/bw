CC?=		/usr/bin/cc

CPPFLAGS=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

OBJS=		dlist_qsort.o ../../sysinfo/sysinfo.o

.PHONY: all
all: dlist_qsort

dlist_qsort: $(OBJS)
	$(CC) -o dlist_qsort $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) dlist_qsort
