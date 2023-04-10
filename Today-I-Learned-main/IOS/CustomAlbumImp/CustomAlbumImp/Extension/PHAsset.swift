//
//  PHAsset.swift
//  CustomAlbumImp
//
//  Created by JeongMin Ko on 2023/04/09.
//

import UIKit
import Photos
extension PHAsset {
    // 사진선택 - 앨범에 표시할 이미지 return
    func getAssetThumbnail() -> UIImage {
//        let manager = PHImageManager.default()
        let manager = PHCachingImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        manager.requestImage(for: self,
                                targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight),
                                contentMode: .aspectFit,
                                options: option,
                                resultHandler: {(result, info) -> Void in
            if let img = result {
                thumbnail = img
            }
            
        })
        return thumbnail
    }
}
