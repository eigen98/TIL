//
//  ContentView.swift
//  ReHelloSwiftUI
//
//  Created by JeongMin Ko on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button(action: {
                print("Hello")
            }){
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("안녕하세요")
                }
            }
            .padding()
            
            MyVStack(content: {
                Image(systemName: "넣고싶은 이미지1")
            })
            MyVStack(content: {
                Image(systemName: "넣고싶은 이미지2")
            })
            MyVStack(content: {
                Image(systemName: "넣고싶은 이미지3")
            })
            MyVStack(content: {
                Image(systemName: "넣고싶은 이미지4")
            })
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
