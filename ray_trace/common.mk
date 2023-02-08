IDIR=		../complex_vector
CC?=		/usr/bin/cc

CPPFLAGS=	-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

LIBS=		-lm

CPLEX_SRC!=	find ../complex_vector/ -name \*.c -a ! -name cplex_test.c \
		-a ! -name idea\*

CPLEX_OBJ!=	find ../complex_vector/ -name \*.c -a ! -name cplex_test.c \
		-a ! -name idea\* | sed 's/\(.*\)\.c/\1\.o/g'

OBJS=		obs_point.o \
		${CPLEX_OBJ}

.PHONY: all
all: obs_point

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) $(CPPFLAGS)

obs_point: $(OBJS)
	$(CC) -o obs_point $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

clean:
	rm -f $(OBJS) obs_point
