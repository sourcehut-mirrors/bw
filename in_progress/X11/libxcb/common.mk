
CPPFLAGS?= -D_XOPEN_SOURCE=600

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

