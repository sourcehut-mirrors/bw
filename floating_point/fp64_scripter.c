
/*
 * fp64_scripter.c  create a trivial shell script that runs the
 *                  fp64_inexact binary for all reasonable values
 *                  within the range 2^0  through to 2^(-54) where
 *                  we know there are only 53 bits of mantissa.
 *
 * Copyright (C) Dennis Clarke 2022
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
 */

/*********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *********************************************************************/
#define _XOPEN_SOURCE 600

#include <errno.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>

int main (void)
{

    char *buf;
    int j;

    buf = setlocale (LC_ALL,"C");

    if (buf == NULL) {
        fprintf (stderr,"FAIL : setlocale fail\n");
        return EXIT_FAILURE;
    }

    errno = 0;

    /*
     * #!/bin/sh
LC_NUMERIC=de_DE.UTF-8
export LC_NUMERIC

/usr/bin/printf "\n----  1 ----  "; echo '64k 2 _1 ^ 1+ pq' | dc | sed -e 's/\./,/' ; ./fp64_inexact `( echo '64k 2 _1 ^ 1+ pq' | dc )` de_DE.UTF-8
/usr/bin/printf "\n----  2 ----  "; echo '64k 2 _2 ^ 1+ pq' | dc | sed -e 's/\./,/' ; ./fp64_inexact `( echo '64k 2 _2 ^ 1+ pq' | dc )` de_DE.UTF-8
/usr/bin/printf "\n----  3 ----  "; echo '64k 2 _3 ^ 1+ pq' | dc | sed -e 's/\./,/' ; ./fp64_inexact `( echo '64k 2 _3 ^ 1+ pq' | dc )` de_DE.UTF-8
/usr/bin/printf "\n----  4 ----  "; echo '64k 2 _4 ^ 1+ pq' | dc | sed -e 's/\./,/' ; ./fp64_inexact `( echo '64k 2 _4 ^ 1+ pq' | dc )` de_DE.UTF-8
callisto$ /usr/bin/printf "\n----  6 ----  "; echo '64k 2 _6 ^ pq' | dc | sed 's/0*$//'

----  6 ----  .015625
*/

    printf("#!/bin/sh\nLC_NUMERIC=C\nexport LC_NUMERIC\n\n");
    for (j=0;j<55;j++){
        printf("/usr/bin/printf \"\\n---- %2i ----  \"\n",j);
        printf("echo '64k 2 _%-2i ^ 1+ pq' | dc | sed -e 's/0*$//'\n",j);
        printf("./fp64_inexact `( echo '64k 2 _%-2i ^ 1+ pq' | dc | sed -e 's/0*$//' )`\n",j);
        printf("\n");
    }

    return EXIT_SUCCESS;

}

