//
//  ViewController.swift
//  EurakaPractice
//
//  Created by JeongMin Ko on 2022/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        containerView.subviews
        
    }
    
    
    @IBAction func tapButton(_ sender: UIButton) {
        
        var vc = MyFormViewController()
        self.present(vc, animated: true)
    }
    

}

