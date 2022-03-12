//
//  AppDelegate.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/07.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth





@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //초기화 (네이티브 앱 키 입력)
        KakaoSDKCommon.KakaoSDK.initSDK(appKey: "dfa3e9caf3407c95221a3df77523671c")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    //카카오톡에서 서비스 앱으로 돌아왔을 때 카카오 로그인 처리를 정상적으로 완료하기 위해 AppDelegate.swift 파일에 handleOpenUrl()을 추가합니다.
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)){
            return AuthController.handleOpenUrl(url: url)
        }
        
        return false
    }


}

