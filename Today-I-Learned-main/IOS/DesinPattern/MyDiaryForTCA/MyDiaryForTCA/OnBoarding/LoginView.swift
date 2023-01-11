//
//  LoginView.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import SwiftUI

struct LoginView: View {
    // 1
    @EnvironmentObject var viewModel: LoginViewModel
    var body: some View {
        VStack{
            Spacer()
            Button(action: {
                
            }, label: {
                Image("apple_login_button")
            })
            
            Button(action: {
                viewModel.signIn()
            }, label: {
                Image("google_login_button")
            })
            .padding(.bottom, 100)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
