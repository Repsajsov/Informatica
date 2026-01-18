#include <climits>
#include <iostream>

using namespace std;

int fibonacciSlow(const int n) {
    if (n == 0) return 0;
    else if (n == 1) return 1;

    return fibonacciSlow(n - 1) + fibonacciSlow(n - 2);
}

int fibonacci(const int& n) {
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

// bool hasSubsetSum(int const A[], int const n, int const s) { return false; }

int stairsMemoization(int const n, int M[]) {
    if (M[n] != -1) return M[n];
    else if (n == 0) return 1;
    else if (n == 1) return 1;
    cout << "Calls with calculations: f(" << n << ")" << endl;
    M[n] = stairsMemoization(n - 1, M) + stairsMemoization(n - 2, M);
    return M[n];
}

int stairsDP(int const n) {
    int M[n + 1];
    M[0] = 1;
    M[1] = 1;
    for (int i = 2; i <= n; i++) { M[i] = M[i - 1] + M[i - 2]; }
    return M[n];
}

int main() {
    // int A[] = {3, 1, 4, 5, 2, 3, 6, 2, 8, 1, 7, 9, 9};
    // int n = sizeof(A) / sizeof(int);
    // cout << longestIncreasingSubArray(A, n);

    int M[] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    int n = sizeof(M) / sizeof(int);
    cout << stairsDP(n - 1);
    return 0;
}