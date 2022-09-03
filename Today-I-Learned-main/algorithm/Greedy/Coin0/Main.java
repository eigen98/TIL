package Greedy.Coin0;

/*
 * 문제
준규가 가지고 있는 동전은 총 N종류이고, 각각의 동전을 매우 많이 가지고 있다.

동전을 적절히 사용해서 그 가치의 합을 K로 만들려고 한다. 이때 필요한 동전 개수의 최솟값을 구하는 프로그램을 작성하시오.

입력
첫째 줄에 N과 K가 주어진다. (1 ≤ N ≤ 10, 1 ≤ K ≤ 100,000,000)

둘째 줄부터 N개의 줄에 동전의 가치 Ai가 오름차순으로 주어진다. (1 ≤ Ai ≤ 1,000,000, A1 = 1, i ≥ 2인 경우에 Ai는 Ai-1의 배수)

출력
첫째 줄에 K원을 만드는데 필요한 동전 개수의 최솟값을 출력한다.
 * 
 */

import java.util.*;

public class Main {

  static Scanner sc = new Scanner(System.in);
  // 동전 개수
  static int N;
  static int K; // 목표 금액
  static int[] value; // 동전 별 가치
  static int[] numOfCoin;
  static int total = 0;

  static void input() {

    N = sc.nextInt();
    K = sc.nextInt();
    numOfCoin = new int[N + 1];
    value = new int[N + 1];
    for (int i = 1; i <= N; i++) {
      value[i] = sc.nextInt();
    }

  }
  // 동전 개수의 최솟값을 출력한다.
  // 가장 큰 가치의 동전의 최댓값 -> 최적의 값.

  static void findAns() {
    int k = K;

    for (int i = N; i > 0; i--) {

      numOfCoin[i] = K / value[i];
      K = K - (numOfCoin[i] * value[i]);
      total = total + numOfCoin[i];
      if (K <= 0) {
        // 종료
        System.out.println(total);
        return;
      }

    }
    System.out.println(total);

    // 한번 돌았는데 부족할 때 ? -> 존재 안 함.

  }

  public static void main(String[] args) {

    input();
    findAns();
  }
}
