#include <iostream>

using namespace std;

int search(const int A[], const int left, const int right, const int x)
{
    if (left > right)
    {
        return -1;
    }

    int middle = (left + right) / 2;

    if (A[middle] == x)
        return middle;
    else if (A[middle] > x)
    {
        return search(A, left, middle - 1, x);
    }
    else
    {
        return search(A, middle + 1, right, x);
    }
}

bool twoZero(const int A[], const int left, const int right)
{
    if (right - left == 1)
        return (A[left] == 0 && A[right] == 0) ? true : false;

    int middle = (left + right) / 2;
    return (twoZero(A, left, middle) || twoZero(A, middle, right)) ? true : false;
}

int main()
{
    int A[] = {1, 0, 0, 1};
    int n = sizeof(A) / sizeof(int);

    cout << twoZero(A, 0, n - 1);
    return 0;
}