
/*
 * get_factor_line.c  read a c10 and its prime factors as a single line
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
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *
 *********************************************************************/

#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "read_f.h"

int get_factor_line(FILE *fp, line_item *line) {

    int k;
    size_t j;

    line->buffer[0] = '\0';
    line->buffer_length = 0;

    for (j=0; j<LINE_LENGTH_MAX; j++) {
        clearerr(fp);
        k = fgetc(fp);
        if (!feof(fp)) {
            if ( (k == 0x0a) || (k == 0x0d) ) {
                /* we hit the end of this line */
                line->buffer[j] = '\0';
                line->buffer_length = j+1;
                return EXIT_SUCCESS;
            } else {
                /* space 0x20 upwards to DEL 0x7f */
                if ( ( k > 0x1f ) && ( k < 0x80 ) ) {
                    line->buffer[j] = (char)k;
                    line->buffer_length = j+1;
                }
            }
        } else {
            line->error_status = ERROR_END_OF_FILE;
            return ERROR_END_OF_FILE;
        }
    }

    line->error_status = LINE_OVERRUN;
    return LINE_OVERRUN;

}

