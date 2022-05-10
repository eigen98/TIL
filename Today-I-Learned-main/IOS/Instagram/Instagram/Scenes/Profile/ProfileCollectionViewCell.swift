//
//  ProfileCollectionViewCell.swift
//  Instagram
//
//  Created by JeongMin Ko on 2022/05/10.
//

import Foundation
import UIKit
import SnapKit

final class ProfileCollectionViewCell : UICollectionViewCell{
    private let imageView = UIImageView()
    
    func setup(with image : UIImage){
        addSubview(imageView)
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        imageView.backgroundColor = .tertiaryLabel
    }
}
