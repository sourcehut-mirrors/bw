
CPPFLAGS= -D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600

SRCS = ./crucible.c ./offset.c ../../sysinfo/sysinfo.c \
	  ../../time_and_date/timediff.c

OBJS = ./crucible.o ./offset.o ../../sysinfo/sysinfo.o \
	   ../../time_and_date/timediff.o

LIBS? = -lrt

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

crucible: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LIBS)

clean:
	rm -f $(OBJS) crucible
