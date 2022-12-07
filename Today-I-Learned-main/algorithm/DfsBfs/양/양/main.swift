//
//  main.swift
//  양
//
//  Created by JeongMin Ko on 2022/12/07.
//

import Foundation

/*
 첫 줄에는 두 정수 R과 C가 주어지며(3 ≤ R, C ≤ 250), 각 수는 마당의 행과 열의 수를 의미한다.
 다음 R개의 줄은 C개의 글자를 가진다. 이들은 마당의 구조(울타리, 양, 늑대의 위치)를 의미한다.
 6 6
 ...#..
 .##v#.
 #v.#.#
 #.o#.#
 .###.#
 ...###
 */

func solution(){
    
    var numLine = readLine()!.split(separator: " ").map{Int(String($0))!}
    var R = numLine[0]
    var C = numLine[1]
    //농장 배열
    var matrix = [[String]]()
    //방문 여부
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
    //방향
    var dir = [
        [1,0],
        [-1,0],
        [0,1],
        [0,-1]
    ]
    
    var totalW = 0 //전체 늑대 수
    var totalH = 0 //전체 양 수
    
    //농장 세팅
    for i in 1...R{
        var input = readLine()!.map{String($0)}
        matrix.append(input)
    }
    
    func bfs(_ row : Int, _ col : Int){
        var queue : [[Int]] = [[Int]]()
        var sheep = 0
        var wolf = 0
        visited[row][col] = true
        if matrix[row][col] == "v" { wolf += 1}
        if matrix[row][col] == "o" { sheep += 1}
        
        queue.append([row, col])
        
        while(!queue.isEmpty){
            var loc = queue.removeFirst()
            
            for i in 0..<4 {
                var nr = loc[0] + dir[i][0]
                var nc = loc[1] + dir[i][1]
                if nr >= 0 &&
                    nr < R &&
                    nc >= 0 &&
                    nc < C &&
                    !visited[nr][nc] &&
                    matrix[nr][nc] != "#"{
                    visited[nr][nc] = true
                    queue.append([nr, nc])
                    
                    if matrix[nr][nc] == "v" { wolf += 1}
                    if matrix[nr][nc] == "o" { sheep += 1}
                    
                }
            }
                
        }
        
        if sheep > wolf {
            totalH += sheep
        }else if sheep == 0 && wolf == 0{
            //둘다 없는 경우
            return
        }else{
            totalW += wolf
        }
        
    }
    
    for i in 0..<R{
        for j in 0..<C{
            if !visited[i][j] && matrix[i][j] != "#"{
                bfs(i, j)
            }
            
        }
    }
    
    print("\(totalH) \(totalW)")
    
    
}
solution()
