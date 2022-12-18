//
//  main.swift
//  BJ6064
//
//  Created by JeongMin Ko on 2022/12/16.
//

import Foundation

func findYear(m: Int, n: Int, x: Int, y: Int) -> Int {
    if x > m || y > n {
        // if x or y is greater than m or n respectively, the expression is invalid
        return -1
    }

    // we can calculate the year by adding 1 to the previous year until we reach the target x and y
    var year = 1
    var currentX = 1
    var currentY = 1
    while currentX != x || currentY != y {
        year += 1
        currentX += 1
        currentY += 1
        if currentX > m {
            currentX = 1
        }
        if currentY > n {
            currentY = 1
        }
    }

    return year
}

// to test the function with the example input
let testCases = [(m: 10, n: 12, x: 3, y: 9, result: 33),
                 (m: 10, n: 12, x: 7, y: 2, result: -1),
                 (m: 13, n: 11, x: 5, y: 6, result: 83)]

let result = findYear(m: 13, n: 11, x: 5, y: 6)
print(result)
