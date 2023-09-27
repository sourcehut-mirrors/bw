
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

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

typedef struct m_data {
    /* the actual data elements */
    uint32_t *mandel_val;
    double *coord_r, *coord_j;
} m_data;

typedef struct f_item {

    /* the header data */
    double       real_translate;
    double       imag_translate;
    double       magnify;
    uint32_t     num_elements;
    uint32_t     mand_bail;
    uint32_t     vbox_real_count;
    uint32_t     vbox_imag_count;
    uint32_t     vbox_sample_real;
    uint32_t     vbox_sample_imag;
    int          pthread_limit;

    FILE         *fp;
    int          file_error_status;
    long         file_position;

    m_data       *mandelbrot_data;

} f_item;

uint32_t rot4(uint32_t x);
uint64_t rot8(uint64_t x);
char *strtrim( char *str );
int file_stat_err( int file_errno );
int sysinfo(int verbose);

int array_index(uint32_t Vr, uint32_t Vj,
                uint32_t Sr, uint32_t Sj,
                uint32_t vbox_real_count,
                uint32_t vbox_sample_real,
                uint32_t vbox_sample_imag );

int file_pointer(FILE **fp, char *fidname);

int read_mbrot_data(f_item *mandelbrot);

int file_stat_err( int file_errno );

