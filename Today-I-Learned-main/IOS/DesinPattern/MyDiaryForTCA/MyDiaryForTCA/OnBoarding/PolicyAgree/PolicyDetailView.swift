//
//  PolicyDetailView.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import SwiftUI

struct PolicyDetailView: View {
    
    var title : String = "타이틀"
    var body: some View {
        VStack{
            //이용약관 동의 타이틀
            HStack{
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 24)
            
            HStack{
                Text("Title")
                    .font(.system(size: 14, weight: .medium))
                    
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 24)
            
            Spacer()
            Button(action: {
                print("동의할게요 클릭")
            }, label: {
                Image("abled_yellow")
            })
            .padding(.bottom, 60)
        }
    }
}

struct PolicyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyDetailView()
    }
}
