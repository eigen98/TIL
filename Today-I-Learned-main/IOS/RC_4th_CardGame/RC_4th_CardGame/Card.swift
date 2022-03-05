//
//  Card.swift
//  RC_4th_CardGame
//
//  Created by JeongMin Ko on 2022/03/02.
//

import Foundation
import UIKit

//카드 객체
class Card{
    var number : Int
    var shape : String
    var pokerImg : UIImage!
    
    init(number : Int, shape : String, img : String){
        self.number = number
        self.shape = shape
        self.pokerImg = UIImage(named: img)
    }
    
    init(number : Int, shape : String, img : UIImage?){
        self.number = number
        self.shape = shape
        self.pokerImg = img
    }
    
}
