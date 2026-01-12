#include <iostream>

using namespace std;

int som(int A[], int n)
{
    if (n == 1)
    {
        return A[0];
    }

    return A[n - 1] + som(A, n - 1);
}

int main()
{
    int A[] = {1, 2, 3};
    cout << som(A, 3);

    return 0;
}