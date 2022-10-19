//
//  ContentView.swift
//  SwiftUIDemoApp
//
//  Created by JeongMin Ko on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    
    var colors : [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    //스테이트 변수
    @State private var rotation : Double = 0
    @State private var text : String = "Welcome to SwiftUI"
    @State private var colorIndex = 0
    
    var body: some View {
        VStack {
            
            Spacer()
    
            Text(text).font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(self.rotation))// 회전 상태 프로퍼티 수정자
                .foregroundColor(self.colors[self.colorIndex]) //State 바인딩
                .animation(.easeInOut(duration: 5)) //애니메이션 프로퍼티 수정자
                
            
            Spacer()
            Divider()
            //텍스트 회전 총량 제어 , rotation 프로퍼티 바인딩
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
            
            //
            TextField("Enter text here" , text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle()) //텍스트필드 상태 수정자
                .padding()
        
            //현재 선택된 colorIndex 저장, 색상 이름 표시에 사용
            Picker(selection: $colorIndex, label: Text("Color")){
                
                ForEach(0 ..< colornames.count){
                    Text(self.colornames[$0])
                        .foregroundColor(self.colors[$0])
                }
               
            }
            .padding()
            
        }
        .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
