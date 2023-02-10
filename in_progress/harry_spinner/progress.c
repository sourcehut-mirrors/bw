
/*
 * progress.c  Demonstrate a progress spinner for activity
 * Copyright (C) The Wild Greek and a singing German :
 *                 Χαρίλαος Σκανδύλας  and Nico Sonack
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
 * SUSv2  superset of SUS extended to  support POSIX.1b-1993,
 * POSIX.1c-1996, and ISO/IEC 9899  (C  Standard) Amendment 1
 *********************************************************************/
#define _XOPEN_SOURCE 500

#include <stdio.h>
#include <unistd.h>

void print_progress_bar(int percent_done)
{
    printf("\r<");
    for(int i=0;i<percent_done/2;i++)
    {
	printf("=");
    }
    for(int i=percent_done/2;i<50;i++)
    {
	printf(" ");
    }
    printf(">");
    fflush(stdout);
}

void print_percent(int percent)
{
    printf("\r %d/100",percent);
    fflush(stdout);
}

void print_spinner(int step)
{
    char *spinner = "-\\|/";
    
    {
	printf("%c\x8", spinner[step%4]);
	fflush(stdout);
	usleep(100000);
    }
}

int main(void)
{
    
    for(int i=0;i<=100;i++)
    {	
	/* print_progress_bar(i);
	 * print_percent(i); */
	print_spinner(i);
	usleep(10000);
    }
    printf("\n");

    return 0;
}

