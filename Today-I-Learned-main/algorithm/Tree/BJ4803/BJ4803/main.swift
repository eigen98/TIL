//
//  main.swift
//  BJ4803
//
//  Created by JeongMin Ko on 2022/12/11.
//
/*
 문제
 그래프는 정점과 간선으로 이루어져 있다. 두 정점 사이에 경로가 있다면, 두 정점은 연결되어 있다고 한다. 연결 요소는 모든 정점이 서로 연결되어 있는 정점의 부분집합이다. 그래프는 하나 또는 그 이상의 연결 요소로 이루어져 있다.

 트리는 사이클이 없는 연결 요소이다. 트리에는 여러 성질이 있다. 예를 들어, 트리는 정점이 n개, 간선이 n-1개 있다. 또, 임의의 두 정점에 대해서 경로가 유일하다.

 그래프가 주어졌을 때, 트리의 개수를 세는 프로그램을 작성하시오.

 입력
 입력은 여러 개의 테스트 케이스로 이루어져 있다. 각 테스트 케이스의 첫째 줄에는 n ≤ 500과 m ≤ n(n-1)/2을 만족하는 정점의 개수 n과 간선의 개수 m이 주어진다. 다음 m개의 줄에는 간선을 나타내는 두 개의 정수가 주어진다. 같은 간선은 여러 번 주어지지 않는다. 정점은 1번부터 n번까지 번호가 매겨져 있다. 입력의 마지막 줄에는 0이 두 개 주어진다.

 출력
 입력으로 주어진 그래프에 트리가 없다면 "No trees."를, 한 개라면 "There is one tree."를, T개(T > 1)라면 "A forest of T trees."를 테스트 케이스 번호와 함께 출력한다.
 
 6 3
 1 2
 2 3
 3 4
 6 5
 1 2
 2 3
 3 4
 4 5
 5 6
 6 6
 1 2
 2 3
 1 3
 4 5
 5 6
 6 4
 0 0
 
 Case 1: A forest of 3 trees.
 Case 2: There is one tree.
 Case 3: No trees.
 */

import Foundation

func rec_func(){
    var test = 0
    var M = -1
    var N = -1
    var ans = [String]()
    func solution(){
        
        
        
        
        var adjList = [[Int]](repeating: [Int](), count: N + 1) //1번노드 ~ N번 노드
        var child = [Int]()
        var visited = [Bool](repeating: false, count: N + 1) //N번 노드 방문 여부
        //간선 개수 만큼 반복
        // 인접 리스트 입력
        for i in 1...M {
            var input = readLine()!.split(separator: " ").map{Int(String($0))!}
            var from = input[0]
            var to = input[1]
            //간선 연결
            adjList[from].append(to)
            adjList[to].append(from)
        }
        var count = 0
        
        
        func dfs(start: Int, par: Int) -> Int{
            
            if visited[start] { return 0}
            visited[start] = true
            for node in adjList[start]{
                if node == par { continue }
                if visited[node]{ return 0} //사이클 존재 트리 X
                
                dfs(start: node, par: start)
            }
            return 1
            
        }
        
        for i in 1...N{
            var result = dfs(start: i, par: -1)
            count += result
        }
        if count > 1 {
            ans.append("Case \(test): A forest of \(count) trees.")
            //print("Case \(test): A forest of \(count) trees.")
            
        }else if count == 1{
            ans.append("Case \(test): A forest of one tree.")
            //print("Case \(test): A forest of one tree.")
            
        }else{
            ans.append("Case \(test): No trees.")
            //print("Case \(test): No trees.")
           
        }
       
        
        
        
        
        
        
        
        
    }

    while(true){
        var firstInput = readLine()!.split(separator: " ").map{Int(String($0))!}
        N = firstInput[0] //노드 개수
        M = firstInput[1] //간선 개수
        if N == 0 && M == 0 { break }
        solution()
        test += 1
    }
    
    print(ans.joined(separator: "\n"))
    return

    
}

rec_func()
