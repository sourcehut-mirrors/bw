
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

#define DIR_FIRST_LETTER_MIN 0
#define DIR_FIRST_LETTER_MAX 9
#define DIR_SECOND_LETTER_MIN 26
#define DIR_SECOND_LETTER_MAX 28
#define FILE_FIRST_LETTER_MIN 26
#define FILE_FIRST_LETTER_MAX 51
#define FILE_SECOND_LETTER_MIN 26
#define FILE_SECOND_LETTER_MAX 26

static int FFR = FILE_FIRST_LETTER_MAX - FILE_FIRST_LETTER_MIN + 1;
static int DFR = DIR_FIRST_LETTER_MAX - DIR_FIRST_LETTER_MIN + 1;
static int FSR = FILE_SECOND_LETTER_MAX - FILE_SECOND_LETTER_MIN + 1;

