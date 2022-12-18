//
//  main.swift
//  BJ7343
//
//  Created by JeongMin Ko on 2022/12/17.
//

import Foundation


// Read the input
let n = Int(readLine()!)!
let number = Int(readLine()!)!

// Initialize the snail array
var snail: [[Int]] = []
for _ in 0..<n {
  snail.append(Array(repeating: 0, count: n))
}

// Initialize the current position and direction
var x = 0
var y = 0
var dx = 1
var dy = 0

// Fill the snail array
for i in 1...n*n {
  snail[y][x] = i

  // Change direction if necessary
  if (x+dx >= n || x+dx < 0 || y+dy >= n || y+dy < 0 || snail[y+dy][x+dx] != 0) {
    let temp = dx
    dx = dy
    dy = -temp
  }

  // Move to the next position
  x += dx
  y += dy
}

// Print the snail array
for i in 0..<n {
  for j in 0..<n {
    print(snail[i][j], terminator: " ")
  }
  print("")
}

// Print the coordinates of the given number
for i in 0..<n {
  for j in 0..<n {
    if snail[i][j] == number {
      print("\(i+1) \(j+1)")
    }
  }
}
