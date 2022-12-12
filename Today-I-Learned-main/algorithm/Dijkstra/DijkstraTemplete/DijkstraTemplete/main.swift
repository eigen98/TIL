//
//  main.swift
//  DijkstraTemplete
//
//  Created by JeongMin Ko on 2022/12/12.
//

import Foundation

print("Hello, World!")

// Dijkstra's algorithm in Swift

// define a type alias for a tuple that represents an edge in the graph
typealias Edge = (vertex: Int, weight: Int)

// define a type alias for a dictionary that maps a vertex to its edges
typealias Graph = [Int: [(vertex: Int, weight: Int)]]

// define a function that implements Dijkstra's algorithm
func dijkstra(graph: Graph, source: Int) -> [Int: Int] {
  // create a dictionary to store the distances from the source to all other vertices
  var distances = [Int: Int]()

  // initialize all distances to be infinity
  for vertex in graph.keys {
    distances[vertex] = Int.max
  }

  // set the distance from the source to itself to be 0
  distances[source] = 0

  // create a set to store the visited vertices
  var visited = Set<Int>()

  // create a priority queue to store the vertices
  var pq = PriorityQueue(sort: <, elements: Array(graph.keys))

  // while there are vertices in the priority queue
  while !pq.isEmpty {
    // get the vertex with the smallest distance from the priority queue
    guard let vertex = pq.dequeue() else { break }

    // add the vertex to the visited set
    visited.insert(vertex)

    // get the edges for the vertex
    guard let edges = graph[vertex] else { continue }

    // iterate over the edges
    for edge in edges {
      // if the edge leads to a visited vertex, skip it
      if visited.contains(edge.vertex) { continue }

      // calculate the distance from the source to the vertex connected by this edge
      let distance = distances[vertex]! + edge.weight

      // if the calculated distance is less than the current distance, update the distance
      if distance < distances[edge.vertex]! {
        distances[edge.vertex] = distance
      }
    }
  }

  // return the distances
  return distances
}


struct Edge {
    let from: String
    let to: String
    let weight: Int
}

class Graph {
    var nodes: Set<String>
    var edges: [Edge]

    init(nodes: Set<String>, edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }

    func dijkstra(source: String, destination: String) -> [String] {
        var distances: [String: Int] = [:]
        var previous: [String: String] = [:]

        // initialize distances
        for node in nodes {
            distances[node] = Int.max
            previous[node] = ""
        }

        // the distance from the source to itself is 0
        distances[source] = 0

        var unvisited = nodes
        var current = source

        while unvisited.count > 0 {
            for edge in edges where edge.from == current {
                let distance = distances[current]! + edge.weight

                if distance < distances[edge.to]! {
                    distances[edge.to] = distance
                    previous[edge.to] = current
                }
            }

            unvisited.remove(current)

            if let next = unvisited.min(by: { distances[$0]! < distances[$1]! }) {
                current = next
            } else {
                break
            }
        }

        var path: [String] = []
        var currentNode = destination
        while let previousNode = previous[currentNode] {
            path = [currentNode] + path
            currentNode = previousNode
        }

        if path.count > 0 {
            path = [source] + path
        }

        return path
    }
}

// example usage
let nodes: Set<String> = ["A", "B", "C", "D"]
let edges = [
    Edge(from: "A", to: "B", weight: 1),
    Edge(from: "A", to: "C", weight: 2),
    Edge(from: "B", to: "D", weight: 3),
    Edge(from: "C", to: "D", weight: 1)
]
// Set up a graph with the specified number of nodes and edges
let numNodes = 5
let numEdges = 6
var graph = [[Int]](repeating: [Int](repeating: Int.max, count: numNodes), count: numNodes)

// Add the edges to the graph
graph[0][1] = 2
graph[0][2] = 1
graph[1][2] = 3
graph[1][3] = 1
graph[1][4] = 4
graph[2][3] = 1

// Implement the Dijkstra algorithm
func dijkstra(graph: [[Int]], numNodes: Int, startNode: Int) -> [Int] {
  // Set up the distances array, with all distances initially set to infinity
  var distances = [Int](repeating: Int.max, count: numNodes)
  distances[startNode] = 0

  // Set up the visited array, with all nodes initially unvisited
  var visited = [Bool](repeating: false, count: numNodes)

  // Repeat the following until all nodes have been visited
  while let unvisitedNode = visited.firstIndex(of: false) {
    // Find the unvisited node with the minimum distance
    let minDistance = distances.min()!
    let node = distances.firstIndex(of: minDistance)!

    // Update the distances of all adjacent nodes
    for i in 0..<numNodes {
      if graph[node][i] != Int.max && distances[i] > distances[node] + graph[node][i] {
        distances[i] = distances[node] + graph[node][i]
      }
    }

    // Mark the current node as visited
    visited[node] = true
  }

  // Return the distances array
  return distances
}

// Use the Dijkstra algorithm to find the shortest distances from node 0
let distances = dijkstra(graph: graph, numNodes: numNodes, startNode: 0)

// Print the distances from node 0 to each of the other nodes
print(distances) // [0, 2, 1, 2, 4]

