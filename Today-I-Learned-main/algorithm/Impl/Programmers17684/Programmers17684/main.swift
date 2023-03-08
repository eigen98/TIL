//
//  main.swift
//  Programmers17684
//
//  Created by JeongMin Ko on 2023/03/08.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    
    // var arr = ["A", "B", "C", "D","E","F","G","H", "I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var arr = [Int]()
    var strArr = [String]()
    var dic = [String : Int]()
    var N = 0 //현재 알파벳 개수
    // 길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.
    for i in 0...25{
        dic[String(UnicodeScalar(i + 65)!)] = i + 1
        N += 1
    }
    var msgArr = msg.map{String($0)}
    var input = ""
    
    var pointer = 0
    
    var w = ""
    while(pointer < msgArr.count){
        // 사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
        var registered = false
        w += msgArr[pointer]
        
        if pointer < msgArr.count - 1{
            if dic[w + msgArr[pointer + 1]] != nil{
            pointer += 1
            continue
            }
        }
        // w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
        arr.append(dic[w]!)
        
        registered = true
        
        // 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
        if pointer < msgArr.count - 1{
            var wc = w + msgArr[pointer + 1]
            dic[wc] = N + 1
            N += 1
            
        }
        
        if registered{
            w = ""
        }
        pointer += 1
    }

    
    
    return arr
    
}
