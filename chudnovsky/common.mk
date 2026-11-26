
SRCS = chud.c ../sysinfo/sysinfo.c \
	../sysinfo/endian.c \
	../gmp_mpfr/gmp_mpfr_ver.c \
	../gmp_mpfr/mpfr_check_flags.c

OBJS = chud.o ../sysinfo/sysinfo.o \
	../sysinfo/endian.o \
	../gmp_mpfr/gmp_mpfr_ver.o \
	../gmp_mpfr/mpfr_check_flags.o

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) $(CPPFLAGS)

chud: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR) $(CPPFLAGS) -L$(LDIR) $(LIBS)

clean:
	rm -f $(OBJS) chud

