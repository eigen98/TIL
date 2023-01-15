//
//  main.swift
//  BJ2110
//
//  Created by JeongMin Ko on 2023/01/15.
//

/*
 문제
 도현이의 집 N개가 수직선 위에 있다. 각각의 집의 좌표는 x1, ..., xN이고, 집 여러개가 같은 좌표를 가지는 일은 없다.

 도현이는 언제 어디서나 와이파이를 즐기기 위해서 집에 공유기 C개를 설치하려고 한다. 최대한 많은 곳에서 와이파이를 사용하려고 하기 때문에, 한 집에는 공유기를 하나만 설치할 수 있고, 가장 인접한 두 공유기 사이의 거리를 가능한 크게 하여 설치하려고 한다.

 C개의 공유기를 N개의 집에 적당히 설치해서, 가장 인접한 두 공유기 사이의 거리를 최대로 하는 프로그램을 작성하시오.

 입력
 첫째 줄에 집의 개수 N (2 ≤ N ≤ 200,000)과 공유기의 개수 C (2 ≤ C ≤ N)이 하나 이상의 빈 칸을 사이에 두고 주어진다. 둘째 줄부터 N개의 줄에는 집의 좌표를 나타내는 xi (0 ≤ xi ≤ 1,000,000,000)가 한 줄에 하나씩 주어진다.

 출력
 첫째 줄에 가장 인접한 두 공유기 사이의 최대 거리를 출력한다.

 예제 입력 1
 5 3
 1
 2
 8
 4
 9
 예제 출력 1
 3
 */
import Foundation

func solution(){

    var input = readLine()!.split(separator: " ").map {Int(String($0))!}

    // N 집 개수
    var N = input[0]
    // C 공유기 개수
    var C = input[1]
    
    var Arr = [Int]()
    for i in 1...N{
        var position = Int(readLine()!)!
        Arr.append(position)
        
    }
    Arr = Arr.sorted()
    var L = 1
    var R = Arr.last! - Arr.first!
    
    while(L < R){
        var mid = (L + R) / 2
        if search(len: mid) {
            R = mid - 1
        }else{
            L = mid + 1
        }
        print("L :\(L) R :\(R)")
    }
    
    
    
    
    
    func search(len : Int) -> Bool{
        
    
        var now = 0
        var count = C
        print("search")
        while(count > 0 && now < N - 1){
            for j in now + 1..<Arr.count{
                var gap = Arr[j] - Arr[now]
                print("gap")
                if gap >= len{
                    //공유기 설치 가능하다면
    //                    print("Arr[idx] : \(Arr[i])  Arr[idx - 1] : \( Arr[]) ")
                    count -= 1 //남은 공유기 개수 감소
                    now = j - 1
                    print(gap)
                   break
                }
            }
            now += 1
        }
        if count > 0{
            return false
        }else{
            return true
        }
        
        
        
        
    }
    
    
    print(L)
    
}


solution()
