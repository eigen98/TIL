//
//  CustomPopUpViewController.swift
//  RC_4th_CardGame
//
//  Created by JeongMin Ko on 2022/03/04.
//

import Foundation
import UIKit

class CustomPopUpViewController : UIViewController{
    @IBOutlet weak var gameWinPopup: UIImageView!
    
    @IBOutlet weak var gameLosePopup: UIImageView!
    
    
    var win = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if win == 0 {
            gameWinPopup.isHidden = true
            gameLosePopup.isHidden = false
        }else {
            gameWinPopup.isHidden = false
            gameLosePopup.isHidden = true
        }
        
        
        
        print("다이얼로그 호출 = ")
    }
    
//    @IBAction func onBackgroundButtonClicked(_ sender: UIButton) {
//        print("CustomDialogViewController - onBackgroundButtonClicked() called")
//        self.dismiss(animated: true, completion: nil)
//    }  // 다이얼로그 사라짐
}
