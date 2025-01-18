
/* as seen at
 * https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=235751
 */

int f(int x) {
    return x;
}

struct s_t {
    int (*func)(int);
};

struct s_t __thread x = { f };

