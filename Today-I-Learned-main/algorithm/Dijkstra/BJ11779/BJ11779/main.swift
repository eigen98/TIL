//
//  main.swift
//  BJ11779
//
//  Created by JeongMin Ko on 2022/12/13.
//

import Foundation




struct Info : Comparable{
    static func < (lhs : Info, rhs : Info) -> Bool{
        return lhs.dist > rhs.dist
        
    }
    
    var idx : Int
    var dist : Int
    
    init(idx: Int, dist: Int) {
        self.idx = idx
        self.dist = dist
    }
}

struct Edge{
    var to : Int
    var dist: Int
    
    init(to: Int, dist: Int) {
        self.to = to
        self.dist = dist
    }
    
}


/*
 5
 8
 1 2 2
 1 3 3
 1 4 1
 1 5 10
 2 4 2
 3 4 1
 3 5 1
 4 5 3
 1 5
 */
func solution(){
    
    
    var cityCount = Int(readLine()!)! //도시 수
    var busCount = Int(readLine()!)! //버스 수
    
    var edges = [[Edge]](repeating: [Edge](), count: cityCount + 1) // 그래프
    var dist = [Int](repeating: Int.max, count: cityCount + 1) //각 점까지의 거리
    var record = [Int](repeating: 0, count: cityCount + 1)
    for i in 1...busCount{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        edges[input[0]].append(Edge(to: input[1], dist: input[2]))
        
    }
    var lastInput = readLine()!.split(separator:" ").map{Int(String($0))!}
    var start = lastInput[0]
    var end = lastInput[1]
    
    var pq = Heap<Info>()
    //시작점 갱신
    pq.insert(Info(idx: start, dist: 0))
    dist[start] = 0
    record[start] = start
    
    //우선순위큐가 비어있을 때까지
    while(!pq.isEmpty){
        var now = pq.delete()! //큐에서 거리 정보 하나 꺼냄
        if dist[now.idx] < now.dist{ //거리 정보가 지금 꺼보다 구리면 (더 크면) 무시
            continue
        }
        for next in edges[now.idx]{
            if dist[next.to] > next.dist + now.dist { //현재 가진 정보보다 더 좋은 길을 발견하면
                dist[next.to] = next.dist + now.dist //갱신
                record[next.to] = now.idx
                pq.insert(Info(idx: next.to, dist: next.dist + now.dist))
            }
        }
        
    }
    
    var cost = dist[end]
    var cityNum = 0
    var cityRecord = [String]()
    
    var destination = end
    //var serchIdx = destination
    while(destination != start){
        cityNum += 1
        cityRecord.append("\(destination)")
        destination = record[destination]
    }
    cityNum += 1
    cityRecord.append("\(start)")
    print(cost)
    print(cityNum)
    var arr = cityRecord.reversed().joined(separator: " ")
    print(String(arr))
}
solution()





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

