
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "read_f.h"

int readline(FILE *fp, line_item *line) {

    int k;
    size_t j;


    /* the char buffer must exist */
    memset(line->buffer, 0, 1);
    line->buffer_length = 0;

    for (j=0; j<LINE_LENGTH_MAX; j++) {
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

