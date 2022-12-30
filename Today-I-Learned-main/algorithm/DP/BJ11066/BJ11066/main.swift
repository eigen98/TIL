//
//  main.swift
//  BJ11066
//
//  Created by JeongMin Ko on 2022/12/22.
//
/*
 입력
 프로그램은 표준 입력에서 입력 데이터를 받는다. 프로그램의 입력은 T개의 테스트 데이터로 이루어져 있는데, T는 입력의 맨 첫 줄에 주어진다.각 테스트 데이터는 두 개의 행으로 주어지는데, 첫 행에는 소설을 구성하는 장의 수를 나타내는 양의 정수 K (3 ≤ K ≤ 500)가 주어진다. 두 번째 행에는 1장부터 K장까지 수록한 파일의 크기를 나타내는 양의 정수 K개가 주어진다. 파일의 크기는 10,000을 초과하지 않는다.

 출력
 프로그램은 표준 출력에 출력한다. 각 테스트 데이터마다 정확히 한 행에 출력하는데, 모든 장을 합치는데 필요한 최소비용을 출력한다.

 예제 입력 1
 2
 4
 40 30 30 50
 15
 1 21 3 4 5 35 5 4 3 5 98 21 14 17 32
 
 예제 출력 1
 300
 864
 */

import Foundation

func solution(){
    var T = Int(readLine()!)!
    for _ in 1...T{
        
        var K = Int(readLine()!)!
        var A = [Int]()
        A = readLine()!.split(separator: " ").map{Int(String($0))!}
        A.insert(0, at: 0)
        var sum = [[Int]](repeating: [Int](repeating: 0, count: K + 1), count: K + 1)
        var Dy = [[Int]](repeating: [Int](repeating: 0, count: K + 1), count: K + 1)
        //sum 전처리
        for i in 1...K{
            for j in i...K{
                sum[i][j] = sum[i][j - 1] + A[j]
            }
        }

        for len in 2...K{
            for i in 1...K - len + 1 {
                var j = i + len - 1
                
                Dy[i][j] = Int.max
                for k in i..<j{
                    Dy[i][j] = min(Dy[i][j], Dy[i][k] + Dy[k + 1][j] + sum[i][j])
                }
            }
        }


        print("\(Dy[1][K])")


    }

}
solution()
