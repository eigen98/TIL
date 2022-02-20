//
//  RoutineViewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/18.
//

import UIKit

//루틴 아이템
struct RoutineItem {
    let percent : Int
    let title : String
    let time : String
    static func generateData() -> [RoutineItem]{
        return [
        RoutineItem(percent: 33, title: "월요일 루틴", time: "오전 10:00 ~ 오전 11:00"),
        RoutineItem(percent: 15, title: "화요일 루틴", time: "오전 11:00 ~ 오후 13:00"),
        RoutineItem(percent: 60, title: "수요일 루틴", time: "오후 13:00 ~ 오후 15:00"),
        RoutineItem(percent: 90, title: "목요일 루틴", time: "오후 15:00 ~ 오전 20:00")]
    }
}

class RoutineViewController: UIViewController {

    var routines = RoutineItem.generateData()
    
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.customTableView.dataSource = self
        self.customTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
}

extension RoutineViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = customTableView.dequeueReusableCell(withIdentifier: "custumCell") as! CustomTableViewCell
        
        cell.titleView.text = routines[indexPath.row].title
        cell.PercentView.text = "\(routines[indexPath.row].percent)%"
        cell.routineTimeView.text = routines[indexPath.row].time
        return cell
    }
}

extension RoutineViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        var routine = self.routines[indexPath.row] //배열 요소에 접근
        
        guard let detailRoutineVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailRoutineVC") as? DetailRoutineViewController else { return }
        
        detailRoutineVC.routine = routine
        
        self.navigationController?.pushViewController(detailRoutineVC, animated: true)
    }
}
