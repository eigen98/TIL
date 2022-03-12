//
//  FoodDetailViewController.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/11.
//

import UIKit
import Alamofire

class FoodDetailViewController: UIViewController {

   
    
    @IBOutlet weak var foodDetailCollectionView: UICollectionView!
    
    var restaurantEntity : Restaurant = Restaurant(img: UIImage(imageLiteralResourceName: "img_food1"), name: "String", rate: "String", countView: "", countReview: "", position: "")
    
    
    @IBOutlet weak var restaurantName: UILabel!
    
    @IBOutlet weak var addressNow: UILabel!
    
    var listImg : ImageList?
    var arrayImg : [URL] = [URL]()
    
    var uiImageList : [UIImage] = [UIImage]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //이미지 불러오기
        getRestaurantImage(keyword : restaurantEntity.name, page : 1, size : 3)
        print("검색한 이미지의 음식점은 : \(restaurantEntity.name)")
        self.restaurantName.text = restaurantEntity.name
        self.addressNow.text = restaurantEntity.position
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.foodDetailCollectionView.reloadData()
            print("사진 업데이트 : \(self.uiImageList.count)")
        })
        
        
        
        
        //이미지 불러오기 (가져온 url을 통해 이미지 불러오기)
        DispatchQueue.global().asyncAfter(deadline: .now()+1, execute: {
            for i in 0...(self.listImg?.documents.count)! - 1 {
                
                let img = self.listImg?.documents[i]
                print("불러온 url \(img!.image_url)")
                let url  : URL = URL(string : img!.image_url)!
                var urlImg : UIImage = UIImage()
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            urlImg = image
                            
                        }
                        
                    }
                    
                }

                self.uiImageList.append(urlImg) //불러온 ui이미지 베열에 추가
                print("불러온 ui이미지 베열에 추가 \(urlImg)")
                
            }
            
        })
        
        
        
        self.foodDetailCollectionView.dataSource = self
        self.foodDetailCollectionView.register(UINib(nibName: "FoodDetailCell" , bundle: nil), forCellWithReuseIdentifier: "FoodCollectionCell")
    }
    
    @IBAction func cameraBtn(_ sender: UIButton) {
        self.foodDetailCollectionView.reloadData()
    }
    @IBAction func backBton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    //이미지 호출 api (url세개 불러오기)
    func getRestaurantImage(keyword : String, page : Int, size : Int) {
        let headers : HTTPHeaders = [//RestAPI Key
            "Authorization" : "KakaoAK 07bb5489a38bfc0d076146cc3588db4b"
        ]
        //요청할 키워드 파라미터
        let parameters : [String : Any] = [
            "query" : keyword,
            "page" : page,
            "size" : 3
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
                        self.listImg = images
                    case .failure(let error):
                        print(" 상세 이미지 로드 실패 : \(error)")
                    }
                
                }catch let parsingError{
                    print("상세 이미지 로드 실패", parsingError)
                }
            }.resume()
        
    }

    
    
    

    

}

extension FoodDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return uiImageList.count
    }
    
    //셀 값 초기화
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodDetailCollectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionCell", for: indexPath) as! FoodDetailCell
        cell.uiImageView.image = uiImageList[indexPath.row]
        return cell
    }
    
}
