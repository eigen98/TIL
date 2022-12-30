//
//  People.swift
//  LadarAnimationChallenge
//
//  Created by JeongMin Ko on 2022/12/26.
//

import Foundation
struct People : Identifiable{
    var id = UUID().uuidString
    var image: String
    var name: String
    //Offset will be used for showing user in pulse animation...
    var offset: CGSize = CGSize(width: 0, height: 0)
    
}

var peoples = [
    People( image: "eraser", name: "Eigen"),
    People( image: "square.and.pencil.circle.fill", name: "Sral"),
    People( image: "scribble", name: "Garosh"),
    People( image: "pencil.tip.crop.circle", name: "Arthas"),
    People( image: "pencil.tip.crop.circle", name: "Arthas")

]

var firstFiveOffsets : [CGSize] = [
    CGSize(width: 100, height: 100),
    CGSize(width: -100, height: -100),
    CGSize(width: -50, height: 130),
    CGSize(width: 50, height: -130),
    CGSize(width: 120, height: -50)
]
