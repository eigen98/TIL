//
//  main.swift
//  BJ2331
//
//  Created by JeongMin Ko on 2023/01/08.
//
/*
 문제
 다음과 같이 정의된 수열이 있다.

 D[1] = A
 D[n] = D[n-1]의 각 자리의 숫자를 P번 곱한 수들의 합
 예를 들어 A=57, P=2일 때, 수열 D는 [57, 74(=52+72=25+49), 65, 61, 37, 58, 89, 145, 42, 20, 4, 16, 37, …]이 된다. 그 뒤에는 앞서 나온 수들(57부터가 아니라 58부터)이 반복된다.

 이와 같은 수열을 계속 구하다 보면 언젠가 이와 같은 반복수열이 된다. 이때, 반복되는 부분을 제외했을 때, 수열에 남게 되는 수들의 개수를 구하는 프로그램을 작성하시오. 위의 예에서는 [57, 74, 65, 61]의 네 개의 수가 남게 된다.

 입력
 첫째 줄에 A(1 ≤ A ≤ 9999), P(1 ≤ P ≤ 5)가 주어진다.

 출력
 첫째 줄에 반복되는 부분을 제외했을 때, 수열에 남게 되는 수들의 개수를 출력한다.

 예제 입력 1
 57 2
 예제 출력 1
 4
 
 57, 74, 65, 61, 37, 58, 89, 145, 42, 20, 4, 16, 37, …
 */
import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    let A = input[0] //D[1]
    let P = input[1] // 제곱 수
    
    var map = [Int:[Int]]()
    var now = A
    var deleteTarget = 0
    while(map[now] == nil){
        let to = calcNextNum(A: now, P: P)
        map[now] = [Int]()
        map[now]!.append(to)
        now = to
        deleteTarget = to
        //print(now)
    }// 사이클이 생기는 부분에서 중단
    // deleteTarget 제거
    
    map[deleteTarget]?.remove(at: 0)
    
    dfs(start: A, num: 1)
    
    
    
    func dfs(start : Int, num: Int){
        if map[start]?.first != nil{
            let next = map[start]?.first
            dfs(start: next!, num: num + 1)
        }else{
            print(num - 1)
        }
    }
    
   
   
    
}
solution()



func calcNextNum(A: Int, P: Int) -> Int{
    let arr = String(A).map{Int(String($0))!}
    var total = 0
    for num in arr{
        total += Int(pow(Float(num), Float(P)))
    }
    return total
}
