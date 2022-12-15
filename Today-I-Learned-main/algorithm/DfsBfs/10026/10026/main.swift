//
//  main.swift
//  10026
//
//  Created by JeongMin Ko on 2022/12/15.
//
/*
 5
 RRRBB
 GGBBB
 BBBRR
 BBRRR
 RRRRR
 */

import Foundation

func solution(){
    
    var threeCount = 0
    var twoCount = 0
    
    var dir = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1],
    ]
    
    var num = Int(readLine()!)!
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: num), count: num)
    var newVisited = [[Bool]](repeating: [Bool](repeating: false, count: num), count: num)
    var matrix = [[String]](repeating: [String](), count: num)
    
    for i in 0..<num{
        var input = readLine()!.map{String($0)}
        matrix[i] = input
    }
    
    func dfs(_ r : Int, _ c: Int){
        if visited[r][c] {
           return
        }
        visited[r][c] = true
        var color = matrix[r][c]
        
        for i in 0..<4{
            var nr = r + dir[i][0]
            var nc = c + dir[i][1]
            
            if nr < 0 || nr >= num || nc < 0 || nc >= num{ //범위 체크
                continue
            }
            if visited[nr][nc] { continue } //방문 여부확인
            if matrix[nr][nc] != color { continue } // 색상 확인
            dfs(nr, nc)
        }
        
        
    }
    
    func rgdfs(_ r : Int, _ c: Int){
        if newVisited[r][c] {
           return
        }
        newVisited[r][c] = true
        var color = matrix[r][c]
        
        for i in 0..<4{
            var nr = r + dir[i][0]
            var nc = c + dir[i][1]
            
            if nr < 0 || nr >= num || nc < 0 || nc >= num{ //범위 체크
                continue
            }
            if newVisited[nr][nc] { continue } //방문 여부확인
            if matrix[r][c] == "B" && color != matrix[nr][nc] { continue } // 색상 확인
            if matrix[nr][nc] == "B" && color != matrix[nr][nc] { continue } // 색상 확인
            rgdfs(nr, nc)
        }
        
        
    }
    
    for i in 0..<num{
        for j in 0..<num{
            if !visited[i][j]{
                threeCount += 1
                dfs(i, j)
            }
           
        }
    }
    for i in 0..<num{
        for j in 0..<num{
            if !newVisited[i][j]{
                twoCount += 1
                rgdfs(i, j)
            }
           
        }
    }
    print(threeCount)
    print(twoCount)
    
    
    
}
solution()
