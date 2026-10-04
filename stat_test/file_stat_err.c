
/*
 * file_stat_err.c  process a file stat error code
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
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

/* hack this away on the OpenBSD world for now 
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif
*/

#include <errno.h>
#include <stdio.h>
#include <locale.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int file_stat_err(int file_errno) {

        /* oops ... what went wrong? */
        switch(file_errno) {
            case EFAULT :
                fprintf (stderr,"ERR  : EFAULT\n");
                fprintf (stderr,"     : Bad address\n");
                break;

            case ENOENT :
                fprintf (stderr,"ERR  : ENOENT\n");
                fprintf (stderr,"     : A component of pathname\n");
                fprintf (stderr,"     : does not exist or pathname\n");
                fprintf (stderr,"     : is an empty string and\n");
                fprintf (stderr,"     : AT_EMPTY_PATH was not\n");
                fprintf (stderr,"     : specified in flags.\n");
                break;

            case EBADF :
                fprintf (stderr,"ERR  : EBADF\n");
                fprintf (stderr,"     : not a valid open file\n"); 
                fprintf (stderr,"     : descriptor.\n");
                break;

            case ELOOP :
                fprintf (stderr,"ERR  : ELOOP\n");
                fprintf (stderr,"     : Too many symbolic links\n");
                fprintf (stderr,"     : encountered while traversing\n");
                fprintf (stderr,"     : the path.\n");
                break;

            case EACCES :
                fprintf (stderr,"ERR  : EACCES\n");
                fprintf (stderr,"     : Search permission is denied\n");
                fprintf (stderr,"     : for one of the directories\n");
                fprintf (stderr,"     : in the path prefix of pathname.\n");
                break;

            case ENAMETOOLONG :
                fprintf (stderr,"ERR  : ENAMETOOLONG\n");
                fprintf (stderr,"     : pathname is too long.\n"); 
                break;

            case ENOMEM :
                fprintf (stderr,"ERR  : ENOMEM\n");
                fprintf (stderr,"     : Out of memory (kernel memory?)\n");
                break;

            case ENOTDIR :
                fprintf(stderr,"ERR  : ENOTDIR\n");
                fprintf(stderr,"     : A component of the path prefix\n");
                fprintf(stderr,"     : of pathname is not a directory.\n");
                break;

            case EOVERFLOW :
                fprintf(stderr,"ERR  : EOVERFLOW\n");
                fprintf(stderr,
                        "     : pathname or fd refers to a file\n");
                fprintf(stderr,
                        "     : whose size, inode number, or number\n");
                fprintf(stderr,
                        "     : of blocks cannot be represented\n");
                fprintf(stderr,
                        "     : in, respectively, the types off_t,\n");
                fprintf(stderr,
                        "     : ino_t, or blkcnt_t. This error can\n");
                fprintf(stderr,
                        "     : occur when, for example, an application\n");
                fprintf(stderr,
                        "     : compiled on a 32-bit platform without\n");
                fprintf(stderr,
                        "     : -D_FILE_OFFSET_BITS=64 calls stat() on\n");
                fprintf(stderr,
                        "     : a file whose size exceeds (1<<31)-1 bytes.\n");

                break;

            default :
                /* we really just do not know */
                fprintf(stderr,"ERR  : something bad happened.\n");

        }

    perror("ERR  ");

    /* send the file error number back to the caller */
    return file_errno;

}

