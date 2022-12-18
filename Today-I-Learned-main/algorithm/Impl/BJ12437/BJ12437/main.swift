//
//  main.swift
//  BJ12437
//
//  Created by JeongMin Ko on 2022/12/16.
//
/*
 입력
 입력의 첫 줄에는 테스트 케이스의 숫자 T가 주어진다. 아래로 T 줄의 입력이 주어지며 각 줄은 하나의 테스트 케이스에 대한 입력이다. 각 테스트 케이스는 아래와 같이 3개의 자연수로 주어진다.

 총월수 월당일수 주당일수
 제한
 1 ≤ T ≤ 100.
 1 ≤ 총월수 ≤ 20.
 1 ≤ 월당일수 ≤ 10.
 1 ≤ 주당일수 ≤ 100.
 출력
 각 테스트 케이스에 대한 출력은 "Case #x: y" 형태로 이루어져야 한다. x는 1부터 시작되는 케이스 번호이고, y는 달력을 만드는데 필요한 줄 수 이다.

 예제 입력 1
 3
 3 11 4
 12 28 7
 10 35 10
 

 예제 출력 1
 Case #1: 11
 Case #2: 48
 Case #3: 40
 
 첫 달의 첫날은 첫 번째 열에 위치한다.
 첫 달을 제외한 각 달의 첫날은 이전달의 마지막 날 다음 열에 위치한다.
 서로 다른 달에 속한 날은 같은 줄에 위치하지 않는다.
 달력은 1년치만 출력된다.
 */
import Foundation

func solution(){
    let T = Int(readLine()!)!
    for i in 1..<T + 1{
        
        
        print("Case #\(i): \(checkcheck(testNum: i))")
    }
    func checkcheck(testNum : Int) -> Int{
        //총월수 월당일수 주당일수
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let TM = input[0]
        let MD = input[1]
        let WD = input[2]
        
        var totalDay = 0
        for _ in 1..<TM{
            totalDay += (MD)
            if totalDay % WD != 0{
                totalDay += WD
            }
            
        }
        
        totalDay += MD
        
        let ans = totalDay / WD + totalDay % WD
        
        
        return ans
        
    }
    
    
    
    
}

solution()
