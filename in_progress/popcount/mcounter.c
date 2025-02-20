
/* becauge Marian says so .. this is a no brancher */

#define _XOPEN_SOURCE 600

int 
mcounter ( int number )
{
    int result = 0;
    do {
        result += number & 0x1;
    } while (number>>=1);

    return result;

}

