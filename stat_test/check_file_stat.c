
#define _XOPEN_SOURCE 600

#include <errno.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>

#define VERBOSE 1
int sysinfo(int verbose);

int main(int argc, char **argv) 
{

    struct stat status_buffer;
    int status;

    setlocale ( LC_ALL, "POSIX" );
    sysinfo(VERBOSE);

    if (argc>1) {
        status = stat(argv[1], &status_buffer);
    } else {
        fprintf ( stderr, "FAIL : give a filename\n");
        return EXIT_FAILURE;
    }

    /* check that we have a valid status and if we do not
     * then check for a pile of possible errors : 
     *
     */

    if ( status < 0 ) {
        /* check for a pile of things that could have gone
         * wrong */
        switch(errno) {
            case EFAULT :
                fprintf ( stderr, "ERROR : EFAULT\n" );
                break;
            case ENOENT :
                fprintf ( stderr, "ERROR : ENOENT\n" );
                break;
            case EBADF :
                fprintf ( stderr, "ERROR : EBADF\n" );
                break;
            default :
                fprintf ( stderr, "ERROR : something bad happened.\n" );
        }
        perror("ERROR ");


        /* all manner of bad stuff can happen
         *
       EACCES Search  permission  is  denied for one of the directories in the
              path prefix of pathname.  (See also path_resolution(7).)

       EBADF  fd is not a valid open file descriptor.

       EFAULT Bad address.

       ELOOP  Too many symbolic links encountered while traversing the path.

       ENAMETOOLONG
              pathname is too long.

       ENOENT A component of pathname does not exist, or pathname is an  empty
              string and AT_EMPTY_PATH was not specified in flags.

       ENOMEM Out of memory (i.e., kernel memory).

       ENOTDIR
              A component of the path prefix of pathname is not a directory.

       EOVERFLOW
              pathname  or  fd  refers  to a file whose size, inode number, or
              number of blocks cannot be  represented  in,  respectively,  the
              types off_t, ino_t, or blkcnt_t.  This error can occur when, for
              example, an application compiled on a  32-bit  platform  without
              -D_FILE_OFFSET_BITS=64 calls stat() on a file whose size exceeds
              (1<<31)-1 bytes.

       The following additional errors can occur for fstatat():

       EBADF  dirfd is not a valid file descriptor.

       EINVAL Invalid flag specified in flags.

       ENOTDIR
              pathname is relative and dirfd is a file descriptor referring to
              a file other than a directory.


     */

    } else {

        /* print the file creation time */
        printf ("creation time of that file is st_ctime) = \"%s\"\n",
                                       ctime(&status_buffer.st_ctime));

    }

    return EXIT_SUCCESS;

}

