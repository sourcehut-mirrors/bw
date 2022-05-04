
/*
 * offset_check.c  Verify that the math for index into the four
 *                 dimensional array will be correct.
 *
 * Copyright (C) Dennis Clarke 2022
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
 */

/*
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 */
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>

#include "index.h"

int offset(int a, int b, int k, int x);

int
main(int argc, char **argv)
{

	int dfl, dsl, ffl, fsl, alpha, beta, kappa, chi;

	/* We are creating a set of files within a set of directories.
	 * The names of the files are all two letters within any given
	 * directory which are also two letters. The set of letters
	 * being used are all the lowercase and uppercase letters thus :
	 *
	 *    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
	 *
	 *    The uppercase set of letters are numbered from 0 to 25
	 *    and thus we may index into the uppercase letter set with
	 *    the number 10 being the letter 'K'.  The lowercase letters
	 *    are similar :
	 *
	 *    a b c d e f g h i j k l m n o p q r s t u v w x y z
	 *
	 *    Here we use the numbers 26 upwards to 51 to index into
	 *    that set. Therefore the lowercase letter 'p' is easily
	 *    given the number 41.
	 *
	 * It seems clear that we can use any integer from 0 upwards to
	 * a maximum of 51 to find any letter we want.
	 *
	 * The problem we must face is that 52 possible letters is much
	 * like having a full deck of cards in front of us. There is a lot
	 * of choice and we need a directory name with two letters. Thus
	 * the first letter is 52 possible values and the second letter in
	 * the directory name is also 52 possible values. This is a large
	 * total of 52 x 52 = 2704 unique directory names. Within each of
	 * those directories we create files that also have a two letter
	 * name and it should be obvious that the number of files will be
	 * also 2704 unique files per directory. This is a grand total of
	 * 2704 x 2704 = 7311616 files. Well over seven million. It would
	 * make sense to restrict the total number of files down to a more
	 * reasonable set.
	 *
	 * For the sake of simplicity we can reduce the directory names
	 * down to a first letter starting at 'A' and then no further than
	 * the letter 'J'. This is only ten letters in the first character
	 * of the directory name and we can also further restrict to the
	 * lowercase letters 'a' upwards to 'c'. Only three possible value
	 * letters 'a', 'b' and 'c' are available for the second character
	 * in the directory name 'XX' gives us 10 x 3 = 30 unique names.
	 * To facilitate this in software we can use a few "defines" :
	 *
	 *    #define DIR_FIRST_LETTER_MIN 0
	 *    #define DIR_FIRST_LETTER_MAX 9
	 *
	 * Those take care of the first letter in the directory name for
	 * the letters 'A' through 'J'.
	 *
	 *    #define DIR_SECOND_LETTER_MIN 26
	 *    #define DIR_SECOND_LETTER_MAX 28
	 *
	 * Those two defines cover the second letter 'a', 'b' and 'c'.
	 *
	 * The filename can also be restricted to a subset of letters :
	 *
	 *    #define FILE_FIRST_LETTER_MIN 26
	 *    #define FILE_FIRST_LETTER_MAX 51
	 *    #define FILE_SECOND_LETTER_MIN 26
	 *    #define FILE_SECOND_LETTER_MAX 26
	 *
	 * It should be clear that the MIN and MAX of a given letter
	 * range must be ordered where MIN <= MAX is assured.
	 *
	 * We therefore must have a countable range of letters for each
	 * possible letter character in the directory names and the file
	 * names :
	 *
	 *     (1) countable range of the first letter in a directory :
	 *
	 *         DFR = DIR_FIRST_LETTER_MAX - DIR_FIRST_LETTER_MIN + 1
	 *
	 *     (2) countable range of the second letter in a directory :
	 *
	 *         DSR = DIR_SECOND_LETTER_MAX - DIR_SECOND_LETTER_MIN + 1
	 *
	 *     (3) countable range of the first letter in a filename :
	 *
	 *         FFR = FILE_FIRST_LETTER_MAX - FILE_FIRST_LETTER_MIN + 1
	 *
	 *     (4) countable range of the second letter in a filename :
	 *
	 *         FSR = FILE_SECOND_LETTER_MAX - FILE_SECOND_LETTER_MIN + 1
	 *
	 * It should be clear why we need the additional +1 when the MAX
	 * and MIN of a given letter range are the same. We can not allow
	 * for a countable letter range of zero.  There must be at least
	 * one letter in the range.
	 *
	 * WARNING : In general we offset into arrays ( or memory allocated
	 *           to represent some array ) with a starting point at zero.
	 *
	 * This then gets the problem of how to index into a large linear
	 * array of values where every possible combination of letters has
	 * been represented. At the very least we need to simplify a bit
	 * and refer to the characters with nice three letter variables as
	 * opposed to great long underscore defines. Therefore we have a
	 * full filename structured like so :
	 *
	 *         some_target_path/[dfl][dsl]/[ffl][fsl].dat
	 *
	 * Where :
	 *
	 *     (a) dfl is the directory first letter numerical value
	 *     (b) dsl is the directory second letter numerical value
	 *     (c) ffl is the filename first letter numerical value
	 *     (d) fsl is the filename second letter numerical value
	 *
	 * For a reasonable test we should consider the very small
	 * range of values suggested above where :
	 *
	 *    #define DIR_FIRST_LETTER_MIN 0
	 *    #define DIR_FIRST_LETTER_MAX 9
	 *
	 *        DFR = DIR_FIRST_LETTER_MAX - DIR_FIRST_LETTER_MIN + 1
	 *        DFR =  9 - 0 + 1 = 10
	 *
	 *    #define DIR_SECOND_LETTER_MIN 26
	 *    #define DIR_SECOND_LETTER_MAX 28
	 *
	 *        DSR = 28 - 26 + 1 = 3
	 *
	 *    #define FILE_FIRST_LETTER_MIN 26
	 *    #define FILE_FIRST_LETTER_MAX 51
	 *
	 *        FFR = FILE_FIRST_LETTER_MAX - FILE_FIRST_LETTER_MIN + 1
	 *        FFR = 51 - 26 + 1 = 26
	 *
	 *    #define FILE_SECOND_LETTER_MIN 26
	 *    #define FILE_SECOND_LETTER_MAX 26
	 *
	 *        FSR = FILE_SECOND_LETTER_MAX - FILE_SECOND_LETTER_MIN + 1
	 *        FSR = 26 - 26 + 1 = 1
	 *
	 * A valid file pathname in that scheme would be :
	 *
	 *     some_target_path/Ec/pa.dat
	 *
	 * At this point we can compute the total possible number of
	 * directory and file combinations based on the countable range
	 * for each letter as DFR * DSR * FFR * FSR = 10 * 3 * 26 * 1.
	 * Clearly we get 780 possible unique pathnames.
	 *
	 * We have a two dimensional or rectangular array of possible
	 * letters for the directory name :
	 *
	 *        dsl
	 *         ^
	 *         |
	 *   28 = c|..........* (4,28)
	 *         |          :
	 *         |          :
	 *         |          :
	 *         +-------------------> dfl
	 *                    E = 4
	 *
	 * The directory first and second letter will intersect at the
	 * point indicated with an asterisk '*' and that single point
	 * must represent the two dimensional array of all possible file
	 * names also. We must use the absolute position values of these
	 * letters as integer numbers if we hope to get any math done.
	 * Thus the above intersection point must be (E,c) => (4,28) where
	 * we know that 'A' is 0 and 'a' is 26. Any given file within a
	 * two dimensional array will have the same situation :
	 *
	 *        fsl
	 *         ^
	 *         |
	 *         |                  (41,26)
	 *         |                 /
	 *         |                |
	 *         |                v
	 *   26 = a+----------------*--> ffl
	 *                          p = 41
	 *
	 * Since the FILE_SECOND_LETTER_MIN is 26 and that is also the
	 * maximum value we are restricted to fsl = 'a' which is 26 as a
	 * number value.  The letter 'p' will be 41 and therefore the data
	 * point for the filename is (p,a) => (41,26). This is where we
	 * need to look at entire letter ranges that simply do not matter
	 * to us. There is no reason to consider the uppercase letters for
	 * ffl nor fsl. The total possible filenames is simply FFR * FSR
	 * which we know to be 26 * 1 = 26. Let us therefore look at the
	 * computations needed along with four new variables for an offset :
	 *
	 *     dfl =  4 for the uppercase letter 'E'
	 *     dsl = 28 for the lowercase letter 'c'
	 *     ffl = 41 for the lowercase letter 'p'
	 *     fsl = 26 for the lowercase letter 'a'
	 *
	 *     alpha = dfl - DIR_FIRST_LETTER_MIN    =  4 -  0 = 28
	 *
	 *      beta = dsl - DIR_SECOND_LETTER_MIN   = 28 - 26 = 2
	 *
	 *     kappa = ffl - FILE_FIRST_LETTER_MIN   = 41 - 26 = 15
	 *
	 *       chi = fsl - FILE_SECOND_LETTER_MIN  = 26 - 26 = 0
	 *
	 * The above values (alpha, beta, kappa, chi) will uniquely locate
	 * any file within any directory without the use of letters or
	 * values that do not concern us.
	 *
	 * For a file [kappa,chi] within a directory [alpha,beta] we may
	 * offset into a linear array of values :
	 *
	 *     offset = alpha x FFR + kappa
	 *
	 *            + beta x DFR x FFR x FSR
	 *
	 *            + chi x DFR x FFR
	 *
	 */

	for ( dfl = DIR_FIRST_LETTER_MIN; dfl <= DIR_FIRST_LETTER_MAX; dfl++ ) {
		alpha = dfl - DIR_FIRST_LETTER_MIN;
		for ( dsl = DIR_SECOND_LETTER_MIN; dsl <= DIR_SECOND_LETTER_MAX; dsl++ ) {
			beta = dsl - DIR_SECOND_LETTER_MIN;
			for ( ffl = FILE_FIRST_LETTER_MIN; ffl <= FILE_FIRST_LETTER_MAX; ffl++ ) {
				kappa = ffl - FILE_FIRST_LETTER_MIN;
				for ( fsl = FILE_SECOND_LETTER_MIN; fsl <= FILE_SECOND_LETTER_MAX; fsl++ ) {
					chi = fsl - FILE_SECOND_LETTER_MIN;
					printf("%7i\n",offset(alpha,beta,kappa,chi));
				}
			}
		}
	}

	return EXIT_SUCCESS;

}

int
offset(int a, int b, int k, int x)
{

	return a * FFR + k + b * DFR * FFR * FSR + x * DFR * FFR;

}

