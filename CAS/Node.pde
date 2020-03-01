import java.util.Stack;

public class Node {
  String value;
  Node left, right;
  
  Node(String thing) { 
    value = thing;
    left = right = null;
  }
}

public class ExpressionTree {
  // Check to see if input is an operator
  boolean isOperator(String c) {
    if(c.equals("+") || c.equals("-") || c.equals("*") || c.equals("/") || c.equals("^")) {
      return true;
    }
    return false;
  }
  
  // Inorder traversal
  void inorder(Node t) {
    if(t != null) {
      inorder(t.left);
      System.out.print(t.value + " ");
      inorder(t.right);
    }
  }
  
  // Returns root of the tree for a given postfix expression
  Node constructTree(String[] inp) {
    Stack<Node> nstack = new Stack();
    Node t, t1, t2;
    for(int i = 0; i < inp.length; i++) {
      if(!isOperator(inp[i])) {
        t = new Node(inp[i]);
        nstack.push(t);
      } else {
        t = new Node(inp[i]);
        
        // Pop the first 2 nodes
        t1 = nstack.pop();
        t2 = nstack.pop();
        
        // Make them the children of the first node made
        t.right = t1;
        t.left = t2;
        
        // Add this new expression to the stack
        nstack.push(t);
      }
    }
    
    // The only element left will be the root of the expression tree
    t = nstack.peek();
    nstack.pop();
    
    return t;
  }
  
  
}
