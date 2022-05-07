//
//  BearListViewController.swift
//  Brewery
//
//  Created by JeongMin Ko on 2022/05/07.
//

import Foundation
import UIKit

class BeerListViewController : UITableViewController{
    var beerList = [Beer]()
    var currentPage = 1
    
    var dataTasks = [URLSessionTask]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //uINavigationBar
        title = "브루어리"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        //테이블뷰 설정
        //만든 셀 레지스터
        tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell")
        tableView.rowHeight = 150
        
        tableView.prefetchDataSource = self
        
        fetchBeer(of: currentPage)
    }
}


extension BeerListViewController : UITableViewDataSourcePrefetching {
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Rows : \(indexPath.row)")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as? BeerListCell else{
            return UITableViewCell()
        }
                
                let beer = beerList[indexPath.row]
                cell.configure(with: beer)
                
                return cell
                
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beerList[indexPath.row]
        let detailViewController = BeerDetailViewController()
        
        detailViewController.beer = selectedBeer
        self.show(detailViewController, sender: nil)
    }
    //프리패치 -> 미리 보여줄 화면 -> 미리 새 페이지를 불러오도록 코드 추가
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach{
            print("prefetchRows : \($0.row)")
            
            
        }
        guard currentPage != 1 else { return }
        indexPaths.forEach{
            if ($0.row + 1)/25 + 1 == currentPage {
                self.fetchBeer(of: currentPage)
            }
        }
    }
    
}

//Data Fetching
private extension BeerListViewController {
    func fetchBeer(of page : Int){
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)"),
              dataTasks.firstIndex(where: { task in
                  task.originalRequest?.url == url
                  
              }) == nil
        
        else {
            return
        }
        var request = URLRequest(url : url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) {[weak self]data, response, error in
            guard error == nil,
                  let self = self,
                  let response = response as? HTTPURLResponse,
                  let data = data,
                  let beers = try? JSONDecoder().decode([Beer].self, from: data) else{
                      print("ERROR : URLSession data task \(error?.localizedDescription ?? "")")
                      return
                  }
            
            switch response.statusCode{
            case (200...299) : //성공
                self.beerList += beers
                self.currentPage += 1
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case (400...499) : //클라이언트 에러
                print("Error : Client ERROR\(response.statusCode)")
                
            case (500...599) : //서버 에러
                print("Error : server ERROR\(response.statusCode)")
            default :
                print("Error : ERROR\(response.statusCode)")
            }
        }
        dataTask.resume()
        dataTasks.append(dataTask)
    }
}
