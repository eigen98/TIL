//
//  main.swift
//  연결 요소의 개수
//
//  Created by JeongMin Ko on 2022/12/07.
//
//방향 없는 그래프가 주어졌을 때, 연결 요소 (Connected Component)의 개수를 구하는 프로그램을 작성하시오.
//첫째 줄에 정점의 개수 N과 간선의 개수 M이 주어진다. (1 ≤ N ≤ 1,000, 0 ≤ M ≤ N×(N-1)/2)
//둘째 줄부터 M개의 줄에 간선의 양 끝점 u와 v가 주어진다. (1 ≤ u, v ≤ N, u ≠ v) 같은 간선은 한 번만 주어진다.
import Foundation

func solution(){
    
    var count = 0
    var readNM = readLine()!.split(separator: " ").map{Int(String($0))!}
    var N = readNM[0] //점 Count
    var M = readNM[1] //간선 개수
    //1 ~ N번까지 인접 리스트(0,0 제외)
    var matrix = [[Int]](repeating: [Int](), count: N + 1)
    var visited = [Bool](repeating: false, count: N + 1)
    //간선 연결하기
    for i in 1...M {
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        var u = input[0]
        var v = input[1]
        matrix[u].append(v)
        matrix[v].append(u)
        
    }
    
    func bfs(start : Int){
        count += 1
        var queue : [Int] = []
        queue.append(start)
        
        while(!queue.isEmpty){
            var loc = queue.removeFirst()
            
            for next in matrix[loc]{
                
                if !visited[next]{
                    visited[next] = true
                    queue.append(next)
                }
            }
            
        }
    }
    
    for num in 1...N{
        
        if !visited[num] {
            bfs(start: num)
        }
        
    }
    
    print(count)
    
    
}

solution()

