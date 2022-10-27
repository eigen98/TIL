//
//  ContentView.swift
//  DrawDemo
//
//  Created by JeongMin Ko on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, recteanble!")
                .font(.largeTitle)
            Rectangle()
            
            Text("Hello, Circle")
                .font(.largeTitle)
            Circle()
                .fill(Color.red)
            
            Text("Hello Capsule")
                .font(.largeTitle)
            Capsule()
                .stroke(lineWidth: 10)
                .foregroundColor(.blue)
                .frame(width: 200,height: 100)
            
            Text("Hello, RoundRectangle")
                .font(.largeTitle)
            RoundedRectangle(cornerRadius: CGFloat(20))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(8) ,dash: [CGFloat(10)]))
            Text("Hello, RoundRectangle")
                .font(.largeTitle)
            
            Ellipse()
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
