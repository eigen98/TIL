//
//  main.swift
//  BJ8983
//
//  Created by JeongMin Ko on 2022/12/27.
//
/*
 입력
 입력의 첫 줄에는 사대의 수 M (1 ≤ M ≤ 100,000),
 동물의 수 N (1 ≤ N ≤ 100,000),
 사정거리 L (1 ≤ L ≤ 1,000,000,000)이 빈칸을 사이에 두고 주어진다.
 두 번째 줄에는 사대의 위치를 나타내는 M개의 x-좌표 값이 빈칸을 사이에 두고 양의 정수로 주어진다.
 이후 N개의 각 줄에는 각 동물의 사는 위치를 나타내는 좌표 값이 x-좌표 값, y-좌표 값의 순서로 빈칸을 사이에 두고 양의 정수로 주어진다. 사대의 위치가 겹치는 경우는 없으며, 동물들의 위치가 겹치는 경우도 없다. 모든 좌표 값은 1,000,000,000보다 작거나 같은 양의 정수이다.

 출력
 출력은 단 한 줄이며, 잡을 수 있는 동물의 수를 음수가 아닌 정수로 출력한다.
 
 예제 입력 1
 4 8 4
 6 1 4 9
 7 2
 3 3
 4 5
 5 1
 2 2
 1 4
 8 4
 9 4
 
 예제 출력 1
 6
 */

import Foundation

func solution(){
    // M N L
    var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    
    var M = input[0] //발사대 수
    var N = input[1] //동물 수
    var L = input[2] //사정거리
    
    var ans = 0
    
    var shootArr = [Int]()
    //발사대 배치
    let inputM = readLine()!.split(separator: " ").map{ Int(String($0))!}
    shootArr.append(contentsOf: inputM)
    
    shootArr = shootArr.sorted()
    
    var animalArr = [[Int]]() // [a, b , visited]
    for _ in 1...N{
        let inputN = readLine()!.split(separator: " ").map{ Int(String($0))!}
        animalArr.append(inputN)
    }
    
    for animal in animalArr{
        
        
        let point = search(L: L, shootArr: shootArr, M: M, a: animal[0], b: animal[1])
        let dist1 = abs(shootArr[point] - animal[0]) + animal[1]
        if dist1 <= L {
            ans += 1
        }

    }
    print(ans)
    return
    
   
    
   
  
}

solution()

func search(L : Int, shootArr: [Int], M : Int, a: Int, b: Int) -> Int{
    var left = 0
    var right = M - 1
    var mid = left
    while(left <= right){
        print("left : \(left) \(right)")
        mid = (left + right) / 2
        let shot = shootArr[mid]

        if right >= M{
            return mid
        }
        if abs(shot - a) + b <= L || mid == a {
            return mid
        }
        
        if shot < a{
            left = mid + 1
        }else {
            right = mid - 1
        }
        
        if left >= M{
            return right
        }
        
        if right < 
        
    }
    return mid
}
