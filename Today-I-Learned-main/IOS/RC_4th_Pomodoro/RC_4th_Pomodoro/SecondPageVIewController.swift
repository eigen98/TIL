//
//  SecondPageVIewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/16.
//

import UIKit

class SecondPageVIewController: UIViewController {

   // var delegate : ProgressCheckDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   self.delegate?.pageCheck(number: 0.66)
        
        print("60%")

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        ProgressViewController.pageMeter.page = 2.0
        ProgressViewController.pageMeter.notify()
    }
    

   
}
