//
//  main.swift
//  BJ11656
//
//  Created by JeongMin Ko on 2023/01/01.
//
/*
 접미사 배열
 
 문제
 접미사 배열은 문자열 S의 모든 접미사를 사전순으로 정렬해 놓은 배열이다.

 baekjoon의 접미사는 baekjoon, aekjoon, ekjoon, kjoon, joon, oon, on, n 으로 총 8가지가 있고, 이를 사전순으로 정렬하면, aekjoon, baekjoon, ekjoon, joon, kjoon, n, on, oon이 된다.

 문자열 S가 주어졌을 때, 모든 접미사를 사전순으로 정렬한 다음 출력하는 프로그램을 작성하시오.

 입력
 첫째 줄에 문자열 S가 주어진다. S는 알파벳 소문자로만 이루어져 있고, 길이는 1,000보다 작거나 같다.

 출력
 첫째 줄부터 S의 접미사를 사전순으로 한 줄에 하나씩 출력한다.
 
 */

import Foundation

func solution(){
    var S = readLine()!.map{String($0)}
    var count = S.count - 1
    var arr = [String]()
    
    for j in 0...count{
        var word = ""
        for i in j...count{
            word += S[i]
        }
        arr.append(word)
    }
    
    arr = arr.sorted()
    for str in arr{
        print(str)
    }
}
solution()
