CC?=		/usr/bin/cc
CPPFLAGS=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_REENTRANT -D_XOPEN_SOURCE=600

LIBS=		-lcrypto -lm

OBJS=		dgst_test.o ../../sysinfo/sysinfo.o \
			../../sysinfo/endian.o

.PHONY: all
all: dgst_test

dgst_test: $(OBJS)
	$(CC) -o dgst_test $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) dgst_test
