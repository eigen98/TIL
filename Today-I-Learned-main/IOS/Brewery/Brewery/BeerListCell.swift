//
//  BeerListCell.swift
//  Brewery
//
//  Created by JeongMin Ko on 2022/05/07.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher


class BeerListCell : UITableViewCell{
    let beerImageView = UIImageView()
    let nameLabel = UILabel()
    let taglinelabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [beerImageView, nameLabel, taglinelabel].forEach{
            contentView.addSubview($0)
        }
        
        beerImageView.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.numberOfLines = 2
        
        taglinelabel.font = .systemFont(ofSize: 14, weight: .light)
        taglinelabel.textColor = .systemBlue
        taglinelabel.numberOfLines = 0
        
        beerImageView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.top.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(120)
            
        }
        
        nameLabel.snp.makeConstraints{
            $0.leading.equalTo(beerImageView.snp.trailing).offset(10)
            $0.bottom.equalTo(beerImageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            
            
        }
        
        taglinelabel.snp.makeConstraints{
            $0.leading.trailing.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
        
    }
    
    //해당 엔티티를 받아서 셀의ui컴포넌트에 뿌려줌.
    func configure(with beer : Beer){
        let imageURL = URL(string: beer.imageURL ?? "")
        beerImageView.kf.setImage(with: imageURL, placeholder: UIImage(systemName: "kingfisher-1"))
        nameLabel.text = beer.name ?? "이름 없는 맥주"
        taglinelabel.text = beer.tagLine
        
        accessoryType = .disclosureIndicator // 꺽쇄 추가
        selectionStyle = .none //회색 음영 설정
        
        
        
    }
    
}
