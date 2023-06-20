//
//  main.swift
//  BJ23291
//
//  Created by JeongMin Ko on 2023/06/20.
//

import Foundation
var N = 0
var K = 0
var fishArr = [Int]()
//왼쪽, 위쪽
var dir = [[0,-1], [-1,0], [1,0], [-1,0]]

func solution(){
    var inputNum = readLine()!.split(separator: " ").map{Int(String($0))!}
    N = inputNum[0]
    K = inputNum[1]
    fishArr = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var idxArr = [[Int]]()
    for idx in 0..<fishArr.count{
        idxArr.append([idx, fishArr[idx]]) //idx, num
    }
    idxArr = idxArr.sorted(by: {
        if $0[1] != $1[1]{
            return $0[1] < $1[1]
        }else{
            return $0[0] < $1[0]
        }
    })
    var minimum = idxArr[0][1]
    
    for idx in 0..<fishArr.count{
        if minimum == idxArr[idx][1]{
            fishArr[idxArr[idx][0]] += 1
        }
    }
    
    var maxLen = Int(sqrt(Double(N)))
    if pow(Decimal(maxLen), 2) < Decimal(N){
        maxLen += 1
    }
    
    //한개는 미리 올려두고 시작.
    var pointer = 1
    var fly = [[Int]]()
    fly.append([fishArr[0]])
    var enable = true
    while(enable){
        var newFly = [[Int]]()
        
        
        for idx in 0..<fly[0].count{
            var buffer = [Int]()
            for r in 0..<fly.count{
                buffer.append(fly[r][idx])
            }
            
            buffer.append(fishArr[pointer])
            buffer.reverse()
            
            
            pointer += 1
            if buffer.count > fishArr.count - pointer{
                enable = false
                pointer -= fly.count
                break
            }else{
                newFly.append(buffer)
            }
            
        }
        if enable{
            fly = newFly
        }
        
    }
    var restArr = [Int]()
    
    for i in pointer..<fishArr.count{
        restArr.append(fishArr[i])
    }
    
    //물고기 수 조절
    var newFly = [[Int]](repeating: [Int](repeating: 0, count: fly[0].count), count: fly.count)
    var newRestArr = [Int](repeating: 0, count: restArr.count)
    
    for i in 0..<fly.count{
        for j in 0..<fly[0].count{
            for k in 0...1{
                let nr = i + dir[k][0]
                let nc = j + dir[k][1]
                if nr < 0 || nc < 0 || nc >= fly[0].count {continue}
                
                let gap = abs(fly[i][j] - fly[nr][nc])
                let d = gap / 5
                
                if d > 0{
                    //이동 -> 작은쪽으로
                    if fly[i][j] > fly[nr][nc]{
                        newFly[nr][nc] += d
                        newFly[i][j] -= d
                    }else{
                        newFly[nr][nc] -= d
                        newFly[i][j] += d
                    }
                }
                
            }
        }
    }
    
    for i in 0..<restArr.count{
        var nr = i - 1
        var nc = fly.count - 1
        
        //좌측
        if nr >= 0 {
            var gap = abs(restArr[i] - restArr[nr])
            var d = gap / 5
            
            if d > 0{
                //이동 -> 작은쪽으로
                if restArr[i] > restArr[nr]{
                    newRestArr[nr] += d
                    newRestArr[i] -= d
                }else{
                    newRestArr[nr] -= d
                    newRestArr[i] += d
                }
            }}
        
        
        //상단
        if i >= fly[0].count {continue}
        var gap = abs(restArr[i] - fly[nc][i])
        var d = gap / 5
        
        if d > 0{
            //이동 -> 작은쪽으로
            if restArr[i] > fly[nc][i]{
                newFly[nc][i] += d
                newRestArr[i] -= d
            }else{
                newFly[nc][i] -= d
                newRestArr[i] += d
            }
        }
        
    }
    
    
    
    
    for i in 0..<fly.count{
        for j in 0..<fly[0].count{
            fly[i][j] += newFly[i][j]
        }
    }
    
    for i in 0..<restArr.count{
        restArr[i] += newRestArr[i]
    }
    
    //일렬로 나열하기
    var lineArr = [Int]()
    for i in 0..<restArr.count{
        lineArr.append(restArr[i])
        for j in stride(from: fly.count - 1, through: 0, by: -1){
            if i < fly[0].count{
                lineArr.append(fly[j][i])
            }
            
        }
    }
    
    var firstAdjust = [[Int]]()
    var front = Array(lineArr[0..<lineArr.count / 2])
    var back = Array(lineArr[lineArr.count / 2..<lineArr.count])
    front.reverse()
    firstAdjust.append(front)
    firstAdjust.append(back)
    
    
    var secondAdjust = [[Int]]()
    
    //맨 아래부터 뒤집기.(앞부분 절반)
    for idx in stride(from: firstAdjust.count - 1, to: 0, by: -1){
        
    }
    
    //print(lineArr)
    
    
    
    print(fly)
    print(restArr)
    
    
}



solution()
