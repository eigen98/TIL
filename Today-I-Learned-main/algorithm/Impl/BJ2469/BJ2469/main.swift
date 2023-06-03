//
//  main.swift
//  BJ2469
//
//  Created by JeongMin Ko on 2023/06/03.
//

import Foundation
var k = 0 // 알파벳 수 //
var n = 0 //가로 줄 수
var finalSort = ""
var matrix = [[String]]()
var blankIdx = 0


var alphaLine = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var alphaArr = alphaLine.map{ String($0)}

func solution(){
    k = Int(readLine()!)!
    n = Int(readLine()!)!
    finalSort = readLine()!
    for idx in 0..<n{
        var input = readLine()!.map{ String($0)}
        if input[0] == "?"{
            blankIdx = idx
        }
        matrix.append(input)
    }
    
    var beforeStr = alphaArr[0..<k].joined()
    if blankIdx != 0{
        beforeStr = getDownResult(startIdx: 0, endIdx: blankIdx - 1)
    }
    
    var afterStr = finalSort
    if blankIdx != n - 1{
        afterStr = getUpResult(startIdx: blankIdx + 1, endIdx: n - 1)
    }
   
//    print(beforeStr)
//    print(afterStr)
//    print("---------")
//
    var answer = getBlank(beforeStr: beforeStr, afterStr: afterStr)
    if answer == "Fail"{
        var failArr = [String](repeating: "x", count: k - 1)
        print(failArr.joined())
        return
    }
    print(answer)
    
    
    
}

func getDownResult(startIdx : Int, endIdx : Int ) -> String{
    var resultArr = [String](repeating: "-", count: k)
    
    for alphaIdx in 0..<k{
        let alpha = alphaArr[alphaIdx]
        var position = alphaIdx
        
        for i in startIdx...endIdx{
            //양쪽 인덱스 확인
            if position >= 1 && matrix[i][position - 1] == "-"{
                //이동 -> 왼쪽
                position -= 1
               
                continue
            }
            
            if position < k - 1 && matrix[i][position] == "-"{
                //이동 -> 오른쪽
                position += 1
                continue
            }
        }
        resultArr[position] = alpha
    }
    
    return resultArr.joined()
}

func getUpResult(startIdx : Int, endIdx : Int ) -> String{
    var resultArr = [String](repeating: "-", count: k)
    var msgArr =  finalSort.map{ String($0)}
    
    for alphaIdx in 0..<k{
        let alpha = msgArr[alphaIdx]
        var position = alphaIdx
        //양쪽 인덱스 확인
        for idx in stride(from: endIdx, through: startIdx, by: -1){
            
            //양쪽 인덱스 확인
            if position >= 1 && matrix[idx][position - 1] == "-"{
                //이동 -> 왼쪽
                position -= 1
                
                continue
            }
            
            if position < k - 1 && matrix[idx][position] == "-"{
                //이동 -> 오른쪽
                position += 1
                continue
            }
            
            
        }
        resultArr[position] = alpha
        
    }
    
    return resultArr.joined()
}

func getBlank(beforeStr : String, afterStr : String) -> String{
    var resultArr = [String](repeating: "*", count: k - 1)
    var beforeArr = beforeStr.map{String($0)}
    var afterArr = afterStr.map{String($0)}
    for i in 0..<beforeArr.count{
        var firstCh = beforeArr[i]
        if firstCh == afterArr[i] { continue }
        //왼쪽으로 이동해야함
        if i >= 1 && firstCh == afterArr[i - 1]{
            resultArr[i - 1] = "-"
            continue
        }
        
        //오른쪽으로 이동해야함
        if i < beforeArr.count - 1 && firstCh == afterArr[i + 1]{
            resultArr[i] = "-"
            continue
        }
        //둘다 불가능하다면
        return "Fail"
        
    }
    return resultArr.joined()
    
}

solution()
