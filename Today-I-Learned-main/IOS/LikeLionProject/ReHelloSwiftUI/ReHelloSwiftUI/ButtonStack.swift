//
//  ButtonStack.swift
//  ReHelloSwiftUI
//
//  Created by JeongMin Ko on 2022/10/19.
//

import SwiftUI

struct ButtonStack: View {
    
    @State private var wifiEnalble : Bool = false
    @State private var userName : String = ""
    
    var body: some View {
        
        VStack{
            Toggle(isOn: $wifiEnalble){
                Text("Wi-Fi 가능한가요")
            }
            TextField("이름을 입력하세요",text: $userName)
            Text(userName)
            
            Image(systemName: wifiEnalble ? "wifi" : "wifi.slash")
            Text(wifiEnalble ? "Wi-Fi 켜짐" : "Wi-Fi 꺼짐")
            
        }
        
    }
}

struct ButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStack()
    }
}
