//
//  ContentCollectionViewMainCell.swift
//  NetflixSnapKit
//
//  Created by JeongMin Ko on 2022/05/05.
//

import Foundation
import UIKit

class ContentCollectionMainCell : UICollectionViewCell{
    let baseStackView = UIStackView()
    let menuStackView = UIStackView()
    
    override func layoutSubviews() {
    
        super.layoutSubviews()
        [baseStackView, menuStackView].forEach{
            contentView.addSubview(<#T##view: UIView##UIView#>)
        }
    }
}
