//
//  main.swift
//  BJ13460Retry
//
//  Created by JeongMin Ko on 2023/04/14.
//
/*
 문제
 스타트링크에서 판매하는 어린이용 장난감 중에서 가장 인기가 많은 제품은 구슬 탈출이다. 구슬 탈출은 직사각형 보드에 빨간 구슬과 파란 구슬을 하나씩 넣은 다음, 빨간 구슬을 구멍을 통해 빼내는 게임이다.

 보드의 세로 크기는 N, 가로 크기는 M이고, 편의상 1×1크기의 칸으로 나누어져 있다. 가장 바깥 행과 열은 모두 막혀져 있고, 보드에는 구멍이 하나 있다. 빨간 구슬과 파란 구슬의 크기는 보드에서 1×1크기의 칸을 가득 채우는 사이즈이고, 각각 하나씩 들어가 있다. 게임의 목표는 빨간 구슬을 구멍을 통해서 빼내는 것이다. 이때, 파란 구슬이 구멍에 들어가면 안 된다.

 이때, 구슬을 손으로 건드릴 수는 없고, 중력을 이용해서 이리 저리 굴려야 한다. 왼쪽으로 기울이기, 오른쪽으로 기울이기, 위쪽으로 기울이기, 아래쪽으로 기울이기와 같은 네 가지 동작이 가능하다.

 각각의 동작에서 공은 동시에 움직인다. 빨간 구슬이 구멍에 빠지면 성공이지만, 파란 구슬이 구멍에 빠지면 실패이다. 빨간 구슬과 파란 구슬이 동시에 구멍에 빠져도 실패이다. 빨간 구슬과 파란 구슬은 동시에 같은 칸에 있을 수 없다. 또, 빨간 구슬과 파란 구슬의 크기는 한 칸을 모두 차지한다. 기울이는 동작을 그만하는 것은 더 이상 구슬이 움직이지 않을 때 까지이다.

 보드의 상태가 주어졌을 때, 최소 몇 번 만에 빨간 구슬을 구멍을 통해 빼낼 수 있는지 구하는 프로그램을 작성하시오.

 입력
 첫 번째 줄에는 보드의 세로, 가로 크기를 의미하는 두 정수 N, M (3 ≤ N, M ≤ 10)이 주어진다. 다음 N개의 줄에 보드의 모양을 나타내는 길이 M의 문자열이 주어진다. 이 문자열은 '.', '#', 'O', 'R', 'B' 로 이루어져 있다. '.'은 빈 칸을 의미하고, '#'은 공이 이동할 수 없는 장애물 또는 벽을 의미하며, 'O'는 구멍의 위치를 의미한다. 'R'은 빨간 구슬의 위치, 'B'는 파란 구슬의 위치이다.

 입력되는 모든 보드의 가장자리에는 모두 '#'이 있다. 구멍의 개수는 한 개 이며, 빨간 구슬과 파란 구슬은 항상 1개가 주어진다.

 출력
 최소 몇 번 만에 빨간 구슬을 구멍을 통해 빼낼 수 있는지 출력한다. 만약, 10번 이하로 움직여서 빨간 구슬을 구멍을 통해 빼낼 수 없으면 -1을 출력한다.

 예제 입력 1
 5 5
 #####
 #..B#
 #.#.#
 #RO.#
 #####
 예제 출력 1
 1
 예제 입력 2
 7 7
 #######
 #...RB#
 #.#####
 #.....#
 #####.#
 #O....#
 #######
 예제 출력 2
 5
 예제 입력 3
 7 7
 #######
 #..R#B#
 #.#####
 #.....#
 #####.#
 #O....#
 #######
 예제 출력 3
 5
 예제 입력 4
 10 10
 ##########
 #R#...##B#
 #...#.##.#
 #####.##.#
 #......#.#
 #.######.#
 #.#....#.#
 #.#.#.#..#
 #...#.O#.#
 ##########
 예제 출력 4
 -1
 예제 입력 5
 3 7
 #######
 #R.O.B#
 #######
 예제 출력 5
 1
 예제 입력 6
 10 10
 ##########
 #R#...##B#
 #...#.##.#
 #####.##.#
 #......#.#
 #.######.#
 #.#....#.#
 #.#.##...#
 #O..#....#
 ##########
 예제 출력 6
 7
 예제 입력 7
 3 10
 ##########
 #.O....RB#
 ##########
 예제 출력 7
 -1
 */
