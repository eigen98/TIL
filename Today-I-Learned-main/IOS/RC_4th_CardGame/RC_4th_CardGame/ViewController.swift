//
//  ViewController.swift
//  RC_4th_CardGame
//
//  Created by JeongMin Ko on 2022/03/01.
//

import UIKit



class ViewController: UIViewController {
    //타이머 라벨
    @IBOutlet weak var timerLabel: UILabel!
    var timer : Timer?
    var secondsLeft  = 59
    var computerVariable = 0

    @IBOutlet weak var myNumberText: UILabel!
    
    @IBOutlet weak var computerNumberText: UILabel!
    
    @IBOutlet weak var myProgressBar: UIProgressView!
    
    @IBOutlet weak var computerProgressBar: UIProgressView!
    //나의 턴 표시
    @IBOutlet weak var signMyTurn: UIImageView!
    
    //각자 카드 개수
    var firstCardNumber = 7
    var secondCardNumber = 7
    var cardKind : Array<String> = ["HEART" , "DIAMOND", "SPADE", "CLOVA"]
    var dummyCard : Array<Card>?
    var oppdummyCard : Array<Card>?
    
    var dictionaryMyCard : Dictionary<UIImageView, Card?>?
    var dictionaryComputerCard : Dictionary<UIImageView, Card?>?
    
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
    
    @IBOutlet weak var card3: UIImageView!
    
    @IBOutlet weak var card4: UIImageView!
    
    @IBOutlet weak var card5: UIImageView!
    
    @IBOutlet weak var card6: UIImageView!
    
    @IBOutlet weak var card7: UIImageView!
    
    @IBOutlet weak var card8: UIImageView!
    
    @IBOutlet weak var card9: UIImageView!
    
    @IBOutlet weak var card10: UIImageView!
    
    @IBOutlet weak var card11: UIImageView!
    
    @IBOutlet weak var card12: UIImageView!
    
    
    @IBOutlet weak var card13: UIImageView!
    
    @IBOutlet weak var card14: UIImageView!
    
    @IBOutlet weak var card15: UIImageView!
    
    @IBOutlet weak var card16: UIImageView!
    
    @IBOutlet weak var card17: UIImageView!
    
    @IBOutlet weak var card18: UIImageView!
    
    @IBOutlet weak var card19: UIImageView!
    
    @IBOutlet weak var card20: UIImageView!
    
    @IBOutlet weak var card21: UIImageView!
    
    @IBOutlet weak var card22: UIImageView!
    
    @IBOutlet weak var card23: UIImageView!
    
    @IBOutlet weak var card24: UIImageView!
    
    @IBOutlet weak var card25: UIImageView!
    
    
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
    //카드뽑기 애니메이션을 구현할 카드 이미지
    @IBOutlet weak var cardForDraw: UIImageView!
    
    var myDeckImg : Array<UIImageView>?
    var oppDeckImg : Array<UIImageView>?
    

    
    var gameState = GameState.ready
    
    
    
    var imgBackCard = UIImage(named: "backView")
    
    var imgFrontCard = UIImage(named: "heart2")
   
    var myCount : Int?
    var oppCount : Int?
    
    var pickedCard : UIImageView?
    
    var topOfCard : Card?
    
