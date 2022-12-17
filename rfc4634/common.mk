CC?=		/usr/bin/cc
CPPFLAGS=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600

LOCALBASE!=	if [ -d /opt/bw ]; then     \
			echo "/opt/bw/";    \
		else                        \
			echo "/usr/local/"; \
		fi

IDIR?=		$(LOCALBASE)/include
LDIR?=		$(LOCALBASE)/lib

LIBS=		-lm

OBJS=		cube_roots.o \
		../sysinfo/sysinfo.o

.PHONY: all
all: cube_roots

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

cube_roots: $(OBJS)
	$(CC) -o cube_roots $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) cube_roots
