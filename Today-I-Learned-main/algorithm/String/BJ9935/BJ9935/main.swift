//
//  main.swift
//  BJ9935
//
//  Created by JeongMin Ko on 2022/12/15.
//
/*
 mirkovC4nizCC44
 C4
 
 입력
 첫째 줄에 문자열이 주어진다. 문자열의 길이는 1보다 크거나 같고, 1,000,000보다 작거나 같다.

 둘째 줄에 폭발 문자열이 주어진다. 길이는 1보다 크거나 같고, 36보다 작거나 같다.

 두 문자열은 모두 알파벳 소문자와 대문자, 숫자 0, 1, ..., 9로만 이루어져 있다.

 출력
 첫째 줄에 모든 폭발이 끝난 후 남은 문자열을 출력한다.
 
 */
import Foundation
// 시간 초과
func solution(){
    var str = readLine()!
    let elemArr = readLine()!
    
    while(str.contains(elemArr)){
        str = str.replacingOccurrences(of: elemArr, with: "")
    }
   
    if str.count > 0 {
        print(str)
    }else{
        print("FRULA")
    }
}


//solution()


let input = Array(readLine()!).map{String($0)}
let target = readLine()!
let targetLen = target.count

let lastCh = String(target.last!)
print(lastCh)
var stack = [String]()

for ch in input {
    stack.append(ch)
    
    if ch == lastCh {
        let len = stack.count
        if len >= targetLen
            && stack[(len-targetLen)...].joined() == target{
            (0..<targetLen).forEach{_ in
                stack.removeLast()
            }
        }
    }
}
