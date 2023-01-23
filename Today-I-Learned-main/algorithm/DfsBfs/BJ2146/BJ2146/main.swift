//
//  main.swift
//  BJ2146
//
//  Created by JeongMin Ko on 2023/01/21.
//
/*
 문제
 여러 섬으로 이루어진 나라가 있다. 이 나라의 대통령은 섬을 잇는 다리를 만들겠다는 공약으로 인기몰이를 해 당선될 수 있었다. 하지만 막상 대통령에 취임하자, 다리를 놓는다는 것이 아깝다는 생각을 하게 되었다. 그래서 그는, 생색내는 식으로 한 섬과 다른 섬을 잇는 다리 하나만을 만들기로 하였고, 그 또한 다리를 가장 짧게 하여 돈을 아끼려 하였다.

 이 나라는 N×N크기의 이차원 평면상에 존재한다. 이 나라는 여러 섬으로 이루어져 있으며, 섬이란 동서남북으로 육지가 붙어있는 덩어리를 말한다. 다음은 세 개의 섬으로 이루어진 나라의 지도이다.



 위의 그림에서 색이 있는 부분이 육지이고, 색이 없는 부분이 바다이다. 이 바다에 가장 짧은 다리를 놓아 두 대륙을 연결하고자 한다. 가장 짧은 다리란, 다리가 격자에서 차지하는 칸의 수가 가장 작은 다리를 말한다. 다음 그림에서 두 대륙을 연결하는 다리를 볼 수 있다.



 물론 위의 방법 외에도 다리를 놓는 방법이 여러 가지 있으나, 위의 경우가 놓는 다리의 길이가 3으로 가장 짧다(물론 길이가 3인 다른 다리를 놓을 수 있는 방법도 몇 가지 있다).

 지도가 주어질 때, 가장 짧은 다리 하나를 놓아 두 대륙을 연결하는 방법을 찾으시오.

 입력
 첫 줄에는 지도의 크기 N(100이하의 자연수)가 주어진다. 그 다음 N줄에는 N개의 숫자가 빈칸을 사이에 두고 주어지며, 0은 바다, 1은 육지를 나타낸다. 항상 두 개 이상의 섬이 있는 데이터만 입력으로 주어진다.

 출력
 첫째 줄에 가장 짧은 다리의 길이를 출력한다.

 예제 입력 1
 10
 1 1 1 0 0 0 0 1 1 1
 1 1 1 1 0 0 0 0 1 1
 1 0 1 1 0 0 0 0 1 1
 0 0 1 1 1 0 0 0 0 1
 0 0 0 1 0 0 0 0 0 1
 0 0 0 0 0 0 0 0 0 1
 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 1 1 0 0 0 0
 0 0 0 0 1 1 1 0 0 0
 0 0 0 0 0 0 0 0 0 0
 예제 출력 1
 3

 */
