#include <iostream>

int main()
{
    std::cout << (5 ^ 6) << std::endl;
    int mask = 7; // 111 in base 2
    std::cout << ((~5) & mask) << std::endl;
    
    // x = 101b0111  - you want the bit b
    // shift right by 4: x >> 4 = ...101b
    // mask with 1: x >>
    int x = 5;
    std::cout << ((x)& 1) << ' '
              << ((x >> 1)& 1) << ' '
              << ((x >> 2)& 1) << std::endl;
               
    return 0;
}
