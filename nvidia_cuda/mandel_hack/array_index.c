
#include <inttypes.h>

int array_index(uint32_t Vr, uint32_t Vj,
                uint32_t Sr, uint32_t Sj,
                uint32_t vbox_real_count,
                uint32_t vbox_sample_real,
                uint32_t vbox_sample_imag )
{

    int part1 = (int)Vr * (int)vbox_sample_real;

    int part2 = (int)Vj * (int)vbox_real_count
                        * (int)vbox_sample_real
                        * (int)vbox_sample_imag;

    int part3 = (int)Sj * (int)vbox_real_count
                        * (int)vbox_sample_real;

    int result = part1 + (int)Sr + part2 + part3;

    return result;

}

