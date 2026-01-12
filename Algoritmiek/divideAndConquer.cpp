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

int main()
{
    int A[] = {1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 99};
    int n = sizeof(A) / sizeof(int);
    cout << search(A, 0, n, 12);
    return 0;
}