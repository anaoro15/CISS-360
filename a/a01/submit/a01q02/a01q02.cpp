// File: a01q02.cpp
// Author: aoro

#include <iostream>

int main()
{
    int x = 0;
    std::cin >> x;
    int y = 0;

    if (x < 0) goto L1;
    if (x >= 0) goto L2;
    
  L1:    y = 1;
    std::cout << "foo" << std::endl;
    goto L3;
    
  L2:     y = 2;
    std::cout << "bar" << std::endl;

  L3:  std::cout << y << std::endl;
    
    return 0;
}
