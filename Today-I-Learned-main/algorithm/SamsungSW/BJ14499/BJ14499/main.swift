//
//  main.swift
//  BJ14499
//
//  Created by JeongMin Ko on 2023/02/21.
//
/*
 문제
 크기가 N×M인 지도가 존재한다. 지도의 오른쪽은 동쪽, 위쪽은 북쪽이다. 이 지도의 위에 주사위가 하나 놓여져 있으며, 주사위의 전개도는 아래와 같다. 지도의 좌표는 (r, c)로 나타내며, r는 북쪽으로부터 떨어진 칸의 개수, c는 서쪽으로부터 떨어진 칸의 개수이다.

   2
 4 1 3
   5
   6
 주사위는 지도 위에 윗 면이 1이고, 동쪽을 바라보는 방향이 3인 상태로 놓여져 있으며, 놓여져 있는 곳의 좌표는 (x, y) 이다. 가장 처음에 주사위에는 모든 면에 0이 적혀져 있다.

 지도의 각 칸에는 정수가 하나씩 쓰여져 있다. 주사위를 굴렸을 때, 이동한 칸에 쓰여 있는 수가 0이면, 주사위의 바닥면에 쓰여 있는 수가 칸에 복사된다. 0이 아닌 경우에는 칸에 쓰여 있는 수가 주사위의 바닥면으로 복사되며, 칸에 쓰여 있는 수는 0이 된다.

 주사위를 놓은 곳의 좌표와 이동시키는 명령이 주어졌을 때, 주사위가 이동했을 때 마다 상단에 쓰여 있는 값을 구하는 프로그램을 작성하시오.

 주사위는 지도의 바깥으로 이동시킬 수 없다. 만약 바깥으로 이동시키려고 하는 경우에는 해당 명령을 무시해야 하며, 출력도 하면 안 된다.

 입력
 첫째 줄에 지도의 세로 크기 N, 가로 크기 M (1 ≤ N, M ≤ 20), 주사위를 놓은 곳의 좌표 x, y(0 ≤ x ≤ N-1, 0 ≤ y ≤ M-1), 그리고 명령의 개수 K (1 ≤ K ≤ 1,000)가 주어진다.

 둘째 줄부터 N개의 줄에 지도에 쓰여 있는 수가 북쪽부터 남쪽으로, 각 줄은 서쪽부터 동쪽 순서대로 주어진다. 주사위를 놓은 칸에 쓰여 있는 수는 항상 0이다. 지도의 각 칸에 쓰여 있는 수는 10 미만의 자연수 또는 0이다.

 마지막 줄에는 이동하는 명령이 순서대로 주어진다. 동쪽은 1, 서쪽은 2, 북쪽은 3, 남쪽은 4로 주어진다.

 출력
 이동할 때마다 주사위의 윗 면에 쓰여 있는 수를 출력한다. 만약 바깥으로 이동시키려고 하는 경우에는 해당 명령을 무시해야 하며, 출력도 하면 안 된다.

 예제 입력 1
 4 2 0 0 8
 0 2
 3 4
 5 6
 7 8
 4 4 4 1 3 3 3 2
 예제 출력 1
 0
 0
 3
 0
 0
 8
 6
 3
 예제 입력 2
 3 3 1 1 9
 1 2 3
 4 0 5
 6 7 8
 1 3 2 2 4 4 1 1 3
 예제 출력 2
 0
 0
 0
 3
 0
 1
 0
 6
 0
 예제 입력 3
 2 2 0 0 16
 0 2
 3 4
 4 4 4 4 1 1 1 1 3 3 3 3 2 2 2 2
 예제 출력 3
 0
 0
 0
 0
 예제 입력 4
 3 3 0 0 16
 0 1 2
 3 4 5
 6 7 8
 4 4 1 1 3 3 2 2 4 4 1 1 3 3 2 2
 예제 출력 4
 0
 0
 0
 6
 0
 8
 0
 2
 0
 8
 0
 2
 0
 8
 0
 2
 */


/*
  2
4 1 3
  5
  6
 */
import Foundation
func solution(){
    
    let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var N = input[0] //세로길이
    var M = input[1] //가로길이
    var X = input[2] //주사위 좌표
    var Y = input[3] //주사위 좌표
    var K = input[4] //명령수
    
    var arr = [[Int]]()
    for i in 1...N{
        var arrInput = readLine()!.split(separator: " ").map{ Int(String($0))!}
        arr.append(arrInput)
    }
    
    var order = readLine()!.split(separator: " ").map{ Int(String($0))!}
    
    // 윗면 pointer 1이고, 동쪽을 바라보는 방향이 3인 상태로 놓여져 있으며, 가장 처음에 주사위에는 모든 면에 0이 적혀져 있다.
    // -> 바닥 pointer 6인 상태
    
    //주사위 이동 경로 -> 인접리스트 생성
    //각 방향 별 경로 배열 (동1, 서2, 북3, 남4)
    var dicePointer = [[Int]]()
    dicePointer.append([0]) // 0 깍두기
    dicePointer.append([1, 3, 4, 2, 5]) // 1 이 밑에 있을때 본인, 동, 서, 북, 남
    dicePointer.append([2, 3, 4, 6, 1]) // 2 이 밑에 있을때
    dicePointer.append([3, 6, 1, 2, 5]) // 3 이 밑에 있을때
    dicePointer.append([4, 1, 6, 2, 5]) // 4 이 밑에 있을때
    dicePointer.append([5, 3, 4, 1, 6]) // 5 이 밑에 있을때
    dicePointer.append([6, 4, 3, 5, 2]) // 6 이 밑에 있을때
    
    var encounter = [0, 6, 5, 4, 3, 2, 1]
    
    var diceNum = [0,0,0,0,0,0,0] // 0깍두기
    
    var bottom = 6
    
    var dir = [
        [0, 0],
        [0, 1],
        [0,-1],
        [-1,0],
        [1, 0]
    
    ]
    
    
    
    //row행 col열로 0번째
    func dfs(row : Int, col : Int, orderCount : Int, status : Bool){
        //상판 프린트
        
        let top = encounter[bottom]
        if status{
            //print("\(bottom) 건너편 \(top) 출력값 :")
            print(diceNum[top])
        }
       
        
        let arrNum = arr[row][col]
        if arrNum != 0 && status{
            //주사위에 복사
            //print("\(bottom)에 \(arr[row][col]) 복사")
            diceNum[bottom] = arr[row][col]
        }else if arrNum == 0 && status{
            //주사위를 바닥으로 복사
            arr[row][col] =  diceNum[bottom]
        }
        if orderCount >= order.count{
            return
        }
        //다음 명령
        var nextDir = order[orderCount]
        var nr = row + dir[nextDir][0]
        var nc = col + dir[nextDir][1]

        if nr < 0 || nr >= N || nc < 0 || nc >= N { //비정상
            dfs(row: row, col: col, orderCount: orderCount +  1, status: false)
        }else{ //정상
            var nextBottom = dicePointer[bottom][nextDir]
            bottom = nextBottom
            dfs(row: nr, col: nc, orderCount: orderCount + 1, status: true)
        }
        
    }
    
    dfs(row: Y, col: X, orderCount: 0, status: true)
    
    
    
}
solution()