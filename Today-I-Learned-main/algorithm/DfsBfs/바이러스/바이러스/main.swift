//
//  main.swift
//  바이러스
//
//  Created by JeongMin Ko on 2022/12/07.
//

import Foundation

//신종 바이러스인 웜 바이러스는 네트워크를 통해 전파된다. 한 컴퓨터가 웜 바이러스에 걸리면 그 컴퓨터와 네트워크 상에서 연결되어 있는 모든 컴퓨터는 웜 바이러스에 걸리게 된다.
//첫째 줄에는 컴퓨터의 수가 주어진다. 컴퓨터의 수는 100 이하이고 각 컴퓨터에는 1번 부터 차례대로 번호가 매겨진다. 둘째 줄에는 네트워크 상에서 직접 연결되어 있는 컴퓨터 쌍의 수가 주어진다. 이어서 그 수만큼 한 줄에 한 쌍씩 네트워크 상에서 직접 연결되어 있는 컴퓨터의 번호 쌍이 주어진다.
func solution(){
    
    
    var count = 0
    var node = Int(readLine()!)!
    var edge = Int(readLine()!)!
    //인접 리스트
    var adjList = [[Int]](repeating: [Int](), count: node + 1)
    //방문 여부
    var visited = [Bool](repeating: false, count: node + 1)
    
    //인접 리스트 세팅
    for _ in 1...edge{
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        adjList[input[0]].append(input[1])
        adjList[input[1]].append(input[0])
    }
    
    func bfs(start : Int){
        var queue : [Int] = [Int]()
        queue.append(start)
        visited[start] = true
        
        while(!queue.isEmpty){
            var loc = queue.removeFirst()
            for next in adjList[loc]{
                if !visited[next]{
                    visited[next] = true
                    queue.append(next)
                    count += 1
                }
            }
        }
    }
   
    bfs(start: 1)
    print(count)
   
    
}

solution()

