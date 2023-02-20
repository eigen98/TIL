//
//  main.swift
//  BJ3190
//
//  Created by JeongMin Ko on 2023/02/20.
//
/*
 문제
  'Dummy' 라는 도스게임이 있다. 이 게임에는 뱀이 나와서 기어다니는데, 사과를 먹으면 뱀 길이가 늘어난다. 뱀이 이리저리 기어다니다가 벽 또는 자기자신의 몸과 부딪히면 게임이 끝난다.

 게임은 NxN 정사각 보드위에서 진행되고, 몇몇 칸에는 사과가 놓여져 있다. 보드의 상하좌우 끝에 벽이 있다. 게임이 시작할때 뱀은 맨위 맨좌측에 위치하고 뱀의 길이는 1 이다. 뱀은 처음에 오른쪽을 향한다.

 뱀은 매 초마다 이동을 하는데 다음과 같은 규칙을 따른다.

 먼저 뱀은 몸길이를 늘려 머리를 다음칸에 위치시킨다.
 만약 이동한 칸에 사과가 있다면, 그 칸에 있던 사과가 없어지고 꼬리는 움직이지 않는다.
 만약 이동한 칸에 사과가 없다면, 몸길이를 줄여서 꼬리가 위치한 칸을 비워준다. 즉, 몸길이는 변하지 않는다.
 사과의 위치와 뱀의 이동경로가 주어질 때 이 게임이 몇 초에 끝나는지 계산하라.

 입력
 첫째 줄에 보드의 크기 N이 주어진다. (2 ≤ N ≤ 100) 다음 줄에 사과의 개수 K가 주어진다. (0 ≤ K ≤ 100)

 다음 K개의 줄에는 사과의 위치가 주어지는데, 첫 번째 정수는 행, 두 번째 정수는 열 위치를 의미한다. 사과의 위치는 모두 다르며, 맨 위 맨 좌측 (1행 1열) 에는 사과가 없다.

 다음 줄에는 뱀의 방향 변환 횟수 L 이 주어진다. (1 ≤ L ≤ 100)

 다음 L개의 줄에는 뱀의 방향 변환 정보가 주어지는데,  정수 X와 문자 C로 이루어져 있으며. 게임 시작 시간으로부터 X초가 끝난 뒤에 왼쪽(C가 'L') 또는 오른쪽(C가 'D')로 90도 방향을 회전시킨다는 뜻이다. X는 10,000 이하의 양의 정수이며, 방향 전환 정보는 X가 증가하는 순으로 주어진다.

 출력
 첫째 줄에 게임이 몇 초에 끝나는지 출력한다.

 예제 입력 1
 6
 3
 3 4
 2 5
 5 3
 3
 3 D
 15 L
 17 D
 예제 출력 1
 9
 예제 입력 2
 10
 4
 1 2
 1 3
 1 4
 1 5
 4
 8 D
 10 D
 11 D
 13 L
 예제 출력 2
 21
 예제 입력 3
 10
 5
 1 5
 1 3
 1 2
 1 6
 1 7
 4
 8 D
 10 D
 11 D
 13 L
 예제 출력 3
 13
 */

import Foundation

func solution(){
    let N = Int(readLine()!)! //보드 크기
    let K = Int(readLine()!)! //사과 개수
    //0행 0열 깍두기
    var arr = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)
    
    let dir = [
        [0,1], //처음은 오른쪽 0
        [1,0], //아래 1
        [0,-1], //왼쪽 2
        [-1,0] //위쪽 3
    ]
    //MARK: 꼬리
    var tailQueue = [[Int]]()
    //tailQueue.append([1,1])
    var tailPointer = 0
    if K > 0{
        for i in 1...K{
            var RC = readLine()!.split(separator: " ").map{Int(String($0))!}
            var r = RC[0]
            var c = RC[1]
            arr[r][c] = -1 //사과 : -1
        }
    }
   
    
    var order = [[String]]()
    var orderPointer = 0
    var count = 0
    let L = Int(readLine()!)! //변환 수
    
    for i in 1...L{
        let XC = readLine()!.split(separator: " ").map{String($0)}
        let x = XC[0] //x초 후
        let c = XC[1] //방향 왼쪽(C가 'L') 또는 오른쪽(C가 'D')
        order.append([x, c]) //몇초 후, 어느 방향인지
    }
    
    //행, 열, 초, 꼬리
    func dfs(row :Int, col : Int, second : Int, direct : Int){
        count = second
        arr[row][col] = 1
        tailQueue.append([row, col])
        
        let nextOrder = Int(order[orderPointer][0]) ?? 0
        
        if second == nextOrder{
            var nd = direct
            //왼쪽
            if order[orderPointer][1] == "L"{
                if nd == 0 { nd = 3} else{ nd -= 1 }
            //오른쪽
            }else{
                nd = abs(nd + 1) % 4
            }
            
            //방향 전환
            let nr = row + dir[nd][0]
            let nc = col + dir[nd][1]
            
            let tr = tailQueue[tailPointer][0]
            let tc = tailQueue[tailPointer][1]
            
            if nr <= 0 || nr > N || nc <= 0 || nc > N{
                count += 1
                return } //벽을 만남
            if arr[nr][nc] == 1{
                //if tr != nr && tc != nc{
                    count += 1
                    return
                //}
            } //자신의 몸을 만남
            
            //사과를 안 만났을때 꼬리 초기화
            if arr[nr][nc] == 0{
                
                arr[tr][tc] = 0
                tailPointer += 1
            }
           
            
            if orderPointer < order.count - 1{
                orderPointer += 1
            }
            
            dfs(row: nr, col: nc, second: second + 1, direct: nd)
            
            
            
        }else{
            //직진
           
            let nr = row + dir[direct][0]
            let nc = col + dir[direct][1]
            let tr = tailQueue[tailPointer][0]
            let tc = tailQueue[tailPointer][1]
            
            if nr <= 0 || nr > N || nc <= 0 || nc > N{
                count += 1
                return } //벽을 만남
            if arr[nr][nc] == 1 {
                count += 1
                return
                
            } //자신의 몸을 만남
            
            //사과를 안 만났을때 꼬리 초기화
            if arr[nr][nc] == 0{
                
                arr[tr][tc] = 0
                tailPointer += 1
            }
            
            dfs(row: nr, col: nc, second: second + 1, direct: direct)
        }
    }
    
    //처음 방향 0, 1행1열 시작, 0초
    dfs(row: 1, col: 1, second: 0, direct: 0)
    print(count)
}

solution()
