//
//  main.swift
//  수찾기1920
//
//  Created by JeongMin Ko on 2022/12/08.
//


/*
 첫째 줄에 자연수 N(1 ≤ N ≤ 100,000)이 주어진다. 다음 줄에는 N개의 정수 A[1], A[2], …, A[N]이 주어진다. 다음 줄에는 M(1 ≤ M ≤ 100,000)이 주어진다. 다음 줄에는 M개의 수들이 주어지는데, 이 수들이 A안에 존재하는지 알아내면 된다. 모든 정수의 범위는 -231 보다 크거나 같고 231보다 작다.
 
 5
 4 1 5 2 3
 5
 1 3 7 9 5
 
 */
import Foundation

func solution(){

    var N = String(readLine()!)
    var A = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
    
    var M = String(readLine()!)
    var B = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    func search(arr: [Int], left : Int, right : Int, X : Int) -> Int{
        //A[L...R] 에서 X 이상의 수 중 제일 왼쪽 인덱스를 return 하는 함수
        // // 그런 게 없다면 R + 1 을 return 한다
        
        var L = left
        var R = right
        
        while(L <= R){
            var mid = (R + L)/2
            if arr[mid] == X{
                print(1)
                return 1
            }
            if arr[mid] > X{
                R = mid - 1
            }else{
                L = mid + 1
            }
        }
        print(0)
        return 0
    }
    for i in 0..<B.count{
        search(arr: A, left: 0, right: Int(N)! - 1, X: B[i])
    }
   
    
    
}
solution()
