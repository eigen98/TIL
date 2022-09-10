package Greedy.ContestOrIntern;

/*
 * 문제
백준대학교에서는 대회에 나갈 때 2명의 여학생과 1명의 남학생이 팀을 결성해서 나가는 것이 원칙이다. (왜인지는 총장님께 여쭈어보는 것이 좋겠다.)

백준대학교는 뛰어난 인재들이 많아 올해에도 N명의 여학생과 M명의 남학생이 팀원을 찾고 있다. 대회에 참여하려는 학생들 중 K명은 반드시 인턴쉽 프로그램에 참여해야 한다. 인턴쉽에 참여하는 학생은 대회에 참여하지 못한다.

백준대학교에서는 뛰어난 인재들이 많기 때문에, 많은 팀을 만드는 것이 최선이다.

여러분은 여학생의 수 N, 남학생의 수 M, 인턴쉽에 참여해야하는 인원 K가 주어질 때 만들 수 있는 최대의 팀 수를 구하면 된다.

입력
첫째 줄에 N, M, K가 순서대로 주어진다. (0 ≤ M ≤ 100, 0 ≤ N ≤ 100, 0 ≤ K ≤ M+N),

출력
만들 수 있는 팀의 최대 개수을 출력하면 된다.
 */

import java.util.*;

public class Main {

  static Scanner sc = new Scanner(System.in);
  static int N; // 여자 6
  static int M; // 남자 3
  static int K; // 인턴 2
  // 대회 팀은 남자 2명 여자 1명

  static void input() {
    N = sc.nextInt();
    M = sc.nextInt();
    K = sc.nextInt();
  }

  static void findAns() {
    int groupW = N / 2; // 6
    int groupM = M; // 1
    int restW = N % 2; // 1

    // 선발 전 가능한 팀개수
    int possibleTeam = 0;
    if (groupM > groupW) {
      possibleTeam = groupW;
    } else {
      possibleTeam = groupM; // 1
    }

    // 낙오자 수
    int straggler = 0;
    if (groupM > groupW) {
      straggler = groupM - groupW;
    } else if (groupM < groupW) {
      straggler = (groupW - groupM) * 2 + restW; // 남자 솔로 + 남은 여자들
    } else {
      straggler = restW;
    }

    // 이때 낙오자수가 K보다 같거나 크다면 현재 팀 개수가 정답
    if (straggler >= K) {
      System.out.println(possibleTeam);
      return;
    } else if (straggler < K) {// 낙오자 수가 인턴 K인원수보다 부족하다면 팀을 해체시킴

      int lackOfMember = K - straggler; // 부족한 인원수
      int rest = lackOfMember % 3 == 0 ? 0 : 1;
      int bombTeam = lackOfMember / 3 + rest;
      possibleTeam = possibleTeam - bombTeam;
      System.out.println(possibleTeam);

    }

  }

  public static void main(String[] args) {
    input();
    findAns();

  }

}
