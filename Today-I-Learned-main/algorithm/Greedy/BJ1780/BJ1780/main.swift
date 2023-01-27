//
//  main.swift
//  BJ1780
//
//  Created by JeongMin Ko on 2023/01/25.
//
/*
 문제
 N×N크기의 행렬로 표현되는 종이가 있다. 종이의 각 칸에는 -1, 0, 1 중 하나가 저장되어 있다. 우리는 이 행렬을 다음과 같은 규칙에 따라 적절한 크기로 자르려고 한다.

 만약 종이가 모두 같은 수로 되어 있다면 이 종이를 그대로 사용한다.
 (1)이 아닌 경우에는 종이를 같은 크기의 종이 9개로 자르고, 각각의 잘린 종이에 대해서 (1)의 과정을 반복한다.
 이와 같이 종이를 잘랐을 때, -1로만 채워진 종이의 개수, 0으로만 채워진 종이의 개수, 1로만 채워진 종이의 개수를 구해내는 프로그램을 작성하시오.

 입력
 첫째 줄에 N(1 ≤ N ≤ 37, N은 3k 꼴)이 주어진다. 다음 N개의 줄에는 N개의 정수로 행렬이 주어진다.

 출력
 첫째 줄에 -1로만 채워진 종이의 개수를, 둘째 줄에 0으로만 채워진 종이의 개수를, 셋째 줄에 1로만 채워진 종이의 개수를 출력한다.

 예제 입력 1
 9
 0 0 0 1 1 1 -1 -1 -1
 0 0 0 1 1 1 -1 -1 -1
 0 0 0 1 1 1 -1 -1 -1
 1 1 1 0 0 0 0 0 0
 1 1 1 0 0 0 0 0 0
 1 1 1 0 0 0 0 0 0
 0 1 -1 0 1 -1 0 1 -1
 0 -1 1 0 1 -1 0 1 -1
 0 1 -1 1 0 -1 0 1 -1
 예제 출력 1
 10
 12
 11
 */

import Foundation
func solution(){
    var N = Int(readLine()!)!
    var adjArr = [[Int]]()
    for i in 1...N{
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        adjArr.append(input)
    }
    
    
    func rec_func(startRow : Int, startCol: Int, endRow : Int, endCol : Int){
        //다른 숫자가 존재하는지
        var firstNum = adjArr[startRow][startCol]
        var isSame = true
        for i in startRow...endRow{
            for j in startCol...endCol{
                
                if firstNum != adjArr[i][j]{
                    isSame = false
                }
                
            }
        }
        if !isSame {
            //1
            rec_func(startRow: startRow, startCol: startCol, endRow: endRow/3, endCol: endCol/3)
            
            //2
            rec_func(startRow: startRow, startCol: endCol/3, endRow: endRow/3, endCol: 2 * endCol/3)
            
            //3
            rec_func(startRow: startRow, startCol: endCol/3, endRow: endRow/3, endCol: endCol/3)
        }
    }
    
    
    
}

