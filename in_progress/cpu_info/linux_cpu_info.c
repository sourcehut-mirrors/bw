
/* really only care about this stuff

io$      
io$ grep '^vendor_id' /proc/cpuinfo 
vendor_id       : AuthenticAMD
vendor_id       : AuthenticAMD
io$ grep '^vendor_id' /proc/cpuinfo | head -1 
vendor_id       : AuthenticAMD
io$ grep '^model name' /proc/cpuinfo | head -1 
model name      : AMD E-450 APU with Radeon(tm) HD Graphics
io$ 
io$ grep '^siblings' /proc/cpuinfo | head -1 
siblings        : 2
io$ grep '^cpu cores' /proc/cpuinfo | head -1 
cpu cores       : 2
io$ grep '^flags' /proc/cpuinfo | head -1 
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf pni monitor ssse3 cx16 popcnt lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch ibs skinit wdt hw_pstate vmmcall arat npt lbrv svm_lock nrip_save pausefilter
io$ grep '^bugs' /proc/cpuinfo | head -1 
bugs            : fxsave_leak sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass
io$ 

*/

a
#include <stdio.h>
#include <stdlib.h>

FILE *f = fopen("textfile.txt", "rb");
fseek(f, 0, SEEK_END);
long fsize = ftell(f);
fseek(f, 0, SEEK_SET);  /* same as rewind(f); */

char *string = malloc(fsize + 1);
fread(string, fsize, 1, f);
fclose(f);

string[fsize] = 0;

// use the string, then ...

free(string);

