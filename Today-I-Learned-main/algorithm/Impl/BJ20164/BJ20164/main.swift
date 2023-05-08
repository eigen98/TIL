//  main.swift
//  BJ20164

/*
 문제
 호석이는 짝수랑 홀수 중에서 이니셜이 같은 홀수를 더 좋아한다. 운전을 하던 호석이는 앞차의 번호판이 홀수로 가득할 때 사랑스러움을 느낄 정도이다. 전화번호도 홀수만 있고 싶다. 그렇게 홀수 홀릭에 빠진 호석이는 가지고 있는 수 N을 일련의 연산을 거치면서, 등장하는 숫자들에서 홀수를 최대한 많이 많이 보고 싶다.

 하나의 수가 주어졌을 때 호석이는 한 번의 연산에서 다음과 같은 순서를 거친다.

 수의 각 자리 숫자 중에서 홀수의 개수를 종이에 적는다.
 수가 한 자리이면 더 이상 아무것도 하지 못하고 종료한다.
 수가 두 자리이면 2개로 나눠서 합을 구하여 새로운 수로 생각한다.
 수가 세 자리 이상이면 임의의 위치에서 끊어서 3개의 수로 분할하고, 3개를 더한 값을 새로운 수로 생각한다.
 호석이는 연산이 종료된 순간에 종이에 적힌 수들을 모두 더한다. 그렇게 최종적으로 얻은 수를 최종값이라고 하자. 예를 들어, 시작하는 수가 82019 라고 하자. 그럼 아래와 같이 나누게 되면 5개의 홀수를 볼 수 있기 때문에, 최종값이 5가 된다.
 시작할 때 호석이가 가진 수를 N 이라고 했을 때, 만들 수 있는 최종값 중 최솟값과 최댓값을 구해주자.

 입력
 첫번째 줄에 호석이가 처음 시작할 때 가지고 있는 수 N 이 주어진다.

 출력
 첫 번째 줄에 호석이가 만들 수 있는 최종값 중에서 최솟값과 최댓값을 순서대로 공백으로 구분하여 출력한다.

 제한
 1 ≤ N ≤ 109-1, N 은 자연수이다.
 예제 입력 1
 514
 예제 출력 1
 4 4
 
 514 -> 5+1+4 = 10

 10 -> 1+0 = 1

 1

 각 숫자에서 등장한 홀수가 2개, 1개, 1개 이므로 답은 4이다.

 예제 입력 2
 82019
 예제 출력 2
 4 5
 예제 입력 3
 999999999
 예제 출력 3
 11 18

 */

import Foundation
func solution(){
    var N = Int(readLine()!)!
    var answer = 0
    
    var minimum = divide(input: N, isMin: true)
    
    var maximum = divide(input: N, isMin: false)
    
    
    print("\(minimum) \(maximum)")
    // 0, 1 , 2, 3,
}
// 111 -> 1, 1, 1 -> 2
func divide(input : Int, isMin : Bool) -> Int{
    var result = getCount(input: input)
    if input < 10{
        return getCount(input: input)
    }else if input < 100{
        var first = input / 10
        var second = input % 10
        return result + getCount(input: first + second)
    }else{
        //82019
        var str = "\(input)".map{String($0)}
        var first = 0
        var second = 0
        var third = 0
        
        var tripleResult = isMin ? Int.max : Int.min
        for i in 1..<str.count - 1{
            for j in i + 1..<str.count{
                first = Int(str[0..<i].joined())!
                second = Int(str[i..<j].joined())!
                third = Int(str[j..<str.count].joined())!
               // print("first : \(first), second : \(second), third: \(third)")
                if isMin{
                    tripleResult = min( tripleResult , divide(input: Int( "\(first + second + third)")!, isMin: isMin))
                }else{
                    tripleResult = max( tripleResult , divide(input: Int( "\(first + second + third)")!, isMin: isMin))
                }
                
            }
        }
        return result + tripleResult
    }
}

//82019
func getCount(input : Int) -> Int{
    var count = 0
    var num = input
    while(num > 0){
        var rest = num % 10
        if rest % 2 != 0{ count += 1 }
        num = num / 10
    }
    return count
}

solution()
