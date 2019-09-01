ArrayList<String> opStack = new ArrayList<String>();
ArrayList<String> numStack = new ArrayList<String>();

String input = " x ^ y / ( 5 * z ) + 10 ";



void setup() {
  println(convRPN(input));
  
}


public int getPrecendence(String n) {
  int prec = 1;
  if(n.equals("^")) {
    prec = 3;
  }
  if(n.equals("/") || n.equals("*")) {
    prec = 2;
  }
  if(n.equals("(")) {
    prec = 0;
  }
  return prec;
}

public String convRPN(String str) {
  ArrayList<String> queue = new ArrayList<String>();
  ArrayList<String> ops = new ArrayList<String>();
  String retStr = "";
  String op;
  int curpos = 1;
  String temp;
  while((str.substring(curpos)).length() > 1) {
    temp = str.substring(curpos, str.indexOf(" ", curpos + 1));
    // println(temp);
    if(!(temp.indexOf("x") == -1 && temp.indexOf("y") == -1 && temp.indexOf("z") == -1 && temp.indexOf("0") == -1 && temp.indexOf("1") == -1 && temp.indexOf("2") == -1 && temp.indexOf("3") == -1 && temp.indexOf("4") == -1 && temp.indexOf("5") == -1 && temp.indexOf("6") == -1 && temp.indexOf("7") == -1 && temp.indexOf("8") == -1 && temp.indexOf("9") == -1)) {
      queue.add(temp);
    } else {
      if(ops.size() == 0) {
        ops.add(temp);
      } else if(temp.equals("(")) {
        ops.add(temp);
      } else if(temp.equals(")")) {
        while(ops.size() > 0 && !((ops.get(ops.size() - 1)).equals("("))) {
          queue.add(ops.get(ops.size() - 1));
          ops.remove(ops.size() - 1);
        }       
        ops.remove(ops.size() - 1);
      } else if(getPrecendence(ops.get(ops.size() - 1)) <= getPrecendence(temp)) {
        ops.add(temp);
      } else {
        while(ops.size() > 0 && !((ops.get(ops.size() - 1)).equals("("))) {
          queue.add(ops.get(ops.size() - 1));
          ops.remove(ops.size() - 1);
          
        }       
        ops.add(temp);
      }
      
    }
    
    curpos = str.indexOf(" ", curpos + 1) + 1;
  }
  
  while(ops.size() > 0) {
    queue.add(ops.get(ops.size() - 1));
    ops.remove(ops.size() - 1);
  }
  
  for(int i = 0; i < queue.size(); i++) {
    retStr = retStr + " " + queue.get(i);
  }
 
  return retStr;
}
  
