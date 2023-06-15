//
//  main.swift
//  BJ17071
//
//  Created by JeongMin Ko on 2023/06/15.
//

import Foundation

let inp = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = inp[0], M = inp[1], mx = 500000
var check = Array(repeating: [-1,-1], count: mx+1)
check[N] = [0,-1]
var queue = [(N,0)], q = 0
while queue.count > q {
    let f = queue[q]
    q += 1
    for i in 0..<3 {
        var next = f.0
        switch i {
        case 0: next += 1
        case 1: next -= 1
        case 2: next *= 2
        default: print()
        }
        if next <= mx, 0<=next && check[next][(f.1+1)%2] == -1 {
            check[next][(f.1+1)%2] = f.1+1
            queue.append((next,f.1+1))
        }
    }
}
var ans = Int.max
var m = M
for t in 0...mx {
    if m+t > mx { break }
    m += t
    (0..<2).forEach{
        if check[m][$0] != -1 && check[m][$0] <= t && (t-check[m][$0])%2 == 0  {
            ans = min(ans, t)
        }
    }
}
print(ans == Int.max ? -1 : ans)


