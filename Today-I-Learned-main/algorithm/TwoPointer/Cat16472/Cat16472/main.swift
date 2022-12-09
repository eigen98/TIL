//
//  main.swift
//  Cat16472
//
//  Created by JeongMin Ko on 2022/12/09.
/*
 
 첫째 줄에는 인식할 수 있는 알파벳의 종류의 최대 개수 N이 입력된다. (1 < N ≤ 26)

 둘째 줄에는 문자열이 주어진다. (1 ≤ 문자열의 길이 ≤ 100,000) 단, 문자열에는 알파벳 소문자만이 포함된다.
 
 2
 abbcaccba
 */

import Foundation

func solution(){
    var ans = ""
    var ansArr = [String]()
    var kinds = 0
    var total = 0
    var N = Int(readLine()!)!
    var arr = readLine()!.map{String($0)}

    arr.insert("", at: 0)
    var cnt : [String: Int] = [String: Int]()
    
    var L = 0
    for R in 1...arr.count - 1{
        ansArr.append(arr[R])
        if let count = cnt[arr[R]]{
            if count == 0 { kinds += 1}
            cnt[arr[R]]! += 1
        }else{
            cnt[arr[R]] = 1
            kinds += 1
        }
       // print(R)
       // print(ansArr)
        
        while(kinds > N){
            var removed = ansArr.removeFirst()
            if cnt[removed] == 1{
                kinds -= 1
            }
            cnt[removed]! -= 1
        }
       // print(ansArr)
        if total < ansArr.count {
            //ans = ansArr.joined()
            total = ansArr.count
        }
        
       
        
    }
    print(total)
}

solution()

