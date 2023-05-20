
LOCALBASE!=	if [ -d /opt/bw ]; then     \
			echo "/opt/bw";    \
		else                        \
			echo "/usr/local"; \
		fi

IDIR?=		$(LOCALBASE)/include
LDIR?=		$(LOCALBASE)/lib

CC?=		/usr/bin/cc
CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

LIBS=		-lm -lgmp -lmpfr

OBJS =	pr_mpfr_quiet.o ../gmp_mpfr/gmp_mpfr_ver.o \
	../sysinfo/sysinfo.o \
	../time_and_date/timediff.o

.PHONY: all
all: pr_mpfr_quiet

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

pr_mpfr_quiet: $(OBJS)
	$(CC) -o pr_mpfr_quiet $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) pr_mpfr_quiet
