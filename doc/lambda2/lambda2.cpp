// https://www.boost.org/doc/libs/latest/libs/lambda2/doc/html/lambda2.html

#include <boost/lambda2.hpp>

#include <algorithm>
#include <iostream>
#include <map>
#include <string>

// Counting the Even Numbers
using namespace boost::lambda2;

int count_even(int const *first, int const *last)
{
    return std::count_if(first, last, _1 % 2 == 0);
}

// Finding the First Whitespace Character
char const *find_whitespace(char const *first, char const *last)
{
    using namespace boost::lambda2;

    return std::find_if(first, last,
                        _1 == ' ' || _1 == '\t' || _1 == '\r' || _1 == '\n');
}

// Code Example 1. Using first and second to print out a map
void print(std::map<int, std::string> const &m)
{
    using namespace boost::lambda2;
    std::for_each(m.begin(), m.end(), std::cout << _1->*first << ": " << _1->*second << '\n');
}

int main()
{
}
