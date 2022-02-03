
/*
 * crucible.c  Single threaded create a pile of files and then append
 *             poetry to the random data with both a 2048 byte chunk
 *             and then a 768 byte chunk to cause some fragmentation.
 *
 * This was written a long long time ago and used on Sparc 5 machines
 * with Sun "photon" storage arrays and such.
 *
 * Copyright (C) Dennis Clarke 1994
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
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *
 *********************************************************************/
#define _XOPEN_SOURCE 600

/**************************************************************************
 *  Author : Dennis M. Clarke  dclarke@blastwave.org
 *  Intent : File system IO load test.
 *  Detail : A tool was needed that would test a simple filesystem and
 *           its component devices.  This tool could then be used to
 *           quickly determine the measurable impact of filesystem and/or
 *           component changes.  This tool was quite useful in creating
 *           half Terabyte and full Terabyte filesystems on disk stripes.
 *           First revision was around 1994 and tested on photon model
 *           fibre arrays in 2004 on FCAL Enterprise Network Arrays.
 *
 *    Note : May not mean very much in the era of Samsung SSDs and such.
 *           Last update Dec 2020. Still likely full of errors and all
 *           the high resolution timer bits are janky as hell.
 **************************************************************************/
#include <sys/time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <limits.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <stdarg.h>
#include <locale.h>

#define VERBOSE 1
#define SIXTYFOURK 65536
#define ONE_MEG 1048576
#define NANOSEC 1000000000

uint64_t dump_64k(FILE *);
void append_2k(FILE *);
void append_TSE(FILE *);
double genrand(void);

uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );

int sysinfo(int verbose);

