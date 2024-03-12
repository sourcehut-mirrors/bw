CC?=		/usr/bin/cc

CPPFLAGS=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=500

OBJS=		cat_qsort.o ../../sysinfo/sysinfo.o

.PHONY: all
all: cat_qsort

cat_qsort: $(OBJS)
	$(CC) -o cat_qsort $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) cat_qsort
