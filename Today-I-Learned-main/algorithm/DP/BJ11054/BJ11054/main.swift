//
//  main.swift
//  BJ11054
//
//  Created by JeongMin Ko on 2023/01/09.
//
/*
 문제
 수열 S가 어떤 수 Sk를 기준으로 S1 < S2 < ... Sk-1 < Sk > Sk+1 > ... SN-1 > SN을 만족한다면, 그 수열을 바이토닉 수열이라고 한다.

 예를 들어, {10, 20, 30, 25, 20}과 {10, 20, 30, 40}, {50, 40, 25, 10} 은 바이토닉 수열이지만,  {1, 2, 3, 2, 1, 2, 3, 2, 1}과 {10, 20, 30, 40, 20, 30} 은 바이토닉 수열이 아니다.

 수열 A가 주어졌을 때, 그 수열의 부분 수열 중 바이토닉 수열이면서 가장 긴 수열의 길이를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 수열 A의 크기 N이 주어지고, 둘째 줄에는 수열 A를 이루고 있는 Ai가 주어진다. (1 ≤ N ≤ 1,000, 1 ≤ Ai ≤ 1,000)

 출력
 첫째 줄에 수열 A의 부분 수열 중에서 가장 긴 바이토닉 수열의 길이를 출력한다.

 예제 입력 1
 10
 1 5 2 1 4 3 4 5 2 1
 예제 출력 1
 7
 */
import Foundation
func solution(){
    var N = Int(readLine()!)!
    var A = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var reverseA = A.reversed() as [Int]
    A.insert(0, at: 0)
    reverseA.insert(0, at: 0)
    var Dp = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: 2)
    
    //Dp[0][] 증가
    //Dp[1][] 감소
    for i in 1...N{
        for j in 0..<i{
            //증가
            if A[i] > A[j]{
                Dp[0][i] = max(Dp[0][j] + 1, Dp[0][i])
            }
        }
    }
    
    
    var tempDp = [Int](repeating: 0, count: N + 1)
    for i in 1...N{
        for j in 0..<i{
            //감소(reverse 증가 상태)
            if reverseA[i] > reverseA[j]{
                tempDp[i] = max(tempDp[j] + 1, tempDp[i])
            }
        }
    }
    Dp[1] = tempDp.reversed() as [Int]
    Dp[1].insert(0, at: 0)
    var best = 0
    
    var result = [Int]()
    result.append(0)
    
    for i in 1...N{
        if Dp[0][i] > 0 &&  Dp[1][i] > 0{
            best = max(Dp[0][i] + Dp[1][i] - 1, best)
            result.append(Dp[0][i] + Dp[1][i] - 1)
        }else{
            best = max(Dp[0][i] + Dp[1][i], best)
            result.append(Dp[0][i] + Dp[1][i] )
        }
        
        
        
    }
    print(best)
    print(result)
    
    
    
}
solution()
