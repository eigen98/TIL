package Greedy.SickKnight;

/*
 * 문제
병든 나이트가 N × M 크기 체스판의 가장 왼쪽아래 칸에 위치해 있다. 병든 나이트는 건강한 보통 체스의 나이트와 다르게 4가지로만 움직일 수 있다.

2칸 위로, 1칸 오른쪽
1칸 위로, 2칸 오른쪽
1칸 아래로, 2칸 오른쪽
2칸 아래로, 1칸 오른쪽
병든 나이트는 여행을 시작하려고 하고, 여행을 하면서 방문한 칸의 수를 최대로 하려고 한다. 병든 나이트의 이동 횟수가 4번보다 적지 않다면, 이동 방법을 모두 한 번씩 사용해야 한다. 이동 횟수가 4번보다 적은 경우(방문한 칸이 5개 미만)에는 이동 방법에 대한 제약이 없다.

체스판의 크기가 주어졌을 때, 병든 나이트가 여행에서 방문할 수 있는 칸의 최대 개수를 구해보자.

입력
첫째 줄에 체스판의 세로 길이 N와 가로 길이 M이 주어진다. N과 M은 2,000,000,000보다 작거나 같은 자연수이다.

출력
병든 나이트가 여행에서 방문할 수 있는 칸의 개수중 최댓값을 출력한다.
 */

import java.util.*;

public class Main {

  static int N;
  static int M;
  static Scanner sc = new Scanner(System.in);
  static int[][] dir = { { 2, 1 }, { 1, 2 }, { -1, 2 }, { -2, 1 } };
  static boolean[][] visited;
  static int count = 0;

  static void dfs(int row, int col) {
    if (visited[row][col] == false) {
      count++;
      visited[row][col] = true;
    }

    for (int i = 0; i < 4; i++) {
      int newRow = row + dir[i][0];
      int newCol = col + dir[i][1];

      if (newRow < 0 || newRow >= N || newCol < 0 || newCol >= M) {
        continue;
      }
      dfs(newRow, newCol);

    }
    return;

  }

  static void input() {
    N = sc.nextInt(); // 행
    M = sc.nextInt(); // 열

    visited = new boolean[N][M];
  }

  public static void main(String[] args) {

    input();
    dfs(N - 1, 0);
    System.out.println(count);

  }

}
