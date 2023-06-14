//
//  main.swift
//  BJ15806
//
//  Created by JeongMin Ko on 2023/06/14.
//

import Foundation

var N = 0 //방 크기
var M = 0 //곰팡이 개수
var K = 0 //검사 좌표 개수
var t = 0 //검사 날짜

var dir = [[-1, -2], [-2, -1], //왼쪽 위
           [-2, 1], [-1, 2],   //오른쪽 위
           [1 ,-2], [2, -1],   //왼쪽 아래
           [2, 1], [1, 2] ]    //오른쪽 아래
var visited = [[Int]]()

func solution(){
    let countInput = readLine()!.split(separator: " ").map{ Int(String($0))!}
    N = countInput[0]
    M = countInput[1]
    K = countInput[2]
    t = countInput[3]
    visited = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    
    var candArr = [[Int]]()
    
    for _ in 1...M{
        let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        //곰팡이 좌표
        let r = input[0] - 1
        let c = input[1] - 1
        let day = 0
        visited[r][c] = 1
        candArr.append([r, c, day])
    }
    var checkList = [[Int]]()
    for _ in 1...K{
        let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        //검사 좌표
        let r = input[0] - 1
        let c = input[1] - 1
        checkList.append([r,c])
    }
    
    
    bfs(inputArr: candArr)
    
//    for i in 0..<visited.count{
//        print(visited[i])
//    }
    
    for i in 0..<checkList.count{
        let row = checkList[i][0]
        let col = checkList[i][1]
        if visited[row][col] > 0{
            print("YES")
            return
        }
    }
    
    
    print("NO")
}


// inputArr = [r, c, 날짜]
func bfs(inputArr : [[Int]]){
    var queue = [[Int]]()
    queue = inputArr
    var pointer = 0
    while(pointer < queue.count){
        
        let now = queue[pointer]
        if now[2] == t { break }
        visited[now[0]][now[1]] -= 1
        
        for i in 0...7{
            let nr = now[0] + dir[i][0]
            let nc = now[1] + dir[i][1]
            if nr < 0 || nr >= N || nc < 0 || nc >= N { continue }
            visited[nr][nc] += 1
            
            queue.append([nr, nc, now[2] + 1])
        }
        pointer += 1
        
    }
}
solution()
