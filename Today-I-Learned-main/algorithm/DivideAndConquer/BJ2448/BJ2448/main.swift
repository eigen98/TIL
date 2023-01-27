//
//  main.swift
//  BJ2448
//
//  Created by JeongMin Ko on 2023/01/26.
//
/*
 문제
 예제를 보고 규칙을 유추한 뒤에 별을 찍어 보세요.

 입력
 첫째 줄에 N이 주어진다. N은 항상 3×2k 수이다. (3, 6, 12, 24, 48, ...) (0 ≤ k ≤ 10, k는 정수)

 출력
 첫째 줄부터 N번째 줄까지 별을 출력한다.

 예제 입력 1
 24
 예제 출력 1
                        *
                       * *
                      *****
                     *     *
                    * *   * *
                   ***** *****
                  *           *
                 * *         * *
                *****       *****
               *     *     *     *
              * *   * *   * *   * *
             ***** ***** ***** *****
            *                       *
           * *                     * *
          *****                   *****
         *     *                 *     *
        * *   * *               * *   * *
       ***** *****             ***** *****
      *           *           *           *
     * *         * *         * *         * *
    *****       *****       *****       *****
   *     *     *     *     *     *     *     *
  * *   * *   * *   * *   * *   * *   * *   * *
 ***** ***** ***** ***** ***** ***** ***** *****
 */
import Foundation
func solution(){
    var N = Int(readLine()!)!
    var arr = [[String]](repeating: [String](repeating: " ", count: N * 2), count: N + 1)
    //r, c : 꼭대기
    
    devide(r: 0, c: N - 1, num: N)
    func devide(r : Int, c : Int ,num :Int){
        if num == 3{
            arr[r][c] = "*"
            
            arr[r + 1][c - 1] = "*"
            arr[r + 1][c + 1] = "*"
            
            arr[r + 2][c - 2] = "*"
            arr[r + 2][c - 1] = "*"
            arr[r + 2][c] = "*"
            arr[r + 2][c + 2] = "*"
            arr[r + 2][c + 1] = "*"
            
        }else{
            devide(r: r, c: c, num: num/2)
            devide(r: r + num/2, c: c - num/2, num: num/2)
            devide(r: r + num/2, c: c + num/2, num: num/2)
        }
    }
    
    for str in arr{
        print(str.joined())
    }
    
    
}
solution()

//
//  main.swift
//  2448
//
//  Created by 이운형 on 09/03/2019.
//  Copyright © 2019 201302458. All rights reserved.
//
let testCount = Int(readLine()!)!
var result:[String] = Array(repeating: "", count: testCount)


func triangle(_ s:Int, _ e: Int) {
    var k = 0
    for i in s..<e {
        result[i] += result[k]
        k += 1
    }
    
    unTriangle(s,e)
    
    k = 0
    for j in s..<e {
        result[j] += result[k]
        k += 1
    }
    
    if e == testCount {
        return
    }
    
    triangle(e,e*2)
}

func unTriangle(_ s: Int, _ e: Int) {
    var i = e-s
    var k = 0
    
    while i > 0 {
        result[s+k] += whiteSpace(i*2 - 1)
        i -= 1
        k += 1
    }
}

func whiteSpace(_ n : Int) -> String {
    var r: String = ""
    
    for _ in 0..<n {
        r += " "
    }
    
    return r
}

result[0] = "*"
result[1] = "* *"
result[2] = "*****"

if testCount > 3 {
    triangle(3,6)
}

var resultPrint:String = ""

for i in 0..<testCount {
    resultPrint += (whiteSpace(testCount - i - 1) + result[i] + whiteSpace(testCount - i - 1))
    if i != testCount-1 {
        resultPrint += "\n"
    }
}

print(resultPrint)
