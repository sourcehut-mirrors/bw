
CC?=	/usr/bin/cc

CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600 \
		-D_FILE_OFFSET_BITS=64

LIBS?=		-lpng

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

LD_RUN_PATH?=	/usr/local/lib

OBJS=		pix_at.o pix.o png_to_fid.o

.PHONY: all
all: small_test

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

small_test: small_test.o $(OBJS)
	$(CC) -o small_test small_test.o $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR),-enable-new-dtags $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) small_test.o small_test

