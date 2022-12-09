//
//  main.swift
//  예산
//
//  Created by JeongMin Ko on 2022/12/08.
//
/*
 첫째 줄에는 지방의 수를 의미하는 정수 N이 주어진다. N은 3 이상 10,000 이하이다. 다음 줄에는 각 지방의 예산요청을 표현하는 N개의 정수가 빈칸을 사이에 두고 주어진다. 이 값들은 모두 1 이상 100,000 이하이다. 그 다음 줄에는 총 예산을 나타내는 정수 M이 주어진다. M은 N 이상 1,000,000,000 이하이다.
 
 4
 120 110 140 150
 485
 
 */
import Foundation

func solution(){
    var N = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var M = Int(readLine()!)!
    var best = 0
    //예산 한도 범위 내 여부
    func isPossible(money : Int) -> Bool{
        if money > M { return false}
        var total = 0
        for coin in arr{
            best = max(best, coin)
            
            if coin >= money {
                total += money
            }else {
                total += coin
            }
        }
        return M >= total
        
    }
    
    var L = 0
    var R = 1000000000
    var res = R + 1
    
    while(L <= R){
        
        var mid = ( L + R ) / 2
        
        if isPossible(money: mid){
            L = mid + 1
            res = mid
        }else {
            R = mid - 1
        }
    }
    
    
    if res == M {
        print(best)
    }else{
        print(res)
    }
    
    
    
}

solution()
