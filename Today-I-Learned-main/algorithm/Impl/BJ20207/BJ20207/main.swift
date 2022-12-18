//
//  main.swift
//  BJ20207
//
//  Created by JeongMin Ko on 2022/12/16.
//
/*
 입력
 첫째 줄에 일정의 개수 N이 주어진다. (1 ≤ N ≤ 1000)

 둘째 줄부터 일정의 개수만큼 시작 날짜 S와 종료 날짜 E가 주어진다. (1 ≤ S ≤ E ≤ 365)

 출력
 코팅지의 면적을 출력한다.

 예제 입력 1
 7
 2 4
 4 5
 5 6
 5 7
 7 9
 11 12
 12 12
 예제 출력 1
 28
 */

import Foundation

func solution(){
    var N = Int(readLine()!)!
    var dubArr = [Int](repeating: 0, count: 366) //0은 제외 , 1 ~ 365일 달력


    var arr = [Schedule]()

    for i in 1...N{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        var start = input[0]
        var end = input[1]
        var schedule = Schedule(start: start,end: end)
        
        arr.append(schedule)
        
        
    }
    //입력된 일정 sort
    arr = arr.sorted(by: {
        if $0.start != $1.start{
            return $0.start < $1.start
        }else {
            return $0.end > $1.end
        }
    })
    
    
    var leading = Int.max
    var trailing = 0
    var height = 0
    var area = 0
    
    arr.forEach{
        var startDay = $0.start
        var endDay = $0.end
        
        if startDay - trailing > 1 { //불연속 구간 초기화
            var width = trailing - leading + 1 // 지금까지 연속된 일정 길이 계산
            area += height * width // 넓이 계산
            leading = startDay //초기화
            height = 0
        }
        leading = min(startDay, leading) //가장 앞부분
        trailing = max(trailing, endDay)
        //배열 채우기
        for i in startDay...endDay{
            dubArr[i] += 1
            height = max(height, dubArr[i])
        }
        
    }
    var width = trailing - leading + 1 // 지금까지 연속된 일정 길이 계산
    area += height * width // 넓이 계산
   

    
  
    
//    width = preDay - firstDay + 1
//    area += width * height

    print(area)
}

solution()


class Schedule {
    
    var start : Int
    var end : Int
    
    init(start: Int, end: Int) {
        self.start = start
        self.end = end
    }
    
}
