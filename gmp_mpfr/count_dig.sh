#!/bin/sh
./mpfr_ver 332193 2>&1 | grep '^pi may be ' | cut -c13- | sed 's/e+00$//' > foo.dat
/usr/bin/printf 'd    count    expected\n'
/usr/bin/printf '---------------------\n'
/usr/bin/printf '0    '; cat foo.dat | grep -o '0' | wc -l | tr -d '\012';
/usr/bin/printf '     9999\n'
/usr/bin/printf '1    '; cat foo.dat | grep -o '1' | wc -l | tr -d '\012';
/usr/bin/printf '    10137\n'
/usr/bin/printf '2    '; cat foo.dat | grep -o '2' | wc -l | tr -d '\012';
/usr/bin/printf '     9908\n'
/usr/bin/printf '3    '; cat foo.dat | grep -o '3' | wc -l | tr -d '\012';
/usr/bin/printf '    10025\n'
/usr/bin/printf '4    '; cat foo.dat | grep -o '4' | wc -l | tr -d '\012';
/usr/bin/printf '     9972\n'
/usr/bin/printf '5    '; cat foo.dat | grep -o '5' | wc -l | tr -d '\012';
/usr/bin/printf '    10026\n'
/usr/bin/printf '6    '; cat foo.dat | grep -o '6' | wc -l | tr -d '\012';
/usr/bin/printf '    10028\n'
/usr/bin/printf '7    '; cat foo.dat | grep -o '7' | wc -l | tr -d '\012';
/usr/bin/printf '    10026\n'
/usr/bin/printf '8    '; cat foo.dat | grep -o '8' | wc -l | tr -d '\012';
/usr/bin/printf '     9978\n'
/usr/bin/printf '9    '; cat foo.dat | grep -o '9' | wc -l | tr -d '\012';
/usr/bin/printf '     9902\n'
rm foo.dat
