
#include <iostream>

/* This test rejects OSF 5.1 Compaq C++ in its default pre-standard iostream
   mode, since that mode puts cout in the global namespace, not "std".  */
void someoutput (void) { std::cout << 123; }

int main (void) { return 42; }
