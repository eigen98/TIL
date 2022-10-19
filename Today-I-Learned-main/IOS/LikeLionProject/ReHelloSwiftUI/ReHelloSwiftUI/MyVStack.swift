//
//  MyVStack.swift
//  ReHelloSwiftUI
//
//  Created by JeongMin Ko on 2022/10/19.
//

import SwiftUI

struct MyVStack<Content : View>: View {
    let content : () -> Content
    init(@ViewBuilder content : @escaping () -> Content){
        self.content = content
    }
    
    var body: some View {
        VStack {
           content()
        }
    }
}

