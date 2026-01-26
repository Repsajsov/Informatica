#include <climits>
#include <iostream>

struct node {
    int value;
    int sum = 0;
    node* leftNode;
    node* rightNode;
};

int getTreeHeight(node* root, int i = -1) {
    if (!root) return i;
    i++;
    int leftHeight = getTreeHeight(root->leftNode, i);
    int rightHeight = getTreeHeight(root->rightNode, i);
    return (leftHeight > rightHeight) ? leftHeight : rightHeight;
}

int getAmountNodes(node* root, int i = 0) {
    if (!root) return i;
    return getAmountNodes(root->rightNode, getAmountNodes(root->leftNode, ++i));
}

int getMaxValue(node* root, int max = INT_MIN) {
    if (!root) return max;
    if (max < root->value) max = root->value;
    int left = getMaxValue(root->leftNode, max);
    int right = getMaxValue(root->rightNode, max);
    return (left < right) ? right : left;
}

node* maxNodeHelper(node* root, node* max);
node* getMaxNode(node* root) {
    node* maxNode = new node;
    maxNode->value = INT_MIN;
    return maxNodeHelper(root, maxNode);
}
node* maxNodeHelper(node* root, node* max) {
    if (!root) return max;
    if (max->value < root->value) max = root;
    node* leftNode = maxNodeHelper(root->leftNode, max);
    node* rightNode = maxNodeHelper(root->rightNode, max);
    return (leftNode->value > rightNode->value) ? leftNode : rightNode;
}

/*

                   x
                  / \
                 y   z
                / \ / \
               w   x   s

               x
             /   \
           p       q
*/

int getAmountLeafs(const node* root) {
    if (!root) { return 0; }
    int left = getAmountLeafs(root->leftNode);
    int right = getAmountLeafs(root->rightNode);
    if ((left + right) == 0) return 1;
    return left + right;
}

int sumTree(node* root) {
    if (!root) return 0;

    int a = sumTree(root->leftNode);
    int b = sumTree(root->rightNode);
    return a + b + root->value;
}

bool hasValue(node* root, int target) {
    if (!root) return false;
    if (root->value == target) return true;
    return hasValue(root->leftNode, target) || hasValue(root->rightNode, target);
}

node* getValueNode(node* root, int target) {
    if (!root) return nullptr;
    if (root->value == target) return root;
    node* left = getValueNode(root->leftNode, target);
    return left ? left : getValueNode(root->rightNode, target);
}

void calculateSum(node* root) {
    if (!root) return;

    calculateSum(root->leftNode);
    calculateSum(root->rightNode);

    int left = root->leftNode ? root->leftNode->sum : 0;
    int right = root->rightNode ? root->rightNode->sum : 0;
    root->sum = left + right + root->value;
}

bool inBalance(node* root) {
    if (!root) return true;
    if (!inBalance(root->leftNode)) return false;
    if (!inBalance(root->rightNode)) return false;
    if (!root->leftNode || !root->rightNode) return true;
    return root->leftNode->sum == root->rightNode->sum;
}

using namespace std;

int main() {
    node* root = new node;
    root->value = 2;
    root->leftNode = new node;
    root->leftNode->value = 3;

    root->rightNode = new node;
    root->rightNode->value = 3;

    root->leftNode->rightNode = new node;
    root->leftNode->rightNode->value = 3;

    root->leftNode->leftNode = new node;
    root->leftNode->leftNode->value = 3;

    cout << inBalance(root);

    return 0;
}
