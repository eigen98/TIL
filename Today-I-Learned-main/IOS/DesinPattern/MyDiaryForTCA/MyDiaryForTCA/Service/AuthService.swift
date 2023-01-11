//
//  AuthService.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import Foundation
import Combine
import ComposableArchitecture
import FirebaseFirestore

//TODO: Service 레이어 분리
//protocol AuthService {
//    func initialize()
//    //func setViewController(viewController: UIViewController?)
//   // func handleRedirectURL(redirectURL:URL) -> Bool
//    //func getAccessToken() -> String
//
//    //func isInstalled() -> Single<Bool>
//    func isAuthenticated() -> Single<AuthState>
//    func authenticate() -> Single<AuthError>
//}

public struct FirebaseAuthService{
    //public var initialize : () -> Effect<String, ApiFailure>
   // public var isAuthenticated : () -> Effect<String, ApiFailure>
    public var authenticate : (_ email : String) -> Effect<Bool, ApiFailure>
    
    public struct ApiFailure: Error, Equatable {
        public let message: String

        public init(message: String) {
            self.message = message
        }
    }
    
    public init(//initialize: @escaping () -> Effect<String, ApiFailure>,
               // isAuthenticated: @escaping () -> Effect<String, ApiFailure>,
                authenticate: @escaping (_ email : String) -> Effect<Bool, ApiFailure>) {
        //self.initialize = initialize
       // self.isAuthenticated = isAuthenticated
        self.authenticate = authenticate
    }
    
}
// MARK: - Live API implementation
//static 으로 처리
//Service 자체를 반환
extension FirebaseAuthService{
    static let live = FirebaseAuthService(
//
//        isAuthenticated: {
//
//        },
//
        authenticate: { email in
            //Effect를 반환. task로 async 함수 사용
            Effect.future{ callback in
               
                Firestore.firestore().collection("User").getDocuments { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                        callback(.failure(.init(message: "Failed create diary")))
                    } else {
                        for document in querySnapshot!.documents {
                            print("\(document.documentID)") // Get documentID
                            //print("\(document.data)") // Get all data
                            print("\(document.data()["name"] as! String)") // Get specific data & type cast it.
                        }
                        callback(.success(true))
                    }
                }
            }
        }
    )
}
