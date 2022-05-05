//
//  ContentCollectionViewCell.swift
//  NetflixSnapKit
//
//  Created by JeongMin Ko on 2022/05/05.
//

import Foundation
import UIKit
import SnapKit

class ContentCollectionViewCell : UICollectionViewCell{
    
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //contentView는 뭐지? => UICollectionViewCell타입의경우 컨텐츠뷰라는 기본 객체가 있음. self.backgroundColor로 실제 레이아웃에 표현 안 됨.
        // 이 컨텐츠 뷰를 슈퍼 뷰로 보고 이 위에서 서브뷰들을 올리는 것.
        contentView.backgroundColor = .white //배경 설정
        contentView.layer.cornerRadius  = 5
        contentView.clipsToBounds = true
        
        //우리가 표시할 이미지 모드
        imageView.contentMode = .scaleToFill
        //뷰에 서브뷰를 추가.
        contentView.addSubview(imageView) //스토리보드에서 라벨이나 버튼, 이미지를 끌어오는 것과 동일한 기능
        
        //오토레이아웃 설정 => 바로 여기서 스냅킷을 사용
        imageView.snp.makeConstraints{
            //모든 엣지에 맞게 붙여줘!
            $0.edges.equalToSuperview()
        }
    }
}
