//
//  main.swift
//  경로찾기
//
//  Created by JeongMin Ko on 2022/12/07.
//

import Foundation

//가중치 없는 방향 그래프 G가 주어졌을 때, 모든 정점 (i, j)에 대해서, i에서 j로 가는 경로가 있는지 없는지 구하는 프로그램을 작성하시오.
/*
 3
 0 1 0
 0 0 1
 1 0 0
 */

func solution(){
    
    var N = Int(readLine()!)!
    
    var matrix = [[Int]](repeating: [Int](), count: N)
    var resultMatrix = [[Int]](repeating: [Int](), count: N)
    // 0 -> 1
    // 1 -> 2
    // 2 -> 0
    //인접 행렬 세팅
    for i in 0..<N{
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        for (idx, value) in input.enumerated(){
            matrix[i].append(idx)
        }
        resultMatrix[i].append(contentsOf: input)
    }
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    
    func bfs(start : Int){
       
        var queue = [Int]()
        queue.append(start)
        visited[start][start] = true
        resultMatrix[start][start] = 1
        while(!queue.isEmpty){
            
            var loc = queue.removeFirst()
            for next in matrix[loc]{
                if !visited[loc][next] && matrix[loc][next] == 1{
                    queue.append(next)
                    visited[loc][next] = true
                    resultMatrix[loc][next] = 1
                }
            }
        }
    }
    for i in 0..<N {
        bfs(start: i)
        
    }
    print(resultMatrix)
    
    
    
}

solution()
