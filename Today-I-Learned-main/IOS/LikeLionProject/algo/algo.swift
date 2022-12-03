//
//  algo.swift
//  algo
//
//  Created by JeongMin Ko on 2022/12/01.
//

import Foundation

func num(_ num : Int) -> Int64{
    return Int64(num)
}
 var calArr : [Int64] = []

 var preNum = num(1)
 
 var i = 1
 for _ in 1...30{
     
     print("\(num(i)) * \(preNum)")
     calArr.append( num(i) * preNum)
     preNum = num(i) * preNum
     i += 1
 }
 print(calArr)
