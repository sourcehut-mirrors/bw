
CC?=	/usr/bin/cc

CPPFLAGS=	-D_LARGEFILE64_SOURCE

IDIR=	/opt/bw/include
LDIR=	/opt/bw/lib

LIBS=	-lcrypto -lm

OBJS=	dgst_test.o ../../../sysinfo/sysinfo.o \
		../../../sysinfo/endian.o

.PHONY: all
all: dgst_test

dgst_test: $(OBJS)
	$(CC) -o dgst_test $(OBJS) $(CFLAGS) $(CPPFLAGS) \
	-I$(IDIR) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) dgst_test

