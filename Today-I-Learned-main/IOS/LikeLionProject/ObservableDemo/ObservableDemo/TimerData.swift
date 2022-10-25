//
//  TimerData.swift
//  ObservableDemo
//
//  Created by JeongMin Ko on 2022/10/24.
//

import Foundation
import Combine
//
class TimerData : ObservableObject{ // ObservableObject -> 지켜봐줘
    @Published var timeCount = 0 //이 변수가 변하면 알려줄게
    var timer : Timer?
    
    init(){
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerDidFire), //매초 마다 함수 호출
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerDidFire(){
        timeCount += 1
    }
    
    func resetCount(){
        timeCount = 0
    }
}
