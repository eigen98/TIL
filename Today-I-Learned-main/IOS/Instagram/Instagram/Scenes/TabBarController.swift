//
//  TabBarController.swift
//  Instagram
//
//  Created by JeongMin Ko on 2022/05/10.
//

import Foundation
import UIKit

final class TabBarController : UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.tabBarItem =  UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        feedViewController.title = "타이틀"
        
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.tabBarItem =  UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        viewControllers = [feedViewController, profileViewController]
    }
}
