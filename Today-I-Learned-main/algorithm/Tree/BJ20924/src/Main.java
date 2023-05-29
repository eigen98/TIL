import java.util.*;

public class Main {

  static Scanner sc = new Scanner(System.in);
  static int N = 0; //노드 개수
  static int R = 0; //루트 노드
  static ArrayList<Edge>[] adjList;

  static int stumpLen = 0;
  static int maxLen = 0;

  static int gigaNodeNum = 0;

  public static void main(String[] args){
    N = sc.nextInt();
    R = sc.nextInt(); //루트 번호

    adjList = new ArrayList[N + 1];

    for(int i = 0; i <= N; i++){
      adjList[i] = new ArrayList<Edge>();
    }
    for(int i = 1; i <= N - 1; i++ ){
      int a = sc.nextInt();
      int b = sc.nextInt();
      int d = sc.nextInt();

      Edge newEdge = new Edge(b, d);
      adjList[a].add(newEdge);
     
    }

    if(n == 1){
      System.out.println("0 0");
    }

     findStumpLen(R, 0);
     if(gigaNodeNum == 0){
      maxLen = 0;
     }else{
      findLongest(gigaNodeNum, 0);
     }
     

     System.out.println(stumpLen + " " + maxLen);

  }

  static void findStumpLen(int rootNum, int totalLen){
    if(adjList[rootNum].size() > 1){
      stumpLen = totalLen;
      gigaNodeNum = rootNum;
      return;
    }
    if(adjList[rootNum].size() == 0){
      stumpLen = totalLen;
      return;
    }
    findStumpLen(adjList[rootNum].get(0).to, totalLen + adjList[rootNum].get(0).dist);
    return;
  }

  static void findLongest(int node, int totalLen){


    for(int i = 0; i < adjList[node].size(); i++){
      Edge next = adjList[node].get(i);
      
      findLongest(next.to, totalLen + next.dist);
    }
    maxLen = Math.max(totalLen, maxLen);
    return;


  }
}



class Edge{
  int to;
  int dist;

  Edge(int to, int dist){
    this.to = to;
    this.dist = dist;

  }
}