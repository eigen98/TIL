//
//  main.swift
//  기타레슨
//
//  Created by JeongMin Ko on 2022/12/09.
//
/*
 첫째 줄에 강의의 수 N (1 ≤ N ≤ 100,000)과 M (1 ≤ M ≤ N)이 주어진다.
 다음 줄에는 강토의 기타 강의의 길이가 강의 순서대로 분 단위로(자연수)로 주어진다. 각 강의의 길이는 10,000분을 넘지 않는다.
 강의 수, 블루레이 수
 9 3
 1 2 3 4 5 6 7 8 9
 
 블루레이 크기중 최소를 출력한다.
 */
import Foundation

func solution(){
    var inputNum = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var N = inputNum[0]
    var M = inputNum[1] //디스크 수
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    func isPossible(length : Int) -> Bool{
        
        var cnt = 1, sum = 0;
        for num in  arr {
            if sum + num > length {
                cnt += 1
                sum = num;
            } else {
                sum += num;
            }
        }
        return cnt <= M;
        
        
    }
    
    var L = 0
    var R = 1000000000
    var res = 0
    for num in arr {
        L = max(L, num)
    }
    while(L <= R){
        var mid = (L + R) / 2
        if isPossible(length: mid) {
            res = mid
            R = mid - 1
        }else{
            L = mid + 1
            
        }
    }
    
    print(res)
}

solution()

