//
//  main.swift
//  BJ12851
//
//  Created by JeongMin Ko on 2022/12/15.
//
/*
 입력
 첫 번째 줄에 수빈이가 있는 위치 N과 동생이 있는 위치 K가 주어진다. N과 K는 정수이다.

 출력
 첫째 줄에 수빈이가 동생을 찾는 가장 빠른 시간을 출력한다.

 둘째 줄에는 가장 빠른 시간으로 수빈이가 동생을 찾는 방법의 수를 출력한다.

 예제 입력 1
 5 17
 */

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var N = input[0] // 수빈
    var K = input[1] // 동생
    var minVisited = [Int](repeating: Int.max, count: 100001)
   // var countArr = [Int](repeating: 0, count: 100001)
    
//    var visited
    
    func bfs(start : Int, end : Int){
        minVisited[start] = 0
        var count = 0
        var queue = [[Int]]()
        queue.append([start, 0])
        while(!queue.isEmpty){
            var now = queue.removeFirst()
            
            if minVisited[now[0]] < now[1] {break}
            for i in 1...3{
                var next = 0
                switch i {
                case 1: next = now[0] + 1
                case 2: next = now[0] - 1
                case 3: next = now[0] * 2
                default: next = 0
                }
                if next < 0 || next > 100000{ //위치 확인
                    continue
                }
                
                
                if minVisited[next] < minVisited[now[0]] + 1 { continue }
                if end == now[0] {
                    
                    count += 1
                }
                //countArr[next] = countArr[now] + 1
                minVisited[next] = minVisited[now[0]] + 1
                
                queue.append([next, minVisited[next]])
            }
            
            
        }
        
        print(minVisited[end])
        //print(count)
    }
    
    bfs(start: N, end: K)
   
}

solution()
