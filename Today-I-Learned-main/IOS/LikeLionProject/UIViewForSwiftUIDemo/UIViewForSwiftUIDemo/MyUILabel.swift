//
//  MyUILabel.swift
//  UIViewForSwiftUIDemo
//
//  Created by JeongMin Ko on 2022/11/02.
//


import SwiftUI
//UILabel은 클래스임

struct MyUILabel : UIViewRepresentable {
 
    var text : String
    
    //SwiftUI에서는 UILabel을 바로 쓸 수 없음. (통역사 역할 )
    //통역사를 고용해야지 or 구글 번역기 사이트 접속 (UIView기반으로 쓸테니 이야기좀 해보자 계약하자)
    //UIView 기반 컴포넌트 인스턴스 생성하고 필요한 초기화 작업 수행뒤 변환.
    func makeUIView(context: UIViewRepresentableContext<MyUILabel>) -> UILabel {
        let myLabel = UILabel()
        myLabel.text = text
        return myLabel
    }
    
    //UIView 자체를 업데이트해야하는 변경이
    //SWiftUI 뷰에서 생길 때마다 호출된다.
    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<MyUILabel>) {
        //필요한 작업 수행.
    }
}

struct MyUILabel_Previews: PreviewProvider {
    static var previews: some View{
        MyUILabel(text: "")
    }
}

//ObjectiveC를 Swift로 끌어와서 쓰는 것
//Swift를 SWiftUI로 끌어와서 쓰는 것.
