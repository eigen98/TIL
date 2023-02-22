//
//  main.swift
//  BJ14890
//
//  Created by JeongMin Ko on 2023/02/22.
//
/*
 문제
 크기가 N×N인 지도가 있다. 지도의 각 칸에는 그 곳의 높이가 적혀져 있다.

 오늘은 이 지도에서 지나갈 수 있는 길이 몇 개 있는지 알아보려고 한다. 길이란 한 행 또는 한 열 전부를 나타내며, 한쪽 끝에서 다른쪽 끝까지 지나가는 것이다.

 다음과 같은 N=6인 경우 지도를 살펴보자.



 이때, 길은 총 2N개가 있으며, 아래와 같다.



 길을 지나갈 수 있으려면 길에 속한 모든 칸의 높이가 모두 같아야 한다. 또는, 경사로를 놓아서 지나갈 수 있는 길을 만들 수 있다. 경사로는 높이가 항상 1이며, 길이는 L이다. 또, 개수는 매우 많아 부족할 일이 없다. 경사로는 낮은 칸과 높은 칸을 연결하며, 아래와 같은 조건을 만족해야한다.

 경사로는 낮은 칸에 놓으며, L개의 연속된 칸에 경사로의 바닥이 모두 접해야 한다.
 낮은 칸과 높은 칸의 높이 차이는 1이어야 한다.
 경사로를 놓을 낮은 칸의 높이는 모두 같아야 하고, L개의 칸이 연속되어 있어야 한다.
 아래와 같은 경우에는 경사로를 놓을 수 없다.

 경사로를 놓은 곳에 또 경사로를 놓는 경우
 낮은 칸과 높은 칸의 높이 차이가 1이 아닌 경우
 낮은 지점의 칸의 높이가 모두 같지 않거나, L개가 연속되지 않은 경우
 경사로를 놓다가 범위를 벗어나는 경우
 L = 2인 경우에 경사로를 놓을 수 있는 경우를 그림으로 나타내면 아래와 같다.



 경사로를 놓을 수 없는 경우는 아래와 같다.



 위의 그림의 가장 왼쪽부터 1번, 2번, 3번, 4번 예제라고 했을 때, 1번은 높이 차이가 1이 아니라서, 2번은 경사로를 바닥과 접하게 놓지 않아서, 3번은 겹쳐서 놓아서, 4번은 기울이게 놓아서 불가능한 경우이다.

 가장 위에 주어진 그림 예의 경우에 지나갈 수 있는 길은 파란색으로, 지나갈 수 없는 길은 빨간색으로 표시되어 있으며, 아래와 같다. 경사로의 길이 L = 2이다.



 지도가 주어졌을 때, 지나갈 수 있는 길의 개수를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 N (2 ≤ N ≤ 100)과 L (1 ≤ L ≤ N)이 주어진다. 둘째 줄부터 N개의 줄에 지도가 주어진다. 각 칸의 높이는 10보다 작거나 같은 자연수이다.

 출력
 첫째 줄에 지나갈 수 있는 길의 개수를 출력한다.

 예제 입력 1
 6 2
 3 3 3 3 3 3
 2 3 3 3 3 3
 2 2 2 3 2 3
 1 1 1 2 2 2
 1 1 1 3 3 1
 1 1 2 3 3 2
 예제 출력 1
 3
 예제 입력 2
 6 2
 3 2 1 1 2 3
 3 2 2 1 2 3
 3 2 2 2 3 3
 3 3 3 3 3 3
 3 3 3 3 2 2
 3 3 3 3 2 2
 예제 출력 2
 7
 예제 입력 3
 6 3
 3 2 1 1 2 3
 3 2 2 1 2 3
 3 2 2 2 3 3
 3 3 3 3 3 3
 3 3 3 3 2 2
 3 3 3 3 2 2
 예제 출력 3
 3
 예제 입력 4
 6 1
 3 2 1 1 2 3
 3 2 2 1 2 3
 3 2 2 2 3 3
 3 3 3 3 3 3
 3 3 3 3 2 2
 3 3 3 3 2 2
 예제 출력 4
 11
 */
