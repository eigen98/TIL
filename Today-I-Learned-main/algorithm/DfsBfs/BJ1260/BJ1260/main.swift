//
//  main.swift
//  BJ1260
//
//  Created by JeongMin Ko on 2023/01/03.
//
/*
 문제
 그래프를 DFS로 탐색한 결과와 BFS로 탐색한 결과를 출력하는 프로그램을 작성하시오. 단, 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문하고, 더 이상 방문할 수 있는 점이 없는 경우 종료한다. 정점 번호는 1번부터 N번까지이다.

 입력
 첫째 줄에 정점의 개수 N(1 ≤ N ≤ 1,000), 간선의 개수 M(1 ≤ M ≤ 10,000), 탐색을 시작할 정점의 번호 V가 주어진다. 다음 M개의 줄에는 간선이 연결하는 두 정점의 번호가 주어진다. 어떤 두 정점 사이에 여러 개의 간선이 있을 수 있다. 입력으로 주어지는 간선은 양방향이다.

 출력
 첫째 줄에 DFS를 수행한 결과를, 그 다음 줄에는 BFS를 수행한 결과를 출력한다. V부터 방문된 점을 순서대로 출력하면 된다.

 예제 입력 1
 4 5 1
 1 2
 1 3
 1 4
 2 4
 3 4
 예제 출력 1
 1 2 4 3
 1 2 3 4
 예제 입력 2
 5 5 3
 5 4
 5 2
 1 2
 3 4
 3 1
 예제 출력 2
 3 1 2 5 4
 3 1 4 2 5
 */
import Foundation

func solution(){
    
    var dfsAns = [String]()
    var bfsAns = [String]()
    
    var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var N = input[0]// 정점 개수
    var M = input[1]// 간선 개수
    var V = input[2]// 시작점
    var visited = [Bool](repeating: false, count: N + 1) //0 깍두기 [false, false, false]
    var adjList = [[Int]](repeating: [Int](), count: N + 1) //0 깍두기
    
    //인접 리스트 조립
    for i in 1...M{
        var connectInput = readLine()!.split(separator: " ").map{ Int(String($0))!}
        
        var from = connectInput[0]
        var to = connectInput[1]
        
        adjList[from].append(to)
        adjList[to].append(from)
        
    }
    for i in 1...N{
        adjList[i].sort()
    }
    
    func dfs(start : Int){
        if visited[start] {
            return
        }
        dfsAns.append("\(start)")
        
        visited[start] = true
        
        for cand in adjList[start]{
            if !visited[cand]{
                dfs(start: cand)
            }
            //visited[cand] = false
        }
        
    }
    dfs(start: V)
    visited = [Bool](repeating: false, count: N + 1)

    bfs(start: V)
    
    func bfs(start : Int){
        if visited[start] {
            return
        }
        
        var queue = [Int]()
        queue.append(start)
        visited[start] = true
        while(!queue.isEmpty){
            var now = queue.removeFirst()
            bfsAns.append("\(now)")
            
            for cand in adjList[now]{
                if !visited[cand]{
                    visited[cand] = true
                    queue.append(cand)
                }
                
            }
        }
        
        
    }
    print(dfsAns.joined(separator: " "))
    print(bfsAns.joined(separator: " "))

    
    
}
solution()
