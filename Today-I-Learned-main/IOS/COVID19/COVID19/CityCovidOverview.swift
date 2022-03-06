//
//  CityCovidOverview.swift
//  COVID19
//
//  Created by JeongMin Ko on 2022/03/05.
//

import Foundation

struct CityCovidOverview : Codable{
    //시도명 맵핑
    let korea : CovidOverview
    let seoul : CovidOverview
    let busan : CovidOverview
    let daegu : CovidOverview
    let incheon : CovidOverview
    let gwangjo : CovidOverview
    let daejeon : CovidOverview
    let ulsan : CovidOverview
    let sejong : CovidOverview
    let gyeongggi : CovidOverview
    let gangwon : CovidOverview
    let chungbuk : CovidOverview
    let jeonbuk : CovidOverview
    let jeonnam : CovidOverview
    let gyeongbuk : CovidOverview
    let gyeongnam : CovidOverview
    let jeju : CovidOverview
}


//json응답을 받아줄 구조체
struct CovidOverview : Codable {
    let TotalCase : String
    let NowCase : String
   
}
