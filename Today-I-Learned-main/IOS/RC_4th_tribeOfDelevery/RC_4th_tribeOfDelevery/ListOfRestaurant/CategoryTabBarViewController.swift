//
//  CategoryTabBarViewController.swift
//  RC_4th_tribeOfDelevery
//
//  Created by JeongMin Ko on 2022/02/22.
//

import UIKit
import Tabman
import Pageboy

class CategoryTabBarViewController: TabmanViewController, MyCutsomSegmentControllerDelegate {
    func segmentValueChanged(to index: Int) {
        print("ViewController - segmentValuChanged()")
    }
    
    
    private var viewControllers : Array<UIViewController> = []
    private var titles : Array<String> = ["치킨","피자", "아시안", "중식", "카페,디저트", "패스트푸드"]
    
    
    override func loadView() {
        super.loadView()
        print("ViewController - loadView() called")
        let customSegmentControl = CategorySegmentController(frame: CGRect(x: 100, y: 100, width: 2000, height: 200), buttonTitles: ["배달 빠른순", "배달팁 적은 순", "기본 순"])
        customSegmentControl.mySegmentDelegate = self
        self.view.addSubview(customSegmentControl)
        
        // 세그먼트 컨테이너
        customSegmentControl.backgroundColor = .white //배경
        customSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        customSegmentControl.widthAnchor.constraint(equalToConstant: 400).isActive = true
        customSegmentControl.heightAnchor.constraint(equalToConstant: 32).isActive = true
        customSegmentControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        customSegmentControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //customSegmentControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        //customSegmentControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chickenVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChickenVC") as! ChickenViewController
        let pizzaVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChickenVC") as! ChickenViewController
        let asianVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChickenVC") as! ChickenViewController
        let chineseVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChickenVC") as! ChickenViewController
        let cafeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChickenVC") as! ChickenViewController
        let fastfoodVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChickenVC") as! ChickenViewController

        viewControllers.append(chickenVC)
        viewControllers.append(pizzaVC)
        viewControllers.append(asianVC)
        viewControllers.append(cafeVC)
        viewControllers.append(fastfoodVC)

        
        self.dataSource = self
        
        
        //탭바 생성
        let categoryBar = TMBar.ButtonBar()
        categoryBar.layout.transitionStyle = .snap // 커스텀
        
        //Add to View
        addBar(categoryBar, dataSource: self, at: .top)
        
        //margin
        categoryBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        
        
    }
    

}

extension CategoryTabBarViewController : PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title:"")
        item.title = "\(titles[index])"
        item.image = UIImage(named : "image.png")
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
}
