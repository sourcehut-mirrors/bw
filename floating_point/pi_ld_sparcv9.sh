#!/bin/bash
unset AR
unset AS
unset CC
unset CFLAGS
unset CLUTTER_IM_MODULE
unset CPPFLAGS
unset CVS_RSH
unset CXX
unset DBUS_SESSION_BUS_ADDRESS
unset DESKTOP_SESSION
unset G_BROKEN_FILENAMES
unset GDM_KEYBOARD_LAYOUT
unset GDM_LANG
unset GDMSESSION
unset GIO_LAUNCHED_DESKTOP_FILE
unset GIO_LAUNCHED_DESKTOP_FILE_PID
unset GLADE_CATALOG_PATH
unset GLADE_MODULE_PATH
unset GLADE_PIXMAP_PATH
unset GNOME_DESKTOP_SESSION_ID
unset GNOME_KEYRING_CONTROL
unset GNOME_KEYRING_PID
unset GNOME_KEYRING_SOCKET
unset GPG_AGENT_INFO
unset GTK_IM_MODULE
unset GTK_MODULES
unset GTK_RC_FILES
unset HOSTNAME
unset IMSETTINGS_INTEGRATE_DESKTOP
unset IMSETTINGS_MODULE
unset JAVA_HOME
unset LANG
unset LANGUAGE
unset LC_ADDRESS
unset LC_ALL
unset LC_IDENTIFICATION
unset LC_MEASUREMENT
unset LC_NAME
unset LC_PAPER
unset LC_TELEPHONE
unset LD
unset LD_LIBRARY_PATH
unset LD_OPTIONS
unset LD_RUN_PATH
unset LESS
unset LESS_IS_MORE
unset LESSOPEN
unset LIBGLADE_MODULE_PATH
unset LIBGL_DRIVERS_PATH
unset LS_COLORS
unset _LXSESSION_PID
unset MORE
unset MOTD_SHOWN
unset NCURSES_NO_UTF8_ACS
unset NM
unset OBJCOPY
unset OBJDUMP
unset ORBIT_SOCKETDIR
unset PKG_CONFIG
unset POSIXLY_CORRECT
unset POSIX_ME_HARDER
unset QT4_IM_MODULE
unset QT_ACCESSIBILITY
unset QTDIR
unset QT_GRAPHICSSYSTEM_CHECKED
unset QT_IM_MODULE
unset QTINC
unset QTLIB
unset QT_LINUX_ACCESSIBILITY_ALWAYS_ON
unset QT_PLUGIN_PATH
unset RANLIB
unset SAL_USE_VCLPLUGIN
unset SESSION_MANAGER
unset SIZE
unset SSH_AGENT_PID
unset SSH_ASKPASS
unset SSH_AUTH_SOCK
unset STRINGS
unset STRIP
unset USER
unset USERNAME
unset WINDOWID
unset WINDOWPATH
# unset XAUTHORITY
unset XDG_CONFIG_DIRS
unset XDG_CONFIG_HOME
unset XDG_CURRENT_DESKTOP
unset XDG_DATA_DIRS
unset XDG_DATA_HOME
unset XDG_GREETER_DATA_DIR
unset XDG_MENU_PREFIX
# unset XDG_RUNTIME_DIR
unset XDG_SEAT
unset XDG_SEAT_PATH
unset XDG_SESSION_CLASS
unset XDG_SESSION_COOKIE
unset XDG_SESSION_DESKTOP
# unset XDG_SESSION_ID
unset XDG_SESSION_PATH
unset XDG_SESSION_TYPE
unset XDG_VTNR
unset XMODIFIERS
unset GTK_OVERLAY_SCROLLING
unset LIBOVERLAY_SCROLLBAR

unset CONFIG_PROTECT_MASK
unset CONFIG_PROTECT
unset GCC_SPECS
unset INFOPATH

TERM=xterm
export TERM 

EDITOR=`( command -v vi )`
export EDITOR

VISUAL=`( command -v vi )`
export VISUAL

HISTORY=128
export HISTORY

HISTSIZE=128
export HISTSIZE

PAGER=/bin/more
export PAGER
unset LESS_IS_MORE

TZ=GMT0
export TZ

