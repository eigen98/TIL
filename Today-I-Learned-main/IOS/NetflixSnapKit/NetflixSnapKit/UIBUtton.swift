//
//  UIBUtton.swift
//  NetflixSnapKit
//
//  Created by JeongMin Ko on 2022/05/06.
//

import Foundation
import UIKit

extension UIButton{
    //이미지와 타이틀 사이의 값을 스페이싱을 넣어서 배열하는 함수.
    func adjustVerticalLayout(_ spacing : CGFloat = 0){
        let imageSize = self.imageView?.frame.size ?? .zero
        let titleLabelSize = self.titleLabel?.frame.size ?? .zero
        
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleLabelSize.height + spacing), left: 0, bottom: 0, right: -titleLabelSize.width)
    }
}
