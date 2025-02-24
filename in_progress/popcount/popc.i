# 1 "popc.c"


 
# 5

 
# 13

# 1 "/usr/include/stdint.h"
 
# 5

# 8

#ident	"@(#)stdint.h	1.1	03/12/04 SMI"

 
# 16

# 1 "/usr/include/sys/stdint.h"
 
# 5

# 8

#ident	"@(#)stdint.h	1.1	03/12/04 SMI"

 
# 16

# 1 "/usr/include/sys/int_types.h"
 
# 5

# 8

#ident	"@(#)int_types.h	1.10	04/09/28 SMI"

 
# 33

# 1 "/usr/include/sys/feature_tests.h"
 
# 4

# 7

#ident	"@(#)feature_tests.h	1.26	11/04/12 SMI"

# 1 "/usr/include/sys/ccompile.h"
 
# 5

# 8

#ident	"@(#)ccompile.h	1.2	04/11/08 SMI"

 
# 15

# 19

 
# 29

# 84

# 86

# 88

 
# 92

# 100


# 105

# 1 "/usr/include/sys/isa_defs.h"
 
# 4

# 7

#ident	"@(#)isa_defs.h	1.30	11/03/31 SMI"

 
# 191

# 195

 
# 395

 
# 402

 
# 412

 
# 433

 
# 442

 
# 473

 
# 482

# 484

 
# 495

# 499

 
# 506

# 510

# 514

# 12 "/usr/include/sys/feature_tests.h"

# 16

 
# 30

 
# 61

# 65

 
# 110

# 117

 
# 121

# 125

 
# 165

 
# 193

 
# 244

 
# 266
 
# 278

 
# 302

 
# 307

 
# 328

 
# 344

 
# 357

 
# 363

 
# 369

 
# 375

# 379

# 35 "/usr/include/sys/int_types.h"

# 39

 
# 54
typedef char			int8_t;
# 60
typedef short			int16_t;
typedef int			int32_t;
# 64
typedef long			int64_t;
# 71

typedef unsigned char		uint8_t;
typedef unsigned short		uint16_t;
typedef unsigned int		uint32_t;
# 76
typedef unsigned long		uint64_t;
# 82

 
# 88
typedef int64_t			intmax_t;
typedef uint64_t		uintmax_t;
# 94

 
# 101
typedef long			intptr_t;
typedef unsigned long		uintptr_t;
# 107

 
# 113
typedef char			int_fast8_t;
# 119
typedef int			int_fast16_t;
typedef int			int_fast32_t;
# 122
typedef long			int_fast64_t;
# 128

typedef unsigned char		uint_fast8_t;
typedef unsigned int		uint_fast16_t;
typedef unsigned int		uint_fast32_t;
# 133
typedef unsigned long		uint_fast64_t;
# 139

 
# 145
typedef char			int_least8_t;
# 151
typedef short			int_least16_t;
typedef int			int_least32_t;
# 154
typedef long			int_least64_t;
# 160

typedef unsigned char		uint_least8_t;
typedef unsigned short		uint_least16_t;
typedef unsigned int		uint_least32_t;
# 165
typedef unsigned long		uint_least64_t;
# 171

# 175

# 1 "/usr/include/sys/int_limits.h"
 
# 5

# 8

#ident	"@(#)int_limits.h	1.9	04/09/28 SMI"

 
# 34

# 1 "/usr/include/sys/feature_tests.h"
 
# 4

# 36 "/usr/include/sys/int_limits.h"

# 40

 
# 72

# 81

# 87

# 93

# 102

# 109

# 118

# 125

 
# 139

 
# 146

 
# 159

 
# 164

 
# 173

 
# 178

 
# 255

# 259

# 1 "/usr/include/sys/int_const.h"
 
# 5

# 8

#ident	"@(#)int_const.h	1.5	04/09/28 SMI"

 
# 32

# 1 "/usr/include/sys/feature_tests.h"
 
# 4

# 34 "/usr/include/sys/int_const.h"

# 38

 
# 55
 
# 61

# 68
 
# 76

 
# 79
 
# 81
 
# 84
 
# 92

# 94
 
# 96
 
# 109

# 113

# 20 "/usr/include/sys/stdint.h"

# 18 "/usr/include/stdint.h"

# 15 "popc.c"

int popc (unsigned long long x) {

    const unsigned long long k1 = 0x5555555555555555ULL;
    const unsigned long long k2 = 0x3333333333333333ULL;
    const unsigned long long k4 = 0x0f0f0f0f0f0f0f0fULL;

    x =   x             - ((x >> 1)  & k1);
    x = ( x & k2 )      + ((x >> 2)  & k2);
    x = ( x             +  (x >> 4)) & k4 ;

    x = ( x * 0x0101010101010101ULL) >> 56;

     
    return (int)(x & 0xffffffff);

}

#ident "acomp: Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30"