if [[ $EUID -ne 0 ]]; then
    PS1="\[\033]0;sphinx gentoo "`(/usr/bin/uname -r)`" "`(/usr/bin/uname -m)`" ver "`(/bin/cat /etc/gentoo-release)`" hostname \h: \007\]"`(/usr/bin/uname -n)`"$ "
else
    PS1=`(/bin/uname -n)`"# "
fi
PS2=\>\ 

LC_COLLATE=en_US.UTF-8; export LC_COLLATE
LC_CTYPE=en_US.UTF-8; export LC_CTYPE
LC_MESSAGES=en_US.UTF-8; export LC_MESSAGES
LC_MONETARY=en_US.UTF-8; export LC_MONETARY
LC_NUMERIC=en_US.UTF-8; export LC_NUMERIC
LC_TIME=en_US.UTF-8; export LC_TIME
XTERM_LOCALE=en_US.UTF-8; export XTERM_LOCALE
unset LC_ALL
unset LANG

XTERM_SHELL=/usr/bin/bash
export XTERM_SHELL

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/schily/bin:/opt/bw/bin
export PATH

MANPATH=/usr/share/man:/opt/schily/share/man:/opt/bw/share/man
export MANPATH

# CC=`( command -v gcc )`
# export CC

# CFLAGS='-std=iso9899:1999 -m64 -g -O0 -pedantic -pedantic-errors -fno-builtin -march=k8 -mtune=k8 -mieee-fp -mhard-float -mpc80 -fno-fast-math -mno-fancy-math-387 -malign-double -m128bit-long-double -mlong-double-80 -mstackrealign -mpreferred-stack-boundary=8 -mno-mmx'
# export CFLAGS

# CPPFLAGS='-D_TS_ERRNO -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600'
# export CPPFLAGS

if [ -x /usr/bin/bash ]; then
    XTERM_SHELL=/usr/bin/bash
    export XTERM_SHELL
else
    if [ -x /bin/bash ]; then
        XTERM_SHELL=/bin/bash
        export XTERM_SHELL
    else
        /usr/bin/printf "\n* * * * Where is the bash binary? * * *\n"
        unset XTERM_SHELL
    fi
fi

if [ -f $HOME/.Xauthority ]; then
    XAUTHORITY=$HOME/.Xauthority
    export XAUTHORITY
fi

# JAVA_HOME=/usr/jdk/latest
# export JAVA_HOME

TMPDIR=/var/tmp/`( id | sed -e 's/[^(]*(//' -e 's/).*//' )`
export TMPDIR
mkdir -m 0750 $TMPDIR > /dev/null 2>&1
chmod 0750 $TMPDIR

if [ ! -d $TMPDIR ]; then
    TMPDIR=/tmp
    export TMPDIR
    /usr/bin/printf "TMPDIR set to default /tmp\n"
fi


CFLAGS=\-std=iso9899:1999\ \-m64\ \-g\ \-O0\ \-pedantic\ \
\-pedantic-errors\ \-fno-builtin\ \-fno-fast-math\ \
\-mhard-float\ \-mno-app-regs\ \-mflat\ \-msoft-quad-float\ \
\-mno-unaligned-doubles\ \-mno-faster-structs\ \
\-mcpu=ultrasparc\ \-mtune=ultrasparc\ \-mno-vis\ \-mno-cbcond\ \
\-mno-fmaf\ \-mno-fsmuld\ \-mno-popc\ \-mno-subxc\ \
\-mcmodel=medany\ \-mmemory-model=tso\ \-fPIC\ \
\-Wl,-rpath=/usr/lib64\ \-Wl,-rpath=/usr/lib64\ \-Wl,-pie
export CFLAGS

CPPFLAGS='-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600'
export CPPFLAGS

TIME=/usr/bin/time; export TIME
NICE=/usr/bin/nice; export NICE
MAKE=/usr/bin/make; export MAKE
LEX=/usr/bin/flex; export LEX

if [ -x /usr/bin/gcc ]; then
    CC=/usr/bin/gcc
else
    /usr/bin/printf "FAIL : /usr/bin/gcc not seen\n"
    exit 42
fi

$CC $CFLAGS $CPPFLAGS -o pi_ld pi_ld.c

ls -l pi_ld

./pi_ld