import Foundation
func solution(){
    var NL = readLine()!.split(separator: " ").map{Int(String($0))!}
    var N = NL[0]
    var L = NL[1]
    
    var arr = [[Int]]()
    for _ in 1...N{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        arr.append(input)
    }
    
    var visited = [Bool](repeating: false, count: N)
    
    var horiCount = 0
    var vertCount = 0
    //가로길 탐색
 
    for i in 0..<N{
        //차이가 1난다
        //경사로 길이만큼 이동한다. (경사로 설치모드)

        visited = [Bool](repeating: false, count: N)
        var pointer = 0
        var pre =  arr[i][0]
        while(pointer < N && pointer >= 0){
            let now = arr[i][pointer]
            if pre == now{
                pointer += 1
                pre = now
                continue
            }
            //오르막
            if now - pre == 1{
                //경사로 설치 가능 여부 확인
                var length = 0
                //필요 경사로 만큼 이동
                for j in stride(from: pointer-1, through: pointer-L, by: -1){
                    if j < 0{
                        pointer = -1
                        break }
                    if pre == arr[i][j] && visited[j] == false{
                        length += 1
                        visited[j] = true
                    }
                }
                if length != L { break }
                pre = now
            }
            //내리막
            else if now - pre == -1{
                //경사로 설치 가능 여부 확인
                var length = 1
                visited[pointer] = true
                //필요 경사로 만큼 이동
                for j in stride(from: pointer+1, through: pointer + L - 1, by: 1){
                    if j >= N{
                        pointer = -10000
                        break }
                    if now == arr[i][j] && visited[j] == false{
                        length += 1
                        visited[j] = true
                    }
                }
                if length != L { break }
                //경사로 설치 가능하다면
                pre = arr[i][pointer + L - 1]
                pointer += L
                
                continue
            }else{
                break
            }
            pointer += 1
            
        }
        if pointer >= N {
            print("\(i)행")
            horiCount += 1}
        
        
    }
    //세로길 탐색
    for i in 0..<N{
        //차이가 1난다
        //경사로 길이만큼 이동한다. (경사로 설치모드)
        //
        visited = [Bool](repeating: false, count: N)
        var pointer = 0
        var pre =  arr[0][i]
        while(pointer < N && pointer >= 0){
            let now = arr[pointer][i]
            if pre == now{
                pointer += 1
                pre = now
                continue
            }
            //오르막
            if now - pre == 1{
                //경사로 설치 가능 여부 확인
                var length = 0
                //필요 경사로 만큼 이동
                for j in stride(from: pointer-1, through: pointer-L, by: -1){
                    if j < 0{
                        pointer = -2
                        break }
                    if pre == arr[j][i] && visited[j] == false{
                        length += 1
                        visited[j] = true
                    }
                }
                if length != L { break }
                pre = now
            }
            //내리막
            else if now - pre == -1{
                //경사로 설치 가능 여부 확인
                var length = 1
                visited[pointer] = true
                //필요 경사로 만큼 이동
                for j in stride(from: pointer+1, through: pointer + L - 1, by: 1){
                    if j >= N{
                        pointer = -20000
                        break }
                    if now == arr[j][i] && visited[j] == false{
                        length += 1
                        visited[j] = true
                    }
                }
                if length != L { break }
                pre = arr[pointer + L - 1][i]
                pointer += L
                
                continue
            }
            else{
                break
            }
            pointer += 1
            
        }
        if pointer >= N {
            print("\(i)열")
            vertCount += 1}
        
        
    }
    
    print(vertCount + horiCount)
    
    print("가로 :  \(horiCount), 세로 : \(vertCount)")
}

solution()
