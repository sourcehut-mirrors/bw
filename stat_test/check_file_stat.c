
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

int file_stat_err( int file_errno );

int main(int argc, char **argv) 
{

    struct stat status_buffer;
    int status;

    setlocale ( LC_ALL, "POSIX" );
    sysinfo(VERBOSE);

    if (argc>1) {
        errno = 0;
        status = stat(argv[1], &status_buffer);
    } else {
        fprintf ( stderr, "FAIL : give a filename\n");
        return EXIT_FAILURE;
    }

    /* check that we have a valid status and if we do not
     * then check for a pile of possible errors : 
     */

    if ( status < 0 ) {
        status = file_stat_err(errno);
    } else {

        /*
         * print the file creation time.
         * note that ctime() tosses a NL at the end.
         *
         * An Alpine Linux machine with MUSL LibC will
         * have these sort of contents in the status_buffer :
         *
         * For the file /dev/full we see 
         *
         * {st_dev = 6, st_ino = 7, st_nlink = 1,
         *  st_mode = 8630, st_uid = 0, st_gid = 0,
         *  __pad0 = 0, st_rdev = 263, st_size = 0,
         *  st_blksize = 4096, st_blocks = 0,
         *  st_atim = { tv_sec = 1740946400,
         *             tv_nsec = 346666651},
         *  st_mtim = { tv_sec = 1740946400,
         *             tv_nsec = 346666651},
         *  st_ctim = { tv_sec = 1740946408,
         *             tv_nsec = 875160066},
         *  __unused = {0, 0, 0}}
         *
         * Some of that stuff is pretty standard.
         *
         */
        printf ("Yes that file exists.\n");

        printf ("Access       time is st_atime = %s",
                  ctime(&status_buffer.st_atime));

        printf ("Modification time is st_mtime = %s",
                  ctime(&status_buffer.st_mtime));

        printf ("Creation     time is st_ctime = %s",
                  ctime(&status_buffer.st_ctime));

    }

    return EXIT_SUCCESS;

}

