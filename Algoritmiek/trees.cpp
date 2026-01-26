#include <iostream>

struct node {
    int value;
    node* leftNode;
    node* rightNode;
};

int treeHeight(node* root, int i = -1) {
    if (!root) return i;
    i++;
    int leftHeight = treeHeight(root->leftNode, i);
    int rightHeight = treeHeight(root->rightNode, i);
    return (leftHeight > rightHeight) ? leftHeight : rightHeight;
}

int sumTree(node* root) {
    if (!root) return 0;

    int a = sumTree(root->leftNode);
    int b = sumTree(root->rightNode);
    return a + b + root->value;
}

bool searchTree(node* root, int target) {
    if (!root) return false;
    if (root->value == target) return true;
    return searchTree(root->leftNode, target) || searchTree(root->rightNode, target);
}

node* searchTree2(node* root, int target) {
    if (!root) return nullptr;
    if (root->value == target) return root;
    node* left = searchTree2(root->leftNode, target);
    return left ? left : searchTree2(root->rightNode, target);
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

    cout << treeHeight(root);

    return 0;
}
