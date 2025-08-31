#!/bin/sh

AS=/opt/bw/bin/gas
export AS

CC=/opt/csw/gcc4/bin/gcc
export CC

CFLAGS=\-m32\ \-g\ \-O0\ \-mcpu=v7\ \-mno-v8plus\ \-mno-vis\ \
\-fno-builtin\ \-mno-app-regs\ \-mhard-float\ \-mno-faster-structs\ \
\-mstd-struct-return\ \-pthreads\ \-fPIC
export CFLAGS

NICE=/usr/xpg4/bin/nice
export NICE

PAGER=/usr/xpg4/bin/more
export PAGER

PATH=/opt/bw/bin:/opt/bw/sbin:/usr/xpg4/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/ccs/bin:/usr/openwin/bin:/opt/csw/gcc4/bin:/opt/csw/bin:/opt/schily/bin:/opt/SUNWspro/bin
export PATH

TIME=/usr/bin/time
export TIME

