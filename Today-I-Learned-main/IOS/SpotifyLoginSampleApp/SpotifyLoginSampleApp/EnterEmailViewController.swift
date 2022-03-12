//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by JeongMin Ko on 2022/03/07.
//

import Foundation
import UIKit
//파이어베이스
import FirebaseAuth

class EnterEmailViewController : UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //NavigationBar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 30
        nextButton.isEnabled = false
        
        //다음 버튼 비활성화를 위한 딜리게이트

        emailTextField.delegate = self
        passwordTextField.delegate = self
        //화면이 보여질 때 첫 커서의 위치 설정
        emailTextField.becomeFirstResponder()
        
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        //파이어베이스 이메일/비밀번호 인증
        let email = emailTextField.text ?? "" //옵셔널 처리
        let password = passwordTextField.text ?? ""
        
        //신규사용자 생성
        Auth.auth().createUser(withEmail: email, password: password, completion: {
            [weak self] authResult, error in
            guard let self = self else { return }
            
        })
    }
    private func showMainViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
}
//처음엔 다음 버튼 비활성화를 위한 딜리게이트
//두 텍스트 값을 전달하기 위해서
// 텍스트 필드 델리게이트 설정이 필요함.

extension EnterEmailViewController :
    UITextFieldDelegate {
    
    // 리턴버튼을 눌렀을 때 키보드가 내려가도록 구현
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true) //에디트가 끝나면 내려주어라
        return false
    }
    //이메일을 입력한 후 다음버튼을 활성화
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        //버튼이 활성화 될 때는 둘다 비어있지않을 때
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
