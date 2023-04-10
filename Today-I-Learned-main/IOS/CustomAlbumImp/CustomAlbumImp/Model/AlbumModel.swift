//
//  AlbumModel.swift
//  CustomAlbumImp
//
//  Created by JeongMin Ko on 2023/04/09.
//

import Foundation
import Photos
// 앨범
struct AlbumModel {
    let name: String // 앨범 title
    let photoAssets: PHFetchResult<PHAsset> // 해당 앨범에 포함된 사진 assets
}
