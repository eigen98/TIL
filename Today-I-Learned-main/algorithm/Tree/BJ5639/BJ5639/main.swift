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

var tree : Node = Node(num: 0, left: nil, right: nil)
func solution(){
   var inputArr = [Int]()
    while let input = readLine(), let num = Int(input){
        inputArr.append(num)
    }
    //루트
    tree = Node(num: inputArr[0], left: nil, right: nil)
    
    for i in 1..<inputArr.count{
        let num = inputArr[i]
        
        dfs(input: num, nod: tree)
    }

    printDFS(root: tree)
}
func dfs(input : Int, nod : Node){
    var root = nod
    if input < root.num{
        if let left = root.left{
            dfs(input: input, nod: left)
        }else{
            root.left = Node(num: input, left: nil, right: nil)
        }
    }else{
        if let right = root.right{
            dfs(input: input, nod: right)
        }else{
            root.right = Node(num: input, left: nil, right: nil)
        }
    }
}

func printDFS(root : Node){
    
    if root.left != nil{
        printDFS(root: root.left!)
    }
    if root.right != nil{
        printDFS(root: root.right!)
    }
    
    print(root.num)
}

class Node{
    var num : Int
    var left : Node?
    var right : Node?
    init(num : Int, left : Node?, right: Node?){
        self.num = num
        self.left = left
        self.right = right
    }
}

solution()
