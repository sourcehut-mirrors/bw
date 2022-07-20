

#include <string.h>
#include <ctype.h>
#include <stdlib.h>

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
    if( end_off<=start_off ) {
        return NULL;
    }

    /* we hope to enforce the trailing nul char */
    ret=longbow_str_hack(&str[start_off],end_off-start_off+1);

    return ret;

}

