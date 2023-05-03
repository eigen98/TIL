//
//  main.swift
//  BJ1644
//
//  Created by JeongMin Ko on 2023/04/29.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    let arr = createSosu(k: N)
    var sum = 0
    var R = 0
    var answer = 0
    //print(arr)
    for left in 0..<arr.count{
        
        
        while(R < arr.count && sum + arr[R] <= N){
            
            sum += arr[R]
            R += 1
            
        }
       //print("sum : \(sum)")
        if sum == N{
            answer += 1
        }
        sum -= arr[left]
    }
    print(answer)
    
}

func createSosu(k: Int) -> [Int] {
    if k < 2 {
        return []
    }
    
    var isPrime = [Bool](repeating: true, count: k + 1)
    isPrime[0] = false
    isPrime[1] = false

    var max = Int(sqrt(Double(k)))
    if max < 2 { max = 2 }
    for i in 2...max {
        if isPrime[i] {
            for j in stride(from: i * i, through: k, by: i) {
                isPrime[j] = false
            }
        }
    }

    var result = [Int]()
    for i in 2...k {
        if isPrime[i] {
            result.append(i)
        }
    }

    return result
}

solution()
