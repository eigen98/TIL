//
//  TimerViewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/19.
//

import UIKit

enum TimerStatus {
    case start
    case pause
    case before
    case end
}

class TimerViewController: UIViewController {

    @IBOutlet weak var startView: UIView!
    
    @IBOutlet weak var routineTitle: UILabel!
    
    @IBOutlet weak var totalTime: UILabel!
    
    @IBOutlet weak var totalCount: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var totalView: UIView!
    
    @IBOutlet weak var beforeStartView: UIView!
    @IBOutlet weak var startedTimer: UIView!
    
    @IBOutlet weak var cancelButton: UILabel!
    
    @IBOutlet weak var countDown: UILabel!
    var timer: DispatchSourceTimer? // 타이머
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startView.isHidden = false
        
        
    }
    
    private func startTimer() {
            if self.timer == nil { // 타이머가 메모리에 부재 시 타이머 소스를 생성하고 스케줄을 등록한다.
                self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
                self.timer?.schedule(deadline: .now(), repeating: 1) // 1초마다 반복되는 걸 바로 시작
                
                self.timer?.setEventHandler(handler: { [weak self] in
                    
                    guard let self = self else { return }
                    
                    self.duration -= 1
                    
                    // 시간, 분, 초
                    let hour = 0
                    let minutes = 0
                    let seconds = self.duration
                    
                    self.countDown.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds) // 60:60:60의 형태로 라벨 포맷 지정
                    
                    
                                    
                    if self.duration <= 0 {
                        // 타이머 종료
                        self.stopTimer()
                    }
                })
                self.timer?.resume()
            }
        }
        
        private func stopTimer(){
            self.timerStatus = .pause
            
            self.timer?.cancel()
            self.timer = nil // 멈추면 메모리 해제 해 줘야 함
        }
    
    //카운트 다운
    var duration = 59
    //처음 상태
    var timerStatus : TimerStatus = .before
    
    //해야할 일
    var details = DetailItem.generateData()
    
    

    
    @IBAction func tapPauseButton(_ sender: UIButton) {
        if self.timerStatus == .start {
            self.timerStatus = .pause
            stopTimer()
        }
        
        
        
        
    }
    
    
    
    @IBAction func tapPlayButton(_ sender: Any) {
        

        switch self.timerStatus {
        case .before:
            self.timerStatus = .start
            //self.setTimerInfoViewVisible(isHidden: false)
            self.beforeStartView.isHidden = false
            self.startView.isHidden = true
            startTimer()
            totalView.backgroundColor = .white

        case .start:
            
            self.timerStatus = .start
            
            

        case .pause :
            
            startTimer()
            self.timerStatus  = .start
            
        
        case .end:
            break
        }
    }
    
   
    
}
