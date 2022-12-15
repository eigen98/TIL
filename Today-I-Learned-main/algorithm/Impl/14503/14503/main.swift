//
//  main.swift
//  14503
//
//  Created by JeongMin Ko on 2022/12/13.
//
/*
 3 3
 1 1 0
 1 1 1
 1 0 1
 1 1 1
 */

import Foundation

func solution(){
    var nmInput = readLine()!.split(separator: " ").map{ Int(String($0))!}
    let N = nmInput[0] //세로
    let M = nmInput[1] //가로
    
    var dirInput = readLine()!.split(separator: " ").map{ Int(String($0))!}
    let r = dirInput[0]
    let c = dirInput[1]
    let d = dirInput[2] //방향
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    
    var matrix = [[Int]](repeating: [Int](), count: N)
    for i in 0..<N{
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        matrix[i].append(contentsOf: input)
    }
    
    var dir = [
        [-1,0],
        [0,1],
        [1,0],
        [0,-1]
    ]
    var ans = 0
    //r, c 좌표 , dir 방향 0 1 2 3
    func dfs(count : Int ,row : Int, col : Int, direction : Int){
        var nowCount = count
        
//        if visited[row][col] == false{
//            count += 1 //청소가 되어있지 않은 경우에만 증가
//        }
        
        visited[row][col] = true //현재 위치 청소
        
        for i in 0..<4{
            //왼쪽 청소 상태 확인
            var nr = row + dir[(direction + 3 - i) % 4][0]
            var nc = col + dir[(direction + 3 - i) % 4][1]
            var nd = ( direction + 3 - i) % 4
            if nr >= 0 && nr < N &&
                nc >= 0 && nc < M &&
                !visited[nr][nc] &&
                matrix[nr][nc] == 0{
                dfs(count: nowCount + 1, row: nr, col: nc, direction: nd)
            }
            
        }
        
        //후진 청소했더라도 후진은 가능
        var nr = row + dir[(direction + 2) % 4][0]
        var nc = col + dir[(direction + 2) % 4][1]
        var nd = direction //방향 변화 없음
        if nr >= 0 && nr < N &&
            nc >= 0 && nc < M &&
            matrix[nr][nc] == 0{
            dfs(count: nowCount, row: nr, col: nc, direction: nd)
        }else if matrix[nr][nc] == 1{
            print(nowCount)
            exit(0)
            return
        }
        
        //이동 불가
        
    }
    
    dfs(count: 1, row: r, col: c, direction: d)
    
    
}
solution()
