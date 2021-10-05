
/*
 * dlist_curl.c  use libCurl to connect via ssh to a remote host and
 *               look into a target directory
 * Copyright (C) Dennis Clarke 2019
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

#define LS_REPLYSIZE 262144

#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
#include <fcntl.h>

#include <curl/curl.h>

/* TODO why these globals ? */
static char   wr_buf[LS_REPLYSIZE+1];
static int    wr_index;

struct dataflags {
    char trace_ascii;
};

typedef struct {
    char *buf;
    long len;
    int pos;
} readarg_t;

#define VERBOSE 1
int sysinfo(int verbose);

/* TODO clean this mess up and use the time and date funcs */
long double timespec_to_ld( struct timespec t );

size_t write_data( void *buffer, size_t size, size_t nmemb, void *userp );
static size_t read_callback(void *ptr, size_t size, size_t nmemb, void *stream);
static int my_trace( CURL *handle, curl_infotype type, char *data,
                     size_t size, void *userp );
static void dump( const char *text, FILE *stream, unsigned char *ptr,
                  size_t size, char nohex );
void hexdump ( char *desc, void *addr, int len );

int main(void)
{
    CURL *curl;
    CURLcode res;

    FILE *logfile;

    struct timespec start_tv;
    double total_time, speed_upload;
    long double start_ld;
    char* c_time_string;

    sysinfo(VERBOSE);

    /* TODO all this stuff needs to be input parameters */
    char *username = "xtester";
    char *ssh_pub_key_file = calloc(128, sizeof(unsigned char));
    char *ssh_priv_key_file = calloc(128, sizeof(unsigned char));

    /* see the damn man page for STRLCPY(3)  and note that you
     * can not use it in C99 world. */

    char *homedir = getenv("HOME");
    if ( homedir == NULL ) {
	    fprintf(stderr,"WARN : home directory env var HOME not found\n");
        fprintf(stderr,"INFO : ssh keys should be in /opt/bw/ssl/certs\n");
        strcpy(ssh_pub_key_file,"/opt/bw/ssl/certs/xtester_rsa4096.pub");
        strcpy(ssh_priv_key_file,"/opt/bw/ssl/certs/xtester_rsa4096.id");
    } else {
        size_t homedir_len = strlen(homedir);
        if ( homedir_len > 96 ) {
            fprintf(stderr,"FAIL : home directory env var HOME is insane?\n");
            return EXIT_FAILURE;
        }

        strncpy(ssh_pub_key_file,homedir,homedir_len);
        strncat(ssh_pub_key_file,"/.ssh/xtester_rsa4096.pub",26);

        strncpy(ssh_priv_key_file,homedir,homedir_len);
        strncat(ssh_priv_key_file,"/.ssh/xtester_rsa4096.id",25);

    }
    char *ssh_pass = "0xfeeddeadbeefbadcaffeh";
    /* TODO verify that the ssh keys actually exist */

    char *target_url = calloc(128, sizeof(unsigned char));
    strcpy (target_url, "sftp://172.16.35.8:22/~/get_things_from_here/" );

    struct dataflags config;

    config.trace_ascii = 0;

    int wr_error;

    wr_error = 0;
    wr_index = 0;

    readarg_t rarg;  /* for holding the buffer data and info */

    /********************* t i m e   d a t a ***************************/
    time_t *date_tv = calloc(1,sizeof(time_t) );
    if ( date_tv == NULL ) {
        fprintf( stderr, "FAIL : Can not allocate sizeof(time_t)\n" );
        exit( EXIT_FAILURE );
    }

    setlocale (LC_ALL, "POSIX" );
    if (setenv("TZ", "GMT0", 1 ) != 0 ) {
        fprintf(stderr, "WARN : Unable to use timezone GMT0\n" );
        if (setenv("TZ", "UTC", 1 ) != 0 ) {
            fprintf(stderr, "WARN : Unable to use timezone UTC\n" );
        }
    }

    /* Let's get a start time */
    if (clock_gettime(CLOCK_REALTIME, &start_tv ) == -1 ) {
      perror("clock gettime" );
      return EXIT_FAILURE;
    }

    c_time_string = ctime(&start_tv.tv_sec );
 
    fprintf (stderr, "current time is %s", c_time_string );
    start_ld = timespec_to_ld(start_tv );
    fprintf (stderr, "START : %-22.19Lg \n", start_ld );

    /********************* e n d  t i m e   d a t a ********************/

    logfile = fopen("/dev/null", "w" );

    /* hexdump ( NULL, eft_buffer, rarg.len ); */

    curl_global_init(CURL_GLOBAL_ALL );
    curl = curl_easy_init();

    if (curl) {

        /* this is not an upload of data */
        curl_easy_setopt (curl, CURLOPT_UPLOAD, 0L );

        /* only allow CURLPROTO_SCP or SFTP */
        curl_easy_setopt(curl, CURLOPT_PROTOCOLS,
                                        CURLPROTO_SCP | CURLPROTO_SFTP );

        /* enforce TLS v1.3  for https web access***********************
        curl_easy_setopt ( curl, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_3 );
         ***************************************************************/


        /* For FTP and SFTP based URLs a parameter set to 1 tells the
         * library to list the names of files in a directory, rather
         * than performing a full directory listing that would normally
         * include file sizes, dates etc.
         *
         * NOTE that we set this to zero which enables a full verbose
         * listing. */
        curl_easy_setopt (curl, CURLOPT_DIRLISTONLY, 0L ); 

        curl_easy_setopt (curl, CURLOPT_URL, target_url );

        curl_easy_setopt (curl, CURLOPT_USERNAME, username );

        curl_easy_setopt (curl, CURLOPT_SSH_PUBLIC_KEYFILE,
                                 ssh_pub_key_file );

        curl_easy_setopt (curl, CURLOPT_SSH_PRIVATE_KEYFILE,
                                 ssh_priv_key_file );

        curl_easy_setopt (curl, CURLOPT_KEYPASSWD,
                                 ssh_pass );

        curl_easy_setopt (curl, CURLOPT_VERBOSE, 1L );
        curl_easy_setopt (curl, CURLOPT_DEBUGFUNCTION, my_trace );
        curl_easy_setopt (curl, CURLOPT_DEBUGDATA, &config );

        curl_easy_setopt (curl, CURLOPT_NOPROGRESS, 0L );
        curl_easy_setopt (curl, CURLOPT_SSL_VERIFYPEER, 0L );
        curl_easy_setopt (curl, CURLOPT_STDERR, logfile );

        curl_easy_setopt (curl, CURLOPT_READFUNCTION, read_callback );
        curl_easy_setopt (curl, CURLOPT_READDATA, &rarg );

        /* Perform the request, res will get the return code */
        res = curl_easy_perform (curl );

        /* Check for errors */
        if (res != CURLE_OK ) {
            fprintf (stderr, "FAIL : curl_easy_perform() failed: %s\n", curl_easy_strerror ( res ) );
            fprintf (stderr, "FAIL : res = %d (write_error = %d)\n", res, wr_error );
            return EXIT_FAILURE;
        }

        /* now extract transfer info */
        curl_easy_getinfo(curl, CURLINFO_SPEED_UPLOAD, &speed_upload);
        curl_easy_getinfo(curl, CURLINFO_TOTAL_TIME, &total_time);

        fprintf (stderr, "Speed: %.3f bytes/sec during %.3f seconds\n", speed_upload, total_time); 

        /*
         * we should  null terminate the reply
         *    with some sort of  data[write_result.pos] = '\0';
         */
        printf("res = %d (write_error = %d)\n", res, wr_error );

        /* this may not be reasonable at all */
        if (res == 0 )
            printf ("\nData length received : %-06i bytes\n", strlen(wr_buf) );
        else
            printf ("\nError : \n" );

        /* always cleanup */
        curl_easy_cleanup (curl);

    } else {
        printf ("\nFAIL : curl init fail.\n" );
        return EXIT_FAILURE;
    }

    curl_global_cleanup();

    fflush (logfile);
    fclose (logfile);

    free (ssh_priv_key_file);
    free (ssh_pub_key_file);
    free (target_url);
    free (date_tv);

    return EXIT_SUCCESS;

}

