
package Dijkstra.AlgoSpot;//알고스팟

/*
 * 알고스팟 운영진이 모두 미로에 갇혔다. 미로는 N*M 크기이며, 총 1*1크기의 방으로 이루어져 있다. 미로는 빈 방 또는 벽으로 이루어져 있고, 빈 방은 자유롭게 다닐 수 있지만, 벽은 부수지 않으면 이동할 수 없다.

알고스팟 운영진은 여러명이지만, 항상 모두 같은 방에 있어야 한다. 즉, 여러 명이 다른 방에 있을 수는 없다. 어떤 방에서 이동할 수 있는 방은 상하좌우로 인접한 빈 방이다. 즉, 현재 운영진이 (x, y)에 있을 때, 이동할 수 있는 방은 (x+1, y), (x, y+1), (x-1, y), (x, y-1) 이다. 단, 미로의 밖으로 이동 할 수는 없다.

벽은 평소에는 이동할 수 없지만, 알고스팟의 무기 AOJ를 이용해 벽을 부수어 버릴 수 있다. 벽을 부수면, 빈 방과 동일한 방으로 변한다.

만약 이 문제가 알고스팟에 있다면, 운영진들은 궁극의 무기 sudo를 이용해 벽을 한 번에 다 없애버릴 수 있지만, 안타깝게도 이 문제는 Baekjoon Online Judge에 수록되어 있기 때문에, sudo를 사용할 수 없다.

현재 (1, 1)에 있는 알고스팟 운영진이 (N, M)으로 이동하려면 벽을 최소 몇 개 부수어야 하는지 구하는 프로그램을 작성하시오.


첫째 줄에 미로의 크기를 나타내는 가로 크기 M, 세로 크기 N (1 ≤ N, M ≤ 100)이 주어진다. 다음 N개의 줄에는 미로의 상태를 나타내는 숫자 0과 1이 주어진다. 0은 빈 방을 의미하고, 1은 벽을 의미한다.

(1, 1)과 (N, M)은 항상 뚫려있다.

첫째 줄에 알고스팟 운영진이 (N, M)으로 이동하기 위해 벽을 최소 몇 개 부수어야 하는지 출력한다.
 */

import java.util.*;

class Main {

  static Scanner sc = new Scanner(System.in);

  static class Info {
    int idxX;
    int idxY;
    int distance;

    Info(int _idxX, int _idxY, int _distance) {
      idxX = _idxX;
      idxY = _idxY;
      distance = _distance;

    }
  }

  static int[][] dist;
  static int[][] matrix;
  static int N, M;
  static int[][] dir = { { 1, 0 }, { -1, 0 }, { 0, 1 }, { 0, -1 } };

  static void input() {
    M = sc.nextInt();
    N = sc.nextInt();

    matrix = new int[N + 1][M + 1];

    for (int i = 1; i <= N; i++) {

      String str = sc.next();
      char[] arr = str.toCharArray();

      for (int j = 1; j <= M; j++) {
        matrix[i][j] = arr[j - 1] - '0';
      }
    }
  }

  static void dijkstra() {
    dist = new int[N + 1][M + 1];

    for (int i = 1; i <= N; i++) {
      for (int j = 1; j <= M; j++) {
        dist[i][j] = Integer.MAX_VALUE;
      }
    }

    PriorityQueue<Info> heap = new PriorityQueue<Info>(Comparator.comparing(o -> o.distance));

    dist[1][1] = 0;
    heap.add(new Info(1, 1, 0));

    while (!heap.isEmpty()) {
      Info info = heap.poll();

      if (info.distance != dist[info.idxX][info.idxY])
        continue;

      for (int i = 0; i < 4; i++) {
        // 좌표를 벗어나면 패스
        if (info.idxX + dir[i][0] <= 0
            || info.idxX + dir[i][0] > N
            || info.idxY + dir[i][1] <= 0
            || info.idxY + dir[i][1] > M) {
          continue;
        }

        else if (matrix[info.idxX + dir[i][0]][info.idxY + dir[i][1]]
            + dist[info.idxX][info.idxY] < dist[info.idxX + dir[i][0]][info.idxY + dir[i][1]]) {

          heap.add(new Info(
              info.idxX + dir[i][0],
              info.idxY + dir[i][1],
              matrix[info.idxX + dir[i][0]][info.idxY + dir[i][1]]
                  + dist[info.idxX][info.idxY]));

          dist[info.idxX + dir[i][0]][info.idxY + dir[i][1]] = matrix[info.idxX + dir[i][0]][info.idxY + dir[i][1]]
              + dist[info.idxX][info.idxY];

        }

      }
    }

  }

  public static void main(String[] args) {
    input();
    dijkstra();
    System.out.println(dist[N][M]);
  }
}