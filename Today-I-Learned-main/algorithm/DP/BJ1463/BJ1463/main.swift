//
//  main.swift
//  BJ1463
//
//  Created by JeongMin Ko on 2022/12/21.
//

/*
 
 문제
 정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.

 X가 3으로 나누어 떨어지면, 3으로 나눈다.
 X가 2로 나누어 떨어지면, 2로 나눈다.
 1을 뺀다.
 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.

 입력
 첫째 줄에 1보다 크거나 같고, 106보다 작거나 같은 정수 N이 주어진다.

 출력
 첫째 줄에 연산을 하는 횟수의 최솟값을 출력한다.
 
 입력
 첫째 줄에 1보다 크거나 같고, 106보다 작거나 같은 정수 N이 주어진다.

 출력
 첫째 줄에 연산을 하는 횟수의 최솟값을 출력한다.
 */
import Foundation

func solution(){
    var N = Int(readLine()!)!
    var Dy = [Int]()
    Dy.append(0)//0
    Dy.append(1)//1
    Dy.append(1)//2
    Dy.append(1)//3
    Dy.append(2)//4
    if N >= 5{
        for i in 5...N{
            var cand = Dy[i - 1]
           
            if i % 3 == 0 {
                var prev3 = Dy[i / 3]
                cand = min(prev3, cand)
               
            }
            
            if i % 2 == 0 {
                var prev2 = Dy[i / 2]
                cand = min(prev2, cand)
            }
            
            Dy.append(cand + 1)
           
        }
        
    }
   
    print(Dy[N])
    exit(0)
    return
}

solution()