    var cheating = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //게임 시작
        gameStart()
       
        
        let cardStackBtn = UITapGestureRecognizer(target : self, action: #selector(tapCardStack))
        
        firstCard.isUserInteractionEnabled = true
        firstCard.addGestureRecognizer(cardStackBtn)
        
        let myCardBtn = UITapGestureRecognizer(target : self, action : #selector(tapMycard))
        for x in 0...24{
            myDeckImg![x].isUserInteractionEnabled = true
//            myDeckImg![x].addGestureRecognizer(myCardBtn)
        }
        
        let tackForDrawBtn = UITapGestureRecognizer(target: self, action: #selector(tapDrawStack))
        cardStack.isUserInteractionEnabled = true
        cardStack.addGestureRecognizer(tackForDrawBtn)
        
        let myCardChoose1 = UITapGestureRecognizer(target : self, action : #selector(choosingCard1))
        let myCardChoose2 = UITapGestureRecognizer(target : self, action : #selector(choosingCard2))
        let myCardChoose3 = UITapGestureRecognizer(target : self, action : #selector(choosingCard3))
        let myCardChoose4 = UITapGestureRecognizer(target : self, action : #selector(choosingCard4))
        let myCardChoose5 = UITapGestureRecognizer(target : self, action : #selector(choosingCard5))
        let myCardChoose6 = UITapGestureRecognizer(target : self, action : #selector(choosingCard6))
        let myCardChoose7 = UITapGestureRecognizer(target : self, action : #selector(choosingCard7))
        let myCardChoose8 = UITapGestureRecognizer(target : self, action : #selector(choosingCard8))
        let myCardChoose9 = UITapGestureRecognizer(target : self, action : #selector(choosingCard9))
        let myCardChoose10 = UITapGestureRecognizer(target : self, action : #selector(choosingCard10))
        let myCardChoose11 = UITapGestureRecognizer(target : self, action : #selector(choosingCard11))
        let myCardChoose12 = UITapGestureRecognizer(target : self, action : #selector(choosingCard12))
        let myCardChoose13 = UITapGestureRecognizer(target : self, action : #selector(choosingCard13))
        let myCardChoose14 = UITapGestureRecognizer(target : self, action : #selector(choosingCard14))
        let myCardChoose15 = UITapGestureRecognizer(target : self, action : #selector(choosingCard15))
        let myCardChoose16 = UITapGestureRecognizer(target : self, action : #selector(choosingCard16))
        let myCardChoose17 = UITapGestureRecognizer(target : self, action : #selector(choosingCard17))
        let myCardChoose18 = UITapGestureRecognizer(target : self, action : #selector(choosingCard17))
        let myCardChoose19 = UITapGestureRecognizer(target : self, action : #selector(choosingCard17))
        let myCardChoose20 = UITapGestureRecognizer(target : self, action : #selector(choosingCard1))
        let myCardChoose21 = UITapGestureRecognizer(target : self, action : #selector(choosingCard1))
        let myCardChoose22 = UITapGestureRecognizer(target : self, action : #selector(choosingCard1))
        let myCardChoose23 = UITapGestureRecognizer(target : self, action : #selector(choosingCard1))
        let myCardChoose24 = UITapGestureRecognizer(target : self, action : #selector(choosingCard1))
        let myCardChoose25 = UITapGestureRecognizer(target : self, action : #selector(choosingCard1))
       
        myCard1.addGestureRecognizer(myCardChoose1)
        myCard1.isUserInteractionEnabled = true
        myCard2.addGestureRecognizer(myCardChoose2)
        myCard3.addGestureRecognizer(myCardChoose3)
        myCard4.addGestureRecognizer(myCardChoose4)
        myCard5.addGestureRecognizer(myCardChoose5)
        myCard6.addGestureRecognizer(myCardChoose6)
        myCard7.addGestureRecognizer(myCardChoose7)
        myCard8.addGestureRecognizer(myCardChoose8)
        myCard9.addGestureRecognizer(myCardChoose9)
        myCard10.addGestureRecognizer(myCardChoose10)
        myCard11.addGestureRecognizer(myCardChoose11)
        myCard12.addGestureRecognizer(myCardChoose12)
       
        myCard13.addGestureRecognizer(myCardChoose13)
        myCard14.addGestureRecognizer(myCardChoose14)
        myCard15.addGestureRecognizer(myCardChoose15)
        myCard16.addGestureRecognizer(myCardChoose16)
        myCard17.addGestureRecognizer(myCardChoose17)
        myCard18.addGestureRecognizer(myCardChoose18)
        myCard19.addGestureRecognizer(myCardChoose19)
        myCard20.addGestureRecognizer(myCardChoose20)
        myCard21.addGestureRecognizer(myCardChoose21)
        myCard22.addGestureRecognizer(myCardChoose22)
        myCard23.addGestureRecognizer(myCardChoose23)
        myCard24.addGestureRecognizer(myCardChoose24)
        myCard25.addGestureRecognizer(myCardChoose25)
        
        

        
    }
    
    //게임 시작
    func gameStart(){
        
        //카드 오브젝트 보이기 isHidden
        //카드패 펼쳐지기 -> 내카드 뒤집어 보여주기
        
        //더미 카드 데이터 생성
        dummyCard = [
            Card(number: 5, shape : "CLOVA", img: "clova5"),
            Card(number: 5, shape : "HEART", img: "heart5"),
            Card(number: 3, shape : "DIAMOND", img: "dia3"),
            Card(number: 5, shape : "SPADE", img: "spade5"),
            Card(number: 7, shape : "CLOVA", img: "clova7"),
            Card(number: 6, shape : "HEART", img: "heart6"),
            Card(number: 4, shape : "DIAMOND", img: "dia4")
            
        ] //var cardKind : Array<String> = ["HEART" , "DIAMOND", "SPADE", "CLOVA"]
        //더미 카드 데이터 생성
        oppdummyCard = [
            Card(number: 3, shape : "CLOVA", img: "heart2"),
            Card(number: 3, shape : "CLOVA", img: "heart2"),
            Card(number: 3, shape : "CLOVA", img: "heart2"),
            Card(number: 3, shape : "CLOVA", img: "heart2"),
            Card(number: 3, shape : "CLOVA", img: "heart2"),
            Card(number: 3, shape : "CLOVA", img: "heart2"),
            Card(number: 3, shape : "CLOVA", img: "heart2")
            
        ]
        
        myDeckImg =  [myCard1, myCard2,myCard3,myCard4,myCard5,myCard6,myCard7,myCard8,myCard9, myCard10, myCard11, myCard12, myCard13, myCard14, myCard15, myCard16, myCard17, myCard18, myCard19, myCard20, myCard21, myCard22,myCard23, myCard24, myCard25]
        
        oppDeckImg =  [card1, card2, card3, card4, card5, card6, card7, card8, card9,  card10,  card11,  card12,  card13,  card14,  card15,  card16,  card17,  card18,  card19,  card20, card21,  card22, card23,  card24,  card25]
        
        //플레이어 생성
        player1  = Player(playerName: "1P", cardNumber: 7, cardList : (self.dummyCard)!)
        player2  =  Player(playerName: "2P", cardNumber: 7, cardList : (self.dummyCard)!)
        
        //내카드 딕셔너리
        dictionaryMyCard = [myCard1 : player2!.cardList[0] ,
                            myCard2 : player2!.cardList[1],
                            myCard3 : player2!.cardList[2],
                            myCard4 : player2!.cardList[3],
                            myCard5 : player2!.cardList[4],
                            myCard6 : player2!.cardList[5],
                            myCard7 : player2!.cardList[6],
                            myCard8 : nil,
                            myCard9 : nil,
                            myCard10 : nil,
                            myCard11 : nil,
                            myCard12 : nil,
                            myCard13 : nil,
                            myCard14 : nil,
                            myCard15 : nil,
                            myCard16 : nil,
                            myCard17 : nil,
                            myCard18 : nil,
                            myCard19 : nil,
                            myCard20 : nil,
                            myCard21 : nil,
                            myCard22 : nil,
                            myCard23 : nil,
                            myCard24 : nil,
                            myCard25 : nil ]
        
        //상대카드 딕셔너리
        dictionaryComputerCard = [card1 : player1!.cardList[0] ,
                                 card2 : player1!.cardList[1],
                                 card3 : player1!.cardList[2],
                                 card4 : player1!.cardList[3],
                                 card5 : player1!.cardList[4],
                                 card6 : player1!.cardList[5],
                                 card7 : player1!.cardList[6],
                                 card8 : nil,
                                 card9 : nil,
                                 card10 : nil,
                                 card11 : nil,
                                 card12 : nil,
                                 card13 : nil,
                                 card14 : nil,
                                 card15 : nil,
                                 card16 : nil,
                                 card17 : nil,
                                 card18 : nil,
                                 card19 : nil,
                                 card20 : nil,
                                 card21 : nil,
                                 card22 : nil,
                                 card23 : nil,
                                 card24 : nil,
                                 card25 : nil ]
             
        
        //플레이어의 카드 개수
        myCount = player2?.cardList.count
        oppCount = player1?.cardList.count
        
    
        
        
        
        //받은 카드개수 만큼 보이고 나머지 숨기기
        dictionaryMyCard?.forEach({ key, value in
            if value != nil {
                key.isHidden = false
            }
        })
        
//        for x in 1...myCount!{
//            myDeckImg![x].isHidden = false
//        }
        for x in 1...oppCount!{
            oppDeckImg![x].isHidden = false
        }
        
       
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            self.getCardDeck()

        }
       
        DispatchQueue.main.async{
            self.getOppCardDeck()
        }
    
            
        //받은 카드개수 만큼 보이고 나머지 숨기기
        self.dictionaryMyCard?.forEach ({ key, value in
            if value != nil {
                
                //2초뒤에 카드 뒤집기
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    //가진 카드 뒤집기
                    print(value?.pokerImg)
                    self.cardFlip(card: key, cardEntity: value!
                )}
            }
        })
        self.setfirstCard()
        //카드 세팅 후 내차례로 전환
        self.gameState = GameState.playing(turn: 2)
        self.signMyTurn.isHidden = false //내차례 표시
        
        // 타이머 작동
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.activeTimer()
            
        }
        myProgressBar.progress = 0.5
        computerProgressBar.progress = 0.5
        myNumberText.text = "7"
        computerNumberText.text = "7"
        
        
        
        
       
        
            
        
    
        
       
        //2초뒤에 카드 뒤집기
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            //가진 카드 뒤집기
//            for x in 1...self.myCount!{
//                self.cardFlip(card: (self.oppDeckImg?[x])!)
//            }
//
//
//        }
        
        
        
       
        
        
        
        
        
    }
    
    
    
    func startPointOpponent(){
       
        firstStack.isHidden = true

        UIStackView.animate(withDuration: 1){
            //내카드 덱 첫 시작위치설정
            //카드 덱 위에서 시작
            print("startPoint 상대방")
           //
            let oppMove = CGAffineTransform(translationX:  0, y: -400)
            let oppScale = CGAffineTransform(scaleX: 0.25, y: 1.0)
            let oppCombine = oppScale.concatenating(oppMove)
            
            self.firstStack.transform = oppCombine
//            self.view.setNeedsUpdateConstraints()
//            self.view.layoutIfNeeded()
        }
    }
    
    
    func getOppCardDeck(){
        UIStackView.animate(withDuration: 1, animations: {
            self.firstStack.isHidden = true
            //내카드 덱 첫 시작위치설정
            //카드 덱 위에서 시작
            print("startPoint 상대방")
           //
            let oppMove = CGAffineTransform(translationX:  0, y: +300)
            let oppScale = CGAffineTransform(scaleX: 0.25, y: 1.0)
            let oppCombine = oppScale.concatenating(oppMove)
            
            self.firstStack.transform = oppCombine
//            self.view.setNeedsUpdateConstraints()
//            self.view.layoutIfNeeded()
            
            
        }, completion: { finished in
            UIStackView.animate(withDuration: 1, animations: {
                print("getOppCardDeck 상대방")
                self.firstStack.isHidden = false // 보이는 상태
                let move  = CGAffineTransform(translationX: 0 , y: 0)//8, 618
                let scale = CGAffineTransform(scaleX: 0.25, y: 1.0)
                let combine = scale.concatenating(move)
                self.firstStack.transform = combine
//                self.view.layoutIfNeeded()
//                self.view.setNeedsUpdateConstraints()
//                print("getOppCardDeck 상대방")
//                self.firstStack.isHidden = false // 보이는 상태
//                let move  = CGAffineTransform(translationX: 0 , y: 0)//8, 618
//                let scale = CGAffineTransform(scaleX: 0.25, y: 1.0)
//                let combine = scale.concatenating(move)
//                self.firstStack.transform = combine
//                self.view.setNeedsUpdateConstraints()
//                self.view.layoutIfNeeded()
            
                
               
            }, completion: { finished in
               // self.view.layoutIfNeeded()
               // self.view.setNeedsUpdateConstraints()
                self.spreadOppCardDeck()
                
                
            })
        })
    }
    
    func spreadOppCardDeck(){
        UIStackView.animate(withDuration: 1){
            //내카드 덱 첫 시작위치설정
            //카드 덱 위에서 시작
            //let move  = CGAffineTransform(translationX : 0, y : 0 )//8, 618
            //포개어진 상태로 시작
            print("spreadOppCardDeck 상대방")
            let scale = CGAffineTransform(scaleX: 1.0, y: 1.0)
            let combine = scale//.concatenating(move)
            
            self.firstStack.transform = combine
//            self.view.layoutIfNeeded()
//            self.view.setNeedsUpdateConstraints()
//
        }
    }
    
//    func oppCardSetting(deck : UIStackView){
//        UIStackView.animateKeyframes(withDuration: 5, delay: 0, options: [], animations: {
//
//
//            UIStackView.addKeyframe(withRelativeStartTime: 0.0 , relativeDuration: 0.3){
//                self.startPointOpponent()
//                //카드 나눠주기 전
//                //self.getOppCardDeck()
//
//            }
//
//        }, completion: { finished in
//            self.view.layoutIfNeeded()
//            self.view.setNeedsUpdateConstraints()
//            //카드 받기
//            UIStackView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.7){
//                self.view.layoutIfNeeded()
//                self.view.setNeedsUpdateConstraints()
//
//                self.getOppCardDeck()
//
//
//            }
//
//        })
//    }
    
     
//    //카드 받기 ㅡ 카드셋팅 안에서 수행
//    func startPointCardDeck(){
//        self.secondStack.isHidden = true // 안보이는 상태로 시작
//
//        UIStackView.animate(withDuration: 0.5){
//            //내카드 덱 첫 시작위치설정
//            //카드 덱 위에서 시작
//            let move  = CGAffineTransform(translationX:  0, y: 300)
//            //포개어진 상태로 시작
//            let scale = CGAffineTransform(scaleX: 0.25, y: 1.0)
//
//            let combine = scale.concatenating(move)
//
//            self.secondStack.transform = combine
//
//
//        }
//    }
    
    
    func getCardDeck(){
        
        
        UIStackView.animate(withDuration: 0.1, animations: {
            self.secondStack.isHidden = true // 안보이는 상태로 시작
           // 카드 덱 위에서 시작
                //원래 오토레이아웃 위치에서 -300만큼
                      let move  = CGAffineTransform(translationX:  -30 , y: -300)
                      //포개어진 상태로 시작
                      let scale = CGAffineTransform(scaleX: 0.25, y: 1.0)
          
                      let combine = scale.concatenating(move)
          
                      self.secondStack.transform = combine
          
           // self.startPointCardDeck()
        }, completion: { finished in
            UIStackView.animate(withDuration: 0.5, animations: {
                
                //내카드 덱 첫 시작위치설정
                //카드 덱 위에서 시작 (translationX는 뷰가 로드될 때 원 위치)
                self.secondStack.isHidden = false // 안보이는 상태로 시작
                //원래 오토레이아웃 위치
                let move  = CGAffineTransform(translationX: 0 , y: 0)//8, 618
                let scale = CGAffineTransform(scaleX: 0.25, y: 1.0)
                let combine = scale.concatenating(move)
                self.secondStack.transform = combine
                self.secondStack.layoutIfNeeded()
                self.secondStack.setNeedsUpdateConstraints()
                
               
            }, completion: { finished in
                
                UIStackView.animate(withDuration: 0.3){
                    //내카드 덱 첫 시작위치설정
                    //카드 덱 위에서 시작
                    //let move  = CGAffineTransform(translationX : 0, y : 0 )//8, 618
                    //포개어진 상태로 시작
                    let scale = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    let combine = scale//.concatenating(move)
                    self.secondStack.transform = combine
                    self.secondStack.layoutIfNeeded()
                    self.secondStack.setNeedsUpdateConstraints()
                   
                }
                
              //  self.spreadCardDeck()
            })
        })
    
    }
    
//    func spreadCardDeck(){
//
//        UIStackView.animate(withDuration: 0.3){
//            //내카드 덱 첫 시작위치설정
//            //카드 덱 위에서 시작
//            //let move  = CGAffineTransform(translationX : 0, y : 0 )//8, 618
//            //포개어진 상태로 시작
//            let scale = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            let combine = scale//.concatenating(move)
//            self.secondStack.transform = combine
//            self.secondStack.layoutIfNeeded()
//            self.secondStack.setNeedsUpdateConstraints()
//
//        }
//    }
    
    
//    //카드패 나눠주기 => 카드패 펼쳐지기 => 카드 보이기
//    func cardSetting(deck : UIStackView){
//        UIStackView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
//
//            //카드 나눠주기 전
//            UIStackView.addKeyframe(withRelativeStartTime: 0.0 , relativeDuration: 1){
//
//                self.getCardDeck()
//                self.view.layoutIfNeeded()
//                self.view.setNeedsUpdateConstraints()
//            }
//
//        }, completion: { finished in
//
//            //카드 받기
//            UIStackView.addKeyframe(withRelativeStartTime: 0.5 , relativeDuration: 0.5 ){
//
////                self.spreadCardDeck()
//                self.view.layoutIfNeeded()
//                self.view.setNeedsUpdateConstraints()
//
//            }
//
//        })
//    }
    
    
    
    
//    //카드패 나눠주기 => 카드패 펼쳐지기 => 카드 보이기
//    func moveBelow(deck : UIStackView){
//        UIStackView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
//
//            //카드 받기
//            UIStackView.addKeyframe(withRelativeStartTime: 0 , relativeDuration: 0.3){
//                self.getCardDeck()
//                self.view.layoutIfNeeded()
//            }
//        }, completion: { finished in
//
//
//            UIStackView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3){
//                self.spreadCardDeck()
//                self.view.layoutIfNeeded()
//            }
//        })
//    }
    
    
    
    var tempAddOnCard : Card?
    var tempAddOnKey : UIImageView?
    
    //드로우
    func drawCard(){
        //내 차례가 아니라면 카드뽑기 중단
        switch self.gameState {
            
        case .ready:
            return
        case .end:
            return
            
        case .playing(turn: let turn):
            if turn == 1  {
                return
            }
        }
        
        
       
        //카드 가져오기 애니메이션
        UIImageView.animate(withDuration: 1.0, delay: 0, options : [], animations: {
            self.cardForDraw.isHidden = false
            
//            //원래 오토레이아웃 위치에서 -300만큼
//                  let move  = CGAffineTransform(translationX:  -30 , y: -300)
//                  //포개어진 상태로 시작
//                  let scale = CGAffineTransform(scaleX: 0.25, y: 1.0)
//
//                  let combine = scale.concatenating(move)
//
//                  self.secondStack.transform = combine
            
            
            let targetFrame = CGRect(x: self.view.center.x , y : 500 , width: 100, height: 200)
            self.cardForDraw.frame = targetFrame
            
        } , completion: {  finished in
            
            UIImageView.animate(withDuration: 1.0, delay: 0, options : [], animations: {
                self.cardForDraw.isHidden = false
                
    //            //원래 오토레이아웃 위치에서 -300만큼
    //                  let move  = CGAffineTransform(translationX:  -30 , y: -300)
    //                  //포개어진 상태로 시작
    //                  let scale = CGAffineTransform(scaleX: 0.25, y: 1.0)
    //
    //                  let combine = scale.concatenating(move)
    //
    //                  self.secondStack.transform = combine
                
                
                let targetFrame = CGRect(x: self.view.center.x , y : 500 , width: 100, height: 200)
                self.cardForDraw.frame = targetFrame
                
            } , completion: {  finished in
                
                
                
                
            
            var listRandomCard = [
               Card(number: 5, shape : "CLOVA", img: "clova5"),
               Card(number: 5, shape : "HEART", img: "heart5"),
               Card(number: 3, shape : "DIAMOND", img: "dia3"),
               Card(number: 5, shape : "SPADE", img: "spade5"),
               Card(number: 7, shape : "CLOVA", img: "clova7"),
               Card(number: 6, shape : "HEART", img: "heart6"),
               Card(number: 4, shape : "DIAMOND", img: "dia4"),
               Card(number: 5, shape : "CLOVA", img: "clova5"),
               Card(number: 5, shape : "HEART", img: "heart5"),
               Card(number: 3, shape : "DIAMOND", img: "dia3"),
               Card(number: 5, shape : "SPADE", img: "spade5"),
               Card(number: 7, shape : "CLOVA", img: "clova7"),
               Card(number: 6, shape : "HEART", img: "heart6"),
               Card(number: 4, shape : "DIAMOND", img: "dia4"),
               Card(number: 5, shape : "CLOVA", img: "clova5"),
               Card(number: 5, shape : "HEART", img: "heart5"),
               Card(number: 3, shape : "DIAMOND", img: "dia3"),
               Card(number: 5, shape : "SPADE", img: "spade5"),
               Card(number: 7, shape : "CLOVA", img: "clova7"),
               Card(number: 6, shape : "HEART", img: "heart6"),
               Card(number: 4, shape : "DIAMOND", img: "dia4"),
               Card(number: 5, shape : "CLOVA", img: "clova5"),
               Card(number: 5, shape : "HEART", img: "heart5"),
               Card(number: 3, shape : "DIAMOND", img: "dia3"),
               Card(number: 5, shape : "SPADE", img: "spade5"),
               Card(number: 7, shape : "CLOVA", img: "clova7"),
               Card(number: 6, shape : "HEART", img: "heart6"),
               Card(number: 4, shape : "DIAMOND", img: "dia4")
               
           ] //var cardKind : Array<String> = ["HEART" , "DIAMOND", "SPADE", "CLOVA"]
           // let randomNumber = Int.random(in: 0...6)
            //let randomShape = Int.random(in: 0...3)
           // let randomCard = listRandomCard[randomNumber]
            var addOnCard : Card?
            var addOnKey : UIImageView?
            
            //forEach구문은 중단이 필요한 경우 부적절함.
            print("드로우 반복문 시작")
                
                
            for x in 1...24 {
                var  myDeckImg =  [self.myCard1!,self.myCard2!,self.myCard3!,self.myCard4!,self.myCard5!,self.myCard6!,self.myCard7!,self.myCard8!,self.myCard9!, self.myCard10!, self.myCard11!, self.myCard12!,self.myCard13!, self.myCard14!, self.myCard15!, self.myCard16!,self.myCard17!,self.myCard18!, self.myCard19!, self.myCard20!, self.myCard21!, self.myCard22!,self.myCard23!,self.myCard24!, self.myCard25!]
                
                print(x)
                let key = myDeckImg[x]
                let value = self.dictionaryMyCard![key]!
                print(value)
                if value == nil {
                    print(x)
                    addOnCard =   listRandomCard[Int.random(in: 1...10)]
                    self.tempAddOnKey = key
                    self.tempAddOnCard = addOnCard!
                    
                    addOnKey = key
                    print( " \(addOnKey)is addonKey")
                    self.dictionaryMyCard?.updateValue(addOnCard!, forKey: addOnKey!)
            
                    print(self.tempAddOnKey)
                    print(addOnKey!)
                    addOnKey?.isHidden = false
                    UIImageView.transition(with:  addOnKey!, duration: 1, options: .transitionFlipFromLeft, animations :{
                        self.tempAddOnKey!.image = self.tempAddOnCard!.pokerImg
                        
                    }, completion: { finished in
                        
                        
                        //덱에 카드 보이기
                        addOnKey?.isHidden = false
                        //카드를 내면서 딕셔너리에서 카드 제거
                        
//                        //카드 쌓기 (카드 바꾸기)
//                        self.firstCard.image = self.tempAddOnCard!.pokerImg
//                        self.topOfCard = self.tempAddOnCard!
//                        //턴 넘기기
        
                        
                    })
                   
                    break
                }
                
            }
            })
            
            
            self.cardForDraw.isHidden = true
            
        
            
            
            UIImageView.animate(withDuration: 1.0, delay: 0, options : [], animations: {
                let targetFrame = CGRect(x: 80, y : 317 , width: 100, height: 200)
                self.cardForDraw.frame = targetFrame
                
            }, completion: { finished in
                
                self.myProgressBar.progress += 0.1
                
                if self.myCount! >= 12 {
                    self.myProgressBar.progress = 0.9
                }
                
                self.myCount! += 1
                self.myNumberText.text = "\(self.myCount!)"
                self.computerNumberText.text = "\(self.oppCount!)"
                self.gameState = GameState.playing(turn: 1) //턴 넘기기
                self.signMyTurn.isHidden = true //내차례 끝 표시 가리기
                self.computerTurn()
                
            })
        
        })
        
        
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
            self.cheating += 1
            if self.cheating == 4 {
                self.myCount = 0
                self.whoIsWinner()
            }
        
        }, completion: nil)
        //firstCard.setNeedsUpdateConstraints()
    }
    
    
                                               
    func playCard(){
       
        
        
        //내 차례가 아니라면 카드내기 중단
        switch self.gameState {
            
        case .ready:
            return
        case .end:
            return
            
        case .playing(turn: let turn):
            if turn == 1  {
                return
            }
        }
        //카드가 없을 때 중단
        var mypick = dictionaryMyCard![self.pickedCard!]
        if self.topOfCard == nil{
            return
        }
        
        //선택한 카드가 적절하지 않으면 중단
        if(mypick!!.shape  != self.topOfCard!.shape && mypick!!.number != self.topOfCard!.number){
            return
        }
        //타이머 리셋
        resetTimer()
        
        UIImageView.animate(withDuration: 1, animations: {
            //원래 오토레이아웃 위치에서 -300만큼
            var cardxy  = self.pickedCard?.center.x
            var superviewX = self.view.center.x
            var movingX : Int = 0
            if superviewX - cardxy! ?? 0 > 0 {
                movingX = 50
                
            } else {
                movingX = -50
                
            }
            let move  = CGAffineTransform(translationX: CGFloat(movingX), y: -300)
                  //포개어진 상태로 시작
            let scale = CGAffineTransform(scaleX: 1.0 , y: 1.0)
      
            let combine = scale.concatenating(move)
      
//                  self.secondStack.transform = combine
            
//            let targetFrame = CGRect(x: 80, y : 317 , width: 100, height: 200)
            self.pickedCard?.transform = combine
            
        } , completion: { finished in
            
            
            //내는 카드 안보이기 처리
            self.pickedCard?.isHidden = true
            
            let move  = CGAffineTransform(translationX: 0, y: 0)
                  //포개어진 상태로 시작
            let scale = CGAffineTransform(scaleX: 1.0 , y: 1.0)
      
            let combine = scale.concatenating(move)
            self.pickedCard?.transform = combine
//                  self.secondStack.transform = combine
            
//            let targetFrame = CGRect(x: 80, y : 317 , width: 100, height: 200)
            self.pickedCard?.transform = combine
            
            
            //카드를 내면서 딕셔너리에서 카드 제거
            self.dictionaryMyCard?.updateValue(nil, forKey: self.pickedCard!)
            //카드 쌓기 (카드 바꾸기)
            self.firstCard.image = self.pickedCard?.image
            self.topOfCard = (self.dictionaryMyCard?[self.pickedCard!])!
            //턴 넘기기
            self.gameState = GameState.playing(turn: 1)
            self.signMyTurn.isHidden = true
            
            
            
            self.myProgressBar.progress -= 0.1
            if self.myCount! <= 2 {
                self.myProgressBar.progress = 0.1
            }
            self.myCount! -= 1
            self.whoIsWinner()
            self.myNumberText.text = "\(self.myCount!)"
            self.computerNumberText.text = "\(self.oppCount!)"
            
            
            //턴이 넘겨지고 컴퓨터가 행동
            self.computerTurn()
            
        })
    }
    //옮기고 뒤집고
    //터치 테스트 클래스
    @objc func tapDrawStack(sender : UITapGestureRecognizer){
        //내 차례가 아니라면 카드뽑기 중단
        switch self.gameState {
            
        case .ready:
            return
        case .end:
            return
            
        case .playing(turn: let turn):
            if turn == 1  {
                return
            }
        }
        UIImageView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            
            UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3){
                self.drawCard()
            }
            
            
        }, completion: { finished in
            
            UIImageView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0.3){
                
               
            }
            UIImageView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0, animations: {
                
               
            })
        
        })
    }
    
    

    
    
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
    
    func setfirstCard(){
        UIImageView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            
            UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3){
                self.moveCardRight()
                //self.view.layoutIfNeeded()
            }
            self.topOfCard = Card(number: 3, shape: "HEART", img: "heart3")
            
            
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
    
    @objc func tapMycard(sender : UITapGestureRecognizer){
        //내 차례가 아니라면 카드 내기 중단
        switch self.gameState {
            
        case .ready:
            return
        case .end:
            return
            
        case .playing(turn: let turn):
            if turn == 1  {
                return
            }
        }
        
        UIImageView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            self.playCard()
        }, completion: {_ in
            
            //TODO 내는 카드 내 덱에서 제거
            //self.player2?.cardList.remove(at: <#T##Int#>)
            //카드 업데이트
            // topcard
        }
        
                
        )
    }
    
    
   
    
    func cardFlip(card : UIImageView, cardEntity : Card){
        UIImageView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            
            
            
            
            UIImageView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0, animations: {
                
                card.image = cardEntity.pokerImg
                
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
    
  
    @objc func choosingCard1(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard1
        self.tapMycard(sender: sender)

    }
    @objc func choosingCard2(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard2
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard3(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard3
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard4(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard4
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard5(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard5
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard6(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard6
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard7(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard7
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard8(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard8
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard9(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard9
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard10(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard10
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard11(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard11
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard12(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard12
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard13(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard13
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard14(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard14
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard15(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard15
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard16(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard16
        self.tapMycard(sender: sender)
    }
    @objc func choosingCard17(sender : UITapGestureRecognizer){
        
        self.pickedCard = myCard17
        self.tapMycard(sender: sender)
    }
    
    
    
    func computerTurn(){
        
        
        //컴퓨터 턴 확인
        //내 차례가 아니라면 카드뽑기 중단
        switch self.gameState {
            
        case .ready:
            return
        case .end:
            return
            
        case .playing(turn: let turn):
            if turn == 2  {
                return
            }
        }
        
        //현재 턴에 맞추어야할 조건의 카드
        if self.topOfCard == nil {
            self.topOfCard = Card(number: 3 , shape : "HEART" , img: "heart2")
        }
        
        var mustCard = Card(number: self.topOfCard!.number, shape: self.topOfCard!.shape, img: self.topOfCard!.pokerImg)
        if mustCard.pokerImg == nil {
            mustCard = Card(number: 3 , shape : "HEART" , img: "heart2")
        }
        
        var cheatCard = Card(number: mustCard.number, shape: mustCard.shape, img: mustCard.pokerImg)
        
        if(computerVariable == 1){
            //컴퓨터 카드 내기
            print("지금 내는 카드는? : \(cheatCard.pokerImg)")
            self.playCardComputer(mustCard: cheatCard)
            
            
        }else {
            //컴퓨터 카드 드로우
            self.drawCardComputer()
            
        }
        
        
        
        
        
        
        
        
    }

    
    
    //컴퓨터의 드로우
    func drawCardComputer(){
        
        
        var listRandomCard = [
           Card(number: 5, shape : "CLOVA", img: "clova5"),
           Card(number: 5, shape : "HEART", img: "heart5"),
           Card(number: 3, shape : "DIAMOND", img: "dia3"),
           Card(number: 5, shape : "SPADE", img: "spade5"),
           Card(number: 7, shape : "CLOVA", img: "clova7"),
           Card(number: 6, shape : "HEART", img: "heart6"),
           Card(number: 4, shape : "DIAMOND", img: "dia4")
           
       ] //var cardKind : Array<String> = ["HEART" , "DIAMOND", "SPADE", "CLOVA"]
    
        
        
        
        let randomNumber = Int.random(in: 0...6)
        let randomShape = Int.random(in: 0...3)
        let randomCard = Card(number: 4, shape : "DIAMOND", img: "dia4")
        var addOnCard : Card?
        var addOnKey : UIImageView?
      
        for x in 0...24 {
            var  oppDeckImg =  [self.card1!,self.card2!,self.card3!,self.card4!,self.card5!,self.card6!,self.card7!,self.card8!,self.card9!, self.card10!, self.card11!, self.card12!,self.card13!, self.card14!, self.card15!, self.card16!,self.card17!,self.card18!, self.card19!, self.card20!, self.card21!, self.card22!,self.card23!,self.card24!, self.card25!]
            
            var key = oppDeckImg[x]
            var value = self.dictionaryComputerCard![key]!
            
            if value == nil {
                addOnCard = randomCard
                addOnKey = key
                break
            }
        }
        
        
        self.dictionaryComputerCard?.updateValue(addOnCard, forKey: self.card8)
        UIImageView.animate(withDuration: 1.0, delay: 0, options : [], animations: {
            self.cardForDraw.isHidden = false
            let targetFrame = CGRect(x: self.view.center.x , y : 16 , width: 100, height: 200)
            self.cardForDraw.frame = targetFrame
            
        } , completion: { finished in
            
            
            self.cardForDraw.isHidden = true
//            self.cardFlip(card: self.card7, cardEntity:randomCard )
            //덱에 카드 보이기
            
            print("\(self.card8!) is 컴퓨터가 드로우한 카드")
            
            
            UIImageView.animate(withDuration: 1.0, delay: 0, options : [], animations: {
                //돌아가기
                let targetFrame = CGRect(x: 80, y : 317 , width: 100, height: 200)
                self.cardForDraw.frame = targetFrame
                
            }, completion: { finished in
                self.card8!.isHidden = false
                self.computerProgressBar.progress += 0.1
                if self.oppCount! >= 12 {
                    self.computerProgressBar.progress = 0.9
                }
                self.oppCount! += 1
                
                self.computerNumberText.text = "\(self.oppCount!)"
                
                self.gameState = GameState.playing(turn: 2) //턴 넘기기
                self.signMyTurn.isHidden = false
                self.computerVariable = 1
                
                
            })
        
        })
    }
    
    //컴퓨터 카드 내기
    func playCardComputer(mustCard : Card){
        UIImageView.animate(withDuration: 2, animations: {
            //원래 오토레이아웃 위치에서 -300만큼
//            var cardxy  = self.pickedCard?.center.x
//            var superviewX = self.view.center.x
//            var movingX : Int = 0
//            if superviewX - cardxy! ?? 0 > 0 {
//                movingX = 50
//
//            } else {
//                movingX = -50
//
//            }
            let move  = CGAffineTransform(translationX: -50 , y: +300)
                  
            let scale = CGAffineTransform(scaleX: 1.0 , y: 1.0)
      
            let combine = scale.concatenating(move)
            
//            let targetFrame = CGRect(x: 80, y : 317 , width: 100, height: 200)
            self.card8?.transform = combine
            
            
        } , completion: { finished in
            
            UIImageView.animate(withDuration: 1, animations: {
                
                
//                UIView.transition(with: card, duration: 1, options: .transitionFlipFromLeft, animations: {
                UIImageView.transition(with: self.card8, duration: 1, options: .transitionFlipFromLeft, animations :{
                    self.card8.image = mustCard.pokerImg
                    
                    
                    
                }, completion: { finished in
                    //카드 쌓기 (카드 바꾸기)
                    self.firstCard.image = mustCard.pokerImg
                    
                    //내는 카드 안보이기 처리
                    self.card8.isHidden = true
                    self.card8.image = self.imgBackCard
                    
                    let move  = CGAffineTransform(translationX: 0 , y: 0)
                          //포개어진 상태로 시작
                    let scale = CGAffineTransform(scaleX: 1.0 , y: 1.0)
              
                    let combine = scale.concatenating(move)
                    
        //            let targetFrame = CGRect(x: 80, y : 317 , width: 100, height: 200)
                    self.card8?.transform = combine
                    //카드를 내면서 딕셔너리에서 카드 제거
                    self.dictionaryComputerCard?.updateValue(nil, forKey: self.card8!)
                   
                    self.topOfCard = mustCard
                    //턴 넘기기
                    self.gameState = GameState.playing(turn: 2)
                    self.signMyTurn.isHidden = false
                    self.computerVariable = 0
                    
             
                    self.computerProgressBar.progress -= 0.1
                    if self.oppCount! <= 2 {
                        self.computerProgressBar.progress = 0.1
                    }
                    self.oppCount! -= 1
                    self.whoIsWinner()
//                    self.myNumberText.text = "\(self.myCount!)"
                    self.computerNumberText.text = "\(self.oppCount!)"
                    
                })
               
                
                
                
                
                
                
            }, completion: { finished in
                self.signMyTurn.isHidden = false
               
            })
            
            
            
        
            
            
            
        })
    }
    
    
    
    
}

extension ViewController{
    
    
    
    func activeTimer(){
        self.secondsLeft = 120
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            t in
            self.secondsLeft -= 1
            
            var minutes = self.secondsLeft/60
            
            var seconds = self.secondsLeft % 60
            
            self.timerLabel.text = String(format: "%02d : %02d", minutes, seconds)
            
            //남은 시간이 0보다 크면
            if self.secondsLeft > 0 {
                self.timerLabel.text = "\(minutes) : \(seconds)"
            }else {
                self.timerLabel.textColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
                //시간이 다 되었을 경우 턴 넘기기
                self.gameState = GameState.playing(turn: 1)
                self.signMyTurn.isHidden = true
                
            }
            
        })
        
    }
    
    func resetTimer(){
        self.timer?.invalidate()
        timer = nil
    
        timerLabel.text = "00:00"
        secondsLeft = 120
    }
    //승자 판별
    func whoIsWinner(){
    
        if self.myCount == 0 {
        
        DispatchQueue.main.async {
            let alert = self.storyboard?.instantiateViewController(withIdentifier: "CustomStoryboard") as! CustomPopUpViewController
        print("whois Winner 호출")
            alert.self.win = 1
            alert.modalPresentationStyle = .overCurrentContext
            self.present(alert, animated: false, completion: nil)
        }
            
        }
        
        if self.oppCount == 0 {
        
        DispatchQueue.main.async {
            let alert = self.storyboard?.instantiateViewController(withIdentifier: "CustomStoryboard") as! CustomPopUpViewController
        print("whois Winner 호출")
            alert.self.win = 0
            alert.modalPresentationStyle = .overCurrentContext
            self.present(alert, animated: false, completion: nil)
        }
            
        }
    }
    
    
    
    
}