long double timespec_to_ld( struct timespec t ) {

    char buffer[64] = "";
    int bytes_formatted;
    long double ld_t = 0.0L;

    bytes_formatted = sprintf (buffer, "%10lu.%-9lu", t.tv_sec, t.tv_nsec );

    if (bytes_formatted > 0 )
        ld_t = strtold(buffer, NULL );

    if (ld_t > 0.0L)
        return  ld_t;
    else
        return -1.0L;

}

static size_t read_callback(void *ptr, size_t size, size_t nmemb, void *stream) {
    /* cast the void *stream to our type struct readarg_t */
    readarg_t *rarg = (readarg_t *)stream;

    /* TODO could this be negative? */
    size_t len = rarg->len - rarg->pos;

    if (len > size * nmemb ) {
        len = size * nmemb;
    }

    memcpy(ptr, rarg->buf + rarg->pos, len);

    rarg->pos += len;

    printf("readcb: %d bytes\n", len);
    return len;
}


/*
 * Write data callback function (called within the context of 
 * curl_easy_perform.
 */
size_t write_data( void *buffer, size_t size, size_t nmemb, void *userp ) {

    size_t segsize = size * nmemb;

    /* Check to see if this data exceeds the size of our buffer. If so, 
       * set the user-defined context value and return 0 to indicate a
       * problem to curl.
       */
    if ( ( wr_index + segsize ) > LS_REPLYSIZE ) {
        *(int *)userp = 1;
        return 0;
    }

    /* Copy the data from the curl buffer into our buffer */
    memcpy( (void *) & wr_buf[wr_index], buffer, segsize );

    /* Update the write index */
    wr_index += segsize;

    /* Null terminate the buffer */
    wr_buf[wr_index] = 0;

    /* Return the number of bytes received, indicating to
     * libcurl that all is okay 
     */
    return segsize;
}


