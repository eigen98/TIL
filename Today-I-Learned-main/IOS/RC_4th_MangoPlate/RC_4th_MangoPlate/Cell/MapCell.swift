//
//  MapCell.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/11.
//

import Foundation
import UIKit
import SnapKit
import Then


class MapCell : UITableViewCell {
  
    static let id = "MapCell"
  
  
    // MARK: Top
  
    private let topContainerView = UIView()
  
    private let textStackView = UIStackView().then {
    
        $0.axis = .vertical
    
        $0.spacing = 8.0
  
    }

    //길찾기 네비 택시 주소복사 버튼 스택뷰
    private let btnStackView = UIStackView().then {
      $0.axis = .horizontal
      $0.spacing = 8.0
    }
    //주소 텍스트
  private let addressLabel = UILabel().then {
    $0.textColor = .label
    
    $0.font = .systemFont(ofSize: 16, weight: .bold)
  }
    //지번 텍스트
  private let descLabel = UILabel().then {
    $0.textColor = .secondaryLabel
    $0.font = .systemFont(ofSize: 14)
  }
  
  // MARK: Bottom
  private let bottomContainerView = UIView()
  private let bottomLabel = UILabel().then {
    $0.textColor = .label
    $0.font = .systemFont(ofSize: 14)
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    
    self.setupTopLayout()
    self.setupBottomLayout()
  }
    //???
  required init?(coder: NSCoder) {
    fatalError()
  }
  override func prepareForReuse() { // 재사용되는 셀 속성 초기화
    super.prepareForReuse()
    self.prepare( titleText: nil, supplementText: nil)
  }

  private func setupTopLayout() {
    self.contentView.addSubview(self.topContainerView) //컨테이너 뷰 안에 뷰 추가
    [
     self.textStackView //스택뷰 추가
    ]
      .forEach { [weak self] in self?.contentView.addSubview($0) }
    [self.addressLabel,
     self.descLabel]
      .forEach { [weak self] in self?.textStackView.addArrangedSubview($0) }
    
//    self.profileImageView.snp.makeConstraints {
//      $0.top.bottom.left.equalToSuperview()
//      $0.size.equalTo(70).priority(999)
//    }
//    self.textStackView.snp.makeConstraints {
//      $0.centerY.equalToSuperview()
//      $0.left.equalTo(self.profileImageView.snp.right).offset(8)
//    }
//    self.lineView.snp.makeConstraints {
//      $0.right.bottom.equalToSuperview()
//      $0.left.equalTo(self.profileImageView.snp.right)
//      $0.height.equalTo(1)
//    }
  }
  private func setupBottomLayout() {
    self.contentView.addSubview(self.bottomContainerView)
    [self.bottomLabel]
      .forEach { [weak self] in self?.contentView.addSubview($0) }
    
    self.bottomContainerView.snp.makeConstraints {
      $0.top.equalTo(self.topContainerView.snp.bottom)
    }
    self.bottomLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.left.equalToSuperview().inset(16)
    }
  }
  func prepare( titleText: String?, supplementText: String?) {
    //self.profileImageView.image = profileImage
    self.addressLabel.text = titleText
    self.descLabel.text = supplementText
  }
}
