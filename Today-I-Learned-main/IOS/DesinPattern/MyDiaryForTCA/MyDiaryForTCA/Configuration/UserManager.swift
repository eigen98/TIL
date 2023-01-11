//
//  UserManager.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import Foundation


import KeychainSwift

//유저 정보 관리 클래스
class UserManager {
    static let shared = UserManager()
    
    var jwt: String {
        get {
            return KeychainSwift().get("jwt") ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: "jwt")
        }
    }
    
    var email: String {
        get {
            return KeychainSwift().get("email") ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: "email")
        }
    }
    
    var id: String {
        get {
            return KeychainSwift().get("id") ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: "id")
        }
    }
    
    var image: String {
        get {
            return KeychainSwift().get("image") ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: "image")
        }
    }
    
    /*
     email database id 형식으로 변환
     */
    func safeEmail(emailAddress: String) -> String {
        var safeEmail = emailAddress.replacingOccurrences(of: "@", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: ".", with: "-")
        return safeEmail
    }
    
    var mode : String {// V (Visitor) / M (Member)
        get {
            return KeychainSwift().get("mode") ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: "mode")
        }
    }
    
    var userId: String {
        get {
            return KeychainSwift().get("userId") ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: "userId")
        }
    }
    
    var fullLocation: String { // 동네 이름 전체 (ex. 서울 동작구 노량진1동)
        get {
            return UserDefaults.standard.string(forKey: "fullLocation") ?? ""//KeychainSwift().get("fullLocation") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "fullLocation") //KeychainSwift().set(newValue, forKey: "fullLocation")
        }
    }
   
    
    // 탭바 높이 저장하는 변수
    var tabbarHeight: CGFloat?
    
    // 회원가입 api에 사용되는 변수
//    var provider: String = "" // 카카오, 애플 (로그인 플랫폼)
    var provider : String? {
       get {
           return KeychainSwift().get("provider") ?? ""
       }
       set {
           KeychainSwift().set(newValue ?? "", forKey: "provider")
       }
   }
  
    
    var accessToken: String { // 액세스 토큰
        get {
            return KeychainSwift().get("accessToken") ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: "accessToken")
        }
    }
    
   
    var term: Bool? // 회원가입 약관 동의
    var longitude: String { // 경도
        get {
            return UserDefaults.standard.string(forKey: "longitude") ?? ""//KeychainSwift().get("longitude") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "longitude") //KeychainSwift().set(newValue, forKey: "longitude")
        }
    }
    var longitudeTemp: String { // 동네 변경 중 경도
        get {
            return UserDefaults.standard.string(forKey: "longitudeTemp") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "longitudeTemp")
        }
    }
    
    var latitude: String { //  위도
        get {
            return  UserDefaults.standard.string(forKey: "latitude") ?? "" //KeychainSwift().get("latitude") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "latitude") //KeychainSwift().set(newValue, forKey: "latitude")
        }
    }
    
   
   
    

   
    
    private init() {}
}
