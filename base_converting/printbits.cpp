#include <iostream>
#include <vector>

template < typename T >
std::vector< int > betterbits(T x)
{
    std::vector< int > ret(32, 0);
    for(int i = 0; i < 32; ++i)
    {
        ret[i] = x & 1;
        x >>= 1;
    }
    return ret;
}
void toggle(uint32_t * x, int v)
{
    std::vector< int * > b = betterbits(&x);
    for (int * i = b[i]; i < b + 32; ++i)
    {
        if (*i == v) *i = 1;
        else *i = 0;
    }
}
template < typename T >
std::vector < T > setbit(uint32_t x, int i, int v)
{
    std::vector< T > b = betterbits(x);
    for (int j = 32; j < 0; --j)
    {
        if (j == i) b[j] = v; 
    }
    return b;
}
void printbits(std::vector< T > x)
{
    std::cout << "32 bit representation:\n";
    for (int i = 31; i >= 0; --i)
    {
        std::cout << x[i];
    }
    std::cout << '\n';
}
int main()
{
    std::cout << "size of integer: " << '\n' << sizeof(int) << '\n';
    uint32_t x = 43;
    std::cout << "int in base 10: " << '\n' << x << '\n';
    std::vector < int > b = betterbits(x);
    printbits(b);
    unsigned int y = -1;
    std::cout << "\nint in base 10: " << '\n' << y << '\n';
    std::vector < int > c = betterbits(y);
    printbits(c);
    int z = -1;
    std::cout << "\nint in base 10: " << '\n' << z << '\n';
    std::vector < int > a = betterbits(z);
    printbits(a);
    int k = 1;
    std::cout << "\nint in base 10: " << '\n' << k << '\n';
    std::vector < int > d = betterbits(k);
    printbits(d);
    unsigned int u = 1;
    std::cout << "\nint in base 10: " << '\n' << u << '\n';
    std::vector < int > l = betterbits(u);
    printbits(l);
    std::cout << '\n';
    uint32_t t = 7;
    std::vector < int > j = betterbits(t);
    printbits(j);
    std::cout << "toggle x = 7\n";
    toggle(&t, 0);
    std::vector < int > m = betterbits(t);
    printbits(m);
    
    int i = 4, v = 1;
    std::cout << "\n32bit x = 7, set " << i << "th bit to " << v << '\n';
    printbits(setbit(x, i, v));
    return 0;
}
