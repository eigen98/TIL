//
//  main.swift
//  BJ11662
//
//  Created by JeongMin Ko on 2023/01/23.
//
/*
 민호와 강호

 문제
 민호와 강호가 2차원 좌표 평면 위에 있다. 민호는 점 A(Ax, Ay)에서 점 B(Bx, By)를 향해 걸어가고 있고, 강호는 점 C(Cx, Cy)에서 점 D(Dx, Dy)를 향해 걸어가고 있다. 민호와 강호는 동시에 출발하고, 민호가 점 B에 도착하는 순간 강호도 점 D에 도착한다. 또, 두 사람은 항상 일정한 속도로 걸어간다. 두 사람의 거리가 가장 가까울 때, 거리를 구하는 프로그램을 작성하시오.

 두 점 (x1, y1), (x2, y2)사이의 거리는 \(\sqrt{(x2-x1)^2 + (y2-y1)^2}\) 이다.

 입력
 첫째 줄에 Ax, Ay, Bx, By, Cx, Cy, Dx, Dy가 주어진다. 입력으로 주어지는 모든 좌표는 0보다 크거나 같고, 10000보다 작거나 같은 정수이다.

 출력
 민호와 강호가 가장 가까웠을 때의 거리를 출력한다. 절대/상대 오차는 10-6까지 허용한다.

 예제 입력 1
 0 0 1 1 2 2 3 3
 예제 출력 1
 2.8284271247
 예제 입력 2
 0 0 1 1 1 0 0 1
 예제 출력 2
 0.0000000000
 예제 입력 3
 0 0 10 20 30 0 5 10
 예제 출력 3
 8.2416338387
 예제 입력 4
 5 5 10 10 7 2 20 30
 예제 출력 4
 2.8745554697
 */
import Foundation
func solution(){
    var input = readLine()!.split(separator:" ").map{ Int(String($0))!}
    var Ax = (input[0])
    var Ay = (input[1])
    
    var Bx = (input[2])
    var By = (input[3])
    
    var Cx = (input[4])
    var Cy = (input[5])
    
    var Dx = (input[6])
    var Dy = (input[7])
    //시작 길이
    var L  = (abs(Ax - Cx) * abs(Ax - Cx) + abs(Ay - Cy) * abs(Ay - Cy))
    //나중 길이
    var R  = (abs(Bx - Dx) * abs(Bx - Dx) + abs(By - Dy) * abs(By - Dy))
    //길이 조율 포인터 설정
    if L > R{
        var temp = L
        L = R
        R = temp
    }
    var Left = sqrt(Double(L))
    var Right = sqrt(Double(R))
    
    while(Left < Right){
        var mid = (Left + Right / 2)//Double(String(format: "%.0f", L + R / 2))!
        var gapL = (Left + mid) / 2 //Double(String(format: "%.0f", L - mid))!
        var gapR = (Right + mid) / 2 //Double(String(format: "%.0f", R - mid))!
        
        //양수 음수
        
        
        if gapR > gapL{
            Right = (mid)
        }else if gapR < gapL {
            Left = (mid)
        }else{
            break
        }
        print(L)
    }
    var result = sqrt(Double(L))
    
    print(Double(String(format: "%.10f", result))!)
    
    
}

solution()

