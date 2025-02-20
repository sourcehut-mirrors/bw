
/*
 * popcount.c  more or less ripped off from the LLVM codebase
 *
 * see the weird stuff at :
 *
 * https://github.com/llvm-mirror/compiler-rt/blob/master/lib/builtins/popcountdi2.c
 *
 * beware beware of the green dragon of shit redef types 
 *
 * https://github.com/llvm-mirror/compiler-rt/blob/master/lib/builtins/int_types.h
 *
 * ------------------------------------------------------------------
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <inttypes.h>

/* at most we need 8 bits to count with */
uint8_t
popcount(uint64_t a)
{
    /* try to make sense of the bullshit redef crap in the LLVM
     * header lib/builtins/int_types.h fer fucks sake */
    uint64_t x2, tmp0, tmp1, tmp2;
    uint32_t x;

    x2 = a;

    /*
     * The LLVM code thing has a cool algorithm that we see in most
     * ASM output on a RISCV system with LLVM/Clang 19.x and the
     * original line was this shite :
     *
     *     x2 = x2 - ((x2 >> 1) & 0x5555555555555555uLL);
     *
     * However I want to break that down into little steps because I
     * need small words spoken slowly .. with a beer .. thanbk you.
     *
     * take a shift to the right ... lets all do the time warp again!
     */
    tmp0 = x2 >> 1;

    /* mask with bit pattern 010101010101010....0101 for 64 bits */
    tmp1 = tmp0 & 0x5555555555555555uLL;

    /* what the fuck ? do a subtrackt of that tmp1 for some obsure reason */
    x2 = x2 - tmp1;

    /*
     * The next line in the LLVM magic code was this :
     *
     *    x2 = ((x2 >> 2) & 0x3333333333333333uLL) + (x2 & 0x3333333333333333uLL);
     *
     * NOTE from the wizards of C compilers wherein we hear a scream in the distance
     *
     * SlendiDev : C does not guarantee evaluation order for binary
     *               operations that are commutative
     */
    tmp0 = x2 >> 2;
    tmp1 = tmp0 & 0x3333333333333333uLL;
    tmp2 = x2   & 0x3333333333333333uLL;
    x2 = tmp1 + tmp2;


    /*
     * our next line of code magic from the LLVM world :
     *
     *    x2 = (x2 + (x2 >> 4)) & 0x0F0F0F0F0F0F0F0FuLL;
     */
    tmp0 = x2 >> 4;
    tmp1 = x2 + tmp0;
    x2 = tmp1 & 0x0F0F0F0F0F0F0F0FuLL;


    /*
     * Now things get a tad messy as the intermediate may be 
     * a signed short ( 16 bits ? ) or a damn unsigned 32-bit
     * or an octopus on acid dancing in my mind .... any fucking
     * thing may happen.
     *
     *     x = (long long)(x2 + (x2 >> 32));
     */

     /* fuck why shift right 32 bits ? */
     tmp0 = x2 >> 32; 
     tmp1 = x2 + tmp0;
     x = (uint32_t)( tmp1 + tmp0 );

    /*
     * No idea how this makes sense but at least now I can
     * single step and debug this cuttlefish of disaster
     *
     *     return (int)( (x + (x >> 8)) & 0x0000007F );
     */

    tmp0 = x >> 8;
    tmp1 = x + tmp0;
    tmp2 = tmp1 & 0x0000007F;

    return (uint8_t) tmp2;

}

