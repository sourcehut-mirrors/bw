
/* someone suggested we look at whatever the compiler
 * knows about this thing */

int answer(unsigned int x) {
    return __builtin_popcount(x);
}


