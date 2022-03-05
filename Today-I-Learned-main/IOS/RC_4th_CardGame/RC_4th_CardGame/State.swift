//
//  State.swift
//  RC_4th_CardGame
//
//  Created by JeongMin Ko on 2022/03/03.
//

import Foundation



enum GameState{

    case ready
    case playing(turn : Int)
    case end
}


//        switch self.timerStatus {
//        case .end:
//            self.currentSecond = self.duration
//            self.timerStatus = .start
//            self.setTimerInfoViewVisible(isHidden: false)
//            self.datePicker.isHidden = true
//            self.toggleButton.isSelected = true
//            self.cancelButton.isEnabled = true
//            self.startTimer()
//
//        case .start:
//            self.timerStatus = .pause
//            self.toggleButton.isSelected = false
//            self.timer?.suspend()
//
//        case .pause :
//            self.timerStatus  = .start
//            self.toggleButton.isSelected = true
//            self.timer?.resume()
//        }
//    }
