//
//  main.swift
//  BJ11053
//
//  Created by JeongMin Ko on 2023/01/08.
//
/*
 문제
 수열 A가 주어졌을 때, 가장 긴 증가하는 부분 수열을 구하는 프로그램을 작성하시오.

 예를 들어, 수열 A = {10, 20, 10, 30, 20, 50} 인 경우에 가장 긴 증가하는 부분 수열은 A = {10, 20, 10, 30, 20, 50} 이고, 길이는 4이다.

 입력
 첫째 줄에 수열 A의 크기 N (1 ≤ N ≤ 1,000)이 주어진다.

 둘째 줄에는 수열 A를 이루고 있는 Ai가 주어진다. (1 ≤ Ai ≤ 1,000)

 출력
 첫째 줄에 수열 A의 가장 긴 증가하는 부분 수열의 길이를 출력한다.

 예제 입력 1
 6
 10 20 10 30 20 50
 예제 출력 1
 4
 */

import Foundation

func solution(){
    var N = Int(readLine()!)!
    var A = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var Dp = [Int](repeating: 0, count: N + 1) //0 깍두기
   
    for i in 1...N{
        for j in 0..<i{
            
            if A[i] > A[j]{
                Dp[i] =  max(Dp[j] + A[i], Dp[i])
            }
            
        }
    }
    print(Dp.max()!)
}
solution()