int main (int argc, char *argv[]) {

    uint64_t r64_time, r64_dump_time_hrt, total_dump_time_hrt;
    uint64_t file_create_total_time, file_create_time;
    uint64_t totaltime;

    uint32_t iteration_count;
    uint32_t i, j, k, l, m, n, p, q, s;
    int fflush_err;
    char *c_time_string;

    /* a pile of these can be tossed away */
    struct timespec start_hrt, end_hrt;
    struct timespec end_test1_hrt, end_test2_hrt, end_test3_hrt;
    struct timespec start_proc_hrt, end_proc_hrt;
    struct timespec random_buffer_start_hrt, random_buffer_end_hrt;
    
    double thisfile, avgtime;
    double this_file_io, avg_file_io;

    char fid0[2] = { 'a', 'a' };
    char dir0[2] = { 'a', 'a' };
    char fid1[2] = { 'a', 'a' };
    char dir1[2] = { 'a', 'a' };
    char fid[10] = { 'a', 'a', '/', 'a', 'a', '.', 'd', 'a', 't', '\0' };

    char alph[64] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                      'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
                      'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D',
                      'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
                      'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                      'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7',
                      '8', '9', '+', '-' };

    char buffer_64k_rand_text[65537];
    int char_count, k_index;

    char filename[FILENAME_MAX];
    char directory[FILENAME_MAX];
    char mkdir_path[FILENAME_MAX];

    FILE *fp;

    setlocale( LC_ALL, "C" );

    if ( argc != 2 ) {
        printf ("\n*****************************************************\n");
        printf (" crucible : cru-ci-ble (kroo'se-bel) noun.\n");
        printf ("            1. A vessel for melting materials at\n");
        printf ("               high temperatures.\n");
        printf ("            2. A severe test, as of patience or belief;\n");
        printf ("               a trial.\n\n");
        printf ("[ Dennis Clarke dclarke@blastwave.org ]\n");
        printf ("Written in 1994 or so to hammer Sun SPARC servers and\n");
        printf ("the old \"photon\" series fibre arrays.\n");
        printf ("*****************************************************\n\n");
        printf ("This test will create 26^4 = 456976 files of\n");
        printf ("exactly 65536 bytes each. This amounts to\n");
        printf ("29,948,379,136 bytes = 27.8 GB of data where we\n");
        printf ("are not counting directory structure overhead.\n\n");
        printf ("%s: Usage - you must specify the directory.\n", argv[0]);
        printf ("Example : %s ./test/area/foo \n", argv[0]);
        return EXIT_FAILURE;
    }

    sysinfo(VERBOSE);
    
    /* Get the CLOCK_MONOTONIC time in a timespec struct */
    if ( clock_gettime( CLOCK_MONOTONIC, &start_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
        return(EXIT_FAILURE);
    } else {

        c_time_string = ctime( &start_hrt.tv_sec );
        fprintf (stderr,"\nINFO : current time is %s", c_time_string );

        /* call srand48() with the sub-second time data 
         *
         * TODO note that we are using the Mersennne Twister 
         * at the moment but can switch over to a more modern
         * drand() given that /dev/random etc etc in the world
         * of 2020 can generally be accepted as damn near 
         * cryptographically random. Mostly. At least on most
         * modern systems running UNIX and Linux. Get a random
         * number generator based on radiation decay of some
         * strontium-90 or caesium-137 for best results.
         */
        srand48( (long) start_hrt.tv_nsec );
    }
    
    /**************************************************************
     * from somewhere back in 1994 or so ...                      *
     *                                                            *
     * Be advised that the size_t type is in limits.h as          *
     * :typedef       unsigned long size_t;                       *
     *                                                            *
     * strlen returns a size_t number which is really ulong int   *
     * since we are using short strings then we can cast it to a  *
     * simple int.                                                *
     **************************************************************/
    
    /**************************************************************
     * copy the provided directory argument to the variable
     * directory with the exception of the last character.
     **************************************************************/
    q = (int)strlen(argv[1]);

    /* we need q < ( FILENAME_MAX - 12 )
     *
     * 3 Apr 2021 : near as I can recall we need to append at
     *              least ten bytes onto the given filepath.
     *
     *              filename pattern may be like XX/XX.dat 
     *
     *
     *        foo_path_...._bar/XX/XX.dat    1024 bytes max
     *
     * Also the trailing slash may or may not exist and to be
     * fair we don't care. If the pathname is that long then
     * the user may be just a jerk.
     */
    if ( q > ( FILENAME_MAX - 12 ) ) {
        fprintf(stderr,"ERROR : path name too long\n");
        return EXIT_FAILURE;
    }

    /* TODO check for the trailing slash and then use strncpy */

    /* just copy argv[1] into directory */
    for ( i = 0; (argv[1][i]!='\0'); ++i)
        directory[i] = argv[1][i];

    /* is the last character a forward slash "/" ? */
    if ( (argv[1][q-1]) != '/' ) {  /* was the last char a "/" ? */
        directory[i] = '/';         /* no, so add the slash      */
        directory[i+1] = '\0';      /* null terminate the string */
    } else {
        directory[i] = '\0';        /* argv[1] had the slash, ok */
    }

    /* TODO it would be of some value to stat() the directory
     * pathname just to ensure it actually exists */

    totaltime = 0;
    r64_time = 0;
    r64_dump_time_hrt = 0;
    total_dump_time_hrt = 0;
    file_create_total_time = 0;
    file_create_time = 0;
    iteration_count = 0;

    /* reset the start time clock data */
    if ( clock_gettime( CLOCK_MONOTONIC, &start_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
        return(EXIT_FAILURE);
    }

    /* directory name loops for [a-z][a-z] */
    for ( j=0; j<26; ++j ) {
        for ( k=0; k<26; ++k ) {
            /* The structure of the character string fid is very simple.
             * It looks like so : aa/aa.dat
             * To iterate through a pile of unique filenames we just
             * keep changing those letter chars as needed.  */
            fid[0]=alph[j];
            fid[1]=alph[k];
    
            /* inner loops to change the filename.  */
            for ( l=0; l<26; ++l ) {
                fid[3]=alph[l];
                for ( m=0; m<26; ++m ) {
                    fid[4]=alph[m];
    
                    /* We did add another loop here to change the other
                     * letter in the filename.
                     *
                     * If we stick to just lowercase letters then we
                     * have 26^2 = 676 files per directory. Before long
                     * we would no longer be testing file IO rates and
                     * have to deal with overhead to locate a given
                     * file in a directory.
                     * 
                     * 3 April 2021 and here we are using ZFS and I have
                     * not messed with UFS in over a decade.
                     */
        
                    for ( i = 0; directory[i]!='\0'; ++i)
                        filename[i]=directory[i];

                    for ( q = 0; fid[q]!='\0'; ++q)
                        filename[i+q]=fid[q];

                    filename[i+q]='\0';
                    /* printf ( "File to write %s\n", filename ); */
        
                    /* Generate the random text before we need it and
                     * also outside of the area that measures time. */
        
                    if ( clock_gettime( CLOCK_MONOTONIC, &random_buffer_start_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                        return EXIT_FAILURE;
                    }
    
                    for ( char_count = 0; char_count < 65535; ++char_count ) {
                        k_index = (int) ( genrand() * 62.0 );
                        buffer_64k_rand_text[char_count]=alph[k_index];
                    }
        
                    buffer_64k_rand_text[65535]='\n';
                    buffer_64k_rand_text[65536]='\0';
        
                    if ( clock_gettime( CLOCK_MONOTONIC, &end_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                        return EXIT_FAILURE;
                    }
        
                    /* this is nothing but the time to create the
                     * random 64k bytes */
                    r64_dump_time_hrt += timediff(random_buffer_start_hrt, end_hrt);

                    /* create the new file and dump our random data */
                    thisfile = 0.0;
    
                    if ( clock_gettime( CLOCK_MONOTONIC, &start_proc_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                        return EXIT_FAILURE;
                    }
    
                    /* TODO fix this cruft that follows and sort out a stat()
                     * of that damn directory path and we only ever need to
                     * write and flush once damn it. */
                    if ( (fp = fopen(filename, "w")) == NULL ) {
                        /* probably the directory does not exist */
                        s = (int)strlen(directory);
                        for ( n = 0; (directory[n]!='\0'); ++n ) {
                            mkdir_path[n] = directory[n];
                        }
                        mkdir_path[n] = fid[0];
                        mkdir_path[n+1] = fid[1];
                        mkdir_path[n+2] = '\0';
        
                        errno = 0;
                        if ( mkdir(mkdir_path, (mode_t)0755) != 0 ) {
                            fprintf (stderr,"%s: can't mkdir %s\n",
                                              argv[0], mkdir_path);
                            fprintf (stderr,"%s: ABORTING\n", argv[0]);
                            perror("FAIL ");
                            return EXIT_FAILURE;
                        }
                            
                        /* we know for certain that the directory exists */
                        errno = 0;
                        if ( (fp = fopen(filename, "w")) == NULL ) {
                            fprintf (stderr,"%s: can't open %s\n",
                                               argv[0], filename);
                            fprintf (stderr,"%s: ABORTING\n", argv[0]);
                            perror ("FAIL ");
                            return EXIT_FAILURE;
                        }

                        fprintf(fp, buffer_64k_rand_text );
                        errno = 0;
                        fflush_err = fflush(fp);
                        if (fflush_err != 0) {
                            fprintf ( stderr, "fflush error %i",
                                               fflush_err );
                            perror("FAIL : ");
                            return EXIT_FAILURE;
                        }
                        fclose ( fp ); /* close the file and flush buffers */
                    } else {
                        /* file opened for write just fine */
                        fprintf( fp, buffer_64k_rand_text );
                        errno = 0;
                        fflush_err = fflush ( fp );
                        if ( fflush_err != 0 ) {
                            fprintf (stderr,"fflush error %i", fflush_err );
                            return EXIT_FAILURE;
                        }
                        fclose ( fp ); /* close the file and flush buffers */
                    }
        
                    iteration_count = iteration_count + 1;
        
                    if ( clock_gettime( CLOCK_MONOTONIC, &end_proc_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                        return EXIT_FAILURE;
                    }
                    /* TODO  use file_create_time as an array and then we can
                     *       do some statistical stuff with it later */
                    file_create_time = timediff(start_proc_hrt, end_proc_hrt);
                    file_create_total_time = file_create_total_time + file_create_time;

                } /* m for */
            } /* l for */
        } /* k for */
    } /* j for */

    /* NOTE this marks the end of the initial file create and 64k dump */
    
    if ( clock_gettime( CLOCK_MONOTONIC, &end_test1_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
        return EXIT_FAILURE;
    }

    totaltime = timediff( start_hrt, end_test1_hrt );

    avgtime = (double)totaltime / (double)iteration_count;
    
    avg_file_io = ((double)iteration_count * SIXTYFOURK )
                / ((double)totaltime * ONE_MEG );
    
    printf("\n TEST (1) Wall Clock Time was %.6f sec\n\n", 
               (double)timediff(start_hrt, end_test1_hrt)/NANOSEC );

    printf("%6li files \n", iteration_count);

    printf("          avg =%.6f sec\n", avgtime);

    printf("          actual IO total =%.6f sec\n", (double)totaltime/NANOSEC );

    printf("          IO avg rate =%.6f MB/s\n", avg_file_io);

    /* no idea what the idea is here so we shall ignore it
     *
     * printf(" Difference between Wall Clock and File IO Time = %.6f sec\n",
                      ( ((double)( timediff( start_hrt, end_test1_hrt) ) / BigDivisor ) - totaltime ) );
     */

    printf("Time required for random text generation = %.6f sec\n",
               (double)r64_dump_time_hrt/NANOSEC );
          
    
           /**********************************************************************/
    
           printf ( "\nTEST 2 ) file append 2048 bytes." );
           printf ( "\nAppending to file structure at %s\n", directory );
    
           printf ( "\nThis test will append 2048 bytes to the files\n" );
           printf (   "that were created in TEST 1.\n\n" );
    
           /* we want a new time that does not include the above print statements */

           if ( clock_gettime( CLOCK_MONOTONIC, &end_test1_hrt ) == -1 ) {
               /* We could not get the clock. Bail out. */
               fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
               return(EXIT_FAILURE);
           }
    
           totaltime = 0.0;
           iteration_count = 0;
           for ( j=0; j<26; ++j ) {
               for ( k=0; k<26; ++k ) {
                   fid[0]=alph[j]; /* change the directory name first letter */
                   fid[1]=alph[k]; /* change the directory name second letter */
    
                   /******************************************************
                    * Now we need an inner loop to change the filename.  *
                    ******************************************************/
    
                   for ( l=0; l<26; ++l ) {
                       fid[4]=alph[l]; /* change the filename second letter */
    
                       for ( i = 0; (directory[i]!='\0'); ++i)
                           filename[i]=directory[i];
                       for ( q = 0; (fid[q]!='\0'); ++q)
                           filename[i+q]=fid[q];
                       filename[i+q]='\0';
                       thisfile = 0.0;
                       if ( clock_gettime( CLOCK_MONOTONIC, &start_proc_hrt ) == -1 ) {
                           /* We could not get the clock. Bail out. */
                           fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                           return(EXIT_FAILURE);
                       }
    
                       if ( ( fp = fopen ( filename, "a") ) == NULL )
                            {
                                /** There was an error **/
                                fprintf ( stderr, "%s: can't append to file %s\n", argv[0], filename );
                                fprintf ( stderr, "%s: ABORTING\n", argv[0]);
                                perror ("FAIL ");
                                exit(EXIT_FAILURE);
                            }
                       else
                            {  /** no error .. append the data **/
                            append_2k ( fp );
                            fflush_err = fflush ( fp );
                            if ( fflush_err != 0 )
                                {
                                fprintf ( stderr, "fflush error %i", fflush_err );
                                exit (1);
                                }
                            fclose ( fp ); /* close the file and flush buffers */
                            }
    
                       if ( clock_gettime( CLOCK_MONOTONIC, &end_proc_hrt ) == -1 ) {
                           /* We could not get the clock. Bail out. */
                           fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                           return(EXIT_FAILURE);
                       }

                       iteration_count = iteration_count + 1;
                          thisfile = ( (double)timediff( start_proc_hrt,  end_proc_hrt ) ) / BigDivisor;
                          totaltime = totaltime + thisfile;
                          avgtime = totaltime / ( (double) iteration_count );
                          this_file_io = SixtyFourK / ( thisfile * OneMeg );
                          avg_file_io = (((double) iteration_count ) * ((double) 2048.0 ) ) / ( totaltime * OneMeg );
                   } /* l for */
               } /* k for */
           } /* j for */
    
           if ( clock_gettime( CLOCK_MONOTONIC, &end_test2_hrt ) == -1 ) {
                           /* We could not get the clock. Bail out. */
                           fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                           return(EXIT_FAILURE);
                       }

              printf(" TEST (2) Wall Clock Total Time = %.6f sec\n\n",
                        ( (double)timediff(end_test1_hrt, end_test2_hrt) / BigDivisor ) );

              printf("%6li files  avg=%.6f sec  total=%.6f sec  io_avg=%.6f MB/s\n",
                         iteration_count, avgtime, totaltime, avg_file_io );
    
           /**********************************************************************/
    
           printf ( "\nTEST 3 ) file append 749 bytes" );
           printf ( "\nAppending to file structure at %s\n", directory );
    
           printf ( "\nThis test will append 749 bytes to the files\n" );
           printf (   "that were created in TEST 1.\n\n" );
    
           /* we want a new time that does not include the above print statements */
           if ( clock_gettime( CLOCK_MONOTONIC, &end_test2_hrt ) == -1 ) {
                           /* We could not get the clock. Bail out. */
                           fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                           return(EXIT_FAILURE);
                       }

           totaltime = 0.0;
           iteration_count = 0;
           for ( j=0; j<26; ++j ) {
               for ( k=0; k<26; ++k ) {
                   fid[0]=alph[j]; /* change the directory name first letter */
                   fid[1]=alph[k]; /* change the directory name second letter */
    
                   /******************************************************
                    * Now we need an inner loop to change the filename.  *
                    ******************************************************/
    
                   for ( l=0; l<26; ++l ) {
                       fid[4]=alph[l]; /* change the filename second letter */
    
                       for ( i = 0; (directory[i]!='\0'); ++i)
                           filename[i]=directory[i];
                       for ( q = 0; (fid[q]!='\0'); ++q)
                           filename[i+q]=fid[q];
                       filename[i+q]='\0';
                       thisfile = 0.0;

                       if ( clock_gettime( CLOCK_MONOTONIC, &start_proc_hrt ) == -1 ) {
                           /* We could not get the clock. Bail out. */
                           fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                           return(EXIT_FAILURE);
                       }

                       if ( ( fp = fopen ( filename, "a") ) == NULL )
                            {
                                /** There was an error **/
                                fprintf ( stderr, "%s: can't append to file %s\n", argv[0], filename );
                                fprintf ( stderr, "%s: ABORTING\n", argv[0]);
                                perror ( error_buff );
                                exit(1);
                            }
                       else
                            {  /** no error .. append the data **/
                            append_TSE ( fp );
                            fflush_err = fflush ( fp );
                            if ( fflush_err != 0 )
                                {
                                fprintf ( stderr, "fflush error %i", fflush_err );
                                exit (1);
                                }
                            fclose ( fp ); /* close the file and flush buffers */
                            }
    

                       if ( clock_gettime( CLOCK_MONOTONIC, &end_proc_hrt ) == -1 ) {
                           /* We could not get the clock. Bail out. */
                           fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                           return(EXIT_FAILURE);
                       }

                       iteration_count = iteration_count + 1;
               
                          thisfile = (double)timediff(start_proc_hrt, end_proc_hrt) / BigDivisor;
                          totaltime = totaltime + thisfile;
                          avgtime = totaltime / ( (double) iteration_count );
                          this_file_io = SixtyFourK / ( thisfile * OneMeg );
                          avg_file_io = (((double) iteration_count ) * ((double) 749.0 ) ) / ( totaltime * OneMeg );
                   
                   } /* l for */
               } /* k for */
           } /* j for */
    

           if ( clock_gettime( CLOCK_MONOTONIC, &end_test3_hrt ) == -1 ) {
                           /* We could not get the clock. Bail out. */
                           fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                           return(EXIT_FAILURE);
                       }

              printf(" TEST (3) Wall Clock Total Time = %.6f sec\n\n",
                      (double)timediff( end_test2_hrt, end_test3_hrt ) / BigDivisor );

              printf("%6li files  avg=%.6f sec  total=%.6f sec  io_avg=%.6f MB/s\n",
                         iteration_count, avgtime, totaltime, avg_file_io );
    
        /**********************************************************************/
    
        if ( clock_gettime( CLOCK_MONOTONIC, &end_hrt ) == -1 ) {
                           /* We could not get the clock. Bail out. */
                           fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
                           return(EXIT_FAILURE);
                       }

              printf("\n\n\n Wall Clock Total Time = %.6f sec\n\n",
                      ( (double)timediff( start_hrt ,end_hrt ) / BigDivisor ) );
    
      }

    ru();

return EXIT_SUCCESS;

} /* End of main */

/************************************************************************/
/* A C-program for TT800 : July 8th 1996 Version */
/* by M. Matsumoto, email: matumoto@math.keio.ac.jp */
/* genrand() generate one pseudorandom number with double precision */
/* which is uniformly distributed on [0,1]-interval */
/* for each call.  One may choose any initial 25 seeds */
/* except all zeros. */

/* See: ACM Transactions on Modelling and Computer Simulation, */
/* Vol. 4, No. 3, 1994, pages 254-266. */

/* http://random.mat.sbg.ac.at/ftp/pub/data/tt800.c */

#define N 25
#define M 7

double genrand(void) {
    unsigned long y;
    static int k = 0;
    static unsigned long x[N]={ /* initial 25 seeds, change as you wish */
	0x95f24dab, 0x0b685215, 0xe76ccae7, 0xaf3ec239, 0x715fad23,
	0x24a590ad, 0x69e4b5ef, 0xbf456141, 0x96bc1b7b, 0xa7bdf825,
	0xc1de75b7, 0x8858a9c9, 0x2da87693, 0xb657f9dd, 0xffdc8a9f,
	0x8121da71, 0x8b823ecb, 0x885d05f5, 0x4e20cd47, 0x5a9ad5d9,
	0x512c0c03, 0xea857ccd, 0x4cc1d30f, 0x8891a8a1, 0xa6b7aadb
    };
    static unsigned long mag01[2]={ 
        0x0, 0x8ebfd028 /* this is magic vector `a', don't change */
    };
    if (k==N) { /* generate N words at one time */
      int kk;
      for (kk=0;kk<N-M;kk++) {
	x[kk] = x[kk+M] ^ (x[kk] >> 1) ^ mag01[x[kk] % 2];
      }
      for (; kk<N;kk++) {
	x[kk] = x[kk+(M-N)] ^ (x[kk] >> 1) ^ mag01[x[kk] % 2];
      }
      k=0;
    }
    y = x[k];
    y ^= (y << 7) & 0x2b5b2500; /* s and b, magic vectors */
    y ^= (y << 15) & 0xdb8b0000; /* t and c, magic vectors */
    y &= 0xffffffff; /* you may delete this line if word size = 32 */
/* 
   the following line was added by Makoto Matsumoto in the 1996 version
   to improve lower bit's corellation.
   Delete this line to o use the code published in 1994.
*/
    y ^= (y >> 16); /* added to the 1994 version */
    k++;
    return( (double) y / (unsigned long) 0xffffffff);
}
/**************************************************************************/

/********************************************
 *  dump 64k of random data to file         *
 *
 *  This process is a bit of a problem because
 *  we are adding the time it takes to create
 *  this random data into the file IO time.
 *  We can expect that the file IO time will
 *  be orders of magnitude slower than the 
 *  time it takes to stuff 64K random chars
 *  into a buffer HOWEVER we know as a fact
 *  that the function  genrand() does need 
 *  time. Even with a very fast processor
 *  we can expect this time in nanosecs to
 *  be non-trivial. Therefore, we return the 
 *  execution time of this function as a 
 *  high resolution time type hrtime_t value.
 *
 *  Actual data : on a dual processor 900MHz
 *  Sun UltraSparc IIIi machine we see that
 *  this function requires an average of 
 *  5000000 nsec per call. That is 0.005 secs
 *  of overhead per file.
 ********************************************/
uint64_t dump_64k ( FILE *fp ) {

    int char_count, k_index;
    char buff64Kbytes[65536];

    struct timespec random_start_hrt, random_end_hrt;

    if ( clock_gettime( CLOCK_MONOTONIC, &random_start_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
        return EXIT_FAILURE;
    }

    for ( char_count = 0; char_count<65535; ++char_count ) {
        k_index = (int) ( genrand() * (double)62.0 );
        buff64Kbytes[char_count]=alph[k_index];
    }
    buff64Kbytes[65535]='\n';
    buff64Kbytes[65536]='\0';

    if ( clock_gettime( CLOCK_MONOTONIC, &random_end_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
        return(EXIT_FAILURE);
    }

    fprintf( fp, buff64Kbytes );

    /*
     * Uncomment the next line and see that it takes about 0.005 secs
     * to create the random data. That is non-trivial.
     */
    /* printf("dump_64k time = %lld nsec\n", ( random_end_hrt - random_start_hrt )); */

    return timediff( random_start_hrt, random_end_hrt );

}

/*********************************************
 *  Append 2048 bytes of data to file        *
 *********************************************/
void append_2k ( FILE *fp ) {
    /* dylan */
    int i;
    for ( i = 0; i<936 ; ++i )
        fprintf ( fp, "\n" );

    fprintf( fp, "Suddenly I felt as if I had more to say.\n\n");
    fprintf( fp, "\n\n------------- Rage against the dying of the disk -----------\n\n"); 
    fprintf( fp, "Do not go slowly into that good server,\n");
    fprintf( fp, "Old disks should spin and seek at close of file;\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n");
    fprintf( fp, "Though write cache is fast wise men will not waver,\n");
    fprintf( fp, "Because forking data without trust is like cold bile.\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n");
    fprintf( fp, "Good men, disable write cache, crying how right\n");
    fprintf( fp, "Their frail Sparc 5 might have danced with fibre array,\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n");
    fprintf( fp, "Wild men who caught and sang the Solaris in flight,\n");
    fprintf( fp, "And learn, too late, they grieved Linux on its way,\n");
    fprintf( fp, "Do not go gentle into that good night.\n");
    fprintf( fp, "\n");
    fprintf( fp, "Grave Sparc, near death, will seek with blinding photon\n");
    fprintf( fp, "Blind panic will blaze while Opterons sing a new day,\n");
    fprintf( fp, "Oh William, Oh William where is your Joy?\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n");
    fprintf( fp, "And you, my Sparc, there with sad Alpha chip,\n");
    fprintf( fp, "Curse, watch as x86 Solaris holds back the dawn,\n");
    fprintf( fp, "Do not go gentle into that good night.\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n\n\t\tWith apologies to Dylan from Dennis dclarke@blastwave.org\n\n");
}

/************************************************
 * Append a little more                         *
 ************************************************/
void append_TSE ( FILE *fp ) {
    /* From Thomas Sterns Elliot ... */
    fprintf( fp, "\n\n------------------------------------------------------\n");
    fprintf( fp, "My mind it seems is oft at play.\n\n");
    fprintf( fp, "\n\n------------------------------------------------------\n");

    fprintf( fp, "WEBSTER was much possessed by death\n");
    fprintf( fp, "And saw the skull beneath the skin;\n");
    fprintf( fp, "And breastless creatures under ground\n");
    fprintf( fp, "Leaned backward with a lipless grin.\n");
    fprintf( fp, "\n");
 
    fprintf( fp, "Daffodil bulbs instead of balls               5\n");
    fprintf( fp, "Stared from the sockets of the eyes!\n");
    fprintf( fp, "He knew that thought clings round dead limbs\n");
    fprintf( fp, "Tightening its lusts and luxuries.\n");
    fprintf( fp, "\n");

    fprintf( fp, "Donne, I suppose, was such another\n");
    fprintf( fp, "Who found no substitute for sense,            10\n");
    fprintf( fp, "To seize and clutch and penetrate;\n");
    fprintf( fp, "Expert beyond experience,\n");
    fprintf( fp, "\n");
 
    fprintf( fp, "He knew the anguish of the marrow\n");
    fprintf( fp, "The ague of the skeleton;\n");
    fprintf( fp, "No contact possible to flesh                  15\n");
    fprintf( fp, "Allayed the fever of the bone.\n");
    fprintf( fp, "\n");

}