import Foundation

func solution(){
    let lengthInput = readLine()!.split(separator: " ").map{ Int(String($0))!}
    let N = lengthInput[0]
    let M = lengthInput[1]
    var arr = [[String]]()
    var debugArr = [Int]()
//    [빨,파][N][M](x)
    //[빨,파][상하좌우][N][M]
    var visited = [[[[Bool]]]](repeating: [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false,
                                                                                           count: M),
                                                                   count: N),
                                                 count: 4),
                             count: 2)
    
    //[좌, 우, 상, 하]
    let dir = [ [0, -1], [0,1], [-1, 0], [1, 0] ]
    
    var bluePos = [0,0]
    var redPos = [0,0]
    var destination = [0,0]
    var totalCount = Int.max
    var isPossible = false
    
    //입력
    for i in 0..<N{
        let rowInput = readLine()!.map{ String($0)}
        //각 포지션 탐색
        for j in 0..<M{
            if rowInput[j] == "R"{ redPos = [i, j] }
            if rowInput[j] == "B"{ bluePos = [i, j] }
            if rowInput[j] == "O"{ destination = [i, j] }
        }
        arr.append(rowInput)
    }
    
    func rec_func(count: Int, blueFirst : [Int], redFirst : [Int]){
        
        print("\(count) : blue : \(blueFirst) ,red : \(redFirst)")
        if count > 10{
            return
        }
       
        
        
        //빨간공 도착
        if redFirst[0] == destination[0] && redFirst[1] == destination[1]{
            isPossible = true
            print("빨간공 도착, \(count)")
            totalCount = min(totalCount, count)
            return
        }
        
        //파란공 도착
        if blueFirst[0] == destination[0] && blueFirst[1] == destination[1]{
            return
        }
        
        
        
        //[상하좌우]
        //왼쪽
        var leftResult = leftMove(blueFirst: blueFirst, redFirst: redFirst)
        if !visited[0][0][leftResult.0[0]][leftResult.0[1]] ||
            !visited[1][0][leftResult.1[0]][leftResult.1[1]] {
            visited[0][0][leftResult.0[0]][leftResult.0[1]] = true
            visited[1][0][leftResult.1[0]][leftResult.1[1]] = true
            
            if leftResult.0 != blueFirst || leftResult.1 != redFirst{
                print("좌")
                rec_func(count: count + 1, blueFirst: leftResult.0, redFirst: leftResult.1)
            }
           

        }
        
        
        //오른쪽
        var rightResult = RightMove(blueFirst: blueFirst, redFirst: redFirst)
        
        if !visited[0][1][rightResult.0[0]][rightResult.0[1]] ||
            !visited[1][1][rightResult.1[0]][rightResult.1[1]] {
            visited[0][1][rightResult.0[0]][rightResult.0[1]] = true
            visited[1][1][rightResult.1[0]][rightResult.1[1]] = true
           
            if rightResult.0 != blueFirst || rightResult.1 != redFirst{
                print("우")
                rec_func(count: count + 1, blueFirst: rightResult.0, redFirst: rightResult.1)
            }
           
        }
        
        //위쪽
        var upResult = upMove(blueFirst: blueFirst, redFirst: redFirst)
        if !visited[0][2][upResult.0[0]][upResult.0[1]] ||
            !visited[1][2][upResult.1[0]][upResult.1[1]] {
            visited[0][2][upResult.0[0]][upResult.0[1]] = true
            visited[1][2][upResult.1[0]][upResult.1[1]] = true
            
            if upResult.0 != blueFirst || upResult.1 != redFirst{
                print("상")
                rec_func(count: count + 1, blueFirst: upResult.0, redFirst: upResult.1)
            }
            
            
        }
        
      
        
        //아래쪽
        var downResult = downMove(blueFirst: blueFirst, redFirst: redFirst)
        if !visited[0][3][downResult.0[0]][downResult.0[1]] ||
            !visited[1][3][downResult.1[0]][downResult.1[1]] {
            visited[0][3][downResult.0[0]][downResult.0[1]] = true
            visited[1][3][downResult.1[0]][downResult.1[1]] = true
            //print("down")
           
            if downResult.0 != blueFirst || downResult.1 != redFirst{
                print("하")
                rec_func(count: count + 1, blueFirst: downResult.0, redFirst: downResult.1)
            }
            
        }
       
        
        
    }
            
    rec_func(count: 0, blueFirst: bluePos, redFirst: redPos)
    
    if isPossible{
        print(totalCount - 1)
    }else{
        print(-1)
    }
   
    
    
    //왼쪽 이동 (둘 중 col이 작은 것 먼저 이동) -> [파랑좌표, 빨강좌표]
    func leftMove(blueFirst : [Int], redFirst : [Int]) -> ([Int],[Int]){
       
        var nowBlueRow = blueFirst[1]
        var nowRedRow = redFirst[1]
        
        var blueResult = [0,0]
        var redResult = [0,0]
        
        if nowBlueRow < nowRedRow{ //파란공 먼저
            blueResult = move(directIdx: 0, position: blueFirst)
            redResult = move(directIdx: 0, position: redFirst)
        }else { //빨간공 먼저
            redResult = move(directIdx: 0, position: redFirst)
            blueResult = move(directIdx: 0, position: blueFirst)
          
        }
        return (blueResult, redResult)
    }
    
    //오른쪽 이동 (둘 중 col이 큰 것 먼저 이동)
    func RightMove(blueFirst : [Int], redFirst : [Int]) -> ([Int],[Int]){
      
        var nowBlueRow = blueFirst[1]
        var nowRedRow = redFirst[1]
        
        var blueResult = [0,0]
        var redResult = [0,0]
        
        if nowBlueRow > nowRedRow{ //파란공 먼저
            blueResult = move(directIdx: 1, position: blueFirst)
            redResult = move(directIdx: 1, position: redFirst)
        }else { //빨간공 먼저
            redResult = move(directIdx: 1, position: redFirst)
            blueResult =  move(directIdx: 1, position: blueFirst)
          
        }
        return (blueResult, redResult)
    }
    
    
    //위쪽 이동 (둘 중 row가 작은 것 먼저 이동)
    func upMove(blueFirst : [Int], redFirst : [Int]) -> ([Int],[Int]){
        
        var nowBlueRow = blueFirst[0]
        var nowRedRow = redFirst[0]
        
        var blueResult = [0,0]
        var redResult = [0,0]
        
        if nowBlueRow < nowRedRow{ //파란공 먼저
            blueResult = move(directIdx: 2, position: blueFirst)
            redResult = move(directIdx: 2, position: redFirst)
        }else { //빨간공 먼저
            redResult = move(directIdx: 2, position: redFirst)
            blueResult = move(directIdx: 2, position: blueFirst)
          
        }
        return (blueResult, redResult)
    }
    
    //아래쪽 이동 (둘 중 row가 큰 것 먼저 이동)
    func downMove(blueFirst : [Int], redFirst : [Int]) -> ([Int],[Int]){
       
        let nowBlueRow = blueFirst[0]
        let nowRedRow = redFirst[0]
        
        var blueResult = [0,0]
        var redResult = [0,0]
        
        if nowBlueRow > nowRedRow{ //파란공 먼저
            blueResult = move(directIdx: 3, position: blueFirst)
            redResult = move(directIdx: 3, position: redFirst)
        }else { //빨간공 먼저
            redResult = move(directIdx: 3, position: redFirst)
            blueResult = move(directIdx: 3, position: blueFirst)
          
        }
        return (blueResult, redResult)
    }
    
    
    
    
    
    
    
    
    //[좌, 우, 상, 하], [row, col]
    func move(directIdx : Int, position : [Int]) -> [Int] {
        var row = position[0]
        var col = position[1]
        
        var ballType = arr[row][col] //R or B, 마지막에 할당. 위치갱신
        arr[row][col] = "."
        
        var nr = row// + dir[directIdx][0]
        var nc = col// + dir[directIdx][1]
        
        //빈공간이면 반복
        while(arr[nr][nc] == "."){
            nr += dir[directIdx][0]
            nc += dir[directIdx][1]
            //탈출 구멍인지 check
            if destination[0] == nr && destination[1] == nc{
                print("도착")
                if ballType == "R"{isPossible = true}
                //if ballType == "B"{ isPossible = false}
                arr[nr][nc] = ballType
                return [nr, nc]
            }
        }
        
        
        nr -= dir[directIdx][0]
        nc -= dir[directIdx][1]
        
        
        arr[nr][nc] = ballType //위치 갱신
//        if ballType == "R"{ redPos = [nr, nc]  }
//        if ballType == "B"{ bluePos = [nr, nc] }
        return [nr, nc]
        
    }
    
}

solution()
