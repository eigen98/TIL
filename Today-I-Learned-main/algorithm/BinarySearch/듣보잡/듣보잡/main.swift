//
//  main.swift
//  듣보잡
//
//  Created by JeongMin Ko on 2022/12/08.
//
/*
 첫째 줄에 듣도 못한 사람의 수 N, 보도 못한 사람의 수 M이 주어진다. 이어서 둘째 줄부터 N개의 줄에 걸쳐 듣도 못한 사람의 이름과, N+2째 줄부터 보도 못한 사람의 이름이 순서대로 주어진다. 이름은 띄어쓰기 없이 알파벳 소문자로만 이루어지며, 그 길이는 20 이하이다. N, M은 500,000 이하의 자연수이다.

 듣도 못한 사람의 명단에는 중복되는 이름이 없으며, 보도 못한 사람의 명단도 마찬가지이다.
 
 3 4
 ohhenrie
 charlie
 baesangwook
 obama
 baesangwook
 ohhenrie
 clinton
 */
import Foundation

func solution(){
    var inputNum = readLine()!.split(separator: " ").map{Int(String($0))!}
    var N = inputNum[0] //못들음
    var M = inputNum[1] //못봄
    var noHear = [String]()
    var noSee = [String]()
    //듣못 추가
    for i in 1...N{
        var inputStr = readLine()!
        noHear.append(inputStr)
    }
    noHear = noHear.sorted()
    //보못 추가
    for i in 1...M{
        var inputStr = readLine()!
        noSee.append(inputStr)
    }
    
    var resultStr = [String]()
    var resultCount = 0
    
    func search(A : [String], left : Int, right : Int, str : String) -> Bool{
        
        var L = left
        var R = right
        
        while(L <= R){
            var mid = (L + R) / 2
            if A[mid] == str{
                resultCount += 1
                resultStr.append(str)
                return true
            }
            if A[mid] > str {
                R = mid - 1
            }
            if A[mid] < str {
                L = mid + 1
            }
        }
        
        
        return false
    }
    
    for i in 0..<M{
        search(A: noHear, left: 0, right: N - 1, str: noSee[i])
    }
    print(resultCount)
    print(resultStr.joined(separator: "\n"))
}

solution()
