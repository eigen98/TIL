//
//  main.swift
//  BJ1913
//
//  Created by JeongMin Ko on 2022/12/17.
//
//달팽이


import Foundation

print("Hello, World!")

func minTurns(P: String, S: String) -> Int {
    // Initialize a variable to store the total number of rotations
    var totalRotations = 0
    
    // Iterate through each digit in the password and current number
    for i in 0..<P.count {
        // Calculate the difference between the two digits
        var diff = (Int(String(S[S.index(S.startIndex, offsetBy: i)]))! - Int(String(P[P.index(P.startIndex, offsetBy: i)]))!) % 10
        
        // If the difference is negative, add 10 to make it positive
        if diff < 0 {
            diff += 10
        }
        
        // If the difference is more than half of 10 (which is 5), it's faster to rotate in the opposite direction
        if diff > 5 {
            diff = 10 - diff
        }
        
        // Add the number of rotations to the total
        totalRotations += diff
    }
    
    // Return the total number of rotations
    return totalRotations
}
print(minTurns(P: "82195", S: "64723"))  // Should print 13
print(minTurns(P: "00000000000000000000", S: "91919191919191919191")) 
