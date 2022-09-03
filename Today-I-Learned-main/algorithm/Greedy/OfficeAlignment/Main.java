package Greedy.OfficeAlignment;

import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Scanner;

/*
 * 문제
한 개의 회의실이 있는데 이를 사용하고자 하는 N개의 회의에 대하여 회의실 사용표를 만들려고 한다. 각 회의 I에 대해 시작시간과 끝나는 시간이 주어져 있고, 각 회의가 겹치지 않게 하면서 회의실을 사용할 수 있는 회의의 최대 개수를 찾아보자. 단, 회의는 한번 시작하면 중간에 중단될 수 없으며 한 회의가 끝나는 것과 동시에 다음 회의가 시작될 수 있다. 회의의 시작시간과 끝나는 시간이 같을 수도 있다. 이 경우에는 시작하자마자 끝나는 것으로 생각하면 된다.

입력
첫째 줄에 회의의 수 N(1 ≤ N ≤ 100,000)이 주어진다. 둘째 줄부터 N+1 줄까지 각 회의의 정보가 주어지는데 이것은 공백을 사이에 두고 회의의 시작시간과 끝나는 시간이 주어진다. 시작 시간과 끝나는 시간은 231-1보다 작거나 같은 자연수 또는 0이다.

출력
첫째 줄에 최대 사용할 수 있는 회의의 최대 개수를 출력한다.
 */
import java.util.*;

public class Main {

  static Scanner sc = new Scanner(System.in);
  // 회의 개수
  static int N;
  static int[][] arr; // 회의 시작 끝 시간

  static class Info implements Comparable<Info> {
    int start;
    int end;

    Info(int _start, int _end) {
      start = _start;
      end = _end;
    }

    @Override // bigThree1rm 을 기준으로 오름차순 정렬

    public int compareTo(Info o) {

      if (this.end == o.end) {
        return this.start > o.start ? 1 : -1;

      } else {
        return this.end > o.end ? 1 : -1;
      }

    }

  }

  static PriorityQueue<Info> heap = new PriorityQueue<>(Comparator.comparing(o -> o.end));

  static void input() {
    N = sc.nextInt();

    arr = new int[N][2];

    for (int i = 0; i < N; i++) {
      arr[i][0] = sc.nextInt();
      arr[i][1] = sc.nextInt();
      // 가장 빨리 끝나는 것부터 나열.
      heap.add(new Info(arr[i][0], arr[i][1]));
    }

  }

  static void findAns() {
    int counting = 0;
    Info firstInfo = heap.poll();
    counting++;
    while (!heap.isEmpty()) {
      Info info = heap.poll();
      if (firstInfo.end <= info.start) {
        firstInfo = info;

        counting++;
      }

    }

    System.out.println(counting);
  }

  public static void main(String[] args) {

    input();
    findAns();

  }
}
