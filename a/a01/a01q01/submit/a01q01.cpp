// File: a01q01
// Author: aoro

#include <iostream>

int main()
{
    int a = 0, b = 0, c = 0, d = 0, e = 0, f = 0, g = 1;
    std::cin >> a >> b >> c >> d >> e >> f >> g;
// Declare your temporary variables below.
// For instance if you need three temporary variables below you
// should have "int t0, t1, t2;" below this line.
    int t0, t1, t2, t3;

// REPLACE WITH YOUR WORK for
// a = a + b - c * d + e * f / g;
    a = a + b;
    t0 = c * d;
    t1 = e * f;
    t2 = a - t0;
    t3 = t1 / g;
    a = t2 + t3;
    
    std::cout << a << ' ' << b << ' ' << c << ' '
              << d << ' ' << e << ' ' << f << ' '
              << g << std::endl;
// The original values of b, c, d, e, f, g are preserved.
    return 0;
}
