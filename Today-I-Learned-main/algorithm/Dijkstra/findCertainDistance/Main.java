package Dijkstra.findCertainDistance;

/*
 * 문제
어떤 나라에는 1번부터 N번까지의 도시와 M개의 단방향 도로가 존재한다. 모든 도로의 거리는 1이다.

이 때 특정한 도시 X로부터 출발하여 도달할 수 있는 모든 도시 중에서, 최단 거리가 정확히 K인 모든 도시들의 번호를 출력하는 프로그램을 작성하시오. 또한 출발 도시 X에서 출발 도시 X로 가는 최단 거리는 항상 0이라고 가정한다.

예를 들어 N=4, K=2, X=1일 때 다음과 같이 그래프가 구성되어 있다고 가정하자.

이 때 1번 도시에서 출발하여 도달할 수 있는 도시 중에서, 최단 거리가 2인 도시는 4번 도시 뿐이다.  2번과 3번 도시의 경우, 최단 거리가 1이기 때문에 출력하지 않는다.

입력
첫째 줄에 도시의 개수 N, 도로의 개수 M, 거리 정보 K, 출발 도시의 번호 X가 주어진다. (2 ≤ N ≤ 300,000, 1 ≤ M ≤ 1,000,000, 1 ≤ K ≤ 300,000, 1 ≤ X ≤ N) 둘째 줄부터 M개의 줄에 걸쳐서 두 개의 자연수 A, B가 공백을 기준으로 구분되어 주어진다. 이는 A번 도시에서 B번 도시로 이동하는 단방향 도로가 존재한다는 의미다. (1 ≤ A, B ≤ N) 단, A와 B는 서로 다른 자연수이다.

출력
X로부터 출발하여 도달할 수 있는 도시 중에서, 최단 거리가 K인 모든 도시의 번호를 한 줄에 하나씩 오름차순으로 출력한다.

이 때 도달할 수 있는 도시 중에서, 최단 거리가 K인 도시가 하나도 존재하지 않으면 -1을 출력한다.
 */
import java.util.*;

public class Main {

  static Scanner sc = new Scanner(System.in);

  static class Info {
    int idx;
    int distance;

    Info(int _idx, int _distance) {
      idx = _idx;
      distance = _distance;
    }

  }

  static class Edge {
    int to;
    int distance;

    Edge(int _to, int _distance) {

      to = _to;
      distance = _distance;

    }
  }

  static int N; // 도시 개수
  static int M; // 도로 개수
  static int K; // 찾아낼 도시의 거리
  static int X; // 출발 도시

  static int[] dist; // 각 도시까지의 거리
  static ArrayList<Edge>[] edges; // 인접 노드 리스트

  /**
   * 
   */
  static void input() {
    N = sc.nextInt();
    M = sc.nextInt();
    K = sc.nextInt();
    X = sc.nextInt();

    edges = new ArrayList[N + 1];
    dist = new int[N + 1];

    for (int i = 1; i <= N; i++) {
      edges[i] = new ArrayList<Edge>();
    }

    for (int i = 1; i <= M; i++) {
      int from = sc.nextInt();
      int to = sc.nextInt();

      edges[from].add(new Edge(to, 1)); // 모든 도로의 거리가 동일하므로 1로 설정.
    }

  }

  static void dijkstra() {

    for (int i = 1; i <= N; i++) {
      dist[i] = Integer.MAX_VALUE;
    }

    PriorityQueue<Info> heap = new PriorityQueue<>(Comparator.comparing(o -> o.distance));

    // 시작점 세팅
    dist[X] = 0;
    heap.add(new Info(X, 0));

    while (!heap.isEmpty()) {
      Info info = heap.poll();
      // 필요없는 정보 거르기
      if (dist[info.idx] != info.distance) {
        continue;
      }

      for (Edge e : edges[info.idx]) {
        if (info.distance + e.distance < dist[e.to]) {
          heap.add(new Info(e.to, info.distance + e.distance));
          dist[e.to] = info.distance + e.distance;
        }
      }

    }

  }

  static void findCity() {
    int num = 0;
    for (int i = 1; i <= N; i++) {
      if (dist[i] == K) {
        System.out.println(i);
        num++;
      }
    }
    if (num == 0) {
      System.out.println(-1);
    }
  }

  public static void main(String[] args) {

    input();
    dijkstra();
    findCity();

  }
}
