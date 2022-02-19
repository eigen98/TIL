//
//  PageViewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/16.
//

import UIKit

//
//extension PageViewController : ProgressCheckDelegate{
//    func pageCheck(number: Float) {
//        self.pageProgressBar.progress = number
//    }
//    
//    
//}


class PageViewController: UIPageViewController {
    
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()

        
        //딜리게이트 , 데이터소스 연결
        self.dataSource = self
        self.delegate = self
        
        //첫번째 페이지를 기본 페이지로 설정
        if let firstVC = vcArray.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    lazy var vcArray: [UIViewController] = {
        return [self.vcInstance(name: "FirstPage"),
                self.vcInstance(name: "SecondPage"),
                self.vcInstance(name: "ThirdPage")]
    }()
    //스토리보드 아이디에 맞는 뷰 컨트롤러 인스턴스를 반환
    private func vcInstance(name: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    


}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
   
    
    
   

    
    
    
    
    
    //이전페이지로 넘기는 액션
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        
        
        // 배열에서 현재 페이지의 컨트롤러를 찾아서 해당 인덱스를 현재 인덱스로 기록
        guard let vcIndex = vcArray.firstIndex(of: viewController) else { return nil }
        
        //이전 인덱스
        let prevIndex = vcIndex - 1
        
        // 인덱스가 0 이상이라면 그냥 놔둠
//            guard prevIndex >= 0 else {
//
//                return nil
//
                // 무한반복 시 - 1페이지에서 마지막 페이지로 가야함
                // return vcArray.last
//            }
        if prevIndex < 0 { return nil}
        // 인덱스는 vcArray.count 이상이 될 수 없음
//            guard vcArray.count > prevIndex else { return nil }
        //부모에게 전달할 index
            
        //옵저빙
//        ProgressViewController.pageMeter.page = ProgressViewController.pageMeter.page-1.0
//        ProgressViewController.pageMeter.notify()
        
        return vcArray[prevIndex]
    }
    
    
    //다음 페이지로 넘기는 액션
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = vcArray.firstIndex(of: viewController) else { return nil }
           // 다음 페이지 인덱스
           let nextIndex = vcIndex + 1
           
//           guard nextIndex == vcArray.count else {
//               return nil
//
//               // 무한반복 시 - 마지막 페이지에서 1 페이지로 가야함
//               // return vcArray.first
//           }
//
        if nextIndex == vcArray.count { return nil}
//        guard vcArray.count > nextIndex else { return nil }
        //옵저빙
//        ProgressViewController.pageMeter.page = ProgressViewController.pageMeter.page+1.0
//        ProgressViewController.pageMeter.notify()
           
           return vcArray[nextIndex]
        
    }
    
}
