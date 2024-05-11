1) Sort 
	1) built-in sort
	2) and simple sort methods
2) Binary search - week 4 - 4 tasks
3) Tree - week 7 - 9 tasks
	1) traversing
	3) min max prev
4) Graph - week 8 - 8 tasks; week 9 - 5 tasks; 
	1) representation methods
	2) adjacency matrix, adjacency list
	3) DFS, BFS
	4) number of edges
	5) degree of vertices 





# SORT
```c++
void bubble_sort(int a[], int length){
	int temp;
	for (int i = 0; i < length-1; i++){
		for (int j = length-1; j >= i+1; j--){
			if(a[j] < a[j-1]){  
				temp = a[j-1];  
				a[j-1] = a[j];  
				a[j] = temp;
			}
		}
	}
}

void selection_sort(int a[], int length) {
    int temp, min;
    for (int i = 0; i < length - 1; i++)
    {
        min = i;
        for (int j = i + 1; j < length; j++)
        {
            if (a[j] < a[min])
                min = j;
        }
        temp = a[i];  
        a[i] = a[min];  
        a[min] = temp;
    }
}

void insertion_sort(int a[], int length) {
    int temp, j;
    for (int i = 0; i < length; i++)
    {
        j = i;
        while (j > 0 && a[j] < a[j - 1])
        {
            temp = a[j];  
            a[j] = a[j - 1];  
            a[j - 1] = temp;
            j--;
        }
    }
}

vector<int> arr = { 1, 3, 2, 4, 5 };
sort(arr.begin(), arr.end());

int length = 5;
int arr2[] = { 1, 3, 2, 4, 5 };
sort(arr2, arr2+length);
```

# Binary Search
```c++
int main(){ 
    double C, left = 0, right, middle;
    cin >> C;
    right = C;
    while (right-left>1e-8){
        middle = (left+right)/2;
        if (func(middle)>C){ // x*x+sqrt(x)
            right = middle;
        } else {
            left = middle;
        }
    }
    cout << middle;
    return 0;
}

int main(){
    int a, b, c, d;
    double left, right, middle;
    cin >> a >> b >> c >> d;
    int r = 1;
    while (func(a, b, c, d, r) * func(a, b, c, d, -r) >= 0) { // a*x*x*x + b*x*x + c*x + d
        r *= 2;
    }
    left = -r, right =r;
    while (abs(right-left)>1e-10){
        middle = (left+right)/2;
        if (func(a,b,c,d,middle)*func(a,b,c,d,right)>0) right = middle;
        else left = middle;
    }
    cout << middle;
    return 0;
}

int binsearch(int l, int x){ // l - length, x - number to search
    int left = 0, right = l, middle;

    while ( right>left) {
        middle = (right+left)/2;
        if (arr[middle]<x) left = middle+1;
        else right = middle;
    }
    return left;
}
// binsearch(n, x+1)-binsearch(n,x)
```
# Tree
## TreeNode
```c++
class TreeNode {
public:
    int val;
    TreeNode *left, *right;
    TreeNode(int v) {
        this->val = v;
        this->left = NULL;
        this->right = NULL;
    }
};

class TreeNode {
public:
    int val;
    TreeNode *left, *right, *parent;
    TreeNode(int v, TreeNode* par = NULL) {
        this->val = v;
        this->left = NULL;
        this->right = NULL;
        this->parent = par;
    }
};
```
## Insert
```c++
void Insert(TreeNode*& tree, int x) {
    if (tree == NULL) {
        tree = new TreeNode(x);
        return;
    }
    if (x > tree->val) Insert(tree->right, x);
    else Insert(tree->left, x);
}

```
## Traversals
InOrder – centred: going through left subtree, root, right subtree;
PreOrder – forward: going through root, left subtree, right subtree;
PostOrder – reverse: going through left subtree, right subtree, root;
```c++
void InOrder(TreeNode *tree){
    if (tree == NULL) return;
    InOrder(tree->left);
    cout << tree->val << " ";
    InOrder(tree->right);
}
void PreOrder(TreeNode *tree){
    if (tree == NULL) return;
    cout << tree->val << " ";
    PreOrder(tree->left);
    PreOrder(tree->right);   
}
void PostOrder(TreeNode *tree){
    if (tree == NULL) return;
    PostOrder(tree->left);
    PostOrder(tree->right);  
    cout << tree->val << " "; 
}

int main(){
    TreeNode *tree = new TreeNode(9);

    Insert(tree, 4);
    Insert(tree, 16);
    Insert(tree, 3);
    Insert(tree, 6);
    Insert(tree, 12);
    Insert(tree, 24);

    InOrder(tree); cout << endl;
    PreOrder(tree); cout << endl;
    PostOrder(tree); cout << endl;

    return 0;
}
    /*
    3 4 6 9 12 16 24 
    9 4 3 6 16 12 24 
    3 6 4 12 24 16 9 
    */
```
## Find
```c++
TreeNode* Find(TreeNode *tree, int element) {
    if (tree == NULL) return NULL;
    if (tree->val == element) return tree;
    if (tree->val < element) return Find(tree->right,element);
    else return Find(tree->left,element);
}
```
## Minimum Maximum
```c++
TreeNode* Minimum(TreeNode *tree) {
    while ( tree->left != NULL) tree = tree->left;
    return tree;
}
TreeNode* Maximum(TreeNode *tree) {
    while ( tree->right != NULL) tree = tree->right;
    return tree;
}
```
## Next Previous
```c++
TreeNode* Next(TreeNode *tree) {
    if (tree->right!=NULL) { // finding minumum of right branch
        tree = tree->right; 
        while ( tree->left != NULL) tree = tree->left;
        return tree;
    }
    TreeNode *par = tree->parent;
    while(par!=NULL && par->val < tree->val){ // moving upper 
        tree = tree->parent; 
        par = tree->parent;
    }
    return par;
}
// just changing left and right, < and >
TreeNode* Prev(TreeNode *tree) {
    if (tree->left!=NULL) { // finding maximum of right branch
        tree = tree->left; 
        while ( tree->right != NULL) tree = tree->right;
        return tree;
    }
    TreeNode *par = tree->parent;
    while(par!=NULL && par->val > tree->val){ // moving upper 
        tree = tree->parent; 
        par = tree->parent;
    }
    return par;
}
```
## Depth
```c++
int minDepth(TreeNode* tree){
  if (tree == NULL) return 0;
  if (tree->left == NULL) return minDepth(tree->right) + 1;
  if (tree->right == NULL) return minDepth(tree->left) + 1;
  int Left = minDepth(tree->left);
  int Right = minDepth(tree->right);
  return min(Left, Right) + 1;
}

int maxDepth(TreeNode* tree) {
    if (tree == NULL) return 0;
    return 1 + max(maxDepth(tree->left), maxDepth(tree->right));
}
```
## Sum
```c++
int Sum(TreeNode *tree){
    int sum = 0;
    if (tree) {
        sum+= tree->val+Sum(tree->left)+Sum(tree->right);
    }
    return sum;
}

int sumLeft(TreeNode* tree){ // only left leaves not all nodes
    if (tree == NULL) return 0;
    if (tree->left != NULL && tree->left->left == NULL && tree->left->right == NULL)
        return tree->left->val + sumLeft(tree->right); // if left child does not have children
    return sumLeft(tree->left) + sumLeft(tree->right); // if has
}
```
## Balanced
```c++
bool isBalanced(TreeNode* tree) {
  return (Height(tree) != -1);
}

int Height(TreeNode* tree) {
  if (tree == NULL) return NULL;
  int Left = Height(tree->left);
  int Right = Height(tree->right);
  if (Left == -1 || Right == -1 || abs(Left - Right) == 1) return -1;
  return max(Left, Right) + 1;
}
```
## Symmetric
```c++
bool isSymmetric(TreeNode* root){
    if (root == NULL) return true;
    return Helper(root->left, root->right);
}

bool Helper(TreeNode* left, TreeNode* right){
    if (left == NULL && right == NULL) return true;
    else if (left == NULL || right == NULL) return false; // checking whether one is NULL other is not NULL
    bool cond1 = left->val == right->val;
    bool cond2 = Helper(left->left, right->right);
    bool cond3 = Helper(left->right, right->left);
    return cond1 && cond2 && cond3;
}
```

