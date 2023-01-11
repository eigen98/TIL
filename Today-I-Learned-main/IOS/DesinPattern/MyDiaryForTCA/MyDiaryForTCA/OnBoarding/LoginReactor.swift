//
//  LoginReactor.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import Foundation
import Combine
import ComposableArchitecture
//MARK: ReactorKit에서 Reactor와 매핑되는 개념이라서 Reactor로 설정.

struct LoginReactor: ReducerProtocol {
    // MARK: State
    public struct State: Equatable{
        
        var loginState : LoginState
        
        public init() {
            self.loginState = .logout
        }
        
    }
    
    // MARK: Action
    enum Action: Equatable {
        case appleLoginButtonTapped
        case googleLoginButtonTapped//(Result<Bool, FirebaseAuthService.ApiFailure>)
        case kakaoLoginButtonTapped//(Result<Bool, FirebaseAuthService.ApiFailure>)
        
        case googleAuthenticate
        case startObserve
    }
    
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action{
        case .kakaoLoginButtonTapped:
            
            return .none
        case .googleAuthenticate:
            return .none
        case .startObserve:
            return .none
        case .appleLoginButtonTapped:
            return .none
        case .googleLoginButtonTapped:
//            return Effect.run{_ in
//                let result = await TaskResult{ try await
//
//                }
//
//            }
            return .none
            
        }
        
    }
    
}





// MARK: Environment
public struct LoginViewEnvironment {
    var client: FirebaseAuthService
    var mainQueue: AnySchedulerOf<DispatchQueue>

    public init(client: FirebaseAuthService, mainQueue: AnySchedulerOf<DispatchQueue>) {
        self.client = client
        self.mainQueue = mainQueue
    }
}

//// MARK: reducer
//public let loginReducer = Reducer<LoginViewState, LoginViewAction, LoginViewEnvironment> { state, action, environment in
//    switch action {
//
//
//
//}



enum LoginState {
    case logout
    case login
    case unregistered
    case policyCheck
}
enum AuthError:Error {
    case success
    case fail
}

enum AuthType: String {
    case none = "none"
    case kakao = "kakao"
    case naver = "naver"
    case apple = "apple"
}

enum AuthState {
    case unauthenticated
    case authenticated
}
