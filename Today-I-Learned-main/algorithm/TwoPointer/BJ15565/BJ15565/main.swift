//
//  main.swift
//  BJ15565
//
//  Created by JeongMin Ko on 2022/12/11.
//
/*
 문제
 꿀귀 라이언 인형과, 마찬가지로 꿀귀인 어피치 인형이 N개 일렬로 놓여 있다. 라이언 인형은 1, 어피치 인형은 2로 표현하자. 라이언 인형이 K개 이상 있는 가장 작은 연속된 인형들의 집합의 크기를 구하여라.

 입력
 첫 줄에 N과 K가 주어진다. (1 ≤ K ≤ N ≤ 106)

 둘째 줄에 N개의 인형의 정보가 주어진다. (1 또는 2)

 출력
 K개 이상의 라이언 인형을 포함하는 가장 작은 연속된 인형들의 집합의 크기를 출력한다. 그런 집합이 없다면 -1을 출력한다.
 
 10 3
 1 2 2 2 1 2 1 2 2 1
 
 */
import Foundation

func solution(){
    
    var firstInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    var N = firstInput[0]
    var K = firstInput[1]
    var A = readLine()!.split(separator: " ").map{Int(String($0))!}
    A.insert(0,at: 0)
    
    var small = N + 1 //전체 라이언인형인 경우
    var sum = 0 //라이언 개수
    
    
    var R = 0
    for L in 1...N - K + 1{
        if A[L - 1] == 1{ sum -= 1 }
        
        while(sum < K && R < N){
            R += 1
            if A[R] == 1{ sum += 1}
            
        }
        
        if sum >= K {
            
            small = min(small, R - L + 1)
        }
//        small = min(small, R - L + 1)
        
    }
    if small == N + 1 {
        print(-1)
        return
        
    }
    print(small)
}

solution()
