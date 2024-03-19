#include <iostream>
#include <cstdint>
#include <vector>

int main()
{
    // operator shift left <<
    unsigned int x = 5;
    unsigned int y = 2 * x + 1;
    std::cout << "x: " << x << " y: " << y << '\n';
    unsigned int z = (5 << 1) + 1;
    std::cout << "x: " << x << " y: " << y << '\n';
    unsigned int g = 4 * x + 3;
    std::cout << "x: " << x << " y: " << g << '\n';
    unsigned int h = (5 << 2) + 3;
    std::cout << "x: " << x << " y: " << h << '\n';

    //    int a = 5, b = 21;
    // std::cout << (a ^ b ^ b) << std::endl;         // 5

    // std::cout << (a ^ b) << std::endl;             // 16

    // std::cout << (a ^ b ^ b ^ b) << std::endl;     // 16

    // std::cout << (a ^ b ^ b ^ b ^ b) << std::endl; // 5

    float v = 3.14159;
    uint32_t * p = (uint32_t *)(&v);
    std::cout << sizeof(*p) << '\n';

    std::vector < int > b(32,0);
    for (int i = 0; i < 32; ++i)
    {
        b[i] = p & 1;
        p >>= 1;
    }
    for (int i = 31; i >= 0; --i)
    {
        std::cout << b[i];
    }
    
    std::cout << '\n';

    return 0;
}
