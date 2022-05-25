//
//  Network.swift
//  exReactorKit
//
//  Created by JeongMin Ko on 2022/05/25.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit


class Network {
    func load(url: String) -> Single<UIImage?> {
        let request = URLRequest(url: URL(string: url)!)
        
        return URLSession.shared.rx.response(request: request)
            .map({ UIImage(data: $0.data) })
            .asSingle()
    }
}
