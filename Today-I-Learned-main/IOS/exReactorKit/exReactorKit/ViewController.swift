//
//  ViewController.swift
//  exReactorKit
//
//  Created by JeongMin Ko on 2022/05/25.
//

import UIKit
import ReactorKit

class ViewController: UIViewController, View{
    var disposeBag = DisposeBag()
        
        let loadButton: UIButton = {
            let button = UIButton()
            button.setTitle("load Image", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            return button
        }()
        
        lazy var centerImageView: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
            imageView.image = UIImage()
            imageView.center = view.center
            return imageView
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            makeUI()
            
            loadButton.addAction(UIAction(handler: { _ in
                print("Hello")
            }), for: .touchUpInside)
        }
        
        func makeUI() {
            view.addSubview(centerImageView)
            view.addSubview(loadButton)
            
            loadButton.translatesAutoresizingMaskIntoConstraints = false
            loadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            loadButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        }
        
        func bind(reactor: MainReactor) {
            
            loadButton.rx.tap
                .map({ Reactor.Action.touchButton(index: 0) })
                .bind(to: reactor.action)
                .disposed(by: disposeBag)
            
            reactor.state
                .map({ $0.image })
                .bind(to: centerImageView.rx.image)
                .disposed(by: disposeBag)
            
        }


}

