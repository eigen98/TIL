//
//  main.swift
//  BJ21611
//
//  Created by JeongMin Ko on 2023/05/08.
//

/*
 7 1
 0 0 0 0 0 0 0
 3 2 1 3 2 3 0
 2 1 2 1 2 1 0
 2 1 1 0 2 1 1
 3 3 2 3 2 1 2
 3 3 3 1 3 3 2
 2 3 2 2 3 2 3
 2 2
 */
import Foundation

var N = 0
var M = 0
var matrix = [[Int]]()
var bz = [[Int]]()
//1 2 3 4
var dir = [ [-1,0], [1,0],[0, -1], [0,1] ]

var answer =  [0,0,0]

func solution(){
    let inputNM = readLine()!.split(separator: " ").map{ Int(String($0))!}
    N = inputNM[0]
    M = inputNM[1]
    
    for _ in 0..<N{
        let arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
        matrix.append(arr)
    }
    
    for _ in 0..<M{
        let arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
        bz.append(arr)
    }
    
    for idx in 0..<M{
        var d = bz[idx][0]
        var s = bz[idx][1]
        blizzard(d: d, s: s)
        moveBid()
    }
    //blizzard(d: 2, s: 2)
    
//    for i in 1...matrix.count{
//        print(matrix[i - 1])
//    }
    
    //moveBid()
    print("무빙 결과 : ")
    for i in 1...matrix.count{
        print(matrix[i - 1])
    }
    
    
    print(answer[0] + 2 * answer[1] + 3 * answer[2])
}

solution()

//블리자드 d : 방향, s : 거리
//0으로 만들기
func blizzard(d : Int, s : Int){
    var row = (N + 1) / 2 - 1
    var col = (N + 1) / 2 - 1
    var nr = row
    var nc = col
    
    for _ in 1...s{
        nr += dir[d - 1][0]
        nc += dir[d - 1][1]
        matrix[nr][nc] = 0
    }
//    print("블리자드 결과 : ")
//    for i in 1...matrix.count{
//        print(matrix[i - 1])
//    }
}
//좌측으로
//거리 1칸부터 2번씩 반복후 +1 증가.
//왼쪽 아래 오른쪽 위
//거리가 N과 같아지는 시점 N - 1 까지만 검사 후 종료

//순회하면서 0을 제외한 구슬만 Queue에 담은 후
//다시 순회하면서 Queue 구슬 담기.
func moveBid(){
    var queue = [Int]()
    let moveDir = [[0, -1], [1,-0], [0,1], [-1, 0]]
    var len = 1
    var cornerCount = 0
    
    let row = (N + 1) / 2 - 1
    let col = (N + 1) / 2 - 1
    var nr = row
    var nc = col
    
    //순회하면서 0을 제외한 구슬만 Queue에 담는다.
    while(len < N){
        for _ in 1...len{
            nr += moveDir[cornerCount % 4 ][0]
            nc += moveDir[cornerCount % 4 ][1]
            if matrix[nr][nc] != 0{
                queue.append( matrix[nr][nc])
            }
        }
        cornerCount += 1
        for _ in 1...len{
            nr += moveDir[cornerCount % 4 ][0]
            nc += moveDir[cornerCount % 4 ][1]
            if matrix[nr][nc] != 0{
                queue.append( matrix[nr][nc])
            }
        }
        len += 1
        cornerCount += 1
    }
    
    //마지막 구슬 담기
    len -= 1
    for _ in 1...len{
        nr += moveDir[cornerCount % 4 ][0]
        nc += moveDir[cornerCount % 4 ][1]
        if matrix[nr][nc] != 0{
            queue.append( matrix[nr][nc])
        }
    }
    //print("업데이트 전 \(queue)")
    queue = bidBomb(que: queue)
    //print("업데이트 중 \(queue)")
    queue = groupingAB(que: queue)
    //print("업데이트 후 \(queue)")
    
    //Queue구슬을 순회하면서 다시 배열한다.
    len = 1
    cornerCount = 0
    nr = row
    nc = col
    var bidIdx = 0
    
    while(len < N){
        for _ in 1...len{
            nr += moveDir[cornerCount % 4 ][0]
            nc += moveDir[cornerCount % 4 ][1]
            if bidIdx >= queue.count{
                matrix[nr][nc] = 0
            }else{
                matrix[nr][nc] = queue[bidIdx]
                bidIdx += 1
            }
            
        }
        cornerCount += 1
        for _ in 1...len{
            nr += moveDir[cornerCount % 4 ][0]
            nc += moveDir[cornerCount % 4 ][1]
            if bidIdx >= queue.count{
                matrix[nr][nc] = 0
            }else{
                matrix[nr][nc] = queue[bidIdx]
                bidIdx += 1
            }
        }
        len += 1
        cornerCount += 1
    }
    
    //마지막 구슬 담기
    len -= 1
    for _ in 1...len{
        nr += moveDir[cornerCount % 4 ][0]
        nc += moveDir[cornerCount % 4 ][1]
        if bidIdx >= queue.count{
            matrix[nr][nc] = 0
        }else{
            matrix[nr][nc] = queue[bidIdx]
            bidIdx += 1
        }
    }
    
    
    
}


func bidBomb(que : [Int]) -> [Int]{
    var isOver = true
    var queue = que
    var subQueue = [Int]()
    var preBid = 0
    var bidCount = 0
    var resultQueue = [Int]()
    
    while(isOver){
        resultQueue = []
        isOver = false
        for idx in 0..<queue.count{
            let nowBid = queue[idx]
            if preBid == nowBid{
                bidCount += 1
                subQueue.append(nowBid)
            }
            else{
                
                //하나라도 터진다면 한 번 더 검사.
                if bidCount >= 4{
                    answer[preBid - 1 ] += bidCount
                    isOver = true
                    subQueue = [Int]()
                    bidCount = 1
                }
                
                if !subQueue.isEmpty{
                    resultQueue.append(contentsOf: subQueue)
                }
                subQueue = [Int]()
                subQueue.append(nowBid)
                bidCount = 1
            }
           
            
            preBid = nowBid
            
        }
        
        if !subQueue.isEmpty{
            resultQueue.append(contentsOf: subQueue)
            subQueue = [Int]()
        }
        queue = resultQueue
        
    }
    
    
    return resultQueue
    
}

func groupingAB(que : [Int]) -> [Int]{
    var queue = que
    var preBid = 0
    var bidCount = 1
    var resultQueue = [Int]()
    
    for idx in 0..<queue.count{
        var nowBid = queue[idx]
        if preBid == nowBid{
            bidCount += 1
        }else{
            if preBid != 0{
                resultQueue.append(contentsOf: [bidCount,preBid])
                
                bidCount = 1
            }
           
            
        }
        
        
        preBid = nowBid
    }
    //마지막
    resultQueue.append(contentsOf: [bidCount,preBid])
    if resultQueue.count > (N * N - 1){
        var gap = resultQueue.count - (N * N - 1)
        resultQueue.removeLast(gap)
    }
   
    return resultQueue
}
