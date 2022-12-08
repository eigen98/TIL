//
//  main.swift
//  두수의합
//
//  Created by JeongMin Ko on 2022/12/08.
//
/*
 첫째 줄에 수열의 크기 n이 주어진다.
 다음 줄에는 수열에 포함되는 수가 주어진다.
 셋째 줄에는 x가 주어진다. (1 ≤ n ≤ 100000, 1 ≤ x ≤ 2000000)
 9
 5 12 7 10 9 1 2 3 11
 13
 */
import Foundation

func solution(){
    var count = 0
    var n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{ Int(String($0))!}.sorted()
    var x = Int(readLine()!)!
    
    func search(A: [Int], left : Int, right : Int, X : Int) {
        var L = left
        var R = right
        
        while(L <= R){
            
            var mid = (R + L) / 2
            
            if A[mid] == X{
                count += 1
                return
            }
            
            if A[mid] > X {
                R = mid - 1
            }else if A[mid] < X{
                L = mid + 1
            }
            
        }
        
    }
    
    for i in 0..<n{
        search(A: arr, left: i + 1, right: n - 1, X: x - arr[i])
    }
   
    print(count)
}
solution()
