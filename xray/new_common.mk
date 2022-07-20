CC?=	/usr/bin/cc

CPPFLAGS=	-D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
		-D_XOPEN_SOURCE=600

LIBS=		-lX11 -lrt -lm -lpthread

LDIR?=		/usr/local/lib
IDIR?=		/usr/local/include

CMPLEX_DIR= ../complex_vector

OBJS = ../xwin/x_error_handler.o \
	../xwin/create_gc.o \
	../xwin/create_borderless_topwin.o \
	../time_and_date/timediff.o \
	../complex_vector/icept.o \
	../complex_vector/surface_icept_pt.o \
	../complex_vector/gradient.o \
	../complex_vector/cplex_add.o \
	../complex_vector/cplex_check.o \
	../complex_vector/cplex_div.o \
	../complex_vector/cplex_mag.o \
	../complex_vector/cplex_mult.o \
	../complex_vector/cplex_quad.o \
	../complex_vector/cplex_sq.o \
	../complex_vector/cplex_sqrt.o \
	../complex_vector/cplex_sub.o \
	../complex_vector/cplex_theta.o \
	../complex_vector/cplex_vec_add.o \
	../complex_vector/cplex_vec_copy.o \
	../complex_vector/cplex_vec_dot.o \
	../complex_vector/cplex_vec_set.o \
	../complex_vector/cplex_vec_print.o \
	../complex_vector/cplex_vec_scale.o \
	../complex_vector/cplex_vec_mag.o \
	../complex_vector/cplex_vec_normalize.o \
	../complex_vector/cplex_vec_cross.o \
	../complex_vector/cplex_cramer.o \
	../complex_vector/cplex_det.o \
	../complex_vector/line_plane_icept.o \
	../complex_vector/cplex_vec_check.o \
	../sysinfo/sysinfo.o

.PHONY: all
all: xray

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS) -I$(IDIR) -I$(CMPLEX_DIR)

xray: xray.o $(OBJS)
	$(CC) -o xray xray.o $(OBJS) $(CFLAGS) $(CPPFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean
clean:
	rm -f $(OBJS) xray.o xray
