#include <climits>
#include <iostream>

using namespace std;

void printArray(float A[], int n) {
    for (int i = 0; i < n; i++) { cout << A[i] << " "; }
}

void sort(float A[][7], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j = n - i; j++) {
            if (A[j] < A[j + 1]) {
                float tempWeight = A[1][j];
                A[1][j] = A[1][j + 1];
                A[1][j + 1] = tempWeight;

                float temp
            }
        }
    }
}

float* knapsack(float A[][7], int n, int m) {
    sort(A, n);
    float* L = new float[n];
    for (int i = 0; i < n; i++) { L[i] = 0; }

    int sum = 0;
    for (int i = 0; i < n; i++) {
        if ((A[1][i] + sum) < m) {
            L[i] = A[1][i];
            sum += L[i];
        } else {
            L[i] = m - sum;
            sum += L[i];
            break;
        }
    }
    return L;
}

int main() {
    float A[2][7] = {{12, 17, 9, 7, 5, 21, 8}, {2, 5, 7, 3, 1, 4, 1}};

    float* L = knapsack(A, 7, 15);
    printArray(L, 7);
    delete L;

    return 0;
}