//
//  CategorySegmentController.swift
//  RC_4th_tribeOfDelevery
//
//  Created by JeongMin Ko on 2022/02/22.
//

import Foundation
import UIKit

protocol MyCutsomSegmentControllerDelegate : class{ //클래스에서만 사용가능
    //아이템이 선택
    func segmentValueChanged(to index : Int)
    
}

class CategorySegmentController : UIView {
    private var buttonTitles : [String]!
    private var buttons : [UIButton]!
    var textColor : UIColor = .black
    
    // #colortrial???
    var selectedColor : UIColor =  #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
    // ??? private뭔데 읽기전용?
    public private(set) var selectedIndex : Int = 0
    
    
    //딜리게이트 패턴
    weak var mySegmentDelegate : MyCutsomSegmentControllerDelegate?
    
    
    // ??? 왜 세개나?
    override init(frame: CGRect) {
        super.init(frame: frame)
        //기본적인 뷰 발생
    }
    //데이터를 뷰에 적용시킬 때 많이 사용
    convenience init(frame : CGRect, buttonTitles : [String]){
        self.init(frame: frame)
    
        self.buttonTitles = buttonTitles
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("MycustomSegmentControl - draw")
        updateView()
        
    }
    
    fileprivate func updateView(){
        print("customSegment - updateView()")
        //버튼 만들기
        createButton()
        //스택뷰 설정
        configStackView()
        
    }
    
    fileprivate func createButton(){
        self.buttons = [UIButton]()
        self.buttons.removeAll()
        //하위 뷰들을 다 지운다.
        self.subviews.forEach ({ $0.removeFromSuperview()})
        for buttonTitleItem in buttonTitles{
            let button = UIButton(type : .system)//system -> 버튼 효과
            button.backgroundColor = .white
            button.titleLabel?.textColor = .black
            //button.layer.borderWidth = 1
            //button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            button.setTitle(buttonTitleItem, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.layer.cornerRadius = 8
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.contentEdgeInsets = UIEdgeInsets(top : 10, left: 10, bottom: 10, right: 10)
            
            button.titleLabel?.minimumScaleFactor = 0.5
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.addTarget(self, action: #selector(CategorySegmentController.buttonAction(_:)), for: .touchUpInside)
            
            self.buttons.append(button)
            }
        
        //선택된 버튼 설정
        buttons[0].setTitleColor(selectedColor, for: .normal)
        buttons[0].backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        }
    
    fileprivate func configStackView(){
        //만든 버튼들을 넣어줌
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        //?????
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
    }
    
    //버튼 누를 때 액션 추가
    //세그먼트 버튼이 선택되었을 때
    @objc func buttonAction(_ sender : UIButton){
        for(buttonIndex, btn) in buttons.enumerated(){
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender { //누른 버튼과 일치하면
                self.selectedIndex = buttonIndex
                mySegmentDelegate?.segmentValueChanged(to: self.selectedIndex)
                btn.backgroundColor = selectedColor
                btn.setTitleColor(.gray, for: .normal)
                
            }else {
                btn.backgroundColor = .white
                btn.setTitleColor(textColor, for: .normal)
            }
            
        }
    }
}
