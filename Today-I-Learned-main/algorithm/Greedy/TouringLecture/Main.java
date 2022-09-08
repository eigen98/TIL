package Greedy.TouringLecture;

import java.util.*;

public class Main {

  // static HashMap<Integer, Integer> map = new HashMap<>();
  static ArrayList<Lecture> list = new ArrayList<>();
  static Scanner sc = new Scanner(System.in);

  static int N; // 대학개수

  static class Lecture implements Comparable<Lecture> {
    int pay;
    int day;

    Lecture(int _pay, int _day) {
      pay = _pay;
      day = _day;
    }

    @Override
    public int compareTo(Lecture o) {
      int result = o.pay - this.pay;

      if (result == 0)
        result = this.day - o.day;

      return result;
    }
  }

  static void input() {
    N = sc.nextInt();
    for (int i = 0; i < N; i++) {
      int p = sc.nextInt();
      int d = sc.nextInt();

      Lecture lecture = new Lecture(p, d);
      list.add(lecture);

      // if (map.containsKey(d)) { // 이미 해당 날짜에 페이가 있다면
      // if (map.get(d) < p) { // 해당 날짜의 페이보다 더 크다면
      // map.put(d, p); // 업데이트
      // }else{
      // continue;
      // }
      // } else { // 페이가 없는 날짜라면
      // map.put(d, p); // 업데이트
      // }
    }
    return;
  }

  static long totalPay() {
    if (N == 0)
      return 0;
    boolean[] days = new boolean[10001];
    Collections.sort(list);
    long total = 0;

    for (Lecture lec : list) {

      for (int i = lec.day; i > 0; i--) {
        if (!days[i]) {
          days[i] = true;
          total = total + lec.pay;
          break;
        }
      }
    }
    // for (int d : map.keySet()) {
    // total = total + map.get(d);
    // }

    return total;
  }

  public static void main(String[] args) {
    input();
    System.out.println(totalPay());
  }

}
