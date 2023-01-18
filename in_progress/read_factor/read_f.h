
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

/* there is no promise that _POSIX_PATH_MAX exists or
 * some value for _XOPEN_PATH_MAX and really we may
 * as well go for something reasonable */
#define LOCAL_PATH_MAX 255

#define VERBOSE 1

#define ERROR_FILENAME_LENGTH   247
#define ERROR_FILENAME_EMPTY    248
#define ERROR_FILENAME_STAT     249
#define ERROR_FILENAME_FOPEN    250
#define ERROR_FILENAME          251

#define ERROR_MEMORY            252
#define ERROR_ALL_DATA_NOT_READ 253
#define ERROR_INSUFFICIENT      254
#define ERROR_END_OF_FILE       255

#define LINE_LENGTH_MAX         255
#define LINE_OVERRUN            246

typedef struct f_item {
    FILE  *fp;
    int   file_error_status;
    long  file_position;
} f_item;

typedef struct line_item {
    char *buffer;
    size_t        buffer_length;
    int           error_status;
} line_item;

int file_stat_err( int file_errno );
int filepath_ptr(FILE **fp, char *fidname);
int get_factor_line(FILE *fp, line_item *line);
char *pathname_trim( char *str );

