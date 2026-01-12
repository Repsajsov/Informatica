#include <iostream>
#include <string>

using namespace std;

bool palindrome(const string s, const int left, const int right)
{
    if (left >= right)
    {
        return true;
    }

    if (s[left] != s[right])
    {
        return false;
    }

    return palindrome(s, left + 1, right - 1);
}

int power(const int x, const int n)
{
    if (n == 0)
    {
        return 1;
    }
    return x * power(x, n - 1);
}

int power2(const int x, const int n)
{
    if (n == 0)
    {
        return 1;
    }
    int half = power2(x, n / 2);

    if (n % 2 == 0)
    {
        return half * half;
    }
    else
    {
        return x * half * half;
    }
}

int main()
{
    string s = "112211";
    int n = s.length();

    cout << power2(2, 4);

    return 0;
}