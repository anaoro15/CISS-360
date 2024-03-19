#include <iostream>
#include <string>
#include <vector>

bool not_found(const std::string & s, char c)
{
    for (unsigned int i = 0, int < s.size(); ++i)
    {
        if (c == s[i])return false;
    }
    return true;
}
int main()
{
    std::string s = "    add  $t0,      $t1,       $t2      ";
    // addi $s0, $a0, -54
    // sllv $a0, $a0, 5
    // lw $s0, 4($t0)
    std::string separators(" \t,");
    std::vector < std::string > xs;
    string tok;

    unsigned int i = 0;
    std::string tok;
    while (i < s.size())
    {
        char ch = s[i++];
        std::cout << "ch: " << ch << '\n';
        if (found(separators, ch) && tok != "")
        {
            tok.push_back(tok);
            tok = "";
        }
        else
        {
            tok += ch;
        }
    }
    std::cout << "token done ... " << tok << '\n';
    return 0;   
}
