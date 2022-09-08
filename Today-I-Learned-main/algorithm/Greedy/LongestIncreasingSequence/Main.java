package Greedy.LongestIncreasingSequence;

//가장 긴 증가하는 부분 수열 2

// 문제
// 수열 A가 주어졌을 때, 가장 긴 증가하는 부분 수열을 구하는 프로그램을 작성하시오.

// 예를 들어, 수열 A = {10, 20, 10, 30, 20, 50} 인 경우에 가장 긴 증가하는 부분 수열은 A = {10, 20, 10, 30, 20, 50} 이고, 길이는 4이다.

// 입력
// 첫째 줄에 수열 A의 크기 N (1 ≤ N ≤ 1,000,000)이 주어진다.

// 둘째 줄에는 수열 A를 이루고 있는 Ai가 주어진다. (1 ≤ Ai ≤ 1,000,000)

// 출력
// 첫째 줄에 수열 A의 가장 긴 증가하는 부분 수열의 길이를 출력한다.
import java.util.*;

public class Main {
  static int N;
  static int[] seq;
  static int[] LIS;

  static Scanner sc = new Scanner(System.in);

  static void input() {
    N = sc.nextInt();
    seq = new int[N];
    LIS = new int[N];

    for (int i = 0; i < N; i++) {
      seq[i] = sc.nextInt();
    }

  }

  static void findAns() {
    LIS[0] = seq[0];
    int lengthOfLIS = 1;

    for (int i = 1; i < N; i++) {
      int key = seq[i]; // 탐색 숫자가

      if (LIS[lengthOfLIS - 1] < key) { // 현재 숫자보다 크다면
        lengthOfLIS++; // 길어짐.
        LIS[lengthOfLIS - 1] = key;

      } else { // 크지 않다면 이분탐색으로 찾기
        int lo = 0;
        int hi = lengthOfLIS - 1;

        while (lo < hi) {
          int mid = (hi + lo) / 2;
          if (LIS[mid] < key) {
            lo = mid + 1;
          } else {

            hi = mid;
          }
        }

        LIS[lo] = key;
      }
    }
    System.out.println(lengthOfLIS);
  }

  public static void main(String[] args) {

    input();
    findAns();
  }
}
