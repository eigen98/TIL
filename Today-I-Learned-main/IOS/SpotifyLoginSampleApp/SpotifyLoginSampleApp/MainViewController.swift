//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by JeongMin Ko on 2022/03/07.
//

import Foundation

import UIKit
class MainViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //뒤로가기 제스처 비활성화
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        네비게이션 바 숨기기
        navigationController?.navigationBar.isHidden = true
    }
    
    
    //로그아웃 버튼 눌렀을 때 첫 화면으로 돌아가기
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
