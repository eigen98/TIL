package Greedy.BulbAndSwitch;

/*
 * 문제
N개의 스위치와 N개의 전구가 있다. 각각의 전구는 켜져 있는 상태와 꺼져 있는 상태 중 하나의 상태를 가진다. i(1 < i < N)번 스위치를 누르면 i-1, i, i+1의 세 개의 전구의 상태가 바뀐다. 즉, 꺼져 있는 전구는 켜지고, 켜져 있는 전구는 꺼지게 된다. 1번 스위치를 눌렀을 경우에는 1, 2번 전구의 상태가 바뀌고, N번 스위치를 눌렀을 경우에는 N-1, N번 전구의 상태가 바뀐다.

N개의 전구들의 현재 상태와 우리가 만들고자 하는 상태가 주어졌을 때, 그 상태를 만들기 위해 스위치를 최소 몇 번 누르면 되는지 알아내는 프로그램을 작성하시오.

입력
첫째 줄에 자연수 N(2 ≤ N ≤ 100,000)이 주어진다. 다음 줄에는 전구들의 현재 상태를 나타내는 숫자 N개가 공백 없이 주어진다. 그 다음 줄에는 우리가 만들고자 하는 전구들의 상태를 나타내는 숫자 N개가 공백 없이 주어진다. 0은 켜져 있는 상태, 1은 꺼져 있는 상태를 의미한다.

출력
첫째 줄에 답을 출력한다. 불가능한 경우에는 -1을 출력한다.
 */

import java.util.*;

public class Main {

  static Scanner sc = new Scanner(System.in);
  static int N;

  static int[] nowBulb;
  static int[] targetBulb;
  static int count;

  static void input() {
    N = sc.nextInt();
    nowBulb = new int[N];
    targetBulb = new int[N];

    String inputNow = sc.next();
    String inputTarget = sc.next();
    String[] nowArr = inputNow.split("");
    String[] targetArr = inputTarget.split("");

    for (int i = 0; i < N; i++) {
      nowBulb[i] = Integer.parseInt(nowArr[i]);
      targetBulb[i] = Integer.parseInt(targetArr[i]);
    }
  }

  static void switchOn(int idx) {
    count++;
    if (idx == 0) {
      nowBulb[0] = flip(nowBulb[0]);
      nowBulb[1] = flip(nowBulb[1]);
    } else if (idx == N - 1) {
      nowBulb[idx - 1] = flip(nowBulb[idx - 1]);
      nowBulb[idx] = flip(nowBulb[idx]);
    } else {
      nowBulb[idx - 1] = flip(nowBulb[idx - 1]);
      nowBulb[idx] = flip(nowBulb[idx]);
      nowBulb[idx + 1] = flip(nowBulb[idx + 1]);
    }
  }

  static int flip(int num) {
    if (num == 0) {
      return 1;
    } else {
      return 0;
    }
  }

  static boolean check(int idx) {
    if (idx == 0) {
      if (nowBulb[0] != targetBulb[0] || nowBulb[1] != targetBulb[1]) {
        return false;
      }
    } else if (idx == N - 1) {
      if (nowBulb[idx - 1] != targetBulb[idx - 1] || nowBulb[idx] != targetBulb[idx]) {
        return false;
      }
    } else {
      if (nowBulb[idx - 1] != targetBulb[idx - 1] || nowBulb[idx] != targetBulb[idx]
          || nowBulb[idx + 1] != targetBulb[idx + 1]) {
        return false;
      }
    }
    return true;
  }

  static int findAns() {
    for (int i = 0; i < N; i++) {
      if (!check(i)) {
        // 다르다면
        switchOn(i);
        // printArr();
      }
    }

    for (int i = 0; i < N; i++) {
      if (nowBulb[i] != targetBulb[i]) {
        // 다르다면
        System.out.println(-1);
        return -1;
      }
    }
    System.out.println(count);
    return count;

  }

  public static void main(String[] args) {
    input();
    findAns();
  }

  static void printArr() {
    System.out.println();
    for (int i = 0; i < N; i++) {
      System.out.print(nowBulb[i]);
    }
    System.out.println();

  }

}
