
#include <stdio.h>
#include <fenv.h>  

void test1()
{
    double const decimal =  1.0/20480;
    double const integer = 1024.0L;
    printf("000%.18f\n", decimal);
    printf("%.18f\n", integer);
    printf("%.18f\n", decimal + integer);
    printf("\n");
}

void test2()
{
    double const decimal =  0.000048828125000000L;
    double const integer = 1024.0L;
    printf("000%.18f\n", decimal);
    printf("%.18f\n", integer);
    printf("%.18f\n", decimal + integer);
    printf("\n");
}

int main()
{
    test1();
    test2();
    return 0;
}

