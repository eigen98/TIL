//
//  MainReactor.swift
//  exReactorKit
//
//  Created by JeongMin Ko on 2022/05/25.
//

import Foundation
import ReactorKit
import UIKit

class MainReactor : Reactor {
    
    let network = Network()
        
        private let URLs = ["https://avatars.githubusercontent.com/u/62657991?v=4"]
        
        enum Action {
            case touchButton(index: Int)
        }
        
        enum Mutation {
            case setImage(image: UIImage?)
        }
        
        struct State {
            var image: UIImage?
        }
        
        let initialState: State
        
        init() {
            self.initialState = State()
        }
        
        func mutate(action: Action) -> Observable<Mutation> {
            switch action {
            case .touchButton(let index):
                return Observable.just(URLs[index])
                    .flatMap({ self.network.load(url: $0) })
                    .map({ Mutation.setImage(image: $0) })
            }
        }
        
        func reduce(state: State, mutation: Mutation) -> State {
            var state = state
            
            switch mutation {
            case .setImage(let image):
                state.image = image
            }
            
            return state
        }
}
