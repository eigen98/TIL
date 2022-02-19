//
//  DescriptionViewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/16.
//

import UIKit

class DescriptionViewController: UIViewController{
    
    
    
    

 //   weak var delegate : ProgressCheckDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
   //     self.delegate?.pageCheck(number: 0.3)
        print("30%")
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        ProgressViewController.pageMeter.page = 1.0
        ProgressViewController.pageMeter.notify()
    }
    
    @IBAction func tabLikeButton(_ sender: UIButton) {
    }
    
   

}
