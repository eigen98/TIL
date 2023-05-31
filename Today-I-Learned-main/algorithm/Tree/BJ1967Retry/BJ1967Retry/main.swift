//
//  main.swift
//  BJ1967Retry
//
//  Created by JeongMin Ko on 2023/05/31.
//

import Foundation

//루트 노드의 번호는 항상 1
var n = 0
var adjList = [[Edge]]()
var visited = [Bool](repeating: false, count: n + 1)
var startPoint = 0
var maxLen = 0

func solution(){
    n = Int(readLine()!)!
    adjList = [[Edge]](repeating: [Edge](), count: n + 1) //0 깍두기
    for i in 1..<n{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        var newEdge = Edge(to: input[1], dist: input[2])
        var childEdge = Edge(to: input[0], dist: input[2])
        adjList[input[0]].append(newEdge)
        adjList[input[1]].append(childEdge)
        
    }
    visited = [Bool](repeating: false, count: n + 1)
    findStart(root: 1, len: 0)
    //print(startPoint)
    visited = [Bool](repeating: false, count: n + 1)
    findLen(root: startPoint, len: 0)
    print(maxLen)
}

func findStart(root : Int, len : Int){
    if(maxLen < len){
        maxLen = len
        startPoint = root
    }
    
    for node in adjList[root]{
        if(!visited[node.to]){
            visited[node.to] = true;
            findStart(root: node.to, len: len + node.dist)
            visited[node.to] = false;
        }
    }
    
    
}

func findLen(root : Int, len : Int){
    if(maxLen < len){
        maxLen = len
        startPoint = root
    }
    for node in adjList[root]{
        if(!visited[node.to]){
            visited[node.to] = true;
            findLen(root: node.to, len: len + node.dist)
            visited[node.to] = false;
        }
    }
}

class Edge{
    var to : Int
    var dist : Int
    
    init(to: Int, dist: Int) {
        self.to = to
        self.dist = dist
    }
}

solution()
