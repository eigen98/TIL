//
//  main.swift
//  BJ15806
//
//  Created by JeongMin Ko on 2023/06/14.
//

import Foundation

let dx = [-2, -2, -1, -1, 1, 1, 2, 2]
let dy = [-1, 1, -2, 2, -2, 2, -1, 1]

func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

let inputs = readInts()
let (n, m, k, t) = (inputs[0], inputs[1], inputs[2], inputs[3])

var mold: [(x: Int, y: Int, dis: Int)] = []
for _ in 0..<m {
    var spot = readInts()
    mold.append((x: spot[0], y: spot[1], dis: 0))
}

var room = Array(repeating: Array(repeating: Array(repeating: 10001, count: n + 1), count: n + 1), count: 2)
var check_area: [(Int, Int)] = []
for _ in 0..<k {
    let spot = readInts()
    check_area.append((spot[0], spot[1]))
}

while !mold.isEmpty {
    let (x, y, dis) = mold.removeFirst()

    if dis >= 10001 {
        break
    }

    for dir in 0..<8 {
        let nx = x + dx[dir]
        let ny = y + dy[dir]

        if nx <= 0 || nx > n || ny <= 0 || ny > n {
            continue
        }

        if room[(dis + 1) % 2][nx][ny] == 10001 {
            room[(dis + 1) % 2][nx][ny] = dis + 1
            mold.append((x: nx, y: ny, dis: dis + 1))
        }
    }
}

var check_clean = false
for (x, y) in check_area {
    if room[t % 2][x][y] <= t {
        check_clean = true
        break
    }
}

if check_clean {
    print("YES")
} else {
    print("NO")
}
