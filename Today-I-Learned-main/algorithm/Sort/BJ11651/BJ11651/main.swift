//
//  main.swift
//  BJ11651
//
//  Created by JeongMin Ko on 2022/12/27.
//
/*
 문제
 2차원 평면 위의 점 N개가 주어진다. 좌표를 y좌표가 증가하는 순으로, y좌표가 같으면 x좌표가 증가하는 순서로 정렬한 다음 출력하는 프로그램을 작성하시오.

 입력
 첫째 줄에 점의 개수 N (1 ≤ N ≤ 100,000)이 주어진다. 둘째 줄부터 N개의 줄에는 i번점의 위치 xi와 yi가 주어진다. (-100,000 ≤ xi, yi ≤ 100,000) 좌표는 항상 정수이고, 위치가 같은 두 점은 없다.

 출력
 첫째 줄부터 N개의 줄에 점을 정렬한 결과를 출력한다.

 예제 입력 1
 5
 0 4
 1 2
 1 -1
 2 2
 3 3
 예제 출력 1
 1 -1
 1 2
 2 2
 3 3
 0 4

 */

import Foundation

func solution(){
    var N = Int(readLine()!)!
    var arr = [Node]()
    for i in 1...N{
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        var x = input[0]
        var y = input[1]
        var node = Node(x: x, y: y)
        
        arr.append(node)
    }
    arr = arr.sorted(by: {
        if $0.y != $1.y{
            return $0.y < $1.y
            
        }else{
            return $0.x < $1.x
        }
    })
    
    for vertex in arr{
        print("\(vertex.x) \(vertex.y)")
    }
}

struct Node {
    var x : Int
    var y : Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
solution()
