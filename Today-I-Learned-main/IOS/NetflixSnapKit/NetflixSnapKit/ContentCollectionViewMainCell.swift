//
//  ContentCollectionViewMainCell.swift
//  NetflixSnapKit
//
//  Created by JeongMin Ko on 2022/05/05.
//

import Foundation
import UIKit

class ContentCollectionMainCell : UICollectionViewCell{
    //스택뷰
    let baseStackView = UIStackView()
    let menuStackView = UIStackView()
    //버튼
    let tvButton = UIButton()
    let movieButton = UIButton()
    let categoryButton = UIButton()
    
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let contentStackView = UIStackView()
    
    let plusButton = UIButton()
    let playButton = UIButton()
    let infoButton = UIButton()
    
    override func layoutSubviews() {
    
        super.layoutSubviews()
        [baseStackView, menuStackView].forEach{
            contentView.addSubview($0)
        }
        
        //실제로 스택뷰를 스토리보드에서 추가했을때
        //baseStackView
        baseStackView.axis = .vertical
        baseStackView.alignment = .center
        baseStackView.distribution = .fillProportionally
        baseStackView.spacing = 5
        
        [imageView, descriptionLabel, contentStackView].forEach{
            baseStackView.addArrangedSubview($0) //스택뷰에 추가하는 방법
        }
        imageView.contentMode = .scaleAspectFit //이미지뷰 설정
        imageView.snp.makeConstraints{
            $0.width.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
        
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.sizeToFit()
        
        contentStackView.axis = .horizontal
        contentStackView.alignment = .center
        contentStackView.distribution = .equalCentering
        contentStackView.spacing = 20
        
        [plusButton, infoButton].forEach{
            contentStackView.addArrangedSubview($0) //스택뷰에 추가
            $0.titleLabel?.font = .systemFont(ofSize: 13)
            $0.setTitleColor(.white, for: .normal)
            $0.imageView?.tintColor = .white
            $0.adjustVerticalLayout(5)
            
        }
        
        plusButton.setTitle("내가 찜한 콘텐츠", for: .normal)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        infoButton.setTitle("정보", for: .normal)
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        
        contentStackView.addArrangedSubview(playButton)
        playButton.setTitle("재생", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.backgroundColor = .white
        playButton.layer.cornerRadius = 3
        playButton.snp.makeConstraints{
            $0.width.equalTo(90)
            $0.height.equalTo(30)
            
        }
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        
        
        contentStackView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        
        baseStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        //menusStackView
        
        menuStackView.axis = .horizontal
        baseStackView.alignment = .center
        menuStackView.distribution = .equalSpacing
        menuStackView.spacing = 20
        
        [tvButton, movieButton, categoryButton].forEach{
            menuStackView.addArrangedSubview($0)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.shadowColor = UIColor.black.cgColor // cgColor를 받을때는 UIColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowRadius = 3
        }
        
        tvButton.setTitle("TV 프로그램", for: .normal)//버튼 타이틀 설정
        movieButton.setTitle("영화", for: .normal)
        categoryButton.setTitle("카테고리", for: .normal)
        
        //버튼 IB액션 추가하는 것과 같음
        tvButton.addTarget(self, action: #selector(tvButtonTapped(sender:)), for: .touchUpInside)
        movieButton.addTarget(self, action: #selector(tvButtonTapped(sender:)), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(tvButtonTapped(sender:)), for: .touchUpInside)
        
        menuStackView.snp.makeConstraints{
            $0.top.equalTo(baseStackView.snp.top)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }
    //탭했을 때 어떤 버튼을 탭했을때 구현할 동작
    @objc func tvButtonTapped(sender : UIButton!){
        print("TEST : TV Button Tapped")
    }
    //탭했을 때 어떤 버튼을 탭했을때 구현할 동작
    @objc func movieButtonTapped(sender : UIButton!){
        print("TEST : Movie Button Tapped")
    }
    //탭했을 때 어떤 버튼을 탭했을때 구현할 동작
    @objc func categoryButtonTapped(sender : UIButton!){
        print("TEST : Category Button Tapped")
    }
    @objc func plusButtonTapped(sender : UIButton!){
        print("TEST : plus Button Tapped")
    }
    @objc func infoButtonTapped(sender : UIButton!){
        print("TEST : info Button Tapped")
    }
    @objc func playButtonTapped(sender : UIButton!){
        print("TEST : play Button Tapped")
    }
    
}
