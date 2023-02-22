//
//  main.swift
//  BJ14502
//
//  Created by JeongMin Ko on 2023/02/21.
//
/*
 문제
 인체에 치명적인 바이러스를 연구하던 연구소에서 바이러스가 유출되었다. 다행히 바이러스는 아직 퍼지지 않았고, 바이러스의 확산을 막기 위해서 연구소에 벽을 세우려고 한다.

 연구소는 크기가 N×M인 직사각형으로 나타낼 수 있으며, 직사각형은 1×1 크기의 정사각형으로 나누어져 있다. 연구소는 빈 칸, 벽으로 이루어져 있으며, 벽은 칸 하나를 가득 차지한다.

 일부 칸은 바이러스가 존재하며, 이 바이러스는 상하좌우로 인접한 빈 칸으로 모두 퍼져나갈 수 있다. 새로 세울 수 있는 벽의 개수는 3개이며, 꼭 3개를 세워야 한다.

 예를 들어, 아래와 같이 연구소가 생긴 경우를 살펴보자.

 2 0 0 0 1 1 0
 0 0 1 0 1 2 0
 0 1 1 0 1 0 0
 0 1 0 0 0 0 0
 0 0 0 0 0 1 1
 0 1 0 0 0 0 0
 0 1 0 0 0 0 0
 이때, 0은 빈 칸, 1은 벽, 2는 바이러스가 있는 곳이다. 아무런 벽을 세우지 않는다면, 바이러스는 모든 빈 칸으로 퍼져나갈 수 있다.

 2행 1열, 1행 2열, 4행 6열에 벽을 세운다면 지도의 모양은 아래와 같아지게 된다.

 2 1 0 0 1 1 0
 1 0 1 0 1 2 0
 0 1 1 0 1 0 0
 0 1 0 0 0 1 0
 0 0 0 0 0 1 1
 0 1 0 0 0 0 0
 0 1 0 0 0 0 0
 바이러스가 퍼진 뒤의 모습은 아래와 같아진다.

 2 1 0 0 1 1 2
 1 0 1 0 1 2 2
 0 1 1 0 1 2 2
 0 1 0 0 0 1 2
 0 0 0 0 0 1 1
 0 1 0 0 0 0 0
 0 1 0 0 0 0 0
 벽을 3개 세운 뒤, 바이러스가 퍼질 수 없는 곳을 안전 영역이라고 한다. 위의 지도에서 안전 영역의 크기는 27이다.

 연구소의 지도가 주어졌을 때 얻을 수 있는 안전 영역 크기의 최댓값을 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 지도의 세로 크기 N과 가로 크기 M이 주어진다. (3 ≤ N, M ≤ 8)

 둘째 줄부터 N개의 줄에 지도의 모양이 주어진다. 0은 빈 칸, 1은 벽, 2는 바이러스가 있는 위치이다. 2의 개수는 2보다 크거나 같고, 10보다 작거나 같은 자연수이다.

 빈 칸의 개수는 3개 이상이다.

 출력
 첫째 줄에 얻을 수 있는 안전 영역의 최대 크기를 출력한다.

 예제 입력 1
 7 7
 2 0 0 0 1 1 0
 0 0 1 0 1 2 0
 0 1 1 0 1 0 0
 0 1 0 0 0 0 0
 0 0 0 0 0 1 1
 0 1 0 0 0 0 0
 0 1 0 0 0 0 0
 예제 출력 1
 27
 예제 입력 2
 4 6
 0 0 0 0 0 0
 1 0 0 0 0 2
 1 1 1 0 0 2
 0 0 0 0 0 2
 예제 출력 2
 9
 예제 입력 3
 8 8
 2 0 0 0 0 0 0 2
 2 0 0 0 0 0 0 2
 2 0 0 0 0 0 0 2
 2 0 0 0 0 0 0 2
 2 0 0 0 0 0 0 2
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 예제 출력 3
 3
 */

import Foundation

func solution(){
    var NM = readLine()!.split(separator: " ").map{Int(String($0))!}
    var N = NM[0]
    var M = NM[1]
    
    var dir = [
        [1,0],
        [0,1],
        [-1, 0],
        [0, -1]
    ]
    
    var matrix = [[Int]]()
    var blankArr = [[Int]]()
    var virusArr = [[Int]]()
    var maximum = 0
    for i in 0..<N{
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        matrix.append(input)
        for j in 0..<M{
            if input[j] == 0{
                blankArr.append([i, j])
            }else if input[j] == 2{
                virusArr.append([i, j])
            }
        }
    }
  
    
    //num번째 기둥 세우기
    func rec_func(num : Int, pre : Int){
        if num == 4{
            bfs(arr: matrix)
        }else{
            for cand in pre..<blankArr.count{
                let r = blankArr[cand][0]
                let c = blankArr[cand][1]
                matrix[r][c] = 1
                rec_func(num : num + 1, pre : cand + 1)
                matrix[r][c] = 0
            }
        }
    }
    
    func bfs(arr : [[Int]]){
        var adjList = arr
        var queue = virusArr
        var pointer = 0
        while(pointer < queue.count){
            var now = queue[pointer]
            for i in 0...3{
                var nr = now[0] + dir[i][0]
                var nc = now[1] + dir[i][1]
                if nr < 0 || nr >= N || nc < 0 || nc >= M{ continue }
                if adjList[nr][nc] != 0 { continue }
                queue.append([nr, nc])
                adjList[nr][nc] = 2
            }
            pointer += 1
          
        }
        var emptyCount = 0
        for i in 0..<N{
            for j in 0..<M{
                if adjList[i][j] == 0{
                    emptyCount += 1
                }
            }
        }
        
        maximum = max(maximum, emptyCount)
        return
    }
    
   
    rec_func(num: 1, pre: 0)
    print(maximum)
}
solution()
