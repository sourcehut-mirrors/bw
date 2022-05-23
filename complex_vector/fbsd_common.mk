CC?=		/usr/bin/cc

CPPFLAGS?=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600

DEPS=		v.h
IDIR?=		.
LIBS=		-lm

SRCS!=		find . -name c\*.c
SRCS+=		line_plane_icept.c
OBJS!=		find . -name c\*.c | sed 's/\(.*\.\)c$$/\1o/g'
OBJS+=		line_plane_icept.o

.PHONY: all
all: cplex_test

${OBJS}: ${DEPS}

.c.o:
	${CC} -c -o $@ $< ${CFLAGS} ${CPPFLAGS}

cplex_test: ${OBJS}
	${CC} -o cplex_test ${OBJS} ${CFLAGS} ${CPPFLAGS} ${LIBS}

.PHONY: clean
clean:
	rm -f ${OBJS} cplex_test
