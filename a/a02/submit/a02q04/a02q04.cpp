// Name: aoro
// File: a02q04.cpp
// Documentation:
/*==============================================================================
  This program is the translated SPIM program from assignment a02, q03.
  ============================================================================*/


#include <iostream>

int main()
{
    int a, b, c, d;
    std::cout << "Enter values for a, b, c and d: ";
    std::cin >> a >> b >> c >> d;

    a = 2 * a - c - d;
    std::cout << "a: " << a << '\n'
              << "b: " << b << '\n'
              << "c: " << c << '\n'
              << "d: " << d << '\n';
 
    return 0;
}
