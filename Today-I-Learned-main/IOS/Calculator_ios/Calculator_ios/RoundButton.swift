//
//  RoundButton.swift
//  Calculator_ios
//
//  Created by JeongMin Ko on 2022/02/14.
//

import UIKit


@IBDesignable
//기존 UI버튼들 속성을 그대로 사용할 수 있고
//사용자가 원하는 속성들을 클래스에 정의
class RoundButton: UIButton {
    //정사각형 버튼이 원이 됨 . 아닌 버튼들은 모서리가 둥글게 변화.
    
    @IBInspectable var isRound : Bool = false {
        didSet{
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
    
            }
        }
    }
}


// @IBDesignable ->컴파일 타임으로 적용된 속성을 실시간으로 스토리보드에 렌더링해주는 녀석
// @IBInspectable -> 커스텀한 UI뷰 컴포넌트에서 인스펙터창을 이용해서 보다 쉽게 속성을 적용할 수 있도록 도와주는 속성

