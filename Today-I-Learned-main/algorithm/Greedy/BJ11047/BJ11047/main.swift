//
//  main.swift
//  BJ11047
//
//  Created by JeongMin Ko on 2023/01/25.
//
/*
 문제
 준규가 가지고 있는 동전은 총 N종류이고, 각각의 동전을 매우 많이 가지고 있다.

 동전을 적절히 사용해서 그 가치의 합을 K로 만들려고 한다. 이때 필요한 동전 개수의 최솟값을 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 N과 K가 주어진다. (1 ≤ N ≤ 10, 1 ≤ K ≤ 100,000,000)

 둘째 줄부터 N개의 줄에 동전의 가치 Ai가 오름차순으로 주어진다. (1 ≤ Ai ≤ 1,000,000, A1 = 1, i ≥ 2인 경우에 Ai는 Ai-1의 배수)

 출력
 첫째 줄에 K원을 만드는데 필요한 동전 개수의 최솟값을 출력한다.

 예제 입력 1
 10 4200
 1
 5
 10
 50
 100
 500
 1000
 5000
 10000
 50000
 예제 출력 1
 6
 
 예제 입력 2
 10 4790
 1
 5
 10
 50
 100
 500
 1000
 5000
 10000
 50000
 예제 출력 2
 12
 */
import Foundation
/*
 
 */

func solution(){
    var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var N = input[0]
    var K = input[1]
    var arr = [Int]()
    
    for i in 1...N{
        var read = Int(readLine()!)!
        arr.append(read)
    }
    var rest = K
    var count = 0
    for i in stride(from: N - 1, through: 0, by: -1){
        var num = arr[i]
        if rest >= num{
            count += rest / num
            rest -= (rest / num) * num
        }
    }
    
    print(count)
}
solution()
