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

int min(const int a, const int b) { return (a < b) ? a : b; }
int max(const int a, const int b) { return (a > b) ? a : b; }

int minCoinsHelper(const int n, int seen[]);
int minCoins(const int n) {
    int* seen = new int[n + 1];
    for (int i = 0; i <= n; i++) { seen[i] = -1; }
    seen[0] = 0;

    int result = minCoinsHelper(n, seen);
    delete[] seen;

    return result;
}
int minCoinsHelper(const int n, int seen[]) {
    if (n < 0) return INT_MAX / 2;
    if (seen[n] != -1) return seen[n];

    int a = 1 + minCoinsHelper(n - 1, seen);
    int b = 1 + minCoinsHelper(n - 5, seen);
    int c = 1 + minCoinsHelper(n - 10, seen);

    seen[n] = min(min(a, b), c);

    return seen[n];
}
int minCoinsDP(const int n) {
    int s = n / 10;
    s += (n % 10) / 5;
    s += (n % 5);
    return s;
}

bool subsetSum(const int A[], int n, int sum) {
    if (sum == 0) return true;
    if (n < 0) return false;

    for (int i = n; i >= 0; i--) {
        int newSum = sum - A[i];
        if (subsetSum(A, i - 1, newSum)) return true;
    }
    return false;
}

bool subsetSum2(const int A[], int n, int sum) {
    if (sum == 0) return true;
    if (n < 0) return false;

    bool exclude = subsetSum2(A, n - 1, sum);

    bool include = subsetSum2(A, n - 1, sum - A[n]);
    return exclude | include;
}

int power(const int a, const int n) {
    if (n == 0) return 1;

    return power(a, n - 1) * a;
}

int main() {
    cout << power(2, 3);
    return 0;
}