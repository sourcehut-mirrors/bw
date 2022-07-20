
#define _XOPEN_SOURCE 500

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>

char *longbows_trim(char *str);
static char *longbow_str_hack(const char *src, size_t n);

int main(int argc, char *argv[]) {

    char *some_string[] =
    {
        "one string",
        "    two strings",
        "three strings  ",
        " four ",
        " fifth string  ",
        "sixth   string ",
        "  this   -     thing ",
        "and more\t",
        "     ",
        "a long  string   that    says nothing  much",
        "\tthus quoth the raven and a rose in tatters on the gardens path",
        "\tissued   a compile and gave utterance to\t\nwrath\t",
        "a",
        "",
        NULL
    };
    char buffer[255] = "\0";
    char *longbow = NULL;
    int j;

    /* we are not checking the return from setlocale() */
    setlocale(LC_ALL,"C");

    printf( "----------------------------------------------------\n" );
    printf( "TEST: strtrim()\n\n" );
    for( j = 0; ( j<14 ) ; ++j ) {
        /* NOTE we never pass in a pointer to a string literal
         * and we use the buffer safely */
        strcpy( buffer, some_string[j] );
        printf("input : \"%s\"\n", buffer);

        longbow = longbows_trim( buffer );
        if ( longbow != NULL ) {
            printf("output: \"%s\"\n\n", longbow);
            free(longbow);
            longbow = NULL;
        } else {
            printf("output: NULL pointer\n\n");
        }
    }

    /* the final NULL is a bugger */
    longbow = longbows_trim( some_string[14] );
    if ( longbow == NULL ) {
        printf( "input : NULL\noutput: NULL pointer\n\n");
    } else {
        /* magic ? n0se demons ? */
        printf( "input : NULL\noutput: \"%s\"\n\n", longbow );
        /* should be impossible */
        free(longbow);
        longbow = NULL;
    }

    /* we need to free that some_string[14] mess 
    if ( some_string[14] != NULL ) {
        free( some_string[14] );
        some_string[14] = NULL;
    }
    */

    return EXIT_SUCCESS;

}

static char *longbow_str_hack(const char *src, size_t n) {
    /* trailing \0 char is included in the n+1 byte */
    char *ret=calloc(n+1, sizeof(unsigned char));
    memcpy(ret,src,n);
    return ret;
}

char *longbows_trim(char *str)
{
    size_t start_off=0;
    size_t end_off;
    char *ret = NULL;

    if(!str) {
        return NULL;
    }

    /* strlen does not count the trailing nul byte */
    end_off=strlen(str) - 1;

    /* if this is a single byte string then we check
     * for whitespace and return '\0' if so. */
    if ( end_off == 0 ) {
        ret=longbow_str_hack(str,1);
        if ( isspace(str[0]) ) {
            ret[0] = '\0';
        }
        return ret;
    }

    /* check for some MAX_LENGTH someday */
    while(isspace(str[start_off])) {
        start_off++;
    }

    /* we ensure that end_off > start_off such that we never
     * end up doing a strndup() of zero chars.
     *
     * However this is a total hack ... see longbow_str_hack */
    while((isspace(str[end_off])) && (end_off > start_off)) {
        end_off--;
    }

    /* bad mojo here?
     * however we should never land in this code. */
    if( end_off<start_off ) {
        return NULL;
    }

    /* we hope to enforce the trailing nul char */
    ret=longbow_str_hack(&str[start_off],end_off-start_off+1);

    return ret;

}

