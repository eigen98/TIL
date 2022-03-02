//
//  WheatherInformation.swift
//  Weather
//
//  Created by JeongMin Ko on 2022/02/23.
//

import Foundation

struct WeatherInformation : Codable{
    let weather : [Weather]
    let temp : Temp
    let name : String
    
    
    
    enum CodingKeys : String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}


struct Weather : Codable{
    let id  : Int
    let main : String
    let description : String
    let icon : String
}

struct Temp : Codable {
    let temp : Double
    let feelsLike : Double
    let minTemp : Double
    let maxTemp : Double
    
    enum CodingKeys : String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
    
}
