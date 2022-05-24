//
//  ViewController.swift
//  exApollo
//
//  Created by JeongMin Ko on 2022/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Network.shared.apollo.fetch(query: QueryQuery()) { result in
          switch result {
          case .success(let data):
              print(data.data) // Optional("1581951955")
          case .failure(let error):
            print(error)
          }
        }
    }


}

