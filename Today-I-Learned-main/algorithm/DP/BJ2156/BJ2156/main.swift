//
//  main.swift
//  BJ2156
//
//  Created by JeongMin Ko on 2023/01/07.
//
/*
 입력
 첫째 줄에 포도주 잔의 개수 n이 주어진다. (1 ≤ n ≤ 10,000) 둘째 줄부터 n+1번째 줄까지 포도주 잔에 들어있는 포도주의 양이 순서대로 주어진다. 포도주의 양은 1,000 이하의 음이 아닌 정수이다.

 출력
 첫째 줄에 최대로 마실 수 있는 포도주의 양을 출력한다.

 예제 입력 1
 6
 6
 10
 13
 9
 8
 1
 예제 출력 1
 33
 */
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var A = [Int]()
    A.append(0) //Arr[0] = 0 깍두기
    for i in 1...n{
        var input = Int(readLine()!)!
        A.append(input)
    }
    
    
    var Dp : [[Int]] = [[Int]](repeating : [Int](repeating: 0, count: 3 ), count: n + 1)
    //Dp[1]
    Dp[1][0] = A[1]
    Dp[1][1] = A[1]
    Dp[1][2] = A[1]
    
    if n >= 2{
        //Dp[2]
        Dp[2][0] = A[1] + A[2]
    }
    
    if n >= 3{
        //Dp[3]
        Dp[3][0] = max(A[2] + A[3], A[1] + A[2] ,A[1] + A[3]) //끝부분 두개
        Dp[3][1] = A[1] + A[2] //끝부분 빈 경우
        Dp[3][2] = A[1] + A[3] //끝부분 하나
    }
    
    
    if n >= 4{
        for i in 4...n{
            Dp[i][0] = max(Dp[i - 1][0], Dp[i - 3][0] + A[i - 1] + A[i] , Dp[i - 2][0] + A[i])
            //Dp[i][1] = Dp[i - 1][0] //끝부분 빈 경우
            //Dp[i][2] = Dp[i - 1][1] + A[i] //끝부분 하나
        }
    }
   
   
    print(Dp[n][0])

   
    
}
solution()


func other(){
    let n = Int(readLine()!)!
    var nArray = Array(repeating: 0, count: 10001)

    for i in 1...n {
        nArray[i] = Int(readLine()!)!
    }

    var dp = Array(repeating: 0, count: n+1)
    dp[1] = nArray[1]

    if n > 1 {
        dp[2] = nArray[1] + nArray[2]
    }

    if n > 2 {
        for i in 3...n {
            dp[i] = max(dp[i-2] + nArray[i], dp[i-3] + nArray[i] + nArray[i-1], dp[i-1])
        }
    }

    print(dp[n])

}

