package Greedy.Matrix;

import java.util.Scanner;

/*
 * 문제
0과 1로만 이루어진 행렬 A와 행렬 B가 있다. 이때, 행렬 A를 행렬 B로 바꾸는데 필요한 연산의 횟수의 최솟값을 구하는 프로그램을 작성하시오.

행렬을 변환하는 연산은 어떤 3×3크기의 부분 행렬에 있는 모든 원소를 뒤집는 것이다. (0 → 1, 1 → 0)

입력
첫째 줄에 행렬의 크기 N M이 주어진다. N과 M은 50보다 작거나 같은 자연수이다. 둘째 줄부터 N개의 줄에는 행렬 A가 주어지고, 그 다음줄부터 N개의 줄에는 행렬 B가 주어진다.

출력
첫째 줄에 문제의 정답을 출력한다. 만약 A를 B로 바꿀 수 없다면 -1을 출력한다.
 */

import java.util.*;

public class Main {

  static int N; // 행
  static int M; // 열
  static int count = 0;

  static int[][] matrixA;
  static int[][] matrixB;

  static Scanner sc = new Scanner(System.in);

  static void input() {
    N = sc.nextInt();
    M = sc.nextInt();

    matrixA = new int[N][M];
    matrixB = new int[N][M];

    for (int i = 0; i < N; i++) {
      String str = sc.next();
      String[] arr = str.split("");
      for (int j = 0; j < M; j++) {
        matrixA[i][j] = Integer.parseInt(arr[j]);
      }
    }

    for (int i = 0; i < N; i++) {
      String str = sc.next();
      String[] arr = str.split("");
      for (int j = 0; j < M; j++) {
        matrixB[i][j] = Integer.parseInt(arr[j]);
      }
    }

  }

  static void flip(int row, int col) {

    if (row > N - 2 || col > M - 2) {
      return;
    }

    count++;
    for (int i = row; i < row + 3; i++) {
      for (int j = col; j < col + 3; j++) {
        if (matrixA[i][j] == 0) {
          matrixA[i][j] = 1;
        } else {
          matrixA[i][j] = 0;
        }
      }
    }
  }

  static boolean checkResult() {
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < M; j++) {
        if (matrixA[i][j] != matrixB[i][j]) {
          return false;
        }
      }
    }
    return true;
  }

  static void findAns() {

    if (N < 3 || M < 3) {
      System.out.println(-1);
      return;
    }

    for (int i = 0; i < N - 2; i++) {
      for (int j = 0; j < M - 2; j++) {
        if (i > N - 3 || j > M - 3) {
          continue;
        } else if (i <= N - 3 && j <= M - 3) {
          if (matrixA[i][j] != matrixB[i][j]) {
            flip(i, j); // 뒤집기
          }
          if (i == N - 3) { // 끝부분 도달시 검사
            if (checkResult()) {
              System.out.println(count);
              return;
            }
          } else if (i == N - 3 && j == M - 3 && !checkResult()) {
            System.out.println(-1);
            return;

          }
        }

      }
    }
  }

  public static void main(String[] args) {
    input();

    findAns();

  }

}
