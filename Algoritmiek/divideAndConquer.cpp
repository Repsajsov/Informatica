#include <iostream>

using namespace std;

void print(const int A[], int length)
{
    for (int i = 0; i < length; i++)
    {
        cout << A[i] << ", ";
    }
    cout << endl;
}

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

// void mergesort(const int A[], const int left, const int right)
// {
//     if (right - left == 1)
//     {
//         return;
//     }
// }

void merge(int A[], const int left, const int middle, const int right)
{
    int leftSize = middle - left + 1;
    int rightSize = right - middle;
    int leftArray[leftSize];
    int rightArray[rightSize];

    for (int i = 0; i < leftSize; i++)
    {
        leftArray[i] = A[left + i];
    }
    for (int j = 0; j < rightSize; j++)
    {
        rightArray[j] = A[j + middle + 1];
    }
    print(leftArray, leftSize);
    print(rightArray, rightSize);

    int i = 0;
    int j = 0;
    int k = 0;
    while (i < leftSize && j < rightSize)
    {
        if (leftArray[i] <= rightArray[j])
        {
            A[k] = leftArray[i];
            i++;
        }
        else
        {
            A[k] = rightArray[j];
            j++;
        }
        k++;
    }
    while (i < leftSize)
    {
        A[k] = leftArray[i];
        k++;
        i++;
    }
    while (j < rightSize)
    {
        A[k] = rightArray[j];
        k++;
        j++;
    }
}

int main()
{
    int A[] = {1, 0, 0, 1, 2, 3, -1, -2, 3, 2403, -1234};
    int n = sizeof(A) / sizeof(int);

    print(A, n);
    merge(A, 0, n / 2, n);
    print(A, n);

    return 0;
}