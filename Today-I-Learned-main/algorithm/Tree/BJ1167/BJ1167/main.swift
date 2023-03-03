//
//  main.swift
//  BJ1167
//
//  Created by JeongMin Ko on 2023/01/22.
//
/*
 문제
 트리의 지름이란, 트리에서 임의의 두 점 사이의 거리 중 가장 긴 것을 말한다. 트리의 지름을 구하는 프로그램을 작성하시오.

 입력
 트리가 입력으로 주어진다. 먼저 첫 번째 줄에서는 트리의 정점의 개수 V가 주어지고 (2 ≤ V ≤ 100,000)둘째 줄부터 V개의 줄에 걸쳐 간선의 정보가 다음과 같이 주어진다. 정점 번호는 1부터 V까지 매겨져 있다.

 먼저 정점 번호가 주어지고, 이어서 연결된 간선의 정보를 의미하는 정수가 두 개씩 주어지는데, 하나는 정점번호, 다른 하나는 그 정점까지의 거리이다. 예를 들어 네 번째 줄의 경우 정점 3은 정점 1과 거리가 2인 간선으로 연결되어 있고, 정점 4와는 거리가 3인 간선으로 연결되어 있는 것을 보여준다. 각 줄의 마지막에는 -1이 입력으로 주어진다. 주어지는 거리는 모두 10,000 이하의 자연수이다.

 출력
 첫째 줄에 트리의 지름을 출력한다.

 예제 입력 1
 5
 1 3 2 -1
 2 4 4 -1
 3 1 2 4 3 -1
 4 2 4 3 3 5 6 -1
 5 4 6 -1
 예제 출력 1
 11
 */

import Foundation

class Edge{
    var to : Int
    var weight : Int
    init(to: Int, weight: Int) {
        self.to = to
        self.weight = weight
    }
}

func solution(){
    
    var N = Int(readLine()!)!
    var adjArr = [[Edge]](repeating: [Edge](), count: N + 1) //0 깍두기
    var visited = [Bool](repeating: false, count: N + 1)
    var finalNode = 0
    //인접 리스트 만들기
    for i in 1...N{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        var from = input[0]
        var to = 0
        var dist = 0
        
        for j in 1...input.count - 1{
            if input[j] == -1{ continue }
            if j % 2 == 1{  to = input[j] }
            if j % 2 == 0{
                dist = input[j]
                let edge = Edge(to: to, weight: dist)
                adjArr[from].append(edge)
               
            }
            
        }
    }
    
    var maximum = 0
    var maxLen = [Int](repeating: 0, count: N + 1)
    
    
    func dfs(start : Int, edgeDist : Int){
        if visited[start] {
            return
        }
        
        visited[start] = true
        var nextMax = 0
        var nextRoute = -1
        for cand in adjArr[start]{
            
            if !visited[cand.to]{
                if nextMax < cand.weight{
                    nextMax = cand.weight
                    nextRoute = cand.to
                    
                }
            }
        }
        if nextRoute != -1 {
            dfs(start: nextRoute, edgeDist: edgeDist + nextMax)
            visited[nextRoute] = false
        }
        
        if maximum < edgeDist{
            finalNode = start
            
            maximum = edgeDist
            print(maximum)
        }
        
       
    }
    
   
    dfs(start: 1, edgeDist: 0)
    
    visited = [Bool](repeating: false, count: N + 1)
    maximum = 0
    
    dfs(start: finalNode, edgeDist: 0)
    
    //print(maximum)
}
solution()