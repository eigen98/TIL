//
//  ContentView.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : LoginViewModel
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        
            
        switch viewModel.state {
            case .login : DiaryView( store: .init(
                initialState: DiaryState(),
                reducer: diaryReducer,
                environment: .init(
                    client: .mock,
                    mainQueue: .main.eraseToAnyScheduler()
                )
            ))
            case .logout : LoginView()
            case .unregistered:
            LoginView()
        case .policyCheck:
            PolicyAgreeView()
        }
    }
    
    func login() {
        // Perform login here
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LoginViewModel())
    }
}
