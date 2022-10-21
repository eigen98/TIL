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
    //색상 RGB 상태 값
    @State private var red : Double = 0
    @State private var blue : Double = 0
    @State private var green : Double = 0
    //투명도
    @State private var opacity : Double = 1
    
    func loadImg(){
        
    }

    
    var body: some View {
        VStack {
            
    
            Text(text).font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(self.rotation))// 회전 상태 프로퍼티 수정자
                .foregroundColor(
                    Color(UIColor(red: red,
                                  green: green,
                                  blue: blue,
                                  alpha: opacity)
                    )
                ) //State 바인딩 //self.colors[self.colorIndex]
                .animation(.easeInOut(duration: 10), value: self.opacity) //애니메이션 프로퍼티 수정자
               
     
       
            //텍스트 회전 총량 제어 , rotation 프로퍼티 바인딩
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
            
            //색상 프로퍼티 바인딩
            Slider(value: $red, in: 0...1, step: 1/255)
                .padding()
                
            //
            Slider(value: $blue, in: 0...1, step: 1/255)
                .padding()
            //
            Slider(value: $green, in: 0...1, step: 1/255)
                .padding()
            //
            Slider(value: $opacity, in: 0...1, step: 0.05)
                .padding()
            
           
            //
            TextField("Enter text here" , text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle()) //텍스트필드 상태 수정자
                .padding()
        
//            //현재 선택된 colorIndex 저장, 색상 이름 표시에 사용
//            Picker(selection: $colorIndex, label: Text("Color")){
//
//                ForEach(0 ..< colornames.count, id: \.self){
//                    Text(self.colornames[$0])
//                        .foregroundColor(self.colors[$0])
//                }
//            }.pickerStyle(WheelPickerStyle()) //3.0부터 버려짐 WheelPickerStyle
//            .padding()
            

            //이미지 로드 A view that asynchronously loads and displays an image.
            AsyncImage(url: URL(string: "https://www.appcoda.com/wp-content/uploads/2021/06/asyncimage-scale.png")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
        }
        .padding()
        
        
    }
   
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
