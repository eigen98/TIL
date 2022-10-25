//
//  DemoStateApp.swift
//  DemoState
//
//  Created by JeongMin Ko on 2022/10/24.
//

import SwiftUI

@main
struct DemoStateApp: App {
    //let demoData : DemoData = DemoData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(demoData: DemoData())
//                .environmentObject(DemoData)
        }
    }
}
