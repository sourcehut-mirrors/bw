
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
#define _XOPEN_SOURCE 600
 *********************************************************************/

#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
#include <fcntl.h>

#define VERBOSE 1
int sysinfo(int verbose);

int main(int argc, char **argv)
{
    struct stat status_buffer;
    int status;

    FILE *fp;
    char *line = NULL;
    char *c_time_string, buff[64];
    size_t fwrite_ret, linecap = 0;
    ssize_t linelen;
    fpos_t fpos;
    int fpos_status;
    long ftell_pos;
    struct timespec start_tv;

    if ( argc < 2 ) {
        errno = EINVAL;
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    setlocale ( LC_ALL, "POSIX" );
    if ( clock_gettime( CLOCK_REALTIME, &start_tv ) == -1 ) {
        perror( "clock gettime" );
        return EXIT_FAILURE;
    }

    /* note that we no longer will get an ENOMEM from the
     * sysctlbyname call.  See sysinfo.c for details. */
    sysinfo(VERBOSE);

    c_time_string = ctime( &start_tv.tv_sec );

    status = stat(argv[1], &status_buffer);
    if ( status == 0 ) {
        fprintf (stderr,"\nINFO : current time is %s", c_time_string );
        fprintf (stderr,"     : three UNIX times of the file are :\n");

        /* access time */
        sprintf(buff,"     : ctime(&buffer.st_atime) = %s",
                                        ctime(&status_buffer.st_atime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

        /* modification time */
        sprintf(buff,"     :              .st_mtime) = %s",
                                        ctime(&status_buffer.st_mtime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

        /* creation time */
        sprintf(buff,"     :              .st_ctime) = %s",
                                        ctime(&status_buffer.st_ctime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

    } else {
        perror("FAIL ");
        return EXIT_FAILURE;
    }


    fp = fopen( argv[1], "r");
    if ( fp == NULL ) {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    /* silly but do it anyways.
     *
     * Note that the data in fpos will be unspecified
     * information usable by fsetpos(3C) */
    fpos_status = fgetpos(fp, &fpos);
    if ( fpos_status != 0 ) {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    /* also silly but we expect to be at position byte zero */
    ftell_pos = ftell(fp);
    if ( ftell_pos < 0 ) {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    while ((linelen = getline(&line, &linecap, fp)) > 0) {
        fwrite_ret = fwrite(line, (size_t)linelen, 1, stdout);
        ftell_pos = ftell(fp);
        if ( ftell_pos < 0 ) {
            perror("FAIL ");
            free(line);
            return EXIT_FAILURE;
        }

        fprintf(stderr,"fwrite_ret = %4lu  and ftell_pos = %-6i",
                   fwrite_ret, ftell_pos);

        if ( feof(fp) != 0 ) {
            fprintf(stderr," EOF");
        }
        fprintf(stderr,"\n");

    }

    ftell_pos = ftell(fp);
    if ( ftell_pos < 0 ) {
        perror("FAIL ");
        free(line);
        return EXIT_FAILURE;
    }
    fprintf(stderr,"\nINFO : ftell_pos = %-6i\n", ftell_pos);

    if ( ferror(fp) != 0 ) {
        fprintf(stderr,"\nWARN : some sort of an error occured??\n");
    }

    if ( feof(fp) != 0 ) {
        fprintf(stderr,"INFO : we did hit EOF\n");
    }

    if ( fclose(fp) != 0 ) {
        fprintf(stderr,"\nWARN : fclose returned an error.\n");
        perror("FAIL ");
        free(line);
        return EXIT_FAILURE;
    }

    /* we seem to do this everywhere */
    free(line);

    fprintf(stderr,"INFO : file %s is now closed\n\n", argv[1]);

    status = stat(argv[1], &status_buffer);
    if ( status == 0 ) {
        fprintf (stderr,"\nINFO : three UNIX times are now :\n");

        /* access time */
        sprintf(buff,"     : ctime(&buffer.st_atime) = %s",
                                        ctime(&status_buffer.st_atime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

        /* modification time */
        sprintf(buff,"     :              .st_mtime) = %s",
                                        ctime(&status_buffer.st_mtime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

        /* creation time */
        sprintf(buff,"     :              .st_ctime) = %s",
                                        ctime(&status_buffer.st_ctime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

    } else {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;

}

