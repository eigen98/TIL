//
//  main.swift
//  BJ1743
//
//  Created by JeongMin Ko on 2022/12/15.
//
/*
 입력
 첫째 줄에 통로의 세로 길이 N(1 ≤ N ≤ 100)과 가로 길이 M(1 ≤ M ≤ 100) 그리고 음식물 쓰레기의 개수 K(1 ≤ K ≤ N×M)이 주어진다.  그리고 다음 K개의 줄에 음식물이 떨어진 좌표 (r, c)가 주어진다.

 좌표 (r, c)의 r은 위에서부터, c는 왼쪽에서부터가 기준이다. 입력으로 주어지는 좌표는 중복되지 않는다.

 출력
 첫째 줄에 음식물 중 가장 큰 음식물의 크기를 출력하라.

 예제 입력 1
 3 4 5
 3 2
 2 2
 3 1
 2 3
 1 1
 */

import Foundation

func solution(){
    var read = readLine()!.split(separator: " ").map{Int(String($0))!}
    var N = read[0] // 행
    var M = read[1] //열
    var K = read[2]
    
    var dir = [
        [1,0],
        [-1,0],
        [0,1],
        [0,-1]
    
    ]
    //행렬
    var matrix = [[Int]](repeating: [Int](repeating: 0, count: M + 1), count: N + 1)
    var ans = 0
    
    for i in 1...K{
        //오물 배치
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        matrix[input[0]][input[1]] = 1 //오물 : 1
    }
    //방문 여부
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M + 1), count: N + 1)
    
    func bfs(_ r: Int, _ c: Int){
       
        var size = 0
        
        if visited[r][c]{
            return
        }
        
        visited[r][c] = true
        
        
        var queue = [[Int]]()
        queue.append([r,c])
        
        while(!queue.isEmpty){
            var now = queue.removeFirst()
            
            for i in 0..<4{
                var nr = now[0] + dir[i][0]
                var nc = now[1] + dir[i][1]
                
                if nr < 0 || nr > N || nc < 0 || nc > M { continue }
                if visited[nr][nc] { continue }
                if matrix[nr][nc] == 0 { continue }
                
                queue.append([nr, nc])
                visited[nr][nc] = true
                size += 1
            }
        }
        
        ans = max(size, ans)
    }
    
    //탐색 시작
    for i in 0..<N{
        for j in 0..<M{
            if !visited[i][j]{ bfs(i, j) }
            
        }
    }
   
    print(ans)
}
solution()

