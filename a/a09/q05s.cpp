#include <iostream>
#include <string>

typedef uint32_t bit; // only least significant bit of uint32_t should be used
typedef uint32_t word;

void readbits(word * x);
void printbit(word x);
void printbits(word x);
void bit_adder(word * s, word * c, word x, word y);   // 1-bit full adder
void addu (word * ret, word x, word y);           // 32-bit unsigned int addition
void comp (word * ret, word x);                   // 32-bit two's complement
void subu (word * ret, word x, word y);           // 32-bit unsigned int subtraction
void multu(word * HI, word * LO, word x, word y); // 32-bit unsigned int mult w
word divu (word * r,  word * q, word x, word y);  // 32-bit unsigned int div

void readbits(word * x)
{
    std::string s;
    std::cin >> s;
    auto p = s.begin();
    for (int i = 31; i >= 0; --i)
    {
        int b = (*p++ == '0' ? 0 : 1);
        *x |= (b << i);
    }
}

void readbit(word * x)
{
    std::string s;
    std::cin >> s;
    int b = (s[0] == '0' ? 0 : 1);
    *x |= b;
}

void printbits(word x)
{
    for (int i = 31; i >= 0; --i)
    {
        std::cout << ((x >> i) & 1);
    }
    std::cout << ' ' << x; 
    std::cout << '\n';
}

void printbit(word x)
{
    std::cout << (x & 1) << '\n'; 
}

void addu (word * ret, word x, word y)
{
}


int main()
{
    bit s, c, a, b;
    word w, x, y, z;

    int option;
    std::cin >> option;
    switch (option)
    {
        case 0: // test readbits and printbits
            readbits(&w);
            printbits(w);
            break;
        case 1: // test readbit and printbit
            readbit(&w);
            printbit(w);
            break;
        /*
        case 2: // test addu
            readbits(&x);
            readbits(&y);
            addu(&w, x, y);
            printbits(w);
            break;
        case 3: // test comp
            readbits(&x);
            comp(&w, x);
            printbits(w);
            break;
        case 4: // test subu
        case 5: // test multu
        case 6: // test divu
        */
    }
    
    return 0;
}
