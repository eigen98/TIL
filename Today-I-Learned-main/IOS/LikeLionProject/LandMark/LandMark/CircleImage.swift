//
//  CircleImage.swift
//  LandMark
//
//  Created by JeongMin Ko on 2022/11/25.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("BIComming")
            .frame(width: 260, height: 260)
            .clipShape(Circle()) //원으로 자른다.
            .overlay{ //위에 겹친다.
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
            
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
