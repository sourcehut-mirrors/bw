#!/bin/sh

CC='/usr/bin/nice -n +18 /usr/bin/gcc'
export CC

CFLAGS='-std=iso9899:1999 -m64 -g -O0 -pedantic -pedantic-errors -fno-builtin'
export CFLAGS 

CPPFLAGS='-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600'
export CPPFLAGS

POSIXLY_CORRECT=1
export POSIXLY_CORRECT

$CC $CFLAGS $CPPFLAGS -c -o x_error_handler.o ../../../xwin/x_error_handler.c
$CC $CFLAGS $CPPFLAGS -c -o create_gc.o ../../../xwin/create_gc.c
$CC $CFLAGS $CPPFLAGS -c -o create_borderless_topwin.o ../../../xwin/create_borderless_topwin.c
$CC $CFLAGS $CPPFLAGS -c -o sysinfo.o ../../../sysinfo/sysinfo.c
$CC $CFLAGS $CPPFLAGS -c -o cursor.o cursor.c

