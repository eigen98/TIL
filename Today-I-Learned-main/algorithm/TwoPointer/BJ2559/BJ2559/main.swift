//
//  main.swift
//  BJ2559
//
//  Created by JeongMin Ko on 2022/12/11.
//
/*
 첫째 줄에는 두 개의 정수 N과 K가 한 개의 공백을 사이에 두고 순서대로 주어진다. 첫 번째 정수 N은 온도를 측정한 전체 날짜의 수이다. N은 2 이상 100,000 이하이다. 두 번째 정수 K는 합을 구하기 위한 연속적인 날짜의 수이다. K는 1과 N 사이의 정수이다. 둘째 줄에는 매일 측정한 온도를 나타내는 N개의 정수가 빈칸을 사이에 두고 주어진다. 이 수들은 모두 -100 이상 100 이하이다.

 출력
 첫째 줄에는 입력되는 온도의 수열에서 연속적인 K일의 온도의 합이 최대가 되는 값을 출력한다
 
 10 2
 3 -2 -4 -9 0 3 7 13 8 -3
 */

import Foundation

func solution(){
    
    var firstInput = readLine()!.split(separator: " ").map{Int(String($0))!}
   
    
    var N = firstInput[0] //전체 날짜
    var K = firstInput[1] //연속적인 날짜 수
    
    var sum = 0
    var prime = -100 * K
    
    var A = readLine()!.split(separator: " ").map{Int(String($0))!}
    A.insert(0, at: 0)
    
    var R = 0
    for L in 1...N - K + 1{
        sum -= A[L - 1]
        while(R - L < K - 1 && R < N){
            R += 1
            sum += A[R]
            
        }
        
        prime = max(sum, prime)
        
       
        
    }
    print(prime)
}

solution()

