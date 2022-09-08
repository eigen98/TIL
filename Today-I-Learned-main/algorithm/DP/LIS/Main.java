package DP.LIS;

import java.util.*;

public class Main {

  static int N;
  static int[] arr;
  static int[] dp;

  static Scanner sc = new Scanner(System.in);

  static void input() {
    N = sc.nextInt();
    arr = new int[N];
    dp = new int[N];

    for (int i = 0; i < N; i++) {
      arr[i] = sc.nextInt();
    }
  }

  static int rec_func(int k) {
    if (dp[k] == 0) {
      dp[k] = 1;
      for (int i = k - 1; i >= 0; i--) {
        if (arr[i] < arr[k]) { // 더 작은 수를 발견했을 경우.
          dp[k] = Math.max(dp[k], rec_func(i) + 1);
        }
      }
    }
    return dp[k];
  }

  public static void main(String[] args) {
    input();
    for (int i = 0; i < N; i++) {
      rec_func(i);
    }

    int max = 0;
    for (int i = 0; i < N; i++) {
      max = Math.max(max, dp[i]);
    }

    System.out.println(max);
  }

}
