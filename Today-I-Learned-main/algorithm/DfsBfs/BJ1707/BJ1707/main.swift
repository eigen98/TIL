//
//  main.swift
//  BJ1707
//
//  Created by JeongMin Ko on 2023/01/04.
//
/*
 문제
 그래프의 정점의 집합을 둘로 분할하여, 각 집합에 속한 정점끼리는 서로 인접하지 않도록 분할할 수 있을 때, 그러한 그래프를 특별히 이분 그래프 (Bipartite Graph) 라 부른다.

 그래프가 입력으로 주어졌을 때, 이 그래프가 이분 그래프인지 아닌지 판별하는 프로그램을 작성하시오.

 입력
 입력은 여러 개의 테스트 케이스로 구성되어 있는데, 첫째 줄에 테스트 케이스의 개수 K가 주어진다. 각 테스트 케이스의 첫째 줄에는 그래프의 정점의 개수 V와 간선의 개수 E가 빈 칸을 사이에 두고 순서대로 주어진다. 각 정점에는 1부터 V까지 차례로 번호가 붙어 있다. 이어서 둘째 줄부터 E개의 줄에 걸쳐 간선에 대한 정보가 주어지는데, 각 줄에 인접한 두 정점의 번호 u, v (u ≠ v)가 빈 칸을 사이에 두고 주어진다.

 출력
 K개의 줄에 걸쳐 입력으로 주어진 그래프가 이분 그래프이면 YES, 아니면 NO를 순서대로 출력한다.

 제한
 2 ≤ K ≤ 5
 1 ≤ V ≤ 20,000
 1 ≤ E ≤ 200,000
 예제 입력 1
 2
 3 2
 1 3
 2 3
 4 4
 1 2
 2 3
 3 4
 4 2
 예제 출력 1
 YES
 NO
 */

import Foundation

func solution(){
    //테스트 케이스
    var K = Int(readLine()!)!
    var ans = [String]()
    for i in 1...K{
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        var result = true
        var V = input[0] //정점
        var E = input[1] //간선
        var visited = [Bool](repeating: false, count: V + 1) // 0 깍두기
        var color = [Int](repeating: 0, count: V + 1) // 0없음. 1, 2
        
        var adjList = [[Int]](repeating: [Int](), count: V + 1) //0 깍두기
        
        //인접 리스트 설정
        for j in 1...E{
            var connectInput = readLine()!.split(separator: " ").map{Int(String($0))!}
            var from = connectInput[0]
            var to = connectInput[1]
            adjList[from].append(to)
            adjList[to].append(from)
        }
        
        for vertex in 1...V{
            if !visited[vertex]{
                dfs(start: vertex, preColor: 0, parent: -1)
            }
            
        }
        
        
        // 다음 정점의 색이 같다면 이분그래프 아님
        func dfs(start : Int, preColor : Int, parent : Int){
            
            var nowColor = preColor == 1 ? 2 : 1
            
            color[start] = nowColor
            visited[start] = true
            
            for cand in adjList[start]{
                if cand == parent { continue }
                if color[cand] == nowColor && visited[cand] {
                    result = false
                    return
                }
                
                if !visited[cand]{
                    
                    visited[cand] = true
                    dfs(start: cand, preColor: nowColor, parent: start)
                }
            }
            
        }
        var add = result ? "YES" : "NO"
        ans.append(add)
        
        
    }
    for str in ans{
        print(str)
    }
}
solution()
