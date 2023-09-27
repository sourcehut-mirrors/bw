
/*
 * flt_trap.c More or less lifted from the intertubes and a book
 *            of POSIX signal handling.
 *
 * Copyright (C) Dennis Clarke 2022
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
 */

/*********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *********************************************************************/
#define _XOPEN_SOURCE 600

#include <fenv.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

static void
fpe_signal_handler( int sig, siginfo_t *sip, void *scp )
{
    int fe_code = sip->si_code;

    printf("signal handler : ");

    if (fe_code == ILL_ILLTRP) {
        printf("Illegal trap detected\n");
    } else {
        printf("Code detected : %d\n",fe_code);
    }

    abort();
}

void enable_floating_point_exceptions()
{
    fenv_t env;
    fegetenv(&env);

    /*
    env.__fpcr = env.__fpcr | __fpcr_trap_invalid;
    */
    fesetenv(&env);

    struct sigaction act;
    act.sa_sigaction = fpe_signal_handler;
    sigemptyset (&act.sa_mask);
    act.sa_flags = SA_SIGINFO;
    sigaction(SIGILL, &act, NULL);
}

int main(void)
{
    volatile double x = -1;
    volatile double zero_me = -0.0;
    printf("y = %f\n",sqrt(x));
    /* enable_floating_point_exceptions(); */
    printf("y = %f\n",sqrt(x));

    printf("foobar %f\n", x / zero_me);

}

