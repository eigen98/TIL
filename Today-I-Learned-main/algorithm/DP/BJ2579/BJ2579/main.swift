//
//  main.swift
//  BJ2579
//
//  Created by JeongMin Ko on 2022/12/21.
/*
 입력
 입력의 첫째 줄에 계단의 개수가 주어진다.

 둘째 줄부터 한 줄에 하나씩 제일 아래에 놓인 계단부터 순서대로 각 계단에 쓰여 있는 점수가 주어진다. 계단의 개수는 300이하의 자연수이고, 계단에 쓰여 있는 점수는 10,000이하의 자연수이다.

 출력
 첫째 줄에 계단 오르기 게임에서 얻을 수 있는 총 점수의 최댓값을 출력한다.

 예제 입력 1
 6
 10
 20
 15
 25
 10
 20
 예제 출력 1
 75
 */

import Foundation

func solution(){
    var N = Int(readLine()!)!
    var A = [Int]()
    var Dy = [[Int]]()
    Dy.append([0,0])
   
    
    A.append(0)
    for i in 1...N{
        var point = Int(readLine()!)!
        A.append(point)
    }
    if N >= 2{
        Dy.append([A[1],0]) // Dy[1][0]
        Dy.append([A[2],A[1] + A[2]]) //Dy[2][0], Dy[2][1]
    }
   
    
    for i in 3...N{
        var doubleStep = max(Dy[i - 2][1] + A[i] , Dy[i - 2][0] + A[i])
        var oneStep = Dy[i - 1][0] + A[i]
        Dy.append([doubleStep, oneStep])
        
    }
    
    print(max(Dy[N][0],Dy[N][1]))
    
    
    exit(0)
}

solution()
