//
//  main.swift
//  BJ20437
//
//  Created by JeongMin Ko on 2022/12/15.
//
/*
 작년에 이어 새로운 문자열 게임이 있다. 게임의 진행 방식은 아래와 같다.

 알파벳 소문자로 이루어진 문자열 W가 주어진다.
 양의 정수 K가 주어진다.
 어떤 문자를 정확히 K개를 포함하는 가장 짧은 연속 문자열의 길이를 구한다.
 어떤 문자를 정확히 K개를 포함하고, 문자열의 첫 번째와 마지막 글자가 해당 문자로 같은 가장 긴 연속 문자열의 길이를 구한다.
 위와 같은 방식으로 게임을 T회 진행한다.
 
 입력
 문자열 게임의 수 T가 주어진다. (1 ≤ T ≤ 100)

 다음 줄부터 2개의 줄 동안 문자열 W와 정수 K가 주어진다. (1 ≤ K ≤ |W| ≤ 10,000)

 출력
 T개의 줄 동안 문자열 게임의 3번과 4번에서 구한 연속 문자열의 길이를 공백을 사이에 두고 출력한다.

 만약 만족하는 연속 문자열이 없을 시 -1을 출력한다.
 
 2
 superaquatornado
 2
 abcdefghijklmnopqrstuvwxyz
 5
 */

import Foundation

func solution(){
    
    func checkCheck(){
        var W = readLine()!.map{String($0)} // 소문자로 이루어진 문자열
        var K = Int(readLine()!)!
        var maximum = 0
        var minimum = Int.max
        //K개를 포함하는 가장 짧은 연속 문자열
        
        var countArr = [String:[Int]]() // "a": [firstIdx, preCount]
        
        var dist = [String: Int]() //문자열 길이
        var count = 0
        for i in 0..<W.count{
            var now = W[i]
            if countArr[now] == nil{
                countArr[now] = [i, 1] //첫번째 문자열 idx와 count 초기화
            }else{
                countArr[now]?[1] += 1
                if countArr[now]?[1] == K{ //K개인 문자열을 찾은 경우.
                    print("\n \(now) : \(i) - \((countArr[now]?[0])!)")
                    dist[now] = i - (countArr[now]?[0])! + 1 //해당 문자열 길이 초기화
                    maximum = max(maximum, dist[now]!)
                    minimum = min(minimum, dist[now]!)
                    count += 1
                    //첫번째 문자 바꾸기
                    countArr[now]?[0] += 1
                }
            }
            
        }
        if count > 0 {
            print(" \(minimum) \(maximum)")
        }else{
            print(-1)
        }
    }
    
    //T
    var T = Int(readLine()!)! //게임수
    
    
    for _ in 1...T{
        checkCheck()
    }
    
   
    
    
  
    
    
    
}

solution()



func findAns(){
    var W = readLine()!.map{String($0)} // 소문자로 이루어진 문자열
    var K = Int(readLine()!)!
    var maximum = 0
    var minimum = Int.max
    
    
    
}
