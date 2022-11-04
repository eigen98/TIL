//
//  WebTabView.swift
//  WebMapDemo
//
//  Created by JeongMin Ko on 2022/11/02.
//

import SwiftUI

struct WebTabView: View {
    
    @State private var isShowingSheet = false
    
    var body: some View {
        
        VStack{
            Button(action: {
                
            }){
                Text("Open, Web Browser")
            }
        }.sheet(isPresented: $isShowingSheet, onDismiss: didDismiss){
            
            VStack{
                Text("License Agreement")
                    .font(.title)
                    .padding(50)
                Text("""
    Terms and conditions go here
    """)
                    .font(.title)
                    .padding(50)
                Button("Dismiss", action: {
                    isShowingSheet.toggle()
                })
                
                
            }
        }
        
    }
    func didDismiss(){
        
    }
}

struct WebModalView : View{
    var body: some View{
        Text("Hello")
    }
}

struct WebTabView_Previews: PreviewProvider {
    static var previews: some View {
        WebTabView()
    }
}
