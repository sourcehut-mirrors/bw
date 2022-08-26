#!/bin/sh
grep 'nsec' output/readme.dataset1* | cut -f2 -d\:  | grep -v 'INFO' | cut -f2 -d\=  | sort -n | awk 'BEGIN{print"#!/bin/sh"}{print "/usr/bin/printf \047" $1 "    \047\ngrep \047" $1 "\047 output/readme.dataset1* | cut -f1 -d\: "}' > $TMPDIR/wat.sh; chmod 0755 $TMPDIR/wat.sh
$TMPDIR/wat.sh | sed -e 's/output\/readme\.dataset1_//' | awk '{ printf("%14s    %s\n", $1, $2)}'
rm $TMPDIR/wat.sh
