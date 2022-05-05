//
//  ContentCollectionViewRankCell.swift
//  NetflixSnapKit
//
//  Created by JeongMin Ko on 2022/05/05.
//

import Foundation
import UIKit
import SwiftUI

class ContentCollectionViewRankCell : UICollectionViewCell {
    let imageView = UIImageView()
    let rankLabel = UILabel()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //contentView
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        //imageView
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
            $0.bottom.equalToSuperview().multipliedBy(0.8)
        }
        
        //rnakLabel
        rankLabel.font = .systemFont(ofSize: 100, weight : .black)
        rankLabel.textColor = . white
        contentView.addSubview(rankLabel)
        rankLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(25)
        }
    }
}
