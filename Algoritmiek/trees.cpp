#include <iostream>

struct node {
    int value;
    node* leftNode;
    node* rightNode;
};

void createTree() {};

int sumTree(node* root) {
    if (!root) return 0;
    int a = sumTree(root->leftNode);
    int b = sumTree(root->rightNode);
    return a + b + root->value;
}

bool searchTree(node* root, int target) {
    if (!root) return false;
    bool a = searchTree(root->leftNode, target);
    bool b = searchTree(root->rightNode, target);
    return (root->value == target || a || b) ? true : false;
}

node* searchTree2(node* root, int target) {
    if (!root) return nullptr;
    node* a = searchTree2(root->leftNode, target);
    node* b = searchTree2(root->rightNode, target);
    if (root->value == target) return root;
    else if (a) return a;
    else if (b) return b;
    return nullptr;
}

using namespace std;

int main() {
    node* root = new node;
    root->value = 2;
    root->leftNode = new node;
    root->leftNode->value = 3;

    root->rightNode = new node;
    root->rightNode->value = 12;

    root->leftNode->rightNode = new node;
    root->leftNode->rightNode->value = 5;

    root->leftNode->leftNode = new node;
    root->leftNode->leftNode->value = 6;

    cout << searchTree2(root, 12)->value;

    return 0;
}
