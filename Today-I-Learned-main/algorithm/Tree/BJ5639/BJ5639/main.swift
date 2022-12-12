//
//  main.swift
//  BJ5639
//
//  Created by JeongMin Ko on 2022/12/11.
//
/*
 입력
 트리를 전위 순회한 결과가 주어진다. 노드에 들어있는 키의 값은 106보다 작은 양의 정수이다. 모든 값은 한 줄에 하나씩 주어지며, 노드의 수는 10,000개 이하이다. 같은 키를 가지는 노드는 없다.

 출력
 입력으로 주어진 이진 검색 트리를 후위 순회한 결과를 한 줄에 하나씩 출력한다.
 
 50
 30
 24
 5
 28
 45
 98
 52
 60
 
 */
import Foundation

func solution(){
   var inputArr = [Int]()
    while let input = readLine(), let num = Int(input){
        inputArr.append(num)
    }
    
    var tree = Tree(node: inputArr[0])
    for i in 1..<inputArr.count{
        tree.add(node: inputArr[i])
    }
    
    
    func dfs(start : Int){
        
        dfs(start: )
    }
}


class Tree {
    var node : Int
    var left : Tree?
    var right : Tree?
    
    init(node: Int, left: Tree? = nil, right: Tree? = nil) {
        self.node = node
        self.left = left
        self.right = right
    }
    
    func add(node: Int){
        if self.node < node{
            if left != nil {
                left?.add(node: node)
            }else{
                left = Tree(node: node)
            }
        }else{
            if right != nil {
                right?.add(node: node)
            }else{
                right = Tree(node: node)
            }
        }
    }
    
    
    
}