static int my_trace( CURL *handle, curl_infotype type, char *data,
                     size_t size, void *userp ) {

    struct dataflags *config = (struct dataflags *)userp;
    const char *text;
    (void)handle; /* prevent compiler warning */

    switch (type) {
        case CURLINFO_TEXT:
            fprintf(stderr, "== Info: %s", data);
            break;

        case CURLINFO_END:
            text = "=> END";
            break;

        case CURLINFO_HEADER_OUT:
            text = "=> Send header";
            break;

        case CURLINFO_DATA_OUT:
            text = "=> Send data";
            break;

        case CURLINFO_SSL_DATA_OUT:
            text = "=> Send SSL data";
            break;

        case CURLINFO_HEADER_IN:
            text = "<= Recv header";
            break;

        case CURLINFO_DATA_IN:
            text = "<= Recv data";
            break;

        case CURLINFO_SSL_DATA_IN:
            text = "<= Recv SSL data";
            break;

        default: /* in case a new one is introduced to shock us */
            return 0;

    }

    /* actually we are throwing away the data but at least
     * it gets dumped out onto the terminal */
    dump (text, stderr, (unsigned char *)data, size, config->trace_ascii );

    return 0;

}


static void dump( const char *text, FILE *stream, unsigned char *ptr,
                  size_t size, char nohex ) {

    size_t i;
    size_t c;
  
    unsigned int width=0x10;  /* Assume 16 chars per hex line */
  
    if (nohex)
        /* without the hex output, we can fit more on screen */
        width = 0x40;
  
    /* show how many bytes were received */
    fprintf(stream, "%s, 0x%8.8lx\n", text, (long)size);
  
    for ( i=0; i<size; i+=width ) {
  
        fprintf(stream, "%4.4lx: ", (long)i);
  
        if (!nohex) { /* hex not disabled, show it */
            for ( c = 0; c < width; c++ )
                if ( i+c < size )
                    fprintf (stream, "%02x ", ptr[i+c] );
                else
                    fprintf (stream, "   " );
        }
  
        for ( c = 0; (c < width) && (i+c < size); c++ ) {
            /* check for 0D0A; if found, skip past and 
             * start a new line of output 
             */
            if ( nohex && ( i+c+1 < size ) 
                       && ( ptr[i+c]==0x0D )
                       && ( ptr[i+c+1]==0x0A ) ) {
                i+=(c+2-width);
                break;
            }

            fprintf (stream, "%c",
                      ( ptr[i+c]>=0x20 ) && ( ptr[i+c]<0x80 ) ? ptr[i+c] : '.');

            /* check again for 0D0A, to avoid an extra \n if it's at width */
            if ( nohex && ( i+c+2 < size )
                       && ( ptr[i+c+1]==0x0D )
                       && ( ptr[i+c+2]==0x0A ) ) {
                i+=(c+3-width);
                break;
            }
        }
        fputc('\n', stream); /* newline */
    }

    fflush(stream);

}

void hexdump ( char *desc, void *addr, int len ) {

    int i;
    unsigned char buff[17];
    unsigned char *pc = (unsigned char*)addr;

    /* Output description if given. */
    if ( desc != NULL ) {
        printf ( "%s:\n", desc );
    }

    /* Process every byte in the data. */
    for ( i = 0; i < len; i++ ) {
        /* Multiple of 16 means new line (with line offset). */

        if ( ( i % 16 ) == 0 ) {
            /* Just don't print ASCII for the zeroth line. */
            if ( i != 0 ) {
                printf ( "  %s\n", buff );
            }

            /* Output the offset. */
            printf ( "  %04x ", i );
        }

        /* Now the hex code for the specific character. */
        printf ( " %02x", pc[i] );

        /* And store a printable ASCII character for later. */
        if ( ( pc[i] < 0x20 ) || ( pc[i] > 0x7e ) ) {
            buff[i % 16] = '.';
        } else {
            buff[i % 16] = pc[i];
        }

        buff[(i % 16) + 1] = '\0';

    }

    /* Pad out last line if not exactly 16 characters. */
    while ( ( i % 16 ) != 0 ) {
        printf ( "   " );
        i++;
    }

    /* And print the final ASCII bit. */
    printf ( "  %s\n", buff );

}

