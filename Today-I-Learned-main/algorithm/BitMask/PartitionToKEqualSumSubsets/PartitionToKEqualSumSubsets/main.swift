//
//  main.swift
//  PartitionToKEqualSumSubsets
//
//  Created by JeongMin Ko on 2023/01/18.
//
//Partition to K Equal Sum Subsets

import Foundation


func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
    let sumOfNums = nums.reduce(0, +)
    
    if sumOfNums % k != 0 { return false }
    
    let target = sumOfNums / k
    let sortedNums = nums.sorted()
    
    var subSetSum = Array(repeating: -1, count: 1 << nums.count)
    subSetSum[0] = 0
    /* mask
    0
    1(2진법 : 0000001)
    2(2진법 : 0000010)
    ...
    10(2진법 : 0000110)
    ...
    63( 2진법 : 1000000)
     
     */
    for mask in 0 ..< (1 << nums.count) {
        
        print(mask)
        if subSetSum[mask] == -1 { continue }
        
        for index in 0 ..< nums.count { //index : 0, 1, 2... 7
            if mask & (1 << index) <= 0 && subSetSum[mask] + nums[index] <= target {
                // 서로 부분집합이 아닌 경우 더한다.
                subSetSum[mask | (1 << index)] = (subSetSum[mask] + nums[index]) % target
            }
        }
        
        if subSetSum[(1 << nums.count) - 1] == 0 { return true }
    }
   
    return subSetSum[(1 << nums.count) - 1] == 0
    
}


print(canPartitionKSubsets([4,3,2,3,5,2,1], 4))