# Graph
## Adj Matrix
```c++
int adj[N][N];

void fillAdjMatrix(int n){
    for (int i = 0; i < n; i++){
        for (int j = 0; j < n; j++){
            adj[i][j] = 0;
        }
    }    
}

void inputAdjMatrix(int l){
    for (int i = 1; i <= l; i++){
        for (int j = 1; j <= l; j++){
            cin >> adj[i][j];
        }      
    }
}

void outputAdjMatrix(int l){
    for (int i = 1; i <= l; i++){
        for (int j = 1; j <= l; j++){
            cout << adj[i][j] << " ";
        }      
        cout << endl;
    }
}
```
## Adj List
```c++
vector<int> adjl[N];

void addToAdjList(int from, int to){
    adjl[from].push_back(to);
}

void inputAdjList(int m, bool directed = false){
    while(m--){
        int x,y;
        cin >> x >> y;
        addToAdjList(x,y);
        if (!directed) addToAdjList(y,x);
    }
}

void outputAdjList(int l){
    for (int i = 1; i <= l; i++){
        if (adjl[i].empty()) continue;
        for (int j = 0; j < adjl[i].size(); j++) {
            cout << i << " " << adjl[i].at(j) << endl;
        } // it will output both 1 2 and 2 1 in undirected
    }
}
```
## Adj Matrix to Adj List and vice versa
```c++
void adjListToAdjMatrix(int l){
    fillAdjMatrix(l);
    for (int i = 1; i <= l; i++){
        if (adjl[i].empty()) continue;
        for (int j = 0; j < adjl[i].size(); j++) {
            adj[i][adjl[i].at(j)] = 1;
        }
    }
}

void adjMatrixToAdjList(int l){
    for (int i = 1; i <= l; i++){
        for (int j = 1; j <= l; j++){
            if (adj[i][j]) addToAdjList(i,j);
        }      
    }
}
```

# DFS/BFS
```c++
int visited[N];
int adj[N][N];
vector<int> arr[N];

void dfs(int v, int n) { // adj matrix
	visited[v] = 1;
	cout << v << " ";

	for (int i = 1; i <= n; i++){
		if (adj[v][i] && !visited[i]) {
			dfs(i, n);
		}
	}
}

void dfs(int v) { // adj list
    visited[v] = 1;
    cout << v << " ";

    for (int i = 0; i < arr[v].size(); i++) {
        if (!visited[arr[v].at(i)]) {
            dfs(arr[v].at(i));
        }
    }
}

void bfs(int i){  
	visited[i] = true;  
	queue<int> q;  
	q.push(i);
	while (!q.empty()){
		int u = q.front(); 
		q.pop();  
		cout<<u<<" ";
		for (int v = 1; v <= n; v++){
			if( !visited[v] && adj[u][v]){  
			visited[v] = true;  q.push(v);
			}
		}
	}
}
```

🍬🍬🍬🍬🍬🍬🍬
🍬🍬🍬🍬🍬🍬🍬
🍬🍬By Elnur🍬🍬
🍬🍬🍬🍬🍬🍬🍬
🍬🍬🍬🍬🍬🍬🍬
