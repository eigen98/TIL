//
//  main.swift
//  ListOfUniqueNumbers
//
//  Created by JeongMin Ko on 2022/12/09.
//
/*
 길이가 N인 수열이 주어질 때, 수열에서 연속한 1개 이상의 수를 뽑았을 때 같은 수가 여러 번 등장하지 않는 경우의 수를 구하는 프로그램을 작성하여라.
 
 첫 번째 줄에는 수열의 길이 N이 주어진다. (1 ≤ N ≤ 100,000)

 두 번째 줄에는 수열을 나타내는 N개의 정수가 주어진다. 수열에 나타나는 수는 모두 1 이상 100,000 이하이다.
 
 5
 1 2 3 4 5
 */

import Foundation
func solution(){
    
    var ans = 0
    
    var N = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.insert(0, at: 0)
    
    var cnt = [Int](repeating: 0, count: N + 1)

    var R = 0
    for L in 1...N { // L 마다 R 을 최대한 옮겨 줄 계획이다.
        // R 을 옮길 수 있는 만큼 옮긴다.
        while(R < N && cnt[arr[R + 1]] == 0){
            R += 1
            cnt[arr[R]] += 1
        }
        ans += (R - L + 1)
        
        cnt[arr[L]] -= 1
        
    }
    
    print(ans)
    
}

solution()

