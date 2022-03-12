//
//  DetailDescription.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/11.
//

import Foundation

enum DetailSection {
    case descriptionCase([DescriptionModel])
    case mapCase([MapModel])
    case callCase([CallModel])
    case informationCase([InformationModel])
}

//식당 설명
struct DescriptionModel{
    let titleText: String?
    let descriptionText: String?
}

//지도 설명
struct MapModel{
    let addressText: String?
}

//전화하기 버튼
struct CallModel{
    
    
}

//편의정보
struct InformationModel{
    //업데이트 날짜
    let updateDate : String?
    let priceText : String? //가격정보
    
}

