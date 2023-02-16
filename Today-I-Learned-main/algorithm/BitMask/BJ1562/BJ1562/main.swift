//
//  main.swift
//  BJ1562
//
//  Created by JeongMin Ko on 2023/02/15.
//

import Foundation

let mod = 1000000000
let v = 1023
var n = 0
var ans = 0
var memo = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 1<<10), count: 10), count: 101) //[100까지][0부터 9중 숫자][비트마스킹 1024]

func counter(_ i: Int, _ m: Int, _ k: Int) -> Int {
    if memo[i][m][k] != 0 {
        return memo[i][m][k]
    }
    if i == n && k == v {
        return 1
    } else if i == n && k != v {
        return 0
    }
    if m == 0 { //현재 0일때 다음은 무조건 1이옴
        memo[i][m][k] = counter(i+1, 1, k|(1<<1))
    } else if m == 9 {// 현재 9일때 다음은 무조건 8이 옴
        memo[i][m][k] = counter(i+1, 8, k|(1<<8))
    } else {//
        memo[i][m][k] = (counter(i+1, m-1, k|(1<<(m-1))) + counter(i+1, m+1, k|(1<<(m+1)))) % mod
    }
    return memo[i][m][k]
}

func main() {
    n = Int(readLine()!)!
    for k in 1..<10 {
        ans = (ans + counter(1, k, 1<<k)) % mod
    }
    print(ans)
}

main()

