//
//  ViewController.swift
//  RC_4th_CardGame
//
//  Created by JeongMin Ko on 2022/03/01.
//

import UIKit



class ViewController: UIViewController {

    //각자 카드 개수
    var firstCardNumber = 7
    var secondCardNumber = 7
    var cardKind : Array<String> = ["HEART" , "DIAMOND", "SPADE", "CLOVA"]
    var dummyCard : Array<Card>?
    
    var player1 : Player?
    var player2 : Player?

    @IBOutlet weak var firstCard: UIImageView!
    
    @IBOutlet weak var cardStack: UIImageView!
    
    @IBOutlet weak var secondStack: UIStackView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var firstStack: UIStackView!
    
    //각자의 카드 패
    // Opponenet
    @IBOutlet weak var card1: UIImageView!
    
    @IBOutlet weak var card2: UIImageView!
    
    // My card
    @IBOutlet weak var myCard1: UIImageView!
    
    @IBOutlet weak var myCard2: UIImageView!
    
    @IBOutlet weak var myCard3: UIImageView!
    
    @IBOutlet weak var myCard4: UIImageView!
    
    @IBOutlet weak var myCard5: UIImageView!
    
    @IBOutlet weak var myCard6: UIImageView!
    
    @IBOutlet weak var myCard7: UIImageView!
    
    @IBOutlet weak var myCard8: UIImageView!
    
    @IBOutlet weak var myCard9: UIImageView!
    
    @IBOutlet weak var myCard10: UIImageView!
    
    @IBOutlet weak var myCard11: UIImageView!
    
    @IBOutlet weak var myCard12: UIImageView!
    
    @IBOutlet weak var myCard13: UIImageView!
    
    @IBOutlet weak var myCard14: UIImageView!
    
    @IBOutlet weak var myCard15: UIImageView!
    
    @IBOutlet weak var myCard16: UIImageView!
    
    @IBOutlet weak var myCard17: UIImageView!
    
    @IBOutlet weak var myCard18: UIImageView!
    
    @IBOutlet weak var myCard19: UIImageView!
    
    @IBOutlet weak var myCard20: UIImageView!
    
    @IBOutlet weak var myCard21: UIImageView!
    
    @IBOutlet weak var myCard22: UIImageView!
    
    @IBOutlet weak var myCard23: UIImageView!
    
    @IBOutlet weak var myCard24: UIImageView!
    
    @IBOutlet weak var myCard25: UIImageView!
    
    var myDeckImg : Array<UIImageView>?
    
    
    
    var imgBackCard = UIImage(named: "backView")
    
    var imgFrontCard = UIImage(named: "clova2")
   
    var myCount : Int?
    var oppCount : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //게임 시작
        gameStart()
       
        
        let cardStackBtn = UITapGestureRecognizer(target : self, action: #selector(tapCardStack))
        
        firstCard.isUserInteractionEnabled = true
        firstCard.addGestureRecognizer(cardStackBtn)
        
        var imgBackCard = UIImage(named: "backView")
        
        var imgFrontCard = UIImage(named: "clova2")
        
    }
    
    //게임 시작
    func gameStart(){
        //카드 오브젝트 보이기 isHidden
        //카드패 펼쳐지기 -> 내카드 뒤집어 보여주기
        
        //더미 카드 데이터 생성
        dummyCard = [
            
            Card(number: 2, shape : "CLOVA"),
            Card(number: 2, shape : "CLOVA"),
            Card(number: 2, shape : "CLOVA"),
            Card(number: 2, shape : "CLOVA"),
            Card(number: 2, shape : "CLOVA"),
            Card(number: 2, shape : "CLOVA"),
            Card(number: 2, shape : "CLOVA")
            
        ]
        myDeckImg =  [myCard1, myCard2,myCard3,myCard4,myCard5,myCard6,myCard7,myCard8,myCard9, myCard10, myCard11, myCard12, myCard13, myCard14, myCard15, myCard16, myCard17, myCard18, myCard19, myCard20, myCard21, myCard22,myCard23, myCard24, myCard25]
        
        //플레이어 생성
        player1  = Player(playerName: "1P", cardNumber: 7, cardList : (self.dummyCard)!)
        player2  =  Player(playerName: "2P", cardNumber: 7, cardList : (self.dummyCard)!)
        
        //플레이어의 카드 개수
        myCount = player2?.cardList.count
        myCount = player1?.cardList.count
        
    
        //cardSetting(deck: self.secondStack)
        
        
        //카드만큼 보이고 나머지 숨기기
        for x in 1...myCount!{
            myDeckImg![x].isHidden = false
        }
        
        //가진 카드 뒤집기
        for x in 1...myCount!{
            DispatchQueue.main.async {
                self.cardFlip(card: (self.myDeckImg?[x])!)
            }

        }
        
        
        
    }
    
