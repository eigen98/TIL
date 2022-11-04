//
//  ContentView.swift
//  WebMapDemo
//
//  Created by JeongMin Ko on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: Int = 1
    
    var body: some View {
        
        TabView(selection: $tabSelection){
            Text("Tab Content 1").tabItem{
                Image(systemName: "safari")
                Text("Web").tag(1)
            }
            Text("Tab Content 2").tabItem{
                Image(systemName: "safari")
                Text("Web").tag(1)
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
