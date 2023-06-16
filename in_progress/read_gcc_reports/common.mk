
CC?=	/usr/bin/cc

CPPFLAGS?=	-D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600

IDIR?=		../../stat_test

LD_RUN_PATH?=	/usr/local/lib

OBJS=	../../stat_test/file_stat_err.o \
	../../stat_test/get_a_line.o \
	../../stat_test/filepath_ptr.o \
	../../stat_test/pathname_trim.o

.PHONY: all
all: gcc_tests

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR)

gcc_tests: gcc_tests.o $(OBJS)
	$(CC) -o gcc_tests gcc_tests.o $(OBJS) $(CFLAGS) $(CPPFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) gcc_tests.o gcc_tests
