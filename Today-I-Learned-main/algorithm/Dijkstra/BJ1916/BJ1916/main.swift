//
//  main.swift
//  BJ1916
//
//  Created by JeongMin Ko on 2022/12/11.
//

import Foundation


public struct Heap<T> {
  var nodes: [T] = []
  let comparer: (T,T) -> Bool

  var isEmpty: Bool {
      return nodes.isEmpty
  }

  init(comparer: @escaping (T,T) -> Bool) {
      self.comparer = comparer
  }

  func peek() -> T? {
      return nodes.first
  }

  mutating func insert(_ element: T) {
      var index = nodes.count

      nodes.append(element)

      while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
          nodes.swapAt(index, (index-1)/2)
          index = (index-1)/2
      }
  }

  mutating func delete() -> T? {
      guard !nodes.isEmpty else {
          return nil
      }

      if nodes.count == 1 {
          return nodes.removeFirst()
      }

      let result = nodes.first
      nodes.swapAt(0, nodes.count-1)
      _ = nodes.popLast()

      var index = 0

      while index < nodes.count {
          let left = index * 2 + 1
          let right = left + 1

          if right < nodes.count {
              if comparer(nodes[left], nodes[right]),
                  !comparer(nodes[right], nodes[index]) {
                  nodes.swapAt(right, index)
                  index = right
              } else if !comparer(nodes[left], nodes[index]){
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else if left < nodes.count {
              if !comparer(nodes[left], nodes[index]) {
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else {
              break
          }
      }

      return result
  }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

// Heap By 라이노님 https://gist.github.com/JCSooHwanCho/a3f070c2160bb8c0047a5ddbb831f78e


//시작점부터 각 노드까지의 거리
struct Info  : Comparable{
    static func < (lhs: Info, rhs: Info) -> Bool {
        lhs.dist < rhs.dist
    }
    var idx : Int
    var dist : Int
    
    init(idx: Int, dist: Int) {
        self.idx = idx
        self.dist = dist
    }
    
}

struct Edge {
    var to : Int
    var dist : Int
    
    init(to: Int, dist: Int) {
        self.to = to
        self.dist = dist
    }
    
}

func solution(){
    
    let inf = 7777777 //??
   // let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let v = Int(readLine()!)!
    let e = Int(readLine()!)!
    
    let start = Int(readLine()!)!
    
    var graph = Array(repeating: [Edge]() , count: v + 1)
    for _ in 0..<e{
        let line = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[line[0]].append(Edge(to: line[1], dist: line[2]))
    }
    

    var d = Array(repeating: inf, count: v)
    d[start] = 0

        
    var pq: Heap = Heap<Info>()
    pq.insert(Info(idx: start, dist: 0))
    while(!pq.isEmpty){
        let now = pq.delete()!
        if d[now.idx] < now.dist{
            continue
        }
        
        for next in graph[now.idx]{

            if now.dist + next.dist < d[next.to]{
                d[next.to] = now.dist + next.dist
                pq.insert(Info(idx: next.to, dist: now.dist + next.dist))
            }
        }
    }
    for i in d{
        if i == inf{
            print("INF")
        } else {
            print(i)
        }
    }
    
}

solution()
