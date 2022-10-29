//
//  PathPractice.swift
//  DrawDemo
//
//  Created by JeongMin Ko on 2022/10/27.
//

import SwiftUI

struct PathPractice: View {
    var body: some View {
        VStack{
            Path { path in
                path.move(to: CGPoint(x: 10, y: 0))
                path.addLine(to: CGPoint(x: 10, y: 350))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.closeSubpath()
                
            }
            
            MyShape()
        }
    }
}

struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 도형을 정의하기 코드는 여기에 추가...
        path.move(to: CGPoint(x: 10, y: 0))
        path.addLine(to: CGPoint(x: 10, y: 350))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.closeSubpath()
        
        return path
    }
}

struct PathPractice_Previews: PreviewProvider {
    static var previews: some View {
        PathPractice()
    }
}
