//
//  Place.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/12.
//

import Foundation

public struct Place : Codable{
    let placeName : String //place_name
    let roadAddressName : String //road_address_name
    let longitudeX : String // x
    let latitudeY : String //y
    let placeUrl : String // place_url
    let distance : String
    
    enum CodingKeys : String , CodingKey{
        case placeName = "place_name"
        case roadAddressName = "road_address_name"
        case longitudeX = "x"
        case latitudeY = "y"
        case placeUrl = "place_url"
        case distance
    }
    
    init(placeName : String, roadAddressName : String, longitudeX : String, latitudeY : String, placeUrl : String, distance : String){
        self.placeName = placeName
        self.roadAddressName = roadAddressName
        self.longitudeX = longitudeX
        self.latitudeY = latitudeY
        self.placeUrl = placeUrl
        self.distance = distance
    }
    
}
public struct PlaceList : Codable {
    let documents : [Place]
}

public struct ImageList : Codable {
    var documents : [RestaurantImage]
}

public struct RestaurantImage : Codable{
    let image_url : String
}

