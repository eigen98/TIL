//
//  main.swift
//  BJ16719
//
//  Created by JeongMin Ko on 2023/06/06.
//

/*
 문제
 2018년 12월, 처음 시작하게 된 ZOAC의 오프닝을 맡은 성우는 누구보다 화려하게 ZOAC를 알리려 한다.

 앞 글자부터 하나씩 보여주는 방식은 너무 식상하다고 생각한 성우는 문자열을 보여주는 새로운 규칙을 고안해냈다!

 규칙은 이러하다. 아직 보여주지 않은 문자 중 추가했을 때의 문자열이 사전 순으로 가장 앞에 오도록 하는 문자를 보여주는 것이다.

 예를 들어 ZOAC를 보여주고 싶다면, A → AC → OAC → ZOAC 순으로 보여주면 된다.

 바쁜 성우를 위하여 이 규칙대로 출력해주는 프로그램을 작성하시오.

 입력
 첫 번째 줄에 알파벳 대문자로 구성된 문자열이 주어진다. 문자열의 길이는 최대 100자이다.

 출력
 규칙에 맞게 순서대로 문자열을 출력한다.

 예제 입력 1
 ZOAC
 예제 출력 1
 A
 AC
 OAC
 ZOAC
 예제 입력 2
 BAC
 예제 출력 2
 A
 AC
 BAC
 */
import Foundation


var originalArr = [String]()
var resultArr = [String]()
var nowArr = [String]()
var visited = [Bool]()

func solution(){
    originalArr = readLine()!.map{String($0)}
    nowArr = [String](repeating: "", count: originalArr.count)
    visited = [Bool](repeating: false, count: originalArr.count)
    
    //이전에 사용된 문자의 아스키코드
    //var preAscii = Int.max
    //이전에 사용된 문자의 인덱스
    var preIdx = -1
    
    
    for _ in 1...originalArr.count{
        var frontAscii = Int.max
        var frontSc = ""
        var frontIdx = 0
        var exist = false
        
        var backAscii = Int.max
        var backIdx = 0
        var backSc = ""
        
        //숫자 찾기
        for idx in 0..<originalArr.count{
            //이전에 사용된 문자 뒤에서 사용되지않은 가장 작은 문자 찾기
            if !visited[idx] && preIdx < idx{
                var ch = originalArr[idx]
                if Int(UnicodeScalar(ch)!.value) < frontAscii{
                    frontAscii = Int(UnicodeScalar(ch)!.value)
                    frontSc = ch
                    frontIdx = idx
                    exist = true
                }
            }
            //앞에서 사용되지않은 가장 작은 문자 찾기
            if !visited[idx] && preIdx > idx{
                var ch = originalArr[idx]
                if Int(UnicodeScalar(ch)!.value) < backAscii{
                    backAscii = Int(UnicodeScalar(ch)!.value)
                    backSc = ch
                    backIdx = idx
                }
            }
        }
        
        //뒤에 붙이 문자가 있을 때
        if exist{
            visited[frontIdx] = true
            nowArr[frontIdx] = frontSc
            preIdx = frontIdx
            
        }else{
            visited[backIdx] = true
            nowArr[backIdx] = backSc
            preIdx = backIdx
        }
        resultArr.append(nowArr.joined())
        
        
    }
    
    for str in resultArr{
        print(str)
    }
}
solution()
