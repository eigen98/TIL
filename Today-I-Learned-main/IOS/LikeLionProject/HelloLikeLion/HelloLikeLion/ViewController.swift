//
//  ViewController.swift
//  HelloLikeLion
//
//  Created by JeongMin Ko on 2022/10/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    //라벨
    @IBOutlet weak var resultLabel: UILabel!
    
    var string = "sayHello"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    //버튼 클릭 리스너
    @IBAction func tapSayHelloButton(_ sender: UIButton) {
        
        var utterance = AVSpeechUtterance(string: string)
        
        var speechSynthesizer = AVSpeechSynthesizer()
        speechSynthesizer.speak(utterance)
        
    }
}

