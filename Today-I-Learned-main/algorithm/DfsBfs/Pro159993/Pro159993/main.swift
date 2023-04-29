//
//  main.swift
//  Pro159993
//
//  Created by JeongMin Ko on 2023/04/23.
//

//S : 시작
//L : 레버
//X : 벽
//O : 통로
//E : 출구

import Foundation

var dir = [ [1,0], [-1, 0], [0, 1], [0, -1] ]

var dist = [[Int]]()
var matrix = [[String]]()
var width = 0
var height = 0

var startP = [Int]()
var leverP = [Int]()
var exitP = [Int]()

func solution(_ maps:[String]) -> Int {
    
    
    var leverOpenCount = 0
    var exitCount = 0
    dist = [[Int]](repeating: [Int](repeating : 0, count : maps[0].length), count: maps.count)
    width = maps[0].length
    height = maps.count
    
    for str in maps{
        var arr = str.map{String($0)}
        matrix.append(arr)
    }
    
    //위치 찾기
    //시작, 레버, 탈출구
    for i in 0..<height{
        for j in 0..<width{
            if matrix[i][j] == "S"{startP = [i,j]}
            if matrix[i][j] == "L"{leverP = [i,j]}
            if matrix[i][j] == "E"{exitP = [i,j]}
            
        }
    }
    
    bfs(r : startP[0], c: startP[1])
    leverOpenCount = dist[leverP[0]][leverP[1]]
    
    bfs(r : leverP[0], c: leverP[1])
    exitCount = dist[exitP[0]][exitP[1]]
   
    if exitCount == 0 || leverOpenCount == 0{
        return -1
    }
    return leverOpenCount + exitCount
}

func bfs(r : Int, c: Int){
    var queue = [[Int]]()
    dist = [[Int]](repeating: [Int](repeating : 0, count : width), count: height)
    queue.append([r,c])
    
    while(!queue.isEmpty){
        var now = queue.removeFirst()
        var row = now[0]
        var col = now[1]
        var nowDist = dist[row][col]
        for idx in 0...3{
           
            var nr = row + dir[idx][0]
            var nc = col + dir[idx][1]
            
            if nr < 0 || nr >= height || nc < 0 || nc >= width{ continue }
            if nowDist + 1 >= dist[nr][nc] && dist[nr][nc] != 0 { continue }
            if matrix[nr][nc] == "X" {continue}
            
            queue.append([nr,nc])
            dist[nr][nc] = nowDist + 1
            
        }
    }
    
}

