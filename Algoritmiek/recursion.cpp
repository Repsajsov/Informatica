#include <iostream>
#include <climits>

using namespace std;

int sum(const int A[], const int n)
{
    if (n == 0)
    {
        return 0;
    }

    return A[n - 1] + sum(A, n - 1);
}

int max(const int A[], const int n)
{
    if (n == 0)
    {
        return INT_MIN;
    }

    int tempMax = max(A, n - 1);
    if (A[n - 1] > tempMax)
    {
        return A[n - 1];
    }
    else
    {
        return tempMax;
    }
}

int frequencyCounter(const int A[], const int n, const int x)
{
    if (n == 0)
    {
        return 0;
    }
    int count = frequencyCounter(A, n - 1, x);
    if (A[n - 1] == x)
    {
        count++;
    }
    return count;
}

int main()
{
    int A[] = {1, 3, 4, 123, 3, 4, 0, 0, 0, 1, 2, 2938475, 0, 0, 1};
    int n = sizeof(A) / sizeof(int);
    cout << frequencyCounter(A, n, 0);

    return 0;
}