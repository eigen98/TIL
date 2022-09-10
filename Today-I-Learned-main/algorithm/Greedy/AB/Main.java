package Greedy.AB;

/*
 * 문제
정수 N과 K가 주어졌을 때, 다음 두 조건을 만족하는 문자열 S를 찾는 프로그램을 작성하시오.

문자열 S의 길이는 N이고, 'A', 'B'로 이루어져 있다.
문자열 S에는 0 ≤ i < j < N 이면서 s[i] == 'A' && s[j] == 'B'를 만족하는 (i, j) 쌍이 K개가 있다.
입력
첫째 줄에 N과 K가 주어진다. (2 ≤ N ≤ 50, 0 ≤ K ≤ N(N-1)/2)

출력
첫째 줄에 문제의 조건을 만족하는 문자열 S를 출력한다. 가능한 S가 여러 가지라면, 아무거나 출력한다. 만약, 그러한 S가 존재하지 않는 경우에는 -1을 출력한다.
 */
// 1. N개의 문자로 이루어진 문자열에서 A가 B보다 왼쪽에 있는 쌍 개수 K개
// 2. N개 문자에서 나올 수 있는 최대 개수 (N/2)^2 개

import java.util.*;

public class Main {

  static int N;
  static int K;

  static Scanner sc = new Scanner(System.in);

  static void input() {
    N = sc.nextInt();
    K = sc.nextInt();
  }
  // 0 :B, 1:A

  static void findAns() {
    return;

  }

  public static void main(String[] args) {
    input();

  }

}
