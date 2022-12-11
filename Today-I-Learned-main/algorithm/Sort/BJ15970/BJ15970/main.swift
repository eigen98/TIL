//
//  main.swift
//  BJ15970
//
//  Created by JeongMin Ko on 2022/12/11.
//
/*
 화살표 그리기
 입력
 표준 입력으로 다음 정보가 주어진다. 첫 번째 줄에는 점들의 개수를 나타내는 정수 N이 주어 진다. 다음 N개의 줄 각각에는 점의 좌표와 색깔을 나타내는 두 정수 x와 y가 주어진다.

 출력
 표준 출력으로 모든 점에서 시작하는 화살표들의 길이 합을 출력한다.
 
 5
 0 1
 1 2
 3 1
 4 2
 5 1
 */

import Foundation

func solution(){
    var ans = 0
    var N = Int(readLine()!)!
    var A = [Point]()
    //점 입력
    for i in 0..<N{
        var point = readLine()!.split(separator: " ").map{Int(String($0))!}
        A.append(Point(position: point[0], color: point[1]))
        
    }
    //배열 양끝 깍두기 추가.
    A.append(Point(position: 0, color: 0))
    A.append(Point(position: 0, color: N + 1))
    
    A = A.sorted(by: {a , b in
        if a.color == b.color {
            return a.position < b.position
        }else{
            return a.color < b.color
        }
    })
    
    for i in 1...N{
        var len = connectPoint(arr: A, idx: i)
        ans += len
        
    }
    
    if ans == 0 {
        print(-1)
    }else{
        print(ans)
    }
    
    func connectPoint(arr : [Point] ,idx : Int) -> Int{
        var now = arr[idx]
        var color = now.color
        var position = now.position
        var frontGap = -1
        var backGap = -1
        
        if arr[idx - 1].color == color{
            frontGap = now.position -  arr[idx - 1].position
        }
        if arr[idx + 1].color == color{
            backGap = arr[idx + 1].position - now.position
        }
        
        if min(frontGap, backGap) != -1{
            return min(frontGap, backGap)
        }else if frontGap > 0 {
            return frontGap
        }else if backGap > 0 {
            return backGap
        }else {
            return 0
        }
        
        
    }
}

struct Point{
    var position : Int
    var color : Int

    init(position: Int, color: Int) {
        self.position = position
        self.color = color
    }
}

solution()
