//
//  main.swift
//  BJ11652
//
//  Created by JeongMin Ko on 2022/12/27.
//
/*
 문제
 준규는 숫자 카드 N장을 가지고 있다. 숫자 카드에는 정수가 하나 적혀있는데, 적혀있는 수는 -262보다 크거나 같고, 262보다 작거나 같다.

 준규가 가지고 있는 카드가 주어졌을 때, 가장 많이 가지고 있는 정수를 구하는 프로그램을 작성하시오. 만약, 가장 많이 가지고 있는 정수가 여러 가지라면, 작은 것을 출력한다.

 입력
 첫째 줄에 준규가 가지고 있는 숫자 카드의 개수 N (1 ≤ N ≤ 100,000)이 주어진다. 둘째 줄부터 N개 줄에는 숫자 카드에 적혀있는 정수가 주어진다.

 출력
 첫째 줄에 준규가 가장 많이 가지고 있는 정수를 출력한다.

 예제 입력 1
 5
 1
 2
 1
 2
 1
 예제 출력 1
 1
 예제 입력 2
 6
 1
 2
 1
 2
 1
 2
 예제 출력 2
 1
 */

import Foundation

func solution(){
    var N = Int(readLine()!)!
    
    var ans = [0,0] //[num : Count]
    var dic = [Int:Int]()
    var arr = [Int]()
    
    for i in 1...N{
        var input = Int(readLine()!)!
        arr.append(input)
    }
    arr = arr.sorted()
    for num in arr{
        if dic[num] == nil{
            dic[num] = 1
            if ans[1] < dic[num]! { ans[0] = num ; ans[1] = 1 }
        }else{
            dic[num]! += 1
            if ans[1] < dic[num]! { ans[0] = num ; ans[1] = dic[num]! }
        }
        
    }
    
    
    print(ans[0])
    
}

solution()
