//
//  main.swift
//  BJ1987
//
//  Created by JeongMin Ko on 2022/12/14.
//

import Foundation

func solution(){
    var firstInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    var R = firstInput[0]
    var C = firstInput[1]
    var matrix = [[String]](repeating: [String](), count: R)
    
    for i in 0..<R{
        var input = readLine()!.map{String($0)}
        matrix[i].append(contentsOf: input)
    }
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
    var dist = [[Int]](repeating: [Int](repeating: 0, count: C), count: R)
    var dub =  [String : Int]()
    
    var dir = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1]
    ]
    
    
    
    func bfs(_ r : Int, _ c: Int){
        var maximum = 0
        if visited[r][c]{
            return
        }
        
        visited[r][c] = true
        
        
        
        var queue = [[Int]]()
        queue.append([r,c])
        
        while(!queue.isEmpty){
            
            var now = queue.removeFirst()
            var count = dist[now[0]][now[1]]
            var str = matrix[now[0]][now[1]]
            dub[str] = 1
            maximum = max(count, maximum)
            
            for i in 0..<4{
                var nr = now[0] + dir[i][0]
                var nc = now[1] + dir[i][1]
               
                if nr < 0 || nr >= R || nc < 0 || nc >= C { continue }
               
               
                if visited[nr][nc] { continue }
                var alpa = matrix[nr][nc]
                
                if dub[alpa] ?? 0 >= 1 { continue }
                dist[nr][nc] = count + 1
                
                queue.append([nr, nc])
                print("nr nc : \(nr) \(nc) ")
                visited[nr][nc] = true
                dub[alpa] = 1
            }
        }
        
        print(maximum + 1)
    }
   
    
    //bfs(0, 0)
    var maximum = 0
    func dfs(_ r : Int, _ c: Int, distance : Int){
        if visited[r][c]{
            return
        }
        maximum = max(distance, maximum)
        dub[matrix[r][c]] = 1
        visited[r][c] = true
        for i in 0..<4{
            var nr = r + dir[i][0]
            var nc = c + dir[i][1]
           
            if nr < 0 || nr >= R || nc < 0 || nc >= C { continue }
           
           
            if visited[nr][nc] { continue }
            var alpa = matrix[nr][nc]
            
            if dub[alpa] ?? 0 >= 1 { continue }
            dfs(nr, nc, distance: distance + 1)
            dub[alpa] = 0
            visited[nr][nc] = false
            
        }
        
        
        
    }
    dfs(0, 0, distance: 0)
    print(maximum + 1)
    
}
solution()
