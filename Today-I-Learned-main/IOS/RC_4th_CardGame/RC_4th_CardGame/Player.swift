//
//  Player.swift
//  RC_4th_CardGame
//
//  Created by JeongMin Ko on 2022/03/02.
//

import Foundation

//플레이어 객체
class Player{
    var playerName : String
    var cardNumber : Int
    var cardList : Array<Card>
    
    init(playerName : String, cardNumber : Int, cardList : Array<Card>){
        self.playerName = playerName
        self.cardNumber = cardNumber
        self.cardList = cardList
    }

}
