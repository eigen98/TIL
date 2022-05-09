//
//  StationSearchViewController.swift
//  SubwayStation
//
//  Created by JeongMin Ko on 2022/05/09.
//

import UIKit
import SnapKit
import Alamofire

class StationSearchViewController: UIViewController {

    private var numberOfCell : Int = 0
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.isHidden = true
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setNavigationItems()
        setTableViewLayout()
    }
    

    private func setNavigationItems(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "지하철 도착 정보"
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "지하철 정보를 입력해주세요."
        searchController.obscuresBackgroundDuringPresentation = false //서치바 입력중 어두워지는 것.
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func setTableViewLayout(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }


}
//서치바 딜리게이트
//특정 행동 위임
//대부분 입력받는 컴포넌트들은 딜리게이트 존재.
extension StationSearchViewController : UISearchBarDelegate {
    //입력시작할 때 테이블뷰 나타남
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        numberOfCell = 10
        tableView.reloadData()
        tableView.isHidden = false
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        numberOfCell = 0
        tableView.isHidden = true
    }
}

extension StationSearchViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StationDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension StationSearchViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.item)"
        return cell
    }
}
