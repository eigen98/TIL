//
//  main.swift
//  BJ1068
//
//  Created by JeongMin Ko on 2022/12/11.
//트리
/*
 입력
 첫째 줄에 트리의 노드의 개수 N이 주어진다. N은 50보다 작거나 같은 자연수이다. 둘째 줄에는 0번 노드부터 N-1번 노드까지, 각 노드의 부모가 주어진다. 만약 부모가 없다면 (루트) -1이 주어진다. 셋째 줄에는 지울 노드의 번호가 주어진다.

 출력
 첫째 줄에 입력으로 주어진 트리에서 입력으로 주어진 노드를 지웠을 때, 리프 노드의 개수를 출력한다.

 
 5
 -1 0 0 1 1
 2
 
 */

import Foundation


func solution(){
    
    var root = 0
    var erased = 0
    
    
    var N = 0
    N = Int(readLine()!)!
    var leaf = [Int](repeating: 0, count: N)

    var child = [[Int]](repeating: [Int](), count: N)
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    for i in 0..<N {
        var par = arr[i]
        if par == -1{
            root = i
            continue
        }
        child[par].append(i)
    }
    erased = Int(readLine()!)!
    // dfs(x, par) := 정점 x 의 부모가 par 였고, Subtree(x) 의 leaf 개수를 세주는 함수
    func dfs(start: Int, par: Int){
        if child[start].isEmpty {
            leaf[start] += 1
        }
        for node in child[start]{
            if node == par { continue }
            dfs(start: node, par: start)
            leaf[start] += leaf[node]
        }
    }
    
    for i in 0..<N {
        if child[i].contains(erased){
            child[i].remove(at: child[i].firstIndex(of: erased)!)
        }
    }
    // erased 가 root 인 예외 처리하기
    if root != erased {dfs(start: root, par: -1)}
    
    print(leaf[root])
    
   
}
solution()
//func solution(){
//
//    var set = Set<Int>()
//    var adjList = [[Int]]()
//    var parents = [Int]() //idx 노드의 부모
//
//    var root = 0
//
//    //인접 리스트 입력
//    for node in 0..<N{
//        adjList.append([Int]())
//    }
//    parents = arr
//    for (idx, num) in arr.enumerated(){
//        if num != -1{
//            adjList[idx].append(num)
//            adjList[num].append(idx)
//        }else{
//            root = idx
//
//        }
//    }
//
//    func dfs(start : Int, disconnect : Int){
//        if root == disconnect{
//
//            return
//        }
//        for node in adjList[start]{
//            if node == parents[start] || node == disconnect  { continue }
//            dfs(start: node, disconnect: disconnect)
//        }
//        if adjList[start].count == 1{
//            set.insert(start)
//        }
//
//    }
//
//    dfs(start: root,disconnect: deleteNode)
//    print(set.count)
//
//}
//
//solution()
//
