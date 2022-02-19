
import UIKit

enum TimerStatus {
    case start
    case pause
    case end
}


class ViewController: UIViewController {
    @IBOutlet weak var timerLebel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
   
    @IBOutlet weak var toggleButton: UIButton!
    
    var duration = 60
    var timerStatus : TimerStatus = .end
    var timer : DispatchSourceTimer?
    var currentSecond = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureToggleButton()
    }
    
    func setTimerInfoViewVisible(isHidden : Bool){
        self.timerLebel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func configureToggleButton(){
        self.toggleButton.setTitle("시작", for:.normal)
        self.toggleButton.setTitle("일시정지", for:.selected)
        
    }
    
    func startTimer(){
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue : .main)
            self.timer?.schedule(deadline: .now(), repeating: 1) //1초마다 반복
            self.timer?.setEventHandler(handler: { [weak self] in
                self?.currentSecond -= 1
                
                if self?.currentSecond ?? 0 <= 0 {
                    //타이머 종료
                    self?.stopTimer()
                }
            })
            self.timer?.resume()
            
        }
    }
    
    func stopTimer(){
        
        if self.timerStatus == .pause {
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelButton.isEnabled = false
        self.setTimerInfoViewVisible(isHidden: true)
        self.datePicker.isHidden = false
        self.toggleButton.isSelected = false
        self.timer?.cancel()
        self.timer = nil
    }

    @IBAction func tabCencelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause :
            self.timerStatus = .end
            self.cancelButton.isEnabled = false
            self.setTimerInfoViewVisible(isHidden: true)
            self.datePicker.isHidden = false
            self.toggleButton.isSelected = false
            self.stopTimer()
            
        default :
            break
            
        }
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        
        switch self.timerStatus {
        case .end:
            self.currentSecond = self.duration
            self.timerStatus = .start
            self.setTimerInfoViewVisible(isHidden: false)
            self.datePicker.isHidden = true
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            self.startTimer()
            
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false
            self.timer?.suspend()
            
        case .pause :
            self.timerStatus  = .start
            self.toggleButton.isSelected = true
            self.timer?.resume()
        }
    }
    
}