    //카드 받기 ㅡ 카드셋팅 안에서 수행
    func startPointCardDeck(){
        secondStack.isHidden = true // 안보이는 상태로 시작
        
        UIStackView.animate(withDuration: 1.0){
            //내카드 덱 첫 시작위치설정
            //카드 덱 위에서 시작
            let move  = CGAffineTransform(translationX: 80, y: 317)
            //포개어진 상태로 시작
            let scale = CGAffineTransform(scaleX: 0.2, y: 1.0)
            
            let combine = scale.concatenating(move)
            
            self.secondStack.transform = combine
        }
    }
    
    func getCardDeck(){
        secondStack.isHidden = false //카드 보이기
        
        UIStackView.animate(withDuration: 1.0){
            //내카드 덱 첫 시작위치설정
            //카드 덱 위에서 시작
            let move  = CGAffineTransform(translationX: 8, y: 618)
            self.secondStack.transform = move
        }
    }
    
    func spreadCardDeck(){
        
        UIStackView.animate(withDuration: 1.0){
            //내카드 덱 첫 시작위치설정
            //카드 덱 위에서 시작
            let move  = CGAffineTransform(translationX: 8, y: 618)
            //포개어진 상태로 시작
            let scale = CGAffineTransform(scaleX: 5.0, y: 1.0)
            let combine = scale.concatenating(move)
            self.secondStack.transform = combine
        }
    }
    
    
    //카드패 나눠주기 => 카드패 펼쳐지기 => 카드 보이기
    func cardSetting(deck : UIStackView){
        UIStackView.animateKeyframes(withDuration: 5, delay: 0, options: [], animations: {
            
            UIStackView.addKeyframe(withRelativeStartTime: 0.0 , relativeDuration: 0.3){
                self.startPointCardDeck()
                //self.view.layoutIfNeeded()
            }
            UIStackView.addKeyframe(withRelativeStartTime: 0.2 , relativeDuration: 0.3){
                self.getCardDeck()
                //self.view.layoutIfNeeded()
            }
            
            
            
            
            
            
        }, completion: { finished in
            
            UIStackView.addKeyframe(withRelativeStartTime: 0.4 , relativeDuration: 0.3){
                self.spreadCardDeck()
                //self.view.layoutIfNeeded()
            }
            
            
            
        })
    }
    
    //드로우
    func drawCard(){
        
    }
    
    //첫 카드 오른쪽이동
    func moveCardRight(){
        let targetFrame = CGRect(x: view.center.x, y : 300 , width: 100, height: 200)
        firstCard.frame = targetFrame
        
        //firstCard.setNeedsUpdateConstraints()
    }

    
    // 첫번째 카드뒤집기
    func firstCardflip(){
        
        UIView.transition(with: self.firstCard, duration: 1, options: .transitionFlipFromLeft, animations: {
            
        
        }, completion: nil)
        //firstCard.setNeedsUpdateConstraints()
    }
    
    
    // MARK: 스레드 부여
    //카드 객체 뒤집기 메소드
//    func cardFlip(card : UIImageView){
//        UIView.transition(with: card, duration: 1, options: .transitionFlipFromLeft, animations: {
//
//
//        }, completion: {finished in card.image = self.imgFrontCard })
//        //firstCard.setNeedsUpdateConstraints()
//    }
    
    
    //옮기고 뒤집고
    //터치 테스트 클래스
    @objc func tapCardStack(sender : UITapGestureRecognizer){
        UIImageView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            
            UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3){
                self.moveCardRight()
                //self.view.layoutIfNeeded()
            }
            
            
        }, completion: { finished in
            
            UIImageView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0.3){
                
                self.firstCardflip()
               // self.view.layoutIfNeeded()
            }
            UIImageView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0, animations: {
                
                self.firstCard.image = self.imgFrontCard
            })
        
        })
    }
    
    
   
    
    func cardFlip(card : UIImageView){
        UIImageView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            
            
            
            
            UIImageView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0, animations: {
                
                card.image = self.imgFrontCard
                
            })
            
            UIImageView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0, animations: {
                UIView.transition(with: card, duration: 1, options: .transitionFlipFromLeft, animations: {
                
                
                        }, completion: {finished in  })
                
            })
            
            
            
        }, completion: { finished in
        
        })
    }
    
    
    


}

//게임 시작

//카드패 나눠주기 -> 카드패 펼쳐지기 -> 내 카드 보이기

// 첫 카드 뒤집기

//턴 돌아가기

// 내턴 카드 고르기 -> 카드 내기 or 카드 먹기


extension ViewController{
    
    //var object = CGRect(x: 50, y: 150, width: 50, height: 50)
    
//    @objc private func frameAnimate(){
//        UIView.animate(
//            withDuration: 2,
//            delay: 0,
//            options: .curveEaseIn,
//            animations: {
//                self.firstCard.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
//            }
//        )
//    }
}
