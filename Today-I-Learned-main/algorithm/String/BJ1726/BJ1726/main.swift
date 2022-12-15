//
//  main.swift
//  BJ1726
//
//  Created by JeongMin Ko on 2022/12/15.
//

/*
 5 6
 0 0 0 0 0 0
 0 1 1 0 1 0
 0 1 0 0 0 0
 0 0 1 1 1 0
 1 0 0 0 0 0
 4 2 3
 2 4 1
 */
import Foundation

print("Hello, World!")

func solution(){
    var inputSize = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var M = inputSize[0]
    var N = inputSize[1]
    var matrix = [[Int]](repeating: [Int]() , count: M + 1)
    //궤도 배치
    for i in 1...M{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        matrix[i] = input
        
    }
    var inputStart = readLine()!.split(separator: " ").map{ Int(String($0))!}
    //출발 좌표 방향
    var startR = inputStart[0]
    var startC = inputStart[1]
    var startDir = inputStart[2]
    
    var inputEnd = readLine()!.split(separator: " ").map{ Int(String($0))!}
    //도착 좌표 방향
    var endR = inputEnd[0]
    var endC = inputEnd[1]
    var endDir = inputEnd[2]
    
    
    var dir = [
        
        [0,1],
        [1,0],
        
        
    ]
    
    
    func turn
       
        
    
   
   
}

