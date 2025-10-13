

/* lifted from the manpage processor_affinity(2) */

#include <err.h>
#include <sys/processor.h>
#include <sys/procset.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <thread.h>

int
main ( int argc, char **argv )
{

    id_t *ids;
    procset_t ps;
    uint_t i, nids;
    uint32_t flags = PA_QUERY;

    setprocset(&ps, POP_AND, P_PID, P_MYID, P_LWPID, thr_self());

    if (processor_affinity(&ps, &nids, NULL, &flags) != 0) {
         err(1, "Error querying number of ids");
    }

    if (nids == 0) {
      printf("Current LWP has no affinity set.\n");
      return EXIT_FAILURE;
    }

    printf("LWP %u has affinity for %u CPUs.\n", thr_self(), nids);

    flags = PA_QUERY;
    ids = calloc(nids, sizeof (id_t));

    if (processor_affinity(&ps, &nids, ids, &flags) != 0) {
         err(1, "Error querying ids");
    }

    printf("Current LWP has affinity for the following CPU(s):\n");

    for (i = 0; i < nids; i++) {
         printf(" %lu", ids[i]);
    }

    printf("\n");

    return EXIT_SUCCESS;

}

