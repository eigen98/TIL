//
//  main.swift
//  숫자카드2
//
//  Created by JeongMin Ko on 2022/12/08.
//
/*
 첫째 줄에 상근이가 가지고 있는 숫자 카드의 개수 N(1 ≤ N ≤ 500,000)이 주어진다.
 둘째 줄에는 숫자 카드에 적혀있는 정수가 주어진다.
 숫자 카드에 적혀있는 수는 -10,000,000보다 크거나 같고, 10,000,000보다 작거나 같다.

 셋째 줄에는 M(1 ≤ M ≤ 500,000)이 주어진다.
 넷째 줄에는 상근이가 몇 개 가지고 있는 숫자 카드인지 구해야 할 M개의 정수가 주어지며,
 이 수는 공백으로 구분되어져 있다. 이 수도 -10,000,000보다 크거나 같고, 10,000,000보다 작거나 같다.

 10
 6 3 2 10 10 10 -10 -10 7 3
 8
 10 9 -5 2 3 4 5 -10
 */

import Foundation
func solution(){
    var count = 0
    var N = Int(readLine()!)! //카드 개수
    var A = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
    
    var M = Int(readLine()!)! //카드 개수
    var B = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result = [String]()
    func under_bound(arr : [Int], left : Int, right : Int, X : Int) -> Int{
        
        var L = left
        var R = right
        
        var res = R + 1
        while(L <= R){
            var mid = (R + L) / 2
            
            if arr[mid] >= X{
                res = mid
                R = mid - 1
               
            }
            if arr[mid] < X {
                L = mid + 1
            }
        }
        
        return res
    }
    
    func upper_bound(arr : [Int], left : Int, right : Int, X : Int) -> Int{
        var L = left
        var R = right
        
        var res = R + 1
        while(L <= R){
            var mid = (R + L) / 2
            
            if arr[mid] > X{
                res = mid
                R = mid - 1
               
            }
            if arr[mid] <= X {
               
                L = mid + 1
            }
        }
        
        return res
    }
    
    
    for num in B {
        var min = under_bound(arr: A, left: 0, right: N - 1, X: num)
        var max = upper_bound(arr: A, left: 0, right: N - 1, X: num)
        var gap = max - min
        
        result.append("\(gap)")
        
    }
    
    
    

    print(result.joined(separator: " "))
}
solution()

