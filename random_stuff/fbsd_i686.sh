#!/bin/sh
unset AR
unset AS
unset BUILD
unset CC
unset CFLAGS
unset CFLAGS_SOCKETS
unset CONFIG_SHELL
unset CPPFLAGS
unset CXX
unset CXXFLAGS
unset GREP
unset JAVA_HOME
unset JRE_HOME
unset LC_ALL
unset LD
unset LD_FLAGS
unset LD_LIBRARY_PATH
unset LD_OPTIONS
unset LD_RUN_PATH
unset LIBTOOL
unset M4
unset MACHTYPE
unset MAKE
unset MANPATH
unset NM
unset OPENSSL_SOURCE
unset OSTYPE
unset PAGER
unset PERL
unset PHP
unset PKG_CONFIG_PATH
unset POSIXLY_CORRECT
unset SED
unset SHELL
unset SRC
unset STD_CDEFINES

PATH=/usr/bin:/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/schily/bin
export PATH

TMPDIR=/var/tmp/`( /usr/bin/id | /usr/bin/cut -f2 -d\( | /usr/bin/cut -f1 -d\) )`
export TMPDIR

if [ ! -d $TMPDIR ]; then
    /usr/bin/printf "INFO : no TMPDIR exists in /var/tmp/$USERNAME\n"
    mkdir -m 0750 $TMPDIR
    if [ ! -d $TMPDIR ]; then
        /usr/bin/printf "FAIL : could not create a TMPDIR\n"
        exit 1
    fi
    /usr/bin/printf "INFO : new TMPDIR created\n"
else
    chmod 0750 $TMPDIR
    touch $TMPDIR/foo_$$
    if [ ! -f $TMPDIR/foo_$$ ]; then
        /usr/bin/printf "FAIL : could not create a file in TMPDIR\n"
        exit 1
    fi
    rm $TMPDIR/foo_$$
fi

rm *.s *.o *.i *.bc > /dev/null 2>&1

CC=/usr/bin/cc
export CC

LD_FLAGS=\-Wl,-rpath=/usr/local/lib\ \-L/usr/local/lib
export LD_FLAGS

LC_COLLATE=en_US.UTF-8
export LC_COLLATE

LC_CTYPE=en_US.UTF-8
export LC_CTYPE

LC_MESSAGES=en_US.UTF-8
LC_MONETARY=en_US.UTF-8
LC_NUMERIC=en_US.UTF-8
LC_TIME=en_US.UTF-8



MANPATH=/usr/share/man:/usr/local/share/man:/usr/local/man:/opt/schily/share/man

PAGER=/usr/bin/more
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/opt/schily/bin







TZ=GMT0
VISUAL=/usr/bin/vi

XTERM_LOCALE=en_US.UTF-8

CFLAGS=\-m32\ \-std=c99\ \-fno-builtin\ \-O0\ \-g\ \
\-no-integrated-as\ \-fno-fast-math\ \-Weverything\ \
\-fdiagnostics-format=vi\ \-fno-color-diagnostics
export CFLAGS 

CPPFLAGS=\-D_POSIX_PTHREAD_SEMANTICS\ \
\-D_LARGEFILE64_SOURCE\ \-D_XOPEN_SOURCE=600
export CPPFLAGS

rm -f ent.o iso8859.o randtest.o chisq.o ent
$CC $CFLAGS $CPPFLAGS -c ent.c -o ent.o
$CC $CFLAGS $CPPFLAGS -c iso8859.c -o iso8859.o
$CC $CFLAGS $CPPFLAGS -c randtest.c -o randtest.o
$CC $CFLAGS $CPPFLAGS -c chisq.c -o chisq.o
$CC $CFLAGS $CPPFLAGS -o ent ent.o iso8859.o randtest.o chisq.o -lm

RESULT=$?
if [ $RESULT -eq 0 ]; then
    ls -lapb ent
else
    /usr/bin/printf "\nFAIL to compile.\n"
fi
exit $RESULT



$CC $CFLAGS $CPPFLAGS -c -o iso8859.o iso8859.c
$CC $CFLAGS $CPPFLAGS -c -o randtest.o randtest.c
$CC $CFLAGS $CPPFLAGS -c -o chisq.o chisq.c      
$CC $CFLAGS $CPPFLAGS -c -o ent.o ent.c          
$CC $CFLAGS $CPPFLAGS -o ent ent.o chisq.o randtest.o iso8859.o -lm

