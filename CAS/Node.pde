public class Node {
  int child1;
  int child2;
  
  Node() { 
    child1 = -1;
    child2 = -1;
    
  }
  Node(int node1) {
    child1 = node1;
    child2 = -1;
  }
  Node(int node1, int node2) {
    child1 = node1;
    child2 = node2;
    
  }
  
}
