//
//  main.swift
//  랜선자르기
//
//  Created by JeongMin Ko on 2022/12/08.
//
/*
 4 11
 802
 743
 457
 539
 */
import Foundation

func solution(){
    
    var inputNum = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var K = inputNum[0]
    var N = inputNum[1]
    
    var arr = [Int]()
    for i in 1...K{
        var input = Int(readLine()!)!
        arr.append(input)
    }
    
    func determination(H : Int) -> Bool{
        var count = 0
        for idx in 0..<K{
            var cut = arr[idx] / H
            count += Int(cut)
        }
        
        return count >= N
        
    }
    
    var L = 0 //최소 길이
    var R = 2147483648 - 1 //최대 길이
    var res = 0
    while(L <= R){
        var mid = (R + L) / 2
        if determination(H: Int(mid)) {
            res = mid
            L = mid + 1
        }else{
            R = mid - 1
        }
    }
    
    print(res)
  
    
}

solution()
