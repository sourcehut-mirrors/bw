
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

        /* print the file creation time */
        printf ("creation time of that file is st_ctime) = \"%s\"\n",
                                       ctime(&status_buffer.st_ctime));

    }

    return EXIT_SUCCESS;

}

