//
//  main.swift
//  BJ1726
//
//  Created by JeongMin Ko on 2022/12/15.
//

/*
 5 6
 0 0 0 0 0 0
 0 1 1 0 1 0
 0 1 0 0 0 0
 0 0 1 1 1 0
 1 0 0 0 0 0
 4 2 3
 2 4 1
 */
import Foundation

print("Hello, World!")

func solution(){
    var inputSize = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var M = inputSize[0]
    var N = inputSize[1]
    var matrix = [[Int]](repeating: [Int]() , count: M + 1)
    var visited = [[Int]](repeating: [Int](repeating: 0, count: N + 1) , count: M + 1)
    var count = [[Int]](repeating: [Int](repeating: 0, count: N + 1) , count: M + 1)
    //궤도 배치
    for i in 1...M{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        matrix[i] = input
        
    }
    var inputStart = readLine()!.split(separator: " ").map{ Int(String($0))!}
    //출발 좌표 방향
    var startR = inputStart[0]
    var startC = inputStart[1]
    var startDir = inputStart[2]
    
    var inputEnd = readLine()!.split(separator: " ").map{ Int(String($0))!}
    //도착 좌표 방향
    var endR = inputEnd[0]
    var endC = inputEnd[1]
    var endDir = inputEnd[2]
    
    
    var dir = [
        
        [0,1], //1 동
        [0,-1], //2 서
        [1,0], //3 남
        [-1,0] //4 북
        
        
    ]
    
    func turnLeft(){
        
    }
    func turnRight(){
        
    }
    //k만큼 이동
    func goK(k : Int){
        
    }
    
    func bfs(row : Int, col : Int, direction: Int){ //1 동, 2 서 , 3 남, 4 북
        
        
        var queue = [[Int]]()
        queue.append([row,col])
        
        while(!queue.isEmpty){
            var now = queue.removeFirst()
            for i in 0..<4{
                var nr = now[0] + dir[i][0]
                var nc = now[0] + dir[i][1]
                var nd = i + 1 // 1 동, 2 서, 3 남 , 4 북
                if nr <= 0 || nr > M || nc <= 0 || nc > N{ continue } //궤도 밖으로 나가는 경우
                if matrix[nr][nc] == 1 { continue } //0 으로만 이동 가능
                if visited[nr][nc] == 1 { continue } //기존에 방문한 방향인지 체크
                //turn 횟수
                var turnNum = 0
                
                bfs(row: nr, col: nc, direction: nd)
                
            }
            
        }
    }
       
        
    
   
   
}

