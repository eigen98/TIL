//
//  main.swift
//  BJ2667
//
//  Created by JeongMin Ko on 2023/01/14.
//
/*
 문제
 <그림 1>과 같이 정사각형 모양의 지도가 있다. 1은 집이 있는 곳을, 0은 집이 없는 곳을 나타낸다. 철수는 이 지도를 가지고 연결된 집의 모임인 단지를 정의하고, 단지에 번호를 붙이려 한다. 여기서 연결되었다는 것은 어떤 집이 좌우, 혹은 아래위로 다른 집이 있는 경우를 말한다. 대각선상에 집이 있는 경우는 연결된 것이 아니다. <그림 2>는 <그림 1>을 단지별로 번호를 붙인 것이다. 지도를 입력하여 단지수를 출력하고, 각 단지에 속하는 집의 수를 오름차순으로 정렬하여 출력하는 프로그램을 작성하시오.



 입력
 첫 번째 줄에는 지도의 크기 N(정사각형이므로 가로와 세로의 크기는 같으며 5≤N≤25)이 입력되고, 그 다음 N줄에는 각각 N개의 자료(0혹은 1)가 입력된다.

 출력
 첫 번째 줄에는 총 단지수를 출력하시오. 그리고 각 단지내 집의 수를 오름차순으로 정렬하여 한 줄에 하나씩 출력하시오.

 예제 입력 1
 7
 0110100
 0110101
 1110101
 0000111
 0100000
 0111110
 0111000
 예제 출력 1
 3
 7
 8
 9
 */
import Foundation
func solution(){
    var countTown = 0
    var N = Int(readLine()!)!
    var dir = [
        [1,0],
        [-1,0],
        [0,1],
        [0,-1]
    
    ]
    var houseArr = [Int]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    
    var arr = [[Int]]()
    for i in 1...N{
        var input = readLine()!.map{Int(String($0))!}
        arr.append(input)
    }
    
    
    func bfs(row : Int, col : Int, num : Int, count: Int) -> Int{
        if visited[row][col] || arr[row][col] == 0{
            return 0
        }
        var result = 1
        
        visited[row][col] = true
        
        
        var queue = [[Int]]()
        queue.append([row, col])
        while(!queue.isEmpty){
            var now = queue.removeFirst()
            for i in 0...3{
                var nr = now[0] + dir[i][0]
                var nc = now[1] + dir[i][1]
                if nr < 0 || nr >= N || nc < 0 || nc >= N{
                    continue
                }
                if arr[nr][nc] == 0 || visited[nr][nc]{
                    continue
                }
                result += 1
                visited[nr][nc] = true
                queue.append([nr, nc])
            }
            
        }
        
        return result
        
    }
    
    
    for i in 0..<N{
        for j in 0..<N{
            if !visited[i][j] && arr[i][j] == 1 {
                countTown += 1
               
                var count = bfs(row: i, col: j, num: countTown, count: 1)
                houseArr.append(count)
            }
        }
    }
    
    print(countTown)
    houseArr = houseArr.sorted()
    for str in houseArr{
        print(str)
    }
    
}
solution()

