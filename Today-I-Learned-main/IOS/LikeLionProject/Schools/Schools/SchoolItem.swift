//
//  SchoolItem.swift
//  Schools
//
//  Created by JeongMin Ko on 2022/11/30.
//

import Foundation
struct SchoolItem : Identifiable, Hashable {
    var id = UUID()
    var name : String
    var description : String
}

let schoolItems: [SchoolItem] = [
    SchoolItem(name: "스타트업 스쿨", description: "서비스 탄생의 시작과 끝을 만드는 MVP 프로젝트"),
    SchoolItem(name: "앱 스쿨", description: "개발 기초와 실무 능력을 갖춘 iOS 개발자 양성 교육"),
    SchoolItem(name: "블록체인 스쿨", description: ""),
    SchoolItem(name: "백엔드 스쿨", description: ""),
    SchoolItem(name: "AI 스쿨", description: ""),
    SchoolItem(name: "프론트엔드  스쿨", description: "")

]
