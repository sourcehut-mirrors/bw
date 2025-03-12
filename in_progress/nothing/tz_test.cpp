
/* per https://gcc.gnu.org/pipermail/gcc-help/2025-March/144067.html */

#include <chrono>
#include <iostream>

int main()
{
  std::cout << std::chrono::get_tzdb().version << '\n';
}

