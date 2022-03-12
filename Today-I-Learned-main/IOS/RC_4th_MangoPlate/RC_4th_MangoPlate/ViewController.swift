//
//  ViewController.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/07.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {

    @IBOutlet weak var kakaoLoginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.addAgreement()
        
    
    }
        //로그인 버튼 클릭 이벤트
    @IBAction func tapLoginForKakao(_ sender: UIButton) {
        //isAvailableKaKao()
        loginForKakao()
        //addAgreement()
    }
    //카카오톡으로 로그인 (카카오 계정으로 로그인 따로 존재함)
    func isAvailableKaKao(){
        //카카오톡 설치 여부 확인
        if(UserApi.isKakaoTalkLoginAvailable()){
            UserApi.shared.loginWithKakaoTalk{(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
            
                    
                    //do something\
        
                    guard let findRestaurantViewController = self.storyboard?.instantiateViewController(withIdentifier: "findRestaurantViewControllerID") as? FindRestaurantViewController
                    else {
                        print("controller is null")
                        return }
                    findRestaurantViewController.modalTransitionStyle = .coverVertical
                    findRestaurantViewController.modalPresentationStyle = .fullScreen
                    self.present(findRestaurantViewController, animated: true, completion: nil)
                    _ = oauthToken
                   
                    
                }
                
                
            }
        }
        
    }
    
    
    //기존 로그인 여부와 상관없이 로그인 요청하는 경우
    func loginForKakao(){
        UserApi.shared.loginWithKakaoAccount(prompts: [.Login]) {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                guard let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainVC")
                else {
                    print("controller is null")
                    return }
                mainViewController.modalTransitionStyle = .coverVertical
                mainViewController.modalPresentationStyle = .fullScreen
                self.present(mainViewController, animated: true, completion: nil)
            }
            _ = oauthToken
        }
    }
    func addAgreement(){
        
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                if let user = user {

                    //필요한 scope을 아래의 예제코드를 참고해서 추가한다.
                    //아래 예제는 모든 스콥을 나열한것.
                    var scopes = [String]()

                    if (user.kakaoAccount?.profileNeedsAgreement == true) { scopes.append("profile") }
                    if (user.kakaoAccount?.emailNeedsAgreement == true) { scopes.append("account_email") }
                    if (user.kakaoAccount?.birthdayNeedsAgreement == true) { scopes.append("birthday") }
                    if (user.kakaoAccount?.birthyearNeedsAgreement == true) { scopes.append("birthyear") }
                    if (user.kakaoAccount?.genderNeedsAgreement == true) { scopes.append("gender") }
                    if (user.kakaoAccount?.phoneNumberNeedsAgreement == true) { scopes.append("phone_number") }
                    if (user.kakaoAccount?.ageRangeNeedsAgreement == true) { scopes.append("age_range") }
                    if (user.kakaoAccount?.ciNeedsAgreement == true) { scopes.append("account_ci") }
                    
                    if scopes.count == 0  { return }

                    //필요한 scope으로 토큰갱신을 한다.
                    UserApi.shared.loginWithKakaoAccount(scopes: scopes) { (_, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            UserApi.shared.me() { (user, error) in
                                if let error = error {
                                    print(error)
                                }
                                else {
                                    print("me() success.")

                                    //do something
                                    _ = user
                                }

                            } //UserApi.shared.me()
                        }

                    } //UserApi.shared.loginWithKakaoAccount(scopes:)
                }
            }
        }
    }
    
    //앱 실행시 앞서 로그인을 통해 발급받은 토큰이 있는지 확인
    //호출결과는 기존에 발급받은 액세스 토큰 또는 refresh토큰 존재 여뷰를 bool값으로 알려줌
//    func alreadyToken(){
//        if(AuthApi.hasToken()){
//            UserApi.shared.accessTokenInfo{ (_, error) in
//                if let error = error {
//                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true {
//                        //로그인 필요
//                    }
//                }else {
//                    //기타 에러
//                }
//
//            }
//            else {
//                //토큰 유효성 체크 성공(필요시 토큰 갱신됨)
//            }
//        }
//    }
    
    
    
    //3/12
    //
    //이미지 캐싱 라이브러리
    


}

