//
//  main.swift
//  CommandLine유기농배추
//
//  Created by JeongMin Ko on 2022/12/06.
//

import Foundation
//입력의 첫 줄에는 테스트 케이스의 개수 T가 주어진다. 그 다음 줄부터 각각의 테스트 케이스에 대해 첫째 줄에는 배추를 심은 배추밭의 가로길이 M(1 ≤ M ≤ 50)과 세로길이 N(1 ≤ N ≤ 50), 그리고 배추가 심어져 있는 위치의 개수 K(1 ≤ K ≤ 2500)이 주어진다. 그 다음 K줄에는 배추의 위치 X(0 ≤ X ≤ M-1), Y(0 ≤ Y ≤ N-1)가 주어진다. 두 배추의 위치가 같은 경우는 없다.
/*
 2
 10 8 17
 0 0
 1 0
 1 1
 4 2
 4 3
 4 5
 2 4
 3 4
 7 4
 8 4
 9 4
 7 5
 8 5
 9 5
 7 6
 8 6
 9 6
 10 10
*/

func solution(){
    var T = Int(String(readLine()!))!
    
    for _ in 1...T {
        gogogo()
    }
    
    
}

func gogogo(){
    var testLine = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var M = testLine[0] // 가로
    var N = testLine[1] // 세로
    var K = testLine[2] // 상추 개수
    
    var direction = [
        [1,0],
        [-1,0],
        [0,1],
        [0,-1]
    ]
    //방문 여부
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    
    var matrix = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    
    var count = 0
    //상추 위치 배열
   // var matrix = [[Int]]()
    //상추 심기
    for i in 0..<(K){
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        var r = input[1]
        var c = input[0]
        matrix[r][c] = 1
    }
    //bfs 정의
    func bfs(_ row : Int, _ col : Int){
        count += 1
        var queue : [[Int]] = [[Int]]()
        queue.append([row, col])
        
        
        
        while(!queue.isEmpty){
            var loc = queue.removeFirst()
            for i in 0..<4{
                var nr = loc[0] + direction[i][0]
                var nc = loc[1] + direction[i][1]
                
                if nr >= 0 && nr < N && nc >= 0 && nc < M && !visited[nr][nc] && matrix[nr][nc] == 1 {
                    visited[nr][nc] = true
                    queue.append([nr,nc])
                    
                }
                
            }
            
        }
        
    }
    
    
    //실행
    for i in 0..<N {
        for j in 0..<M{
            if !visited[i][j] && matrix[i][j] == 1 {
                bfs(i,j)
            }
            
        }
    }
    
    print( "\(count)")
    
}

solution()
