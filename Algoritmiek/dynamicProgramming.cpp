#include <climits>
#include <iostream>

using namespace std;

int fibonacciSlow(const int n) {
    if (n == 0) return 0;
    else if (n == 1) return 1;

    return fibonacciSlow(n - 1) + fibonacciSlow(n - 2);
}

int fibonacciMemoization(int const n, int M[]) {
    if (M[n] != -1) return M[n];
    else if (n == 0) return 0;
    else if (n == 1) return 1;
    M[n] = fibonacciMemoization(n - 1, M) + fibonacciMemoization(n - 2, M);
    return M[n];
}

int fibonacciDP(const int& n) {
    int F[n + 1];
    F[0] = 0;
    F[1] = 1;
    for (int i = 2; i <= n; i++) F[i] = F[i - 1] + F[i - 2];
    return F[n];
}

int max(int const A[], int n) {
    if (n == 0) { return A[0]; }
    int x = max(A, n - 1);
    return (A[n] > x) ? A[n] : x;
}

int longestIncreasingSubArray(const int A[], const int& n) {
    int L[n];
    for (int i = 0; i < n; i++) L[i] = 1;

    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++)
            if (A[j] < A[i]) L[i] = max(L[j] + 1, L[i]);
    }
    int maxLength = L[0];
    for (int i = 1; i < n; i++)
        if (L[i] > maxLength) maxLength = L[i];
    return maxLength;
}

int minCoins(const int n) {
    if (n == 1) { return 1; }
    if (n <= 0) { return 0; }

    int a = 0, b = 0, c = 0;
    if (n % 10 == 0) {
        return minCoins(n - 10);
    } else if (n % 5 == 0) {
        return minCoins(n - 5);
    } else {
        return minCoins(n - 1);
    }
}

int main() {
    cout << minCoins(11);
    return 0;
}