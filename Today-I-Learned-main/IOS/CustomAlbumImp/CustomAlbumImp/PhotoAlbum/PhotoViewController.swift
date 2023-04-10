//
//  PhotoViewController.swift
//  CustomAlbumImp
//
//  Created by JeongMin Ko on 2023/04/09.
//

import UIKit
import Photos

class PhotoViewController: UIViewController {

    
    //Album Name 표시(최근 버튼)
    @IBOutlet weak var albumChangeButton: UIButton!
    //Album Name 이미지 표시
    @IBOutlet weak var albumChangeImageView: UIImageView!
    // 앨범 리스트 TableView
    @IBOutlet weak var albumTableView: UITableView!
    // 사진 CollectionView
    @IBOutlet weak var PhotoCollectionView: UICollectionView!
    let cachingImageManager = PHCachingImageManager()
    //앨범 배열
    var allPhotos : PHFetchResult<PHAsset>? = nil
    var photocount = Int()
    
    var albums: [AlbumModel] = [AlbumModel]()
    var albumIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initAlbum()
        
        albumTableView.delegate = self
        albumTableView.dataSource = self
        albumTableView.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: "AlbumTableViewCell")
        
        PhotoCollectionView.delegate = self
        PhotoCollectionView.dataSource = self
        PhotoCollectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        
        fetchAlbum()
        PhotoCollectionView.reloadData()
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    func initAlbum(){
        albumChangeButton.isSelected = true
        albumChangeImageView.isHidden = false
        albumTableView.isHidden = true
        PhotoCollectionView.isHidden = false
    }
   
    func fetchAlbum(){
        
        
    
        // 앨범별로 album 변수에 저장
        let fetchCollections = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options:  PHFetchOptions())
        
        DispatchQueue.main.async {
            fetchCollections.enumerateObjects{ (object: AnyObject!, count: Int, stop: UnsafeMutablePointer) in
                if object is PHAssetCollection {
                    let obj : PHAssetCollection = object as! PHAssetCollection
                    
                    let fetchOptions = PHFetchOptions()
                    fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                    
                    var photoAssets = PHFetchResult<PHAsset>()
                    photoAssets = PHAsset.fetchAssets(in: obj, options: fetchOptions)
                    
                    fetchOptions.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
                    
                    let newAlbum = AlbumModel(name: obj.localizedTitle!, photoAssets: photoAssets)
                    self.albums.append(newAlbum)
                    self.albumTableView.reloadData()
                    self.PhotoCollectionView.reloadData()
                    print("\(self.albums.count) : 앨범Count")
                }
            }
            let allPhotoAlbum = AlbumModel(name: "최근", photoAssets: self.allPhotos!)
            self.albums.insert(allPhotoAlbum, at: 0)
        }
        
    }
    
    func settingAlbum(){
        // 모든 사진 담은 '최근' 폴더 insert
        // 사진첩 전체 사진 asset 변수
       
        
        let allPhotoAlbum = AlbumModel(name: "최근", photoAssets: allPhotos!)
        albums.insert(allPhotoAlbum, at: 0)
    }


}
//앨범 리스트
//MARK: TableView DataSource, Delegate
extension PhotoViewController :  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as! AlbumTableViewCell
        cell.selectionStyle = .none
        cell.albumLabel.text = albums[indexPath.row].name
        if let thumbnail = albums[indexPath.row].photoAssets.firstObject?.getAssetThumbnail() {
            cell.albumImageView.image = thumbnail
        } else {
            cell.albumImageView.image = UIImage(named: "")
        }
        cell.countLabel.text = String(albums[indexPath.row].photoAssets.count)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        albumIndex = indexPath.row
        print("선택된 앨범 albumIndex :\(albumIndex)")
//        print("전체 selectedIndex :\(selectedIndex)")
//        albumChangeButton.setTitle("\(album[indexPath.row].name)", for: .selected)
//        var width = textFitContentSize(str: "\(album[indexPath.row].name)").width
//        albumChangeBtnWidthConstraint.constant = width
//        photoCollectionView.reloadData()
//        tableView.isHidden = true
//        photoCollectionView.isHidden = false
//        albumChangeButton.isSelected = true
//        doneButton.isHidden = false
//        changeButtonImageView.isHidden = false
//
        
    }
    
}

//사진 리스트
//MARK: CollectionView DataSource, Delegate
extension PhotoViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if albums.isEmpty{
            print("1개")
            return 1
        }else{
            print("여러개")
            print("\(albums[albumIndex].photoAssets.count) 개 ")
            return albums[albumIndex].photoAssets.count + 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
       
        cell.isUserInteractionEnabled = false //이미지 로딩중 터치차단
        //카메라 촬영 셀
        if indexPath.row == 0 {
            cell.cameraIconImageView.isHidden = false
            cell.photoImageView.image = nil
            cell.photoImageView.backgroundColor = .gray
            cell.countView.isHidden = true
            cell.isUserInteractionEnabled = true
            cell.indexRow = 0
        } else {
            //사진 셀
            
            cell.imageManager = self.cachingImageManager
            cell.cameraIconImageView.isHidden = true
            cell.photoImageView.backgroundColor = .gray
            cell.photoImageView.isHidden = false
            cell.indexRow = indexPath.row
            let asset = albums[albumIndex].photoAssets.object(at: indexPath.row - 1)
            cell.photoImageView.image = UIImage()
//            if indexPath.row <= tempImages.count {
//                cell.photoImageView.image = tempImages[indexPath.row - 1]
//            }
            cell.photoIdentifier = asset.localIdentifier
            cell.fetchImage(asset: asset, contentMode: .aspectFill, targetSize: CGSize(width: 360, height: 360))
            self.cachingImageManager.requestImage(for: asset,
                                                  targetSize: <#T##CGSize#>,
                                                  contentMode: <#T##PHImageContentMode#>,
                                                  options: <#T##PHImageRequestOptions?#>,
                                                  resultHandler: <#T##(UIImage?, [AnyHashable : Any]?) -> Void#>)

            
            
            
//            cell.fetchImageCompletion = { image, urlStr in
//                print("urlStr : \(urlStr ?? "")")
//
//             //   self.tempImages.append(image)
//
//               // 선택된 사진이 아닌 경우 (해당 앨범 index에서 사진 indexPath가 없는 경우) -> 선택
//                if !self.selectedIndex.contains(where: {
//                    $0.albumIndex == self.albumIndex && urlStr ?? "" == "file://\($0.photoPath)"
//                }){
//                    cell.countLabel.text = ""
//                    cell.countView.backgroundColor = .clear
//                    cell.countView.borderWidth = 2
//                    cell.photoImageView.borderWidth = 0
//
//                }else{
//                    //선택된 사진인 경우
//                    var count = self.selectedIndex.firstIndex(where: {
//                        $0.albumIndex == self.albumIndex && urlStr ?? "" == "file://\($0.photoPath)"
//                    })
//                    let cell1 = collectionView.cellForItem(at: .init(row: indexPath.row, section: 0) ) as? PhotoCollectionViewCell
//                    cell1?.countLabel.text = String((count ?? 0) + 1)
//                    //photoPathList.append(cell.imagePath!.path)
//
//                    cell1?.countView.backgroundColor = .mainYellow
//                    cell1?.countView.borderWidth = 0
//                    cell1?.photoImageView.borderWidth = 4
//                    cell1?.photoImageView.borderColor = .mainYellow
//
//                }
//                cell.isUserInteractionEnabled = true //이미지 로딩 종료후 터치
//            }
//
        }
        
        
        return cell
        
    }
    
    
}


