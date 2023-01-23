
CPPFLAGS= -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
	-D_XOPEN_SOURCE=600

CC?=/usr/bin/cc
LDIR?=	/usr/local/lib
IDIR?=	/usr/local/include
LIBS?=	-lgmp -lmpfr

SRCS = pr_mpfr_quiet.c gmp_mpfr_ver.c ../sysinfo/sysinfo.c \
	../time_and_date/timediff.c

OBJS = pr_mpfr_quiet.o gmp_mpfr_ver.o ../sysinfo/sysinfo.o \
	../time_and_date/timediff.o

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) $(CPPFLAGS)

pr_mpfr_quiet: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR) $(CPPFLAGS) -L$(LDIR) $(LIBS)

clean:
	rm -f $(OBJS) pr_mpfr_quiet
