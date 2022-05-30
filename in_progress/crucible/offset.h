
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

/* see https://tools.ietf.org/html/rfc4648 RFC 4648
 * 5.  Base 64 Encoding with URL and Filename Safe Alphabet
 *
 *   0 A            17 R            34 i            51 z
 *   1 B            18 S            35 j            52 0
 *   2 C            19 T            36 k            53 1
 *   3 D            20 U            37 l            54 2
 *   4 E            21 V            38 m            55 3
 *   5 F            22 W            39 n            56 4
 *   6 G            23 X            40 o            57 5
 *   7 H            24 Y            41 p            58 6
 *   8 I            25 Z            42 q            59 7
 *   9 J            26 a            43 r            60 8
 *  10 K            27 b            44 s            61 9
 *  11 L            28 c            45 t            62 - (minus)
 *  12 M            29 d            46 u            63 _
 *  13 N            30 e            47 v           (underline)
 *  14 O            31 f            48 w
 *  15 P            32 g            49 x
 *  16 Q            33 h            50 y         (pad) =
 */

#define DIR_FIRST_LETTER_MIN 0
#define DIR_FIRST_LETTER_MAX 25
#define DIR_SECOND_LETTER_MIN 26
#define DIR_SECOND_LETTER_MAX 51
#define FILE_FIRST_LETTER_MIN 26
#define FILE_FIRST_LETTER_MAX 51
#define FILE_SECOND_LETTER_MIN 26
#define FILE_SECOND_LETTER_MAX 51

static int FFR = FILE_FIRST_LETTER_MAX  - FILE_FIRST_LETTER_MIN  + 1;
static int FSR = FILE_SECOND_LETTER_MAX - FILE_SECOND_LETTER_MIN + 1;
static int DFR = DIR_FIRST_LETTER_MAX   - DIR_FIRST_LETTER_MIN   + 1;
static int DSR = DIR_SECOND_LETTER_MAX  - DIR_SECOND_LETTER_MIN  + 1;

int offset(int a, int b, int k, int x);

