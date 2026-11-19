
CPPFLAGS= -D_XOPEN_SOURCE=600 -D_LARGEFILE64_SOURCE \
	-D_FILE_OFFSET_BITS=64

SRCS = xcb_intro.c

OBJS = xcb_intro.o

.PHONY: all
all: xcb_intro

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR) $(CPPFLAGS)

xcb_intro: $(OBJS)
	$(CC) -o $@ ${OBJS} $(CFLAGS) -L$(LDIR) $(CPPFLAGS) $(LIBS)

clean:
	rm -f $(OBJS) xcb_intro

