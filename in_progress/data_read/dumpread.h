
/* there is no promise that _POSIX_PATH_MAX exists or
 * some value for _XOPEN_PATH_MAX and really we may
 * as well go for something reasonable */
#define LOCAL_PATH_MAX 255

uint64_t rot8(uint64_t x);
uint32_t rot4(uint32_t x);
char *strtrim( char *str );
int file_stat_err( int file_errno );

#define VERBOSE 1
int sysinfo(int verbose);

