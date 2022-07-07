CC?=		/usr/bin/cc
CPPFLAGS=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_REENTRANT

LIBS=		-lssl -lcrypto

OBJS=		dgst_test.o

.PHONY: all
all: dgst_test

dgst_test: $(OBJS)
	$(CC) -o dgst_test $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) dgst_test
