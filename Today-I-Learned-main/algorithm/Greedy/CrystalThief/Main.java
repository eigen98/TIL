package Greedy.CrystalThief;

import java.util.ArrayList;
import java.util.Collections;
import java.util.PriorityQueue;
import java.util.Scanner;

/*
 * 문제
세계적인 도둑 상덕이는 보석점을 털기로 결심했다.

상덕이가 털 보석점에는 보석이 총 N개 있다. 각 보석은 무게 Mi와 가격 Vi를 가지고 있다. 상덕이는 가방을 K개 가지고 있고, 각 가방에 담을 수 있는 최대 무게는 Ci이다. 가방에는 최대 한 개의 보석만 넣을 수 있다.

상덕이가 훔칠 수 있는 보석의 최대 가격을 구하는 프로그램을 작성하시오.

입력
첫째 줄에 N과 K가 주어진다. (1 ≤ N, K ≤ 300,000)

다음 N개 줄에는 각 보석의 정보 Mi와 Vi가 주어진다. (0 ≤ Mi, Vi ≤ 1,000,000)

다음 K개 줄에는 가방에 담을 수 있는 최대 무게 Ci가 주어진다. (1 ≤ Ci ≤ 100,000,000)

모든 숫자는 양의 정수이다.

출력
첫째 줄에 상덕이가 훔칠 수 있는 보석 가격의 합의 최댓값을 출력한다.
 * 
2 1
5 10
100 100
11
 * 
 */
public class Main {

  static class Crystal implements Comparable<Crystal> {
    int m;
    int v;
    double mv;

    Crystal(int _m, int _v) {
      m = _m;
      v = _v;
      mv = m / v;

    }

    @Override
    public int compareTo(Crystal other) {
      if (this.mv > other.mv)
        return 1;
      else if (this.mv < other.mv)
        return -1;
      else if (this.mv == other.mv) {
        return other.v - this.v;
      } else {
        return 1;
      }

    }

  }

  static int N; // 보석
  static int K; // 가방
  static int[] C; // 가방의 수용 가능 무게
  static ArrayList<Integer> backList = new ArrayList<>();
  static ArrayList<Crystal> list = new ArrayList<>();
  static Scanner sc = new Scanner(System.in);
  // 무게 대비 가장 비싼 보석 -> 들어갈 수 있는 가장 작은 가방에 넣기.

  static void input() {

    N = sc.nextInt();
    K = sc.nextInt();
    C = new int[K];
    for (int i = 0; i < N; i++) {
      int m = sc.nextInt();
      int v = sc.nextInt();
      Crystal cry = new Crystal(m, v);
      list.add(cry);
    }
    for (int i = 0; i < K; i++) {
      int c = sc.nextInt(); // 수용 무게 할당.
      backList.add(c);
    }
    Collections.sort(backList);
    Collections.sort(list); // 가격/무게 오름차로 정렬.
  }

  // 보석 가격의 합의 최댓값을 출력
  static void findAns(){
    for(int i = 0; i < K ; i++){
      int backC = backList.get(i);
      if(backC >=  list.get(index))
    }
    return ;
  }

  public static void main(String[] args) {

  }

}
