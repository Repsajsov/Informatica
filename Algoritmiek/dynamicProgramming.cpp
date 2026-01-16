#include <climits>
#include <iostream>

using namespace std;

int fibonacciSlow(const int n) {
    if (n == 0) return 0;
    else if (n == 1) return 1;

    return fibonacciSlow(n - 1) + fibonacciSlow(n - 2);
}

int fibonacci(const int n) {
    int F[n + 1];
    F[0] = 0;
    F[1] = 1;
    for (int i = 2; i <= n; i++) F[i] = F[i - 1] + F[i - 2];
    return F[n];
}

int longestSubArray(const int A[], const int& n) {
    int max = INT_MIN;
    for (int i = 0; i < n; i++) {
        int count = 1;
        int temp = A[i];
        for (int j = i + 1; j < n; j++) {
            if (temp < A[j]) {
                count++;
                temp = A[j];
            }
        }
        if (count > max) max = count;
    }
    return max;
}

int main() {
    int A[] = {3, 1, 4, 5, 2, 3, 6, 2, 8, 1, 7, 9, 9};
    int n = sizeof(A) / sizeof(int);
    cout << longestSubArray(A, n);

    return 0;
}