//
//  main.swift
//  BJ8980
//
//  Created by JeongMin Ko on 2023/06/05.
//

import Foundation
var N = 0 // 마을 수
var C = 0 // 용량
var M = 0 // 박스 정보
var list = [[Int]]()
func solution(){
    var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    N = input[0]
    C = input[1]
    M = Int(readLine()!)!
    for i in 1...M{
        var info = readLine()!.split(separator: " ").map{Int(String($0))!}
        var from = info[0]
        var to = info[1]
        var count = info[2]
        list.append([from, to, count])
    }
    list.sorted{
        if($0[0] != $1[0]){
            return $0[0] < $1[0]
        }else{
            return $0[1] < $1[1]
        }
    }
    
    var capacity = C
    var position = 0
    
    var stack = [[Int]]()
    for idx in 0..<list.count{
        var post = list[idx]
        if stack.isEmpty{
            //가능한 크기만큼 싣기
            if capacity < post[2]{
                post[2] = capacity
                
            }
            capacity -= post[2]
            stack.append(post)
        }else{
            //이미 도착한 택배 제거
            while(!stack.isEmpty){
                let top = stack.last!
                var from = top[0]
                var to = top[1]
                var size = top[2]
                
                if to <= post[1]{
                    capacity += size
                    stack.popLast()
                }else{
                    break
                }
            }
            //도착하지 않은 택배 중
            //새로운 택배보다 늦게 도착하는 택배 용량만큼 제거
            while(!stack.isEmpty){
                let top = stack.last!
                var from = top[0]
                var to = top[1]
                var size = top[2]
                
                if post[1] < to{// 늦게 도착
                    var prePost = stack.popLast()!
                    capacity += prePost[2]
                    
                }
            }
            
            //택배 싣기
            //가능한 크기만큼 싣기
            if capacity < post[2]{
                post[2] = capacity
                
            }
            capacity -= post[2]
            stack.append(post)
            
            
        }
    }
    
    
}
