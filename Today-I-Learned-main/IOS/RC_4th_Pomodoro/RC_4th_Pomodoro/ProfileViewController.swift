//
//  ProfileViewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/18.
//

import UIKit

enum CellType : String {
    case detailTitle
    case `switch`
    case rightDetail
}



struct SettingItem {
    let title : String
    let RightDetail : String?
    let subTitle : String?
    let type : CellType
    let on : Bool
    var imageName : String?
}

struct SettingSection {
    let items : [SettingItem]
    let header : String?
    
    static func generateData() -> [SettingSection]{
        return [
            SettingSection(
                items:[
                        SettingItem(title : "", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "개인정보", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "온라인 백업", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user")
                ],
                header : "Profile"),
            
            SettingSection(
                items:[
                        SettingItem(title : "커스텀 설정", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "푸시 알림 설정", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user")
                ],
                header : "Setting"),
            
            SettingSection(
                items:[
                        SettingItem(title : "이메일 문의", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "공지사항", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "자주 묻는 질문", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "앱스토어 평가", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "친구에게 공유", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                    ],
                header : "Feedback"),
            
            SettingSection(
                items:[
                        SettingItem(title : "루틴 잘하는 팁", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "앱 튜토리얼", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "루티너리 이야기", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                        SettingItem(title : "동료를 구합니다", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user")
                ],
                header : "Story"),
            
            SettingSection(
                items : [
                    SettingItem(title : "구독하기", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                    SettingItem(title : "선물권이 있어요", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                    SettingItem(title : "선물하기", RightDetail : nil, subTitle : nil, type : .detailTitle, on : false, imageName : "user"),
                ],
                header : "Membership")
        ]
        
    }
}

//프로필 탭 화면
class ProfileViewController: UIViewController {
    
    let list = SettingSection.generateData()

    @IBOutlet weak var profileTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileTable.dataSource = self
    }
    

}

extension ProfileViewController : UITableViewDataSource{
    //섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    //셀 숫자
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = list[indexPath.section].items[indexPath.row] //셀에 표시할 데이터를 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
        
        switch target.type{
        case .detailTitle :
            cell.textLabel?.text = target.title
            cell.detailTextLabel?.text = target.subTitle
            cell.imageView?.image = UIImage(named:  target.imageName!)
            
        case .switch :
            cell.textLabel?.text = target.title
            cell.imageView?.image = UIImage(named: target.imageName!)
            if let switchView = cell.accessoryView as? UISwitch {
                switchView.isOn = target.on
                
                switchView.tag = indexPath.section
            }
        case .rightDetail :
            cell.textLabel?.text = target.title
            cell.detailTextLabel?.text = target.RightDetail
            cell.imageView?.image = UIImage(named: target.imageName!)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].header
    }
    
}
