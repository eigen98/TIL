//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by JeongMin Ko on 2022/10/18.
//

import SwiftUI

@main
struct HelloSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(member: Member(name: "누구"))
        }
    }
}
