//
//  ViewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var helloButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        helloButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    @IBAction func tabHelloButton(_ sender: UIButton) {
        
        guard let introVC = self.storyboard?.instantiateViewController(withIdentifier: "IntroVC") else { return }
        
    
        //mainVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(introVC, animated: true)
    }


}

