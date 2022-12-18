//
//  main.swift
//  firstCodingTest
//
//  Created by JeongMin Ko on 2022/12/17.
//

import Foundation

func solution(gates: [[Int]], aircraft: [Int]) -> [Int] {
    // Initialize a list to store the non-formable days
    var nonFormableDays = [Int]()

    // Iterate over the rows of the gates array
    for i in 0..<gates.count {
        // Initialize a flag to indicate if the current row is formable
        var isFormable = true

        // Iterate over the columns of the current row
        for j in 0..<gates[i].count {
            // If the sum of the elements in the current column is not equal to the number of planes owned by the corresponding airline, set isFormable to false
            if gates[i][j] != aircraft[j] {
                isFormable = false
                break
            }
        }

        // If the current row is not formable, add the index to the list of non-formable days
        if !isFormable {
            nonFormableDays.append(i)
        }
    }

    // Sort the list of non-formable days in ascending order
    nonFormableDays.sort()

    // If the list is empty, return [-1]
    if nonFormableDays.isEmpty {
        return [-1]
    }
    // Otherwise, return the list of non-formable days
    else {
        return nonFormableDays
    }
}

//print(solution(gates: [[1,1,5,3],[2,2,3,3],[1,1,4,4],[1,0,3,6],[0,2,5,3]], aircraft: [3,2,5]))
//print(solution(gates: [[1,1,1,1,2],[0,0,0,0,6],[0,2,1,1,2],[2,0,2,0,2]], aircraft: [0,2,4]))
//print(solution(gates: [[3],[3],[3]], aircraft: [1,1,1]))


func solutionThree(games: [[Int]]) -> Int {
    // Sort the games in ascending order of discount date
    let sortedGames = games.sorted {
        if $0[1] != $1[1]{
            return $0[1] < $1[1]
        }else{
            
           
            return $0[0] * (100 - $0[2]) / 100 < $1[0] * (100 - $1[2]) / 100
        }
       
        
        }

    // Initialize the cost to 0
    var cost : Double = 0

    // Initialize the current day to 0
    var currentDay = 0

    // Iterate over the games
    for game in sortedGames {
        // If the discount date of the game is the same as the current day, apply the discount to the price of the game and add the discounted price to the cost
        
        if game[1] == currentDay {
            cost += Double(game[0]) * Double(100 - game[2]) / Double(100)
            print(Double(game[0]) * Double(100 - game[2]) / Double(100))
           // print(game[0] * (100 - game[2]) / 100  + (game[0] * (100 - game[2])) % 100)
           
        }
        // If the discount date of the game is greater than the current day, add the full price of the game to the cost and increment the current day by the difference between the discount date and the current day
        else {//할인 안 한 경우
            cost += Double(game[0])
            print(game[0])
            currentDay += game[1] - currentDay
        }
        //currentDay += 1
    }

    return Int(cost)
}
//print("첫번째 결과")
//print(solutionThree(games: [[66000,0,50], [16000,2,10],[84500, 3, 20], [5500, 2, 75]])) //117975
//print("두번째 결과")
//print(solutionThree(games: [[100,2,50], [1000,2,50],[10000, 0, 50]])) //5550
//print("세번째 결과")
//print(solutionThree(games: [[100,2,50], [100,2,50],[1000,4, 50], [1000, 4, 50]])) //2650
//print(solutionThree(games: [[100,0,50], [100,0,50],[100,0, 50], [10000, 3, 50]])) //5250


func minimumAmount(games: [[Int]]) -> Int {
    // Sort the games by their discount dates
    let sortedGames = games.sorted {
        
        if $0[1] != $1[1]{
            return $0[1] < $1[1]
        }else{
            
           
            return $0[0] * (100 - $0[2]) / 100 < $1[0] * (100 - $1[2]) / 100
        }
        
        //$0[1] < $1[1]
        
        
    }
    
    var totalAmount = 0
    var currentDay = 0
    
    // Iterate through the sorted games
    for game in sortedGames {
        let price = game[0]
        let discountDate = game[1]
        let discountRate = game[2]
        let discountedPrice = Double(price) * (Double(1.0) - (Double(discountRate)) / Double(100.0))
        if currentDay >= discountDate {
            totalAmount += Int(discountedPrice)
            //print(discountedPrice)
        } else {
            totalAmount += price
            
            //print(price)
        }
        
        currentDay += 1
    }
    
    return totalAmount
}

//var minimumAmountd = minimumAmount(games:  [[100,0,50], [100,0,50],[100,0, 50], [10000, 3, 50]])
//print(minimumAmountd) //117975
print(minimumAmount(games: [[66000,0,50], [16000,2,10],[84500, 3, 20], [5500, 2, 75]])) //117975
print("두번째 결과")
print(minimumAmount(games: [[100,2,50], [1000,2,50],[10000, 0, 50]])) //5550
print("세번째 결과")
print(minimumAmount(games: [[100,2,50], [100,2,50],[1000,4, 50], [1000, 4, 50]])) //2650
print(minimumAmount(games: [[100,0,50], [100,0,50],[100,0, 50], [10000, 3, 50]])) //5250
