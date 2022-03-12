//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by JeongMin Ko on 2022/03/07.
//

import Foundation
import UIKit

class LoginViewController : UIViewController{
    
    
    @IBOutlet weak var emailLoginButton: UIButton!
    
    @IBOutlet weak var googleLoginButton: UIButton!
    
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginButton,googleLoginButton,
         appleLoginButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
        
        appleLoginButton.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //네비게이션 Bar 숨기기
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: Any) {
        //파이어베이스 인증
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
        //파이어베이스 인증
    }
    
    
}
