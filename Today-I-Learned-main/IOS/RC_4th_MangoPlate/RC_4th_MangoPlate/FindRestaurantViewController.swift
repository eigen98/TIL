//
//  FindRestaurantViewController.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/10.
//

import UIKit
import Alamofire
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

struct Restaurant {
    let img : UIImage
    let name : String
    let rate : String
    let countView : String
    let countReview : String
    let position : String
}



class FindRestaurantViewController: UIViewController {
    //컬렉션뷰 크기 조절을 위한 변수
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    //파싱한 결과를 담아줄 List
    var resultList : PlaceList?
    var resultImgList :ImageList?
    var arrayImg : [URL] = [URL]()
    
    var restourantMock  = [Restaurant]()
    
    @IBOutlet weak var restaurantCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //맛집 리스트 요청 GET
        getRestaurantList(keyword: "맛집", page: 1, size: 15)
        
        //검색된 맛집 이미지 요청 GET (2초 뒤에 실행)
        DispatchQueue.global().asyncAfter(deadline: .now()+2, execute: {
            self.resultList?.documents.forEach{ it in
                self.getRestaurantImage(keyword: it.placeName, page: 1, size: 1)
            }
        })
       
//
        
        DispatchQueue.global().asyncAfter(deadline: .now()+4, execute: {
            for i in 0...self.resultList!.documents.count - 1 {
                
                var url = self.arrayImg[i]
                var urlImg : UIImage = UIImage()
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            urlImg = image
                            
                        }
                        
                    }
                    
                }
                
                print("이 음식점의 사진 url : \(self.arrayImg[i])")
                let dataList = self.resultList?.documents[i]
                var entity = Restaurant(img: urlImg, name: dataList!.placeName , rate: "4.8" , countView: "33", countReview: "33", position: dataList!.roadAddressName)
                
                print("지금 출력되는 음식점 컬렉션 : \(entity.name)")
                
                self.restourantMock.append(entity)
                
            }
            
        })
        
        
        
        
        
            
        
       
        
            
  
        
        //컬렉션 뷰 설정
        self.restaurantCollectionView.delegate = self
        self.restaurantCollectionView.dataSource = self
        self.restaurantCollectionView.register(UINib(nibName: "RestaurantCell" , bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        
        self.addAgreement()
    }
    @IBAction func tapRefreshBtn(_ sender: UIButton) {
        self.restaurantCollectionView.reloadData()
    }
    
    

    func getRestaurantList(keyword : String, page : Int, size : Int) {
        let headers : HTTPHeaders = [//RestAPI Key
            "Authorization" : "KakaoAK 07bb5489a38bfc0d076146cc3588db4b"
        ]
        //요청할 키워드 파라미터
        let parameters : [String : Any] = [
            "query" : keyword,
            "page" : page,
            "size" : 15
        ]
        let url = "https://dapi.kakao.com/v2/local/search/keyword.json"
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseJSON{ response in
                var restaurants : PlaceList
                print("response : \(response)")
                
                
                do{
                    let decoder = JSONDecoder()
                    switch (response.result){
                    case .success :
                        restaurants = try decoder.decode(PlaceList.self, from: response.data!)
                        print("response : \(restaurants)")
                        self.resultList = restaurants
                    case .failure(let error):
                        print("errorCode : \(error)")
                    }
                
                }catch let parsingError{
                    print("Error", parsingError)
                }
            }.resume()
        
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
    
    
    func getRestaurantImage(keyword : String, page : Int, size : Int) {
        let headers : HTTPHeaders = [//RestAPI Key
            "Authorization" : "KakaoAK 07bb5489a38bfc0d076146cc3588db4b"
        ]
        //요청할 키워드 파라미터
        let parameters : [String : Any] = [
            "query" : keyword,
            "page" : page,
            "size" : 1
        ]
        let url = "https://dapi.kakao.com/v2/search/image"

        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseJSON{ response in
                var images : ImageList
                print("response : \(response)")
                
                
                do{
                    let decoder = JSONDecoder()
                    switch (response.result){
                    case .success :
                        images = try decoder.decode(ImageList.self, from: response.data!)
                        print("response : \(images)")
                        self.resultImgList? = images
                        self.arrayImg.append(URL(string : images.documents[0].image_url)!)
                    case .failure(let error):
                        print("errorCode : \(error)")
                    }
                
                }catch let parsingError{
                    print("Error", parsingError)
                }
            }.resume()
        
    }

}
extension FindRestaurantViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restourantMock.count
    }
    
    //셀 값 초기화
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = restaurantCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! RestaurantCell
        cell.restaurantName.text = restourantMock[indexPath.row].name// 음식점 이름
        cell.foodImg.image = restourantMock[indexPath.row].img // 음식점 이미지
        cell.position.text = restourantMock[indexPath.row].position
        return cell
    }
    
    //delegate 셀 클릭시 이벤트 발생
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "FoodDetailViewController") as? FoodDetailViewController else { return }
        let restaurant = restourantMock[indexPath.row].self
        pushVC.restaurantEntity = restaurant
        self.navigationController?.pushViewController( pushVC, animated: true)
        
        
        
        
    }
    
    //xib사용시 의미가 없나?
    //xib 오토레이아웃만 적용되는 상황
//    func collecttionView(_collectionView : UICollectionView, layout collectionViewLayout : UICollectionViewLayout, sizeForItemAt indexPath : IndexPath) -> CGSize{
//
//        let width = restaurantCollectionView.bounds.width
//        let height = restaurantCollectionView.bounds.height
//        let itemsPerRow : CGFloat = 2
//        let widthPadding = sectionInsets.left * (itemsPerRow + 1 )
//        let itemsPerColumn : CGFloat = 5
//        let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
//        let cellWidth = (width - widthPadding)  / itemsPerRow
//        let cellHeight = (height - heightPadding) / itemsPerColumn
//
//
//        return CGSize(width: cellWidth , height: cellHeight)
//    }
    
   
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) ->
//    UIEdgeInsets {
//    
//        return sectionInsets
//
//    }
//        
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int)
//    -> CGFloat {
//            return sectionInsets.left
//    
//    }
}
