//
//  UIColor+.swift
//  CustomAlbumImp
//
//  Created by JeongMin Ko on 2023/04/09.
//

import Foundation
import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    class var mainYellow: UIColor { UIColor(hex: 0xfcb600) }
    class var mainBlue: UIColor { UIColor(hex: 0x403dec) }
    class var mainBlack: UIColor { UIColor(hex: 0x363639) }
    class var whiteGrey: UIColor { UIColor(hex: 0xf7f8fc) }
    class var subGrey: UIColor { UIColor(hex: 0x8f9093) }
    class var light_grey: UIColor { UIColor(hex: 0xeff0f4) }
    class var icon_nav: UIColor { UIColor(hex: 0x67686b) }
}
