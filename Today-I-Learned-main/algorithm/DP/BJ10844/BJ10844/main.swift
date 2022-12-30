//
//  main.swift
//  BJ10844
//
//  Created by JeongMin Ko on 2022/12/26.
//

/*
 문제
 45656이란 수를 보자.

 이 수는 인접한 모든 자리의 차이가 1이다. 이런 수를 계단 수라고 한다.

 N이 주어질 때, 길이가 N인 계단 수가 총 몇 개 있는지 구해보자. 0으로 시작하는 수는 계단수가 아니다.

 입력
 첫째 줄에 N이 주어진다. N은 1보다 크거나 같고, 100보다 작거나 같은 자연수이다.

 출력
 첫째 줄에 정답을 1,000,000,000으로 나눈 나머지를 출력한다.

 예제 입력 1
 1
 예제 출력 1
 9
 */


//각 자리수 하위 가능한 수
import Foundation

func solution(){
    var N = Int(readLine()!)!
    var num = [[Int]](repeating: [Int](), count: 10)
    num[0].append(contentsOf: [1]) // 0 : 1
    num[1].append(contentsOf: [0,2]) // 1 : 0, 1
    num[2].append(contentsOf: [1,3]) // 2 : 1, 3
    num[3].append(contentsOf: [2,4]) // 3 : 2, 4
    num[4].append(contentsOf: [3,5]) // 4 : 3, 5
    num[5].append(contentsOf: [4,6]) // 5 : 4, 6
    num[6].append(contentsOf: [5,7]) // 6 : 5, 7
    num[7].append(contentsOf: [6,8]) // 7 : 6, 8
    num[8].append(contentsOf: [7,9]) // 8 : 7, 9
    num[9].append(contentsOf: [8])   // 9 : 8
    
    var A = [[Int]](repeating: [Int](repeating: 0, count: 10), count: N + 1)
    
    for i in 1...8{
        A[1][i] = 2 // 10, 12 , 21, 23 ... 89
    }
    A[1][9] = 1 // 98
    
    A[0][1] = 9
    
    for i in 2...N{
        for j in 1...9{
            
            for cand in num[j]{
                
                A[i][j] += (A[i - 1][cand]) % 1000000000
                A[i][j] %= 1000000000
            }
        }
    }
    
    var ans = 0
    for i in A[N - 1]{
       
        ans += (i % 1000000000 )
        
    }
    print(ans % 1000000000)
    return
}

solution()


func exsolution() -> Int {
    let n = Int(String(readLine()!))!
    let mod = 1000000000
    if n == 1{
        return 9
    } else {
        var result: Int = 0
        var num1: [Int] = [Int](repeating: 1, count: 10)
        var num2: [Int] = [Int](repeating: 0, count: 10)
        num1[0] = 0
        
        for i in 1..<n{
            for j in 0..<num1.count {
                if i % 2 == 1 {
                    if j == 0 {
                        num2[0] = (num1[1]) % mod
                    } else if j == 9 {
                        num2[9] = (num1[8]) % mod
                    } else {
                        num2[j] = (num1[j+1] + num1[j-1]) % mod
                    }
                } else {
                    if j == 0 {
                        num1[0] = (num2[1]) % mod
                    } else if j == 9 {
                        num1[9] = (num2[8]) % mod
                    } else {
                        num1[j] = (num2[j+1] + num2[j-1]) % mod
                    }
                }
            }
        }

        if n % 2 == 1 {
            for i in num1 {
                result += i
            }
        } else {
            for i in num2 {
                result += i
            }
        }
        
        return result % mod
    }
}
print(exsolution())
