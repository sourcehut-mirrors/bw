
LDIR?=	/opt/bw/lib
IDIR?=	/opt/bw/include
ITIME= ../time_and_date

SRCS = ../sysinfo/sysinfo.c ../sysinfo/endian.c \
	../time_and_date/tdiff.c pair.c

OBJS = ../sysinfo/sysinfo.o ../sysinfo/endian.o \
	../time_and_date/tdiff.o pair.o

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) -I$(ITIME) $(CPPFLAGS)

pair: $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) -Wl,-rpath=$(LDIR) \
	-Wl,-enable-new-dtags $(CPPFLAGS) -L$(LDIR) $(LIBS)

clean:
	rm -f $(OBJS) pair
