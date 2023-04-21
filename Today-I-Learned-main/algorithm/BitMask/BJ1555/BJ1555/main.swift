//
//  main.swift
//  BJ1555
//
//  Created by JeongMin Ko on 2023/04/14.
//
/*
 문제
 1보다 크거나 같고, 30보다 작거나 같은 수로 채워진 크기 N의 배열 A가 주어진다. 이 배열의 원소를 +, -, *, /, 괄호를 원하는 만큼 써서 식을 만들어서, 가장 큰 소수와 가장 작은 소수를 구하는 프로그램을 작성하시오.

 배열 A에 있는 수는 중복될 수 있고, 모두 단 한번씩 사용해야 한다.

 예를 들어, A = {1,2,3}일 때, 만들 수 있는 가장 작은 소수는 3-2+1=2 이고, 가장 큰 소수는 3*2+1=7이다.

 나눗셈의 두 피연산자는 양의 정수이며, 결과가 정수가 되는 정수 나눗셈을 사용한다.

 입력
 첫째 줄에 A의 크기 N이 주어진다. 둘째 줄에 A에 들어있는 원소가 주어진다.

 출력
 첫째 줄에 가장 작은 소수를 출력하고, 둘째 줄에 가장 큰 소수를 출력한다. 만약 소수를 만들 수 없으면 -1을 출력한다.

 제한
 1 ≤ N ≤ 6
 예제 입력 1
 2
 1 2
 예제 출력 1
 2
 3
 예제 입력 2
 3
 1 2 3
 예제 출력 2
 2
 7
 예제 입력 3
 6
 1 2 3 4 5 6
 예제 출력 3
 2
 719
 예제 입력 4
 6
 2 3 5 7 11 13
 예제 출력 4
 2
 15017
 예제 입력 5
 6
 2 2 2 2 2 2
 예제 출력 5
 2
 17
 예제 입력 6
 1
 8
 예제 출력 6
 -1
 */
import Foundation

func solution(){
    
}

////주어진 정수 범위 내에서 소수를 찾아 출력하는 함수
//func findPrimes(upTo lastNum: Int) {
//    for i in 2...lastNum {
//        var isPrime = true
//        for j in 2...Int(sqrt(Double(i))) {
//            if i % j == 0 {
//                isPrime = false
//                break
//            }
//        }
//        if isPrime {
//            print(i, terminator: " ")
//        }
//    }
//    print()
//}

let lastNum = 100 // 원하는 범위를 설정하세요.
//findPrimes(upTo: lastNum)

//에라토스테네스 체
func eratosPrimes(upTo lastNum: Int) {
    var nums = [Int](repeating: 0, count: lastNum + 1)

    for i in 2...lastNum {
        nums[i] = i
    }

    for i in 2...Int(sqrt(Double(lastNum))) {
        if nums[i] == 0 { continue }
        for j in stride(from: i * i, through: lastNum, by: i) {
            nums[j] = 0
        }
    }

    for i in 2...lastNum {
        if nums[i] != 0 {
            print(i, terminator: " ")
        }
    }
    print()
}

let eratosNum = 100 // 원하는 범위를 설정하세요.
eratosPrimes(upTo: eratosNum)

let LAST_NUM = 100
var prime = [UInt8](repeating: 255, count: (LAST_NUM + 7) / 8 + 1)

func isPrime(_ k: Int) -> Bool {
    return (prime[k >> 3] & (1 << (k & 7))) == 0 ? false : true
}

func setComposite(_ k: Int) {
    prime[k >> 3] &= ~(1 << (k & 7))
}

func eratosthenes() {
    setComposite(0) // 0과 1은 소수가 아님
    setComposite(1)

    for i in 2...Int(sqrt(Double(LAST_NUM))) {
        if isPrime(i) {
            for j in stride(from: i * i, through: LAST_NUM, by: i) {
                setComposite(j)
            }
        }
    }
}

eratosthenes()

for i in 2...LAST_NUM {
    if isPrime(i) {
        print(i, terminator: " ")
    }
}
print()
