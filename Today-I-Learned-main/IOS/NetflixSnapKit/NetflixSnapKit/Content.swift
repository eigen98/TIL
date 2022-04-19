//
//  Content.swift
//  NetflixSnapKit
//
//  Created by JeongMin Ko on 2022/04/19.
//

import Foundation

struct Content : Decodable{
    let sectionType : String
    let sectionName : String
    let contentItem : [Item]
}

struct Item : Decodable {
    let description : String
    let imageNAme : String
    
}
