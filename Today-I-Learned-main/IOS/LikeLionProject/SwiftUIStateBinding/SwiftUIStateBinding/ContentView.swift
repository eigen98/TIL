//
//  ContentView.swift
//  SwiftUIStateBinding
//
//  Created by JeongMin Ko on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    @State private var wifiEnabled : Bool = false
    @State private var userName : String = ""
    
    var body: some View {
        
        VStack{
            Toggle(isOn: $wifiEnabled){
                Text("Wi-Fi 가능한가요")
            }
            TextField("이름을 입력하세요",text: $userName)
            Text(userName)
            WifiImageView(wifiEnabled: $wifiEnabled)
         
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
