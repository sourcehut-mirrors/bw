

/* strictly on sparcv9 */

#define _XOPEN_SOURCE 600

static inline unsigned long __cmpxchg(volatile void *ptr,
                                      unsigned long old,
                                      unsigned long new, int size)
{
    switch (size) {

    case 1: return atomic_cas_8(ptr,
                                (unsigned char)old,
                                (unsigned char)new );

    case 2: return atomic_cas_16(ptr,
                                 (unsigned short)old,
                                 (unsigned short)new );

    case 4: return atomic_cas_32(ptr,
                                 (unsigned int)old,
                                 (unsigned int)new );

#ifdef _LP64
    case 8: return atomic_cas_64(ptr, old, new);
#endif

    default: break;    

    }

    return old;

}

