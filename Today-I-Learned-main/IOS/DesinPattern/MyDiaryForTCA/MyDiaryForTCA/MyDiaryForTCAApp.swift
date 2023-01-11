//
//  MyDiaryForTCAApp.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import SwiftUI
import FirebaseCore
import Firebase
import GoogleSignIn
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
    FirebaseApp.configure()

    return true
  }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct MyDiaryForTCAApp: App {
    @StateObject var loginViewModel = LoginViewModel()
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginViewModel)
//            DiaryView( store: .init(
//                initialState: DiaryState(),
//                reducer: diaryReducer,
//                environment: .init(
//                    client: .mock,
//                    mainQueue: .main.eraseToAnyScheduler()
//                )
//            ))
        }
    }
}
