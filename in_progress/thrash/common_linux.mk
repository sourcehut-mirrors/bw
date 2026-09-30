
CC?=	/usr/bin/cc

CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
		-D_XOPEN_SOURCE=600

OBJS=	thrash.o ../../time_and_date/tdiff.o

IDIR=	../../time_and_date

.PHONY:	all
all:	thrash

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) $(CPPFLAGS)

thrash:	thrash.o $(OBJS)
		$(CC) -o thrash thrash.o $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY:	clean
clean:
	rm -f $(OBJS) thrash

