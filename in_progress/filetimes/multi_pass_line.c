
/* multi_pass_line.c  the idea here was to read the multi-line
 *                    output one may get from dc
 * 
 * NOTE : does not work and I do not know why fgets() hangs
 *
 * --------------------------------------------------------------------
 * Copyright (C) Dennis Clarke 2026
 * 
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------
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

#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#define SMALL_PAGE 4096

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* accept an input string which may be multiple lines
 * from output that dc spits out */
char *multi_pass_line(FILE *in_stream)
{
    size_t buffer_capacity, len, line_len, newcap;
    char *buffer, *new_buf, line[SMALL_PAGE];
    int continued;

    /* check the input is sane */
    if ( in_stream == NULL ) {
        /* the user is a jerk. return a '\0' empty string */
        buffer = calloc(8,sizeof(unsigned char));
        if ( buffer == NULL ) {
            /* major problem ENOMEM or worse?
             * If you can not get 8 bytes on the heap then
             * you have far far bigger problems. */
            exit ( EXIT_FAILURE );
        }
        return buffer;
    }

    /* the smallest pagesize is in x86 systems at 4KB */
    buffer_capacity = SMALL_PAGE;

    len = 0;
    buffer = (char *)calloc(buffer_capacity, sizeof(unsigned char));
    if (buffer == NULL) {
        /* really? what am I supposed to do now? */
        return NULL;
    }

    /*  the fgets just hangs ... I don't know why yet 
     *
     *
     *  DESCRIPTION
     *  The fgets() function reads at most one less than the number of
     *  characters specified by size from the given stream and stores
     *  them in the string str.  Reading stops when a newline character
     *  is found, at end-of-file or error.  The newline, if any, is
     *  retained.
     *
     *  If any characters are read and there is no error, a '\0' char
     *  is appended to end the string.
     *
     *  The gets_s() function is equivalent to fgets() with a stream
     *  of stdin, except that the newline character (if any) is not
     *  stored in the string.
     *
     *  RETURN VALUES
     *  Upon successful completion, fgets() and gets_s() return a
     *  pointer to the string.  If end-of-file occurs before any
     *  characters are read, they return NULL and the buffer contents
     *  remain unchanged.  If an error occurs, they return NULL and
     *  the buffer contents are indeterminate.  The fgets() and
     *  gets_s() functions do not distinguish between end-of-file and
     *  error, and callers must use feof(3) and ferror(3) to determine
     *  which occurred.
     *
     *  ERRORS
     *     [EBADF]    The given stream is not a readable stream.
     *
     *  The function fgets() may also fail and set errno for any of
     *  the errors specified for the routines fflush(3), fstat(2),
     *  read(2), or malloc(3).
     *
     * I have to guess calloc() also?
     */
    while (fgets(line, sizeof line, in_stream) != NULL) {
        /* we expect 72 chars at most however anything can
         * and will happen */
        line_len = strlen(line);

        /* TODO : what if line_len > SMALL_PAGE ? 
         *      : how about 0 bytes ?
         *
         *      Always assume the user is a jerk.
         */

        /* in this loop we may hit a trailing newline?
         * strip that out */
        if ( (line_len > 0) && (line[line_len - 1] == '\n') ) {
            line[--line_len] = '\0';
        }

        /* have we accepted a continuation backslash char yet? */
        continued = 0;

        if ( (line_len > 0) && (line[line_len - 1] == '\\') ) {
            /* yup .. we got one for sure */
            continued = 1;
            /* strip out the backslash */
            line[--line_len] = '\0';
        }

        /* ensure capacity for SMALL_PAGE bytes + NUL */
        if ( (len + line_len + 1) > buffer_capacity) {
            newcap = buffer_capacity;
            while (len + line_len + 1 > newcap) {
                newcap *= 2;
            }

            new_buf = (char *)calloc(newcap, sizeof(unsigned char));
            if (new_buf == NULL) {
                /* yeah .. we are borked into the gates of hell */
                free(buffer);
                /* TODO any other options here? */
                exit ( EXIT_FAILURE );
            }

            /* we survived the growth .. so swap around pointers */
            memcpy(new_buf, buffer, len);
            free(buffer);
            buffer = new_buf;
            buffer_capacity = newcap;
        }

        /* copy in the chars that we have workable */
        memcpy(buffer + len, line, line_len);
        len += line_len;

        /* did we hit the last line ? */
        if (continued == 0) {
            break;
        }
    }

    /* feof() tests the end-of-file indicator for the stream
     * pointed to by stream, returning non-zero if it is set.
     * The end-of-file indicator may be cleared by explicitly
     * calling clearerr(), or as a side-effect of other stuff
     * like fseek().
     */
    if ( (len == 0) && feof(in_stream)) {
        free(buffer);
        return NULL;
    }

    /* I kknow I did a calloc() but just to be safe
     * stick a '\0' at the end */
    buffer[len] = '\0';
    return buffer;
}

int
main ( int argc, char **argv )
{

    char *str;

    str = multi_pass_line( stdin );

    if ( str == NULL ) {
        fprintf(stderr, "bork bork bork NULL\n");
        return EXIT_FAILURE;
    }

    if ( strlen(str) == 0 ) {
        fprintf(stderr, "bork bork bork \'0\'\n");
        return EXIT_FAILURE;
    }

    printf("%s\n",str);

    free (str)
    return EXIT_SUCCESS;

}

