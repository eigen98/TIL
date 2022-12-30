//
//  SwiftUICoreDataDemoApp.swift
//  SwiftUICoreDataDemo
//
//  Created by JeongMin Ko on 2022/12/19.
//

import SwiftUI

@main
struct SwiftUICoreDataDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
