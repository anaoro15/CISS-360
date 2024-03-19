// File: a01q03.cpp
// Author: aoro

#include <iostream>

int main()
{
    int x = 0;
    std::cin >> x;

    int i = 0;
  
  L0:  if (i < x) goto L1;
    
       if (i >= x) goto L3;
    
  L1:  std::cout << i << std::endl;
    i++;
    goto L0;
   
  L3:  return 0;
}
