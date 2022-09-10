package Greedy.thirty;
/*
 * 문제
어느 날, 미르코는 우연히 길거리에서 양수 N을 보았다. 미르코는 30이란 수를 존경하기 때문에, 그는 길거리에서 찾은 수에 포함된 숫자들을 섞어 30의 배수가 되는 가장 큰 수를 만들고 싶어한다.

미르코를 도와 그가 만들고 싶어하는 수를 계산하는 프로그램을 작성하라.

입력
N을 입력받는다. N는 최대 10^5개의 숫자로 구성되어 있으며, 0으로 시작하지 않는다.

출력
미르코가 만들고 싶어하는 수가 존재한다면 그 수를 출력하라. 그 수가 존재하지 않는다면, -1을 출력하라.
 */

import java.util.*;

public class Main {

  // 0이 여러개 있는경우?
  static String N;
  static Scanner sc = new Scanner(System.in);
  static Integer[] arr;
  static StringBuilder sb = new StringBuilder();

  static void input() {
    N = sc.next();
  }

  static boolean isThereZero() {
    for (int i = 0; i < N.length(); i++) {
      if (N.charAt(i) == '0') {

        String frontStr = N.substring(0, i);
        String endStr = N.substring(i + 1);

        N = frontStr + endStr; // 0 제거 (나중에 추가해주어야함.)

        return true;
      }
    }
    return false;
  }

  static boolean isPossible30() {

    int total = 0;
    arr = new Integer[N.length()];

    for (int i = 0; i < N.length(); i++) {
      total = total + N.charAt(i) - '0';
      arr[i] = N.charAt(i) - '0';

    }
    if (total % 3 == 0) {
      return true;
    }
    return false;
  }

  static void findAns() {

    if (isThereZero()) {
      if (isPossible30()) {
        Arrays.sort(arr, Collections.reverseOrder());
        Arrays.toString(arr);

        String output = "";
        for (int i = 0; i < N.length(); i++) {
          output = output + String.valueOf(arr[i]);
        }
        output = output + "0";
        System.out.println(output);

      } else {
        System.out.println(-1);
      }

    } else {
      System.out.println(-1);
    }

  }

  public static void main(String[] args) {
    input();
    findAns();
  }

}
