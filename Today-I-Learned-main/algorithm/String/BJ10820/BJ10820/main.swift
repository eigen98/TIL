//
//  main.swift
//  BJ10820
//
//  Created by JeongMin Ko on 2023/01/01.
//
/*
 문제
 문자열 N개가 주어진다. 이때, 문자열에 포함되어 있는 소문자, 대문자, 숫자, 공백의 개수를 구하는 프로그램을 작성하시오.

 각 문자열은 알파벳 소문자, 대문자, 숫자, 공백으로만 이루어져 있다.

 입력
 첫째 줄부터 N번째 줄까지 문자열이 주어진다. (1 ≤ N ≤ 100) 문자열의 길이는 100을 넘지 않는다.

 출력
 첫째 줄부터 N번째 줄까지 각각의 문자열에 대해서 소문자, 대문자, 숫자, 공백의 개수를 공백으로 구분해 출력한다.

 예제 입력 1
 This is String
 SPACE    1    SPACE
  S a M p L e I n P u T
 0L1A2S3T4L5I6N7E8
 
 예제 출력 1
 10 2 0 2
 0 10 1 8
 5 6 0 16
 0 8 9 0
 
 */
import Foundation

func solution(){
    
    while let input = readLine() {
        var ans = [Int](repeating: 0, count: 4)
        var S = input.forEach{
            var asciiNum = Int($0.asciiValue!)
           
            
            switch asciiNum{
                //소문자
            case 97...122:
                ans[0] += 1
                break
                //대문자
            case 65...91:
                ans[1] += 1
                break
                //숫자
            case 48...57:
                ans[2] += 1
                break
                //공백
            default:
                ans[3] += 1
                break
            }
        }
        
        print("\(ans[0]) \(ans[1]) \(ans[2]) \(ans[3])")
    }
    
    func findAns(){
       
    }
}

solution()