import Foundation
func solution(){
   
    var dir =
    [
        [1,0],
        [-1,0],
        [0,1],
        [0,-1]
    
    ]
    
    let N = Int(readLine()!)!
    var visitedLand = Array(repeating: Array(repeating: 0, count: N), count: N)
    
    var arr = [[Int]]()
    
    for _ in 1...N{
        let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        arr.append(input)
    }
    
    var minimum = Int.max
    var landCount = 2
    
    for i in 0..<N{
        for j in 0..<N{
            if arr[i][j] == 1 && visitedLand[i][j] == 0{
                bfsLand(row: i, col: j, count: landCount)
                landCount += 1
            }
        }
    }
    
    for i in 0..<N{
        for j in 0..<N{
            if arr[i][j] == 1{
                bfs(row: i, col: j, landNum: visitedLand[i][j])
            }
            
        }
    }
   

    print(minimum - 1)
   
    func bfsLand(row: Int, col : Int, count : Int){
       
        visitedLand[row][col] = landCount
        var queue = [[Int]]()
        
        var idx = 0
        queue.append([row,col])
        
        while(queue.count > idx){
            
            var now = queue[idx]
            idx += 1
            for i in 0...3{
                var nr = now[0] + dir[i][0]
                var nc = now[1] + dir[i][1]
                if nr < 0 || nr >= N || nc < 0 || nc >= N{
                    continue
                }
                if visitedLand[nr][nc] != 0 {
                    continue
                }
                if arr[nr][nc] != 1{
                    continue
                }
                visitedLand[nr][nc] = landCount
                queue.append([nr,nc])
            }
        }
        
        
    }
    
    
    func bfs(row : Int, col: Int, landNum : Int){
        //var visited = [[Bool]](repeating: [Bool](repeating: false, count: N + 1), count: N + 1)
        
        var queue = [[Int]]()
        var idx = 0
        queue.append([row,col])
        
        
        while(idx < queue.count){
            let now = queue[idx]
            let nowValue = arr[now[0]][now[1]]
           // visited[now[0]][now[1]] = true
            
            idx += 1
            
            for i in 0...3{
                let nr = now[0] + dir[i][0]
                let nc = now[1] + dir[i][1]
                //좌표 범위 체크
                if nr < 0 || nr >= N || nc < 0 || nc >= N{
                    continue
                }
                
                //랜드 도착
                if arr[nr][nc] == 1 &&
                    nowValue != 1 &&
                   
                    visitedLand[nr][nc] != landNum{
                   
                    
                    minimum = min(nowValue, minimum)
                    return
                }
                
                // 바다 체크, 방문여부 체크
                if arr[nr][nc] < nowValue + 1 && arr[nr][nc] != 0{
                    continue
                }
                
                
                //대륙 체크
                if arr[nr][nc] != 1{
                    queue.append([nr, nc])
                    arr[nr][nc] = nowValue + 1
                }
                
               
                
            }
        }
        
        
        
    }
//
//    for i in 0..<N{
//        print(arr[i])
//
//    }
//    print("")
//    for i in 0..<N{
//        print(visitedLand[i])
//
//    }
//
    
    
}
solution()


func solution2(){
    var graph = [[Int]]()

    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]

    let n = Int(readLine()!)!
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map{Int(String($0))!}
        graph.append(line)
    }

    var dict: [Int: [(Int,Int)]] = [:]

    func numberingContinent() -> Int{
        var number = 2
        
        for i in 0..<n {
            for j in 0..<n {
                if graph[i][j] == 1 {
                    bfs(i, j, number: number)
                    number += 1
                }
            }
        }
        
        return number
    }

    func bfs(_ sx: Int, _ sy: Int, number: Int) {
        graph[sx][sy] = number
        dict[number] = [(sx,sy)]

        var queue = [(sx,sy)]
        var idx = 0
        
        while queue.count > idx {
            let (cx,cy) = queue[idx]
            idx += 1
            
            for i in 0..<4 {
                let (nx,ny) = (cx+dx[i], cy+dy[i])
                
                if (0..<n) ~= nx && (0..<n) ~= ny && graph[nx][ny] == 1 {
                    graph[nx][ny] = number
                    queue.append((nx,ny))
                    dict[number]!.append((nx,ny))
                }
            }
        }
    }

    let cnt = numberingContinent()

    func bfs2(number: Int) -> Int {
        var queue = dict[number]!
        var idx = 0
        
        let INF = Int.max
        var dist = Array(repeating: Array(repeating: INF, count: n), count: n)
        queue.forEach {dist[$0][$1] = 0}
        
        while queue.count > idx {
            let (cx,cy) = queue[idx]
            idx += 1
            
            //다른 대륙에 도착했다면 리턴
            if graph[cx][cy] != 0 && graph[cx][cy] != number {
                return dist[cx][cy]
            }
            
            for i in 0..<4 {
                let (nx,ny) = (cx+dx[i], cy+dy[i])
                
                if (0..<n) ~= nx && (0..<n) ~= ny && dist[nx][ny] > dist[cx][cy] + 1 {
                    dist[nx][ny] = dist[cx][cy] + 1
                    queue.append((nx,ny))
                }
            }
        }
        
        return Int.max
    }

    var minDist = Int.max

    for k in 2..<cnt {
        let dist = bfs2(number: k)
        minDist = min(minDist, dist)
    }

    print(minDist-1)

}
