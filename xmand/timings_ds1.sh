#!/bin/sh
#
POSIXLY_CORRECT=1
export POSIXLY_CORRECT

TMPDIR=/var/tmp/`( id | sed -e 's/[^(]*(//' -e 's/).*//' )`
export TMPDIR
mkdir -m 0750 $TMPDIR > /dev/null 2>&1
chmod 0750 $TMPDIR

AWK=/usr/bin/gawk
export AWK

if [ -d $TMPDIR ]; then

grep 'nsec' output/readme.dataset1* | cut -f2 -d\:  | grep -v 'INFO' | cut -f2 -d\=  | sort -n | ${AWK} 'BEGIN{print"#!/bin/sh"}{print "/usr/bin/printf \047" $1 "    \047\ngrep \047" $1 "\047 output/readme.dataset1* | cut -f1 -d\: "}' > $TMPDIR/wat.sh; chmod 0755 $TMPDIR/wat.sh
$TMPDIR/wat.sh | sed -e 's/output\/readme\.dataset1_//' | ${AWK} '{ printf("%16s    %s\n", $1, $2)}'
rm $TMPDIR/wat.sh

else
    /usr/bin/printf "FAIL : check your TMPDIR\n"
fi
