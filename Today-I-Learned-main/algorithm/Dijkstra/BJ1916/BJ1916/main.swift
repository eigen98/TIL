//
//  main.swift
//  BJ1916
//
//  Created by JeongMin Ko on 2022/12/11.
//

import Foundation


//struct NodePriority: Comparable {
//    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
//        lhs.priority > rhs.priority
//    }
//    var node: String = ""
//    var priority: Int = 0
//}
//var priorityQueue = MaxHeap(NodePriority.init(node: start, priority: 0))

class Info : Equatable {
    static func == (lhs: Info, rhs: Info) -> Bool {
        return lhs.idx == rhs.idx && lhs.distance == rhs.distance
    }
    
    var idx : Int
    var distance : Int
    init(idx: Int, distance: Int) {
        self.idx = idx
        self.distance = distance
    }
}

func solution(){
    var pq = [Info]()
    
    var minimum = pq.min(by: {$0.distance < $1.distance})
    if let index = pq.firstIndex(where: {$0 == minimum}){
        pq.remove(at: index)
    }
    
}
    
   
