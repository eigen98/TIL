//
//  main.swift
//  CalendarPracice
//
//  Created by JeongMin Ko on 2023/06/14.
//

func isLeapYear(_ year: Int) -> Bool {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
}

func printCalendar(weekCount: Int) {
    let daysPerWeek = 7
    let months = ["1/", "2/", "3/", "4/", "5/", "6/", "7/", "8/", "9/", "10/", "11/", "12/"]
    let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var currentDay = 1
    var currentMonth = 1
    var currentYear = 2023
    
    // 주어진 주(week) 수 만큼 달력 출력
    for _ in 1...weekCount {
        var weekString = ""
        for _ in 1...daysPerWeek {
            if currentDay > daysInMonth[currentMonth - 1] {
                currentDay = 1
                currentMonth += 1
            }
            if currentMonth > 12 {
                currentMonth = 1
                currentYear += 1
            }
            
            let dayString = currentDay == 1 ? "\(months[currentMonth - 1])\(currentDay)" : "\(currentDay)"
            weekString += dayString + " "
            
            currentDay += 1
        }
        print(weekString)
    }
}

// 주어진 주(week) 수만큼 달력 출력
let weekCount = 9
printCalendar(weekCount: weekCount)
