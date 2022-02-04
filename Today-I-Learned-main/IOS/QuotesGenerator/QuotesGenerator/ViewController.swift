//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by JeongMin Ko on 2022/02/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var qouteLabel: UILabel!
    @IBOutlet weak var nameLebel: UILabel!
    
    let quotes = [
    Quote(contents: "죽음을 두려워하는 나머지 삶을 시작조차 못하는 사람이 많다", name: "벤다이크"),
    Quote(contents: "까불지마라", name: "001"),
    Quote(contents: "양치기 소년의 교훈은 사실 믿음이다", name: "mj"),
    Quote(contents: "물량 앞에 장사없다", name: "sc")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tapQouteGeneratorButton(_ sender: Any) {
        let random = Int(arc4random_uniform(4)) // 0~4 사이의 난수를 랜덤하게 생성
        let quote = quotes[random]
        self.qouteLabel.text = quote.contents
        self.nameLebel.text = quote.name
    }
}

