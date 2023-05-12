//
//  main.swift
//  BJ16927
//
//  Created by JeongMin Ko on 2023/05/12.
//
/*
 문제
 크기가 N×M인 배열이 있을 때, 배열을 돌려보려고 한다. 배열은 다음과 같이 반시계 방향으로 돌려야 한다.

 A[1][1] ← A[1][2] ← A[1][3] ← A[1][4] ← A[1][5]
    ↓                                       ↑
 A[2][1]   A[2][2] ← A[2][3] ← A[2][4]   A[2][5]
    ↓         ↓                   ↑         ↑
 A[3][1]   A[3][2] → A[3][3] → A[3][4]   A[3][5]
    ↓                                       ↑
 A[4][1] → A[4][2] → A[4][3] → A[4][4] → A[4][5]
 예를 들어, 아래와 같은 배열을 2번 회전시키면 다음과 같이 변하게 된다.

 1 2 3 4       2 3 4 8       3 4 8 6
 5 6 7 8       1 7 7 6       2 7 8 2
 9 8 7 6   →   5 6 8 2   →   1 7 6 3
 5 4 3 2       9 5 4 3       5 9 5 4
  <시작>         <회전1>        <회전2>
 배열과 정수 R이 주어졌을 때, 배열을 R번 회전시킨 결과를 구해보자.

 입력
 첫째 줄에 배열의 크기 N, M과 수행해야 하는 회전의 수 R이 주어진다.

 둘째 줄부터 N개의 줄에 배열 A의 원소 Aij가 주어진다.

 출력
 입력으로 주어진 배열을 R번 회전시킨 결과를 출력한다.

 제한
 2 ≤ N, M ≤ 300
 1 ≤ R ≤ 109
 min(N, M) mod 2 = 0
 1 ≤ Aij ≤ 108
 예제 입력 1
 4 4 2
 1 2 3 4
 5 6 7 8
 9 10 11 12
 13 14 15 16
 예제 출력 1
 3 4 8 12
 2 11 10 16
 1 7 6 15
 5 9 13 14
 예제 입력 2
 5 4 7
 1 2 3 4
 7 8 9 10
 13 14 15 16
 19 20 21 22
 25 26 27 28
 예제 출력 2
 28 27 26 25
 22 9 15 19
 16 8 21 13
 10 14 20 7
 4 3 2 1
 예제 입력 3
 2 2 3
 1 1
 1 1
 예제 출력 3
 1 1
 1 1
 */

import Foundation

// 두 수의 최대공약수(GCD)를 구하는 함수
func gcd(_ a: Int, _ b: Int) -> Int {
    var num1 = a
    var num2 = b
    
    while num2 != 0 {
        let temp = num1 % num2
        num1 = num2
        num2 = temp
    }
    
    return num1
}

// 두 수의 최소공배수(LCM)를 구하는 함수
func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(){
    var NMR = readLine()!.split(separator: " ").map{Int(String($0))!}
    var N = NMR[0]
    var M = NMR[1]
    var R = NMR[2]
    //input
    var matrix = [[Int]]()
    for _ in 1...N{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        matrix.append(input)
    }
    
    //몇번 돌리면 다시 돌아오는지 확인
    var n = N
    var m = M
    var minimumCycle = (n - 1) * 2 + (m - 1) * 2
    while(n > 1 && m > 1){
        var cycle = (n - 1) * 2 + (m - 1) * 2
        minimumCycle = lcm(minimumCycle, cycle)
        n -= 1
        m -= 1
    }
    if minimumCycle >= R{
        for _ in 1...R{
            matrix = windmill(matrix: matrix)
        }
    }else{
        for _ in 1...R % minimumCycle{
            matrix = windmill(matrix: matrix)
        }
    }
    
    for i in 0..<N{
        var arr = matrix[i].map{ String($0)}
        print(arr.joined(separator: " "))
        
    }
    
    
    
    
}
//돌리기
func windmill(matrix : [[Int]]) -> [[Int]]{
    var n = matrix.count
    var m = matrix[0].count
    //껍질 수
    var coverCount = min(m,n) / 2
    var count = 0
    var beforeMatrix = matrix
    var afterMatrix = matrix
    while(coverCount > 0){
        coverCount -= 1
        
        
        //상단
        //count행, 1열~ m-1열 -> 1열씩 감소.
        
        for i in count..<(m - 1 - count ){
            var before = beforeMatrix[count][i + 1]
            afterMatrix[count][i] = before
        }
        //우측
        //1행씩 감소
        for i in (count)..<(n - 1 - count){
            var before = beforeMatrix[i + 1][m - 1 - count]
            afterMatrix[i][m - 1 - count] = before
        }
        //하단
        //1열씩 증가.
        for i in count..<(m - 1 - count){
            var before = beforeMatrix[n - 1 - count][i]
            afterMatrix[n - 1 - count][i + 1] = before
        }
        //좌측
        //1행씩 증가.
        for i in count..<(n - 1 - count){
            var before = beforeMatrix[i][count]
            afterMatrix[i + 1][count] = before
        }
        count += 1
        
        beforeMatrix = afterMatrix
        
    }
    return afterMatrix
    
    
}


solution()
