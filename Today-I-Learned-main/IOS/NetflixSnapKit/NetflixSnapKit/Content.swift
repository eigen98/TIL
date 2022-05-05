//
//  Content.swift
//  NetflixSnapKit
//
//  Created by JeongMin Ko on 2022/04/19.
//

import Foundation
import UIKit

struct Content : Decodable{
    let sectionType : SectionType
    let sectionName : String
    let contentItem : [Item]
    
    //몇가지 타입형태 (케이스가 여러개)는 enum으로 바꾸는 것이 직관적
    enum SectionType : String, Decodable {
        case basic
        case main
        case large
        case rank
    }
}

struct Item : Decodable {
    let description : String
    let imageName : String
    
    var image : UIImage{
        return UIImage(named: imageName) ?? UIImage()
    }
}
