//
//  main.swift
//  BJ2003
//
//  Created by JeongMin Ko on 2022/12/11.
//
/*
 
 N개의 수로 된 수열 A[1], A[2], …, A[N] 이 있다. 이 수열의 i번째 수부터 j번째 수까지의 합 A[i] + A[i+1] + … + A[j-1] + A[j]가 M이 되는 경우의 수를 구하는 프로그램을 작성하시오.


 첫째 줄에 N(1 ≤ N ≤ 10,000), M(1 ≤ M ≤ 300,000,000)이 주어진다. 다음 줄에는 A[1], A[2], …, A[N]이 공백으로 분리되어 주어진다. 각각의 A[x]는 30,000을 넘지 않는 자연수이다.
 4 2
 1 1 1 1
 
 */

import Foundation

func solution(){
    var firstInput = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var N = firstInput[0]
    var M = firstInput[1]
    
    var sum = 0 // 현재 총합
    var count = 0 // 경우의 수
    var A =  readLine()!.split(separator: " ").map{ Int(String($0))!}
    A.insert(0, at: 0)
    A = A.sorted() //정렬
    
    var R = 0
    for L in 1...N{
        sum -= A[L - 1]
        //총합이 같거나 더 커질 때까지 R 이동
        while(R + 1 <= N && sum < M){
            R += 1
            sum += A[R]
            
            
            
        }
        if sum == M{
            count += 1
        }
        
        
        
        
    }
    
    print(count)
}



