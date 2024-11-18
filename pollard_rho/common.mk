
LOCALBASE!=	if [ -d /opt/genunix ]; then     \
			echo "/opt/genunix";    \
		else                        \
			echo "/usr/local"; \
		fi

IDIR?=		$(LOCALBASE)/include
LDIR?=		$(LOCALBASE)/lib

CC?=		/usr/bin/cc
CPPFLAGS?=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

LIBS=		-lm -lgmp -lmpfr

OBJS =	pollard_rho.o ../gmp_mpfr/gmp_mpfr_ver.o \
	../gmp_mpfr/mpfr_check_flags.o \
	../gmp_mpfr/gcd_mpfr.o \
	../sysinfo/sysinfo.o \
	../time_and_date/tdiff.o \
	../time_and_date/timediff.o

.PHONY: all
all: pollard_rho

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR) -I../time_and_date

pollard_rho: $(OBJS)
	$(CC) -o pollard_rho $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) pollard_rho
