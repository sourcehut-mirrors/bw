
CC?=		/usr/bin/cc

CPPFLAGS=	-D_LARGEFILE64_SOURCE \
		-D_FILE_OFFSET_BITS=64 \
		-D_XOPEN_SOURCE=600

IDIR= ../../../time_and_date

SRCS=	../../../time_and_date/tdiff.c \
	thrash.c

OBJS = ${SRCS:.c=.o}

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

thrash: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) -I$(IDIR) $(CPPFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) thrash

