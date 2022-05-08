//
//  TabBarController.swift
//  AppStore
//
//

import UIKit

class TabBarController: UITabBarController {

    //탭바에서 필요한 UIViewcontroller를 레이지로 생성.
    private lazy var todayViewController : UIViewController = {
        let viewController = TodayViewController()
        let tabBarItem = UITabBarItem(title: "투데이" , image: UIImage(systemName: "mail"), tag: 0)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    private lazy var appViewController : UIViewController = {
        let viewController = UINavigationController(rootViewController: AppViewController())
 
        viewController.navigationBar.isTranslucent = false
        let tabBarItem = UITabBarItem(title: "앱" , image: UIImage(systemName: "square.stack.3d.up"), tag: 1)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //탭바 컨트롤러는 기본적으로 viewControllers라는 프로퍼티를 가지고있음. -> 탭에서 어떤 뷰 컨트롤러를 표시시킬지
        viewControllers = [todayViewController, appViewController]
    }
    
    


}

