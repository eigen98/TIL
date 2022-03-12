//
//  ProfileViewController.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/12.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire

class ProfileViewController: UIViewController {

    var infoList : ProfileInfo?
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var profileName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //getUserInfo()
        //getProfileInfo()
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: { [self] in
//            self.profileImg.load(url:  URL(string : self.infoList!.profileImageURL)!)
//
//            self.profileName.text = infoList?.nickName
//        })
       
        
        
        
    }
    //동의항목 체크 TODO
    func getUserInfo(){
        UserApi.shared.me(){(user, error) in
            if let error = error{
                print(error)
            }
            else{
                print("me() success")
             
                _ = user
                
                self.profileName.text = user?.kakaoAccount?.name
                self.profileImg.load(url: (user?.kakaoAccount?.profile?.profileImageUrl)!)
                
            }
        }
        
        
    }
    
    func getProfileInfo() {
        let headers : HTTPHeaders = [//RestAPI Key
            "Authorization" : "KakaoAK 07bb5489a38bfc0d076146cc3588db4b"
        ]
        //요청할 키워드 파라미터
//        let parameters : [String : Any] = [
//            "query" : keyword,
//            "page" : page,
//            "size" : 1
//        ]
        let url = "https://dapi.kakao.com/v1/api/talk/profile"

        
        AF.request(url, method: .get, headers: headers)
            .responseJSON{ response in
                var infos : ProfileInfo
                self.infoList = ProfileInfo(nickName: "",profileImageURL: "",thumbnailURL: "")
                print("response : \(response)")
                
                
                do{
                    let decoder = JSONDecoder()
                    switch (response.result){
                    case .success :
                        infos = try decoder.decode(ProfileInfo.self, from: response.data!)
                        print("response : \(infos)")
                        self.infoList? = infos
                        
                    case .failure(let error):
                        print("errorCode : \(error)")
                    }
                
                }catch let parsingError{
                    print("Error", parsingError)
                }
            }.resume()
        
        
        
    }
    
    

    


}

struct ProfileInfo : Codable{
    let nickName : String
    let profileImageURL : String
    let thumbnailURL : String
    
    init(nickName : String, profileImageURL : String, thumbnailURL : String) {
        self.profileImageURL = profileImageURL
        self.nickName = nickName
        self.thumbnailURL = thumbnailURL
        
    }
}
