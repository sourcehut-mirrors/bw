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

LIBS=		-lm -lgmp -lmpfr

OBJS=		mpfr_ver.o \
		../time_and_date/timediff.o \
		../sysinfo/sysinfo.o \
		../sysinfo/sysmem.o

.PHONY: all
all: mpfr_ver

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

mpfr_ver: $(OBJS)
	$(CC) -o mpfr_ver $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) mpfr_ver
