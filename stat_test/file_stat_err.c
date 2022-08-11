
#define _XOPEN_SOURCE 600

#include <errno.h>
#include <stdio.h>
#include <locale.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int file_stat_err( int file_errno )
{

        /* what went wrong? */
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
                fprintf(stderr,"     : pathname or fd refers to a file\n");
                fprintf(stderr,"     : whose size, inode number, or number\n");
                fprintf(stderr,"     : of blocks cannot be represented\n");
                fprintf(stderr,"     : in, respectively, the types off_t,\n");
                fprintf(stderr,"     : ino_t, or blkcnt_t. This error can\n");
                fprintf(stderr,"     : occur when, for example, an application\n");
                fprintf(stderr,"     : compiled on a 32-bit platform without\n");
                fprintf(stderr,"     : -D_FILE_OFFSET_BITS=64 calls stat() on\n");
                fprintf(stderr,"     : a file whose size exceeds (1<<31)-1 bytes.\n");
                break;

            default :
                fprintf(stderr,"ERR  : something bad happened.\n");

        }
        perror("ERR  ");

    return file_errno;

}

