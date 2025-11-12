#!/bin/sh

IFS=' 	
'

if [ -d /usr/xpg7/bin ]; then
    PATH=/usr/xpg7/bin:/usr/xpg6/bin:/usr/xpg4/bin:/bin:/sbin:/usr/bin:/usr/sbin
    export PATH
else
    if [ -d /usr/xpg6/bin ]; then
        PATH=/usr/xpg6/bin:/usr/xpg4/bin:/bin:/sbin:/usr/bin:/usr/sbin
        export PATH
    else
        PATH=/usr/bin:/usr/sbin:/bin:/sbin
        export PATH
    fi
fi

LS=`( command -v ls )`
CUT=`( command -v cut )`
SORT=`( command -v sort )`
AWK=`( command -v awk )`
WHO=`( command -v who )`
CAT=`( command -v cat )`
RM=`( command -v rm )`
TOUCH=`( command -v touch )`
CHMOD=`( command -v chmod )`
MKDIR=`( command -v mkdir )`

TMPDIR=/var/tmp/`( id | sed -e 's/[^(]*(//' -e 's/).*//' )`
export TMPDIR
${MKDIR} -m 0750 $TMPDIR > /dev/null 2>&1
${CHMOD} 0750 $TMPDIR


/usr/bin/printf "\n\n-------------------------------------------------------------------\n"
/usr/bin/printf "This script should ( good luck ) produce a script. Yes it is an ugly\n"
/usr/bin/printf "slab of awk which results in a script in your $TMPDIR. You really must\n"
/usr/bin/printf "have a TMPDIR env var to get anything done. Usually in /var/tmp/\044USERNAME\n"
/usr/bin/printf "You will get output that looks like /var/tmp/username/runthis_1475.sh\n"
/usr/bin/printf "and that is a script to run. that thing will produce a whole stack of\n"
/usr/bin/printf "smaller scripts. So yes this is a script that produces a script which\n"
/usr/bin/printf "then creates a stack of trivial scripts. They all look like v6.sh or\n"
/usr/bin/printf "t6.sh and those will product \042variant\042 and \042timing\042 reports.\n"
/usr/bin/printf "-------------------------------------------------------------------\n\n"

if [ -d $TMPDIR ]; then
    ${TOUCH} $TMPDIR/foo_$$
    if [ -f $TMPDIR/foo_$$ ]; then
        ${RM} $TMPDIR/foo_$$
    else
        /usr/bin/printf "\nFAIL : TMPDIR not writable?\n"
        exit 1
    fi
fi


${LS} -1 output/* | ${CUT} -c8-8 | ${SORT} -u > $TMPDIR/sorted_list_$$

${CAT} $TMPDIR/sorted_list_$$ | ${AWK} 'BEGIN{printf"#!/bin/sh\nLC_ALL=C\nexport LC_ALL\n\nTMPDIR=/var/tmp/\140\050 id | sed -e \047s/\133\136\050\135*\050\057\057\047 -e \047s\057\051.*\057\057\047 \051\140\nexport TMPDIR\n\n\nif \133 -d /usr/xpg7/bin \135; then\n    PATH=/usr/xpg7/bin:/usr/xpg6/bin:/usr/xpg4/bin:/bin:/sbin:/usr/bin:/usr/sbin\n    export PATH\nelse\n    if \133 -d /usr/xpg6/bin \135; then\n        PATH=/usr/xpg6/bin:/usr/xpg4/bin:/bin:/sbin:/usr/bin:/usr/sbin\n        export PATH\n    else\n        PATH=/usr/bin:/usr/sbin:/bin:/sbin\n        export PATH\n    fi\nfi\n\nCAT=\140\050 command -v cat \051\140\nSED=\140\050 command -v sed \051\140\nCHMOD=\140\050 command -v chmod \051\140\nLS=\140\050 command -v ls \051\140\n"}{printf"\n\044\173CAT\175 scripts/timing_template | \044\173SED\175 \047s/X/" $1 "/g\047 > $TMPDIR/t" $1 ".sh\n\044\173CHMOD\175 0755 $TMPDIR/t" $1 ".sh\n\n\044\173CAT\175 scripts/list_variant_template | \044\173SED\175 \047s/X/" $1 "/g\047 > $TMPDIR/v" $1 ".sh\n\044\173CHMOD\175 0755 $TMPDIR/v" $1 ".sh\n\n\044\173LS\175 -l $TMPDIR/t" $1 ".sh $TMPDIR/v" $1 ".sh\n"}' > $TMPDIR/runthis_$$.sh

${RM} $TMPDIR/sorted_list_$$

${CHMOD} 0755 $TMPDIR/runthis_$$.sh
${LS} $TMPDIR/runthis_$$.sh

