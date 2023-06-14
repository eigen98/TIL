//
//  main.swift
//  BJ2615
//
//  Created by JeongMin Ko on 2023/06/05.
//

/*
 입력
 19줄에 각 줄마다 19개의 숫자로 표현되는데, 검은 바둑알은 1, 흰 바둑알은 2, 알이 놓이지 않는 자리는 0으로 표시되며, 숫자는 한 칸씩 띄어서 표시된다.

 출력
 첫줄에 검은색이 이겼을 경우에는 1을, 흰색이 이겼을 경우에는 2를, 아직 승부가 결정되지 않았을 경우에는 0을 출력한다. 검은색 또는 흰색이 이겼을 경우에는 둘째 줄에 연속된 다섯 개의 바둑알 중에서 가장 왼쪽에 있는 바둑알(연속된 다섯 개의 바둑알이 세로로 놓인 경우, 그 중 가장 위에 있는 것)의 가로줄 번호와, 세로줄 번호를 순서대로 출력한다.
 */
import Foundation
//
//var matrix = [[Int]]()
//var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 8),
//                                         count: 19),
//                       count: 19)
//var result = 0
//var maxCount = 0
////좌, 우, 상 , 하
////왼쪽위, 오른쪽아래
////오른쪽 위, 왼쪽 아래
//var dir = [ [0, -1], [0 ,1],
//            [-1,0], [1, 0],
//            [-1, -1], [1, 1],
//            [-1, 1],[1, -1] ]
//
//func solution(){
//    for _ in 1...19{
//        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
//        matrix.append(input)
//    }
//
//    for i in 0...18{
//        for j in 0...18{
//            if matrix[i][j] != 0{
//                for idx in 0...7{
//                    if !visited[i][j][idx]{
//                        visited[i][j][idx] = true
//                        dfs(r: i, c: j, direct: idx, stone: matrix[i][j])
//
//                    }
//                }
//            }
//
//        }
//    }
//    print(result)
//
//
//}
//
//func dfs(r : Int, c : Int, direct : Int, stone : Int) -> [Int]{
//
//    var width = 1 // 0 1
//    var height = 1 // 2 3
//    var crossLeft = 1 // 4 5
//    var crossRigth = 1 // 6 7
//
//    for idx in 0...7{
//        var nr = r + dir[idx][0]
//        var nc = c + dir[idx][1]
//
//        if nr < 0 || nr >= 19 || nc < 0 || nc >= 19{ continue }
//        if visited[nr][nc][idx] {continue}
//        if stone != matrix[nr][nc] { continue }
//
//
//        switch idx{
//            //좌우
//        case 0, 1:
//            visited[nr][nc][0] = true
//            visited[nr][nc][1] = true
//            var len = dfs(r: nr, c: nc, direct: idx, stone: stone)
//            width += len[0]
//
//            break
//            //상하
//        case 2, 3:
//            visited[nr][nc][2] = true
//            visited[nr][nc][3] = true
//            var len = dfs(r: nr, c: nc, direct: idx, stone: stone)
//            height += len[1]
//
//            break
//        case 4, 5:
//
//            visited[nr][nc][4] = true
//            visited[nr][nc][5] = true
//            var len = dfs(r: nr, c: nc, direct: idx, stone: stone)
//            crossLeft += len[2]
//
//            break
//
//        case 6, 7:
//            visited[nr][nc][6] = true
//            visited[nr][nc][7] = true
//            var len = dfs(r: nr, c: nc, direct: idx, stone: stone)
//            crossRigth += len[3]
//
//            break
//
//        default:
//            break
//        }
//    }
//
//    if width == 5 || height == 5 || crossLeft == 5 || crossRigth == 5{
//        print("돌 : \(stone)")
//        print("가로 : \(width)")
//        print("세로 : \(height)")
//        print("왼쪽 대각 : \(crossLeft)")
//        print("오른쪽 대각: \(crossRigth)")
//        print("r: \(r) c: \(c)")
//        result = stone
//    }
//
//    return [width, height, crossLeft, crossRigth]
//
//
//}
//
//
//
//solution()
import Foundation

var matrix = [[Int]]()
var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 8),
                                         count: 19),
                       count: 19)
var result = 0
var maxCount = 0
var dir = [ [0, -1], [0 ,1],
            [-1,0], [1, 0],
            [-1, -1], [1, 1],
            [-1, 1],[1, -1] ]

func solution(){
    for _ in 1...19{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        matrix.append(input)
    }
    
    for i in 0...18{
        for j in 0...18{
            if matrix[i][j] != 0{
                for idx in 0...7{
                    if !visited[i][j][idx]{
                        visited[i][j][idx] = true
                        dfs(r: i, c: j, direct: idx, stone: matrix[i][j])
                    }
                }
            }
        }
    }
    print(result)
}

func dfs(r : Int, c : Int, direct : Int, stone : Int) -> Int{
    
    var cnt = 1 
    
    let nr = r + dir[direct][0]
    let nc = c + dir[direct][1]
    
    if nr >= 0 && nr < 19 && nc >= 0 && nc < 19 {
        if !visited[nr][nc][direct] && stone == matrix[nr][nc] {
            visited[nr][nc][direct] = true
            cnt += dfs(r: nr, c: nc, direct: direct, stone: stone)
        }
    }
    
    if cnt == 5 {
        let rn = r - dir[direct][0]
        let cn = c - dir[direct][1]
        if rn < 0 || rn >= 19 || cn < 0 || cn >= 19 || matrix[rn][cn] != stone {
            result = stone
        }
    }
    
    return cnt
}

solution()
