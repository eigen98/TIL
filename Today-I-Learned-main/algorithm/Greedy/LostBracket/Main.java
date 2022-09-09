package Greedy.LostBracket;

import java.security.Signature;

//문제
// 세준이는 양수와 +, -, 그리고 괄호를 가지고 식을 만들었다. 그리고 나서 세준이는 괄호를 모두 지웠다.

// 그리고 나서 세준이는 괄호를 적절히 쳐서 이 식의 값을 최소로 만들려고 한다.

// 괄호를 적절히 쳐서 이 식의 값을 최소로 만드는 프로그램을 작성하시오.

// 입력
// 첫째 줄에 식이 주어진다. 식은 ‘0’~‘9’, ‘+’, 그리고 ‘-’만으로 이루어져 있고, 가장 처음과 마지막 문자는 숫자이다. 그리고 연속해서 두 개 이상의 연산자가 나타나지 않고, 5자리보다 많이 연속되는 숫자는 없다. 수는 0으로 시작할 수 있다. 입력으로 주어지는 식의 길이는 50보다 작거나 같다.
//55-50+40
//+ 먼저 시작
// 출력
// 첫째 줄에 정답을 출력한다.

import java.util.*;

public class Main {

  static Scanner sc = new Scanner(System.in);
  static String str;
  static String[] numArr;
  static ArrayList<Integer> intArr = new ArrayList<>();
  static ArrayList<String> signArr = new ArrayList<>();

  static void input() {

    str = sc.next();
    numArr = str.split("\\+|\\-");
    for (int i = 0; i < numArr.length; i++) {
      intArr.add(Integer.parseInt(numArr[i]));
    }

    intArr.add(0);
    for (int i = 0; i < str.length(); i++) {
      if (str.charAt(i) == '-') {
        signArr.add("-");
      } else if (str.charAt(i) == '+') {
        signArr.add("+");
      }
    }

  }

  static void findAns() {
    // 덧셈 먼저 연산하기
    for (int i = 0; i < signArr.size(); i++) {
      if (signArr.get(i) == "+") {
        int a = intArr.get(i);
        int b = intArr.get(i + 1);
        int result = calc(a, b, "+");
        intArr.set(i, result);
        if (intArr.size() > i + 1) {
          intArr.remove(i + 1);
        }
        signArr.remove(i);
        i--;
      }
    }

    // 나머지 뺄셈 연산하기

    while (!signArr.isEmpty()) { // 모든 뺄셈을 연산할때까지 반복
      String sign = signArr.get(0);
      int firstNum = intArr.get(0);
      int secondNum = intArr.get(1);
      int result = calc(firstNum, secondNum, "-");
      intArr.remove(1);
      intArr.set(0, result);
      signArr.remove(0);
    }
    int ans = intArr.get(0);
    System.out.println(ans);
  }

  static int calc(int a, int b, String sign) {
    if (sign == "+") {
      return a + b;

    } else if (sign == "-") {
      return a - b;

    }
    return a + b;

  }

  public static void main(String[] args) {

    input();
    findAns();
  }
}
