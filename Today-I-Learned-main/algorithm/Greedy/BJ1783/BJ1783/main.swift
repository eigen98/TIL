//
//  main.swift
//  BJ1783
//
//  Created by JeongMin Ko on 2023/01/27.
//
/*
 문제
 병든 나이트가 N × M 크기 체스판의 가장 왼쪽아래 칸에 위치해 있다. 병든 나이트는 건강한 보통 체스의 나이트와 다르게 4가지로만 움직일 수 있다.

 2칸 위로, 1칸 오른쪽
 1칸 위로, 2칸 오른쪽
 1칸 아래로, 2칸 오른쪽
 2칸 아래로, 1칸 오른쪽
 병든 나이트는 여행을 시작하려고 하고, 여행을 하면서 방문한 칸의 수를 최대로 하려고 한다. 병든 나이트의 이동 횟수가 4번보다 적지 않다면, 이동 방법을 모두 한 번씩 사용해야 한다. 이동 횟수가 4번보다 적은 경우(방문한 칸이 5개 미만)에는 이동 방법에 대한 제약이 없다.

 체스판의 크기가 주어졌을 때, 병든 나이트가 여행에서 방문할 수 있는 칸의 최대 개수를 구해보자.

 입력
 첫째 줄에 체스판의 세로 길이 N와 가로 길이 M이 주어진다. N과 M은 2,000,000,000보다 작거나 같은 자연수이다.

 출력
 병든 나이트가 여행에서 방문할 수 있는 칸의 개수중 최댓값을 출력한다.

 예제 입력 1
 100 50
 예제 출력 1
 48
 예제 입력 2
 1 1
 예제 출력 2
 1
 예제 입력 3
 17 5
 예제 출력 3
 4
 예제 입력 4
 2 4
 예제 출력 4
 2
 예제 입력 5
 20 4
 예제 출력 5
 4

 */
import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map { Int(String($0))!}
    var N = input[0]//세로
    var M = input[1]//가로
    if N == 1 || M == 1{
        print(1)
    }else if N <= 2 && M <= 2{
        print(1)
    }else if min(M, N) == 2 && max(M, N) <= 4{
        print(2)
    }else if min(M, N) == 2 && max(M, N) <= 6{
        print(3)
    }else if min(M, N) == 2 && max(M, N) >= 7{
        print(4)
    }else if M == 3 && N <= 3{
        print(3)
    }else if min(M, N) == 3 && N <= 3{
        
    }
    
    
    else if N <= 6 || M <= 6{
        print(4)
    }else{
        var ans = min(N - 2, M - 2)
        print(ans)
    }
}
solution()
