//
//  PhotoCollectionViewCell.swift
//  CustomAlbumImp
//
//  Created by JeongMin Ko on 2023/04/09.
//

import UIKit
import Photos

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var countView: UIView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var cameraIconImageView: UIImageView!
    
    var imagePath : URL?
    var indexRow : Int?
    // 사용자의 사진 라이브러리에서 이미지 및 기타 미디어 Asset을 검색할 수 있도록 하는 Apple에서 제공하는 Photos 프레임워크의 클래스
    var imageManager : PHCachingImageManager?
    
    
    var fetchImageCompletion : ((UIImage, String) -> Void)?
    var photoIdentifier = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        //셀이 화면 밖으로 이동시 or 셀 재사용시 호출
    }
    
    func fetchImage(asset: PHAsset, contentMode: PHImageContentMode , targetSize: CGSize) {
        
        let options = PHImageRequestOptions()
        options.version = .original
        
        //options.deliveryMode = .fastFormat
        print("에셋 : \(asset)")
        
        imageManager?.requestImage(for: asset, targetSize: targetSize, contentMode: contentMode, options: options) { image, _ in
            guard let image = image else { return }
            
            if self.photoIdentifier == asset.localIdentifier{
                self.photoImageView.image = image
                self.fetchImageCompletion?(image, "\(self.imagePath?.description ?? "")")
            }
            
            if self.indexRow == 0{
                self.cameraIconImageView.isHidden = false
                self.photoImageView.image = nil
                self.photoImageView.backgroundColor = .subGrey
                self.countView.isHidden = true
                self.isUserInteractionEnabled = true
            }
            
            asset.requestContentEditingInput(with: PHContentEditingInputRequestOptions()) { (eidtingInput, info) in
                if let input = eidtingInput, let imgURL = input.fullSizeImageURL {
                    
                    if self.photoIdentifier == asset.localIdentifier{
                        self.imagePath = imgURL
                        self.fetchImageCompletion?(image, "\(self.imagePath?.description ?? "")")
                        
                    }
                }
            }
            self.contentMode = .scaleAspectFill
        }
    }
}
