
/* getprio.c  A quick test of the rtprio() call to see wtf */


#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
/* #define __BSD_VISIBLE 1 */
typedef unsigned char   u_char;
typedef unsigned short  u_short;
typedef unsigned int    u_int;
typedef unsigned long   u_long;

#endif

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/sysctl.h>
#include <sys/types.h>
#include <sys/rtprio.h>

int
main ( int argc, char **argv )
{

    int this_pid_prio, prio_err_flag;
    struct rtprio this_pid_rtp;

    prio_err_flag = rtprio( RTP_LOOKUP, 0, &this_pid_rtp);

    if ( prio_err_flag < 0 ) {
        perror("rtprio() : ");
        return EXIT_FAILURE;
    }
    this_pid_prio = this_pid_rtp.prio;

    printf("Lo and behold we have this_pid_prio = %i\n", this_pid_prio);

    return EXIT_SUCCESS;

}

