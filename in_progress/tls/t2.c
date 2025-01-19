

/* as seen at
 * https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=235751
 */

struct s_t {
    int (*func)(int);
};

extern struct s_t __thread x;

int main(int argc, const char *argv[]) {
    int ret = (*x.func)(argc+41);
    return ret;
}

