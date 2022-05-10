//
//  ProfileDataView.swift
//  Instagram
//
//  Created by JeongMin Ko on 2022/05/10.
//

import Foundation

import SnapKit
import UIKit

final class ProfileDataView : UIView {
    private let title : String
    private let count : Int
    
    //두개의 라벨을 추가
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.text = "title"
        
        return label
    }()
    private lazy var countLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.text = "\(count)"
        
        return label
    }()
    
    init(title : String, count : Int){
        self.title = title
        self.count = count
        super.init(frame: .zero)
        setupLayout()
    }
    required init(coder: NSCoder) {
        fatalError()
    }
}
private extension ProfileDataView {
    func setupLayout(){
        let stackView = UIStackView(arrangedSubviews: [countLabel, titleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing =  4.0
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
