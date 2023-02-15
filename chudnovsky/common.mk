
CPPFLAGS= -D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

CC?=/usr/bin/cc
LDIR?=	/usr/local/lib
IDIR?=	/usr/local/include
LIBS?=	-lgmp -lmpfr

SRCS = chud.c ../sysinfo/sysinfo.c ../pollard_rho/gmp_mpfr_ver.c \
	mpfr_check_flags.c

OBJS = chud.o ../sysinfo/sysinfo.o ../pollard_rho/gmp_mpfr_ver.o \
	mpfr_check_flags.o

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) $(CPPFLAGS)

chud: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR) $(CPPFLAGS) -L$(LDIR) $(LIBS)

clean:
	rm -f $(OBJS) chud
