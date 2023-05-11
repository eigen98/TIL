//
//  main.swift
//  GreenHouse3
//
//  Created by JeongMin Ko on 2023/05/10.
//
import Foundation

let INF = Int.max
var nm = readLine()!.split(separator: " ").map{ Int($0)! }
var n = nm[0] //  # 각 동네의 사람 수 입력
var m = nm[1]

var a = [(Int, Int, Int)]() // # (살고 있는 위치, 사람의 번호, 사람의 성향)
var b = [(Int, Int, Int)]() // # (살고 있는 위치, 사람의 번호, 사람의 성향)
var fa = [Int](repeating: -1, count: n)
var fb = [Int](repeating: -1, count: m)

for i in 0..<n {
    let vt = readLine()!.split(separator: " ").map{ Int($0)! }
    a.append((vt[0], i, vt[1]))
}

for i in 0..<m {
    let vt = readLine()!.split(separator: " ").map{ Int($0)! }
    b.append((vt[0], i, vt[1]))
}

a.sort { $0.0 < $1.0 }
b.sort { $0.0 < $1.0 }

var ans = 0

func calc(a: [(Int, Int, Int)], n: Int) -> ([Int], [Int]) {
    //# left[v] := v 이하에서 제일 가까운 값을 갖는 친구의 인덱스
    var left = [Int](repeating: -1, count: 1001)
    //# left[v] := v 이하에서 제일 가까운 값을 갖는 친구의 인덱스
    var right = [Int](repeating: -1, count: 1001)
    for i in 0..<n {
        let v = a[i].0
        if left[v] == -1 {
            left[v] = i
            right[v] = i
        }
    }
    for i in 2..<1001 {
        if left[i] == -1 {
            left[i] = left[i-1]
        }
    }
    for i in stride(from: 999, through: 1, by: -1) {
        if right[i] == -1 {
            right[i] = right[i+1]
        }
    }
    return (left, right)
}

while n > 0 && m > 0 { //# 두 동네 모두 한 명 이상은 산다면, 라운드 진행
    // # A 동네에서 상대를 결정하자
//  # lB, rB는 B 동네에 대한 left, right 배열/
    let (lB, rB) = calc(a: b, n: m)
    for i in 0..<n {
        let v = a[i].0 //# 이 사람은 v 위치에 살고 있다.
        if a[i].2 == -1 { //# 외향적인 사람
            // # 1 이랑 가장 가까운 상대와의 거리
            let left = (abs(v - b[rB[1]].0), -b[rB[1]].1)
            // # 1000 이랑 가장 가까운 상대와의 거리
            let right = (abs(v - b[lB[1000]].0), -b[lB[1000]].1)
            //# 왼쪽에 사는 사람이 더 멀다면, 그 사람을 선택
            // # 아니라면 오른쪽의 사람을 선택
            fa[i] = left >= right ? rB[1] : lB[1000]
        } else { //# 내향적인 사람
            // # v 이하에서 가장 가까운 상대와의 거리
            var left = (INF, 0)
            //   # v 이상에서 가장 가까운 상대와의 거리
            var right = (INF, 0)
            if lB[v] != -1 {
                left = (abs(v - b[lB[v]].0), b[lB[v]].1)
            }
            if rB[v] != -1 {
                right = (abs(v - b[rB[v]].0), b[rB[v]].1)
            }
            // # 만약 왼쪽이 더 "가깝다면" 왼쪽을 선택
            fa[i] = left <= right ? lB[v] : rB[v]
        }
    }
    //# B 동네에서 상대를 선택하자
    let (lA, rA) = calc(a: a, n: n)
    for j in 0..<m {
        if b[j].2 == -1 {
            // # 1 이랑 가장 가까운 상대와의 거리
            let left = (abs(b[j].0 - a[rA[1]].0), -a[rA[1]].1)
            //# 1000 이랑 가장 가까운 상대와의 거리
            let right = (abs(b[j].0 - a[lA[1000]].0), -a[lA[1000]].1)
            fb[j] = left >= right ? rA[1] : lA[1000]
        } else {
            var left = (INF, 0)
            var right = (INF, 0)
            let v = b[j].0
            if lA[v] != -1 {
                //# v 이하에서 가장 가까운 상대와의 거리
                left = (abs(v - a[lA[v]].0), a[lA[v]].1)
            }
            if rA[v] != -1 {
                //# v 이상에서 가장 가까운 상대와의 거리
                right = (abs(v - a[rA[v]].0), a[rA[v]].1)
            }
            fb[j] = left <= right ? lA[v] : rA[v]
        }
    }
    
    var flag = false
    for i in 0..<n {
        // # fa[i] := i 가 선택한 상대의 위치
        // # fb[ fa[i] ] := i 가 선택한 상대가 선택한 상대의 위치
        if fb[fa[i]] == i {
            a[i].1 = -1
            b[fa[i]].1 = -1
            ans += 1
            flag = true
        }
    }
    
    if !flag {
        break
    }
    a = a.filter { $0.1 != -1 }
    b = b.filter { $0.1 != -1 }
    n = a.count
    m = b.count
}
print(ans)


/*
 
 5 4
 750 1
 580 -1
 760 1
 60 1
 120 1
 720 -1
 600 1
 750 1
 740 1
 
 => 2
 
 
 3 4
 100 -1
 490 1
 500 1
 500 1
 510 1
 900 -1
 800 -1
 
 => 3
 
 
 2 2
 500 1
 700 1
 400 -1
 600 1
 
 => 0
 
 
 
 
 
 
 
 */
