//
//  ProgressViewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/16.
//

import UIKit


protocol Observable {
    func addObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
    
}
//옵저버를 등록 및 해제할 수 있는 프로토콜
protocol Observer: AnyObject {
    func update(page: Float) }

//옵저버의 등록 해제를 실제로 담당하는 클래스
class Observation: Observable {
    var observers = [Observer]()
    
    func addObserver(_ observer: Observer) {
        observers.append(observer) }
    
    func removeObserver(_ observer: Observer) {
        observers = observers.filter({ $0 !== observer }) }
}
// 페이지를 측정하여 알림을 보내는 클래스
class PageMeter: Observation {
    var page: Float = 0.0
    func notify() {
        for observer in observers {
            observer.update(page : page)
        }
    }
}

class Subscriber: Observer {
    var name: String = ""
    var uiVC : ProgressViewController
    
    func update(page: Float) {
        print("name: \(name), page: \(page)")
        uiVC.pageProgressBar.progress = (ProgressViewController.pageMeter.page)*0.33
//        uiVC.view.layoutIfNeeded()
    }
    init( name: String , uiVC : ProgressViewController) {
        self.name = name
        self.uiVC = uiVC
        
    }
}







//부모VIew
class ProgressViewController: UIViewController {
    
    
    //관찰자 생성
    public static var pageMeter = PageMeter()
    
    
   
    
    @IBOutlet weak var pageProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //관찰자
        let user = Subscriber(name: "user", uiVC: self)
       
        //알림을 받을 유저 추가
        ProgressViewController.pageMeter.addObserver(user)
        
        
        
        //둥글지 않게
        pageProgressBar.progressViewStyle = .bar
        //색 변경
        pageProgressBar.progressTintColor = .yellow
        pageProgressBar.trackTintColor = .lightGray
        pageProgressBar.transform = pageProgressBar.transform.scaledBy(x: 1, y: 3)

        
        
        
    }
    
}

