//
//  Model.swift
//  VaporDemo
//
//  Created by JeongMin Ko on 2022/12/05.
//

import Foundation
struct GitMemberInfo: Codable, Hashable {
    var login: String? // 회원 정보
    var id: Int?
    var avatar_url : String?
    var html_url : String?
    var name : String?
    var followers : Int?
    var following : Int?
    var bio : String?
   
}
