//
//  ThirdPageViewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/16.
//

import UIKit

class ThirdPageViewController: UIViewController {

  //  var delegate : ProgressCheckDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     //   self.delegate?.pageCheck(number: 0.99)
        print("100%")
    }
    override func viewWillAppear(_ animated: Bool) {
        ProgressViewController.pageMeter.page = 3.0
        ProgressViewController.pageMeter.notify()
    }
    
    //홈화면으로 이동 -> 코드로 호출
    @IBAction func tapReadyButton(_ sender: UIButton) {
        guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else { return }
        
        //mainVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        //Todo 전체화면
        self.present(mainVC, animated: true)
    }
    


}
