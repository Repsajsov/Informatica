#include <climits>
#include <iostream>

using namespace std;
const int MAX = 100;

struct Graph {
    int n;
    int adj[MAX][MAX];
    int distances[MAX];

    Graph(int n) {
        this->n = n;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) { adj[i][j] = 0; }
        }
    }

    void addEdgeDirected(int from, int to, int weight) { adj[from][to] = weight; }
    void addEdgeUndirected(int from, int to, int weight) {
        adj[from][to] = weight;
        adj[to][from] = weight;
    }
    void removeEdge(int from, int to) { adj[from][to] = 0; }
    void printAdj() {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) { cout << adj[i][j] << " "; }
            cout << endl;
        }
    }
    int* dijkstra(int startVertex) {
        bool visited[n];
        for (int i = 0; i < n; i++) {
            distances[i] = INT_MAX;
            visited[i] = false;
        }
        distances[startVertex] = 0;

        for (int i = 0; i < n; i++) {
            int vertex = -1;
            int minimum = INT_MAX;

            for (int i = 0; i < n; i++) {
                if (!visited[i] && distances[i] < minimum) {
                    minimum = distances[i];
                    vertex = i;
                }
            }
            if (vertex == -1) break;
            visited[vertex] = true;

            for (int i = 0; i < n; i++) {
                if (adj[vertex][i] != 0 && distances[vertex] != INT_MAX) {
                    int newDistance = distances[vertex] + adj[vertex][i];
                    if (newDistance < distances[i]) { distances[i] = newDistance; }
                }
            }
        }
        return distances;
    }
};

int main() {
    Graph g = Graph(7);
    g.addEdgeUndirected(0, 1, 12);
    g.addEdgeUndirected(1, 2, 2);
    g.addEdgeUndirected(2, 3, 12);
    g.addEdgeUndirected(3, 4, 1);
    g.addEdgeUndirected(4, 5, 10);
    g.addEdgeUndirected(5, 0, 1);
    g.addEdgeUndirected(3, 6, 3);

    g.addEdgeUndirected(1,5,1);
    g.addEdgeUndirected(2,4,1);
    int* distances = g.dijkstra(0);
    for (int i = 0; i < g.n; i++) { cout << distances[i] << " "; }

    return 0;
}