
/* this should not be needed but here we are in December 2025
 * wherein LLVM/Clang on FreeBSD 15.0-RELEASE gets a hissy fit
 */

#include <stdint.h>
#include <stddef.h>

static void selftest_seq(uint8_t *out, size_t len, uint32_t seed);

int blake2b_selftest(void);

int blake2s_selftest(void);

