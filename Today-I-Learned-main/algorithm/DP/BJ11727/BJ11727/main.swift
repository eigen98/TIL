//
//  main.swift
//  BJ11727
//
//  Created by JeongMin Ko on 2022/12/25.
//
/*
 문제
 2×n 직사각형을 1×2, 2×1과 2×2 타일로 채우는 방법의 수를 구하는 프로그램을 작성하시오.

 아래 그림은 2×17 직사각형을 채운 한가지 예이다.


 입력
 첫째 줄에 n이 주어진다. (1 ≤ n ≤ 1,000)

 출력
 첫째 줄에 2×n 크기의 직사각형을 채우는 방법의 수를 10,007로 나눈 나머지를 출력한다.

 예제 입력 1
 2
 예제 출력 1
 3
 */

import Foundation


func solution(){
    var n = Int(readLine()!)!
    
    var Dy = [Int]()
    
    Dy.append(0) // Dy[0] = 0
    Dy.append(1) // Dy[1] = 1
    Dy.append(3) // Dy[2] = 3
    Dy.append(5) // Dy[3] = 5
    
    if n >= 4{
        for i in 4...n{
            var num = (Dy[i - 1] + 2 * Dy[i - 2]) % 10007
            Dy.append(num)
        }
    }
    
    
    print(Dy[n])
    return
}
solution()

