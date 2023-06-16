//
//  main.swift
//  BJ10703
//
//  Created by JeongMin Ko on 2023/06/15.
//

import Foundation
// 3 ≤ R, S ≤ 3000
var R = 0
var S = 0
var matrix = [[String]]()
var posArr = [[Int]]()
var starArr = [Int]()
var botArr = [Int]()
var minimum = 3001

func solution(){
    var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    R = input[0] //세로
    S = input[1] //가로
    starArr = [Int](repeating: -1, count: S)
    botArr = [Int](repeating: R - 1, count: S)
    
    
    for i in 0..<R{
        var inputLine = readLine()!.map{String($0)}
        
        for j in 0..<S{
            if inputLine[j] == "X"{
                inputLine[j] = "."
                posArr.append([i, j])
                starArr[j] = i
            }
            
            if inputLine[j] == "#"{
                if botArr[j] == R - 1{
                    botArr[j] = i
                }
            }
            
        }
        matrix.append(inputLine)
    }
    
    for i in 0..<S{
        minimum = min(botArr[i] - starArr[i], minimum)
    }
    
    for idx in 0..<posArr.count{
        var r = posArr[idx][0]
        var c = posArr[idx][1]
        matrix[r + minimum - 1][c] = "X"
    }
    
    for i in 0..<R{
        print(matrix[i].joined())
    }
    
    
    
    return
}

solution()
