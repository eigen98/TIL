//
//  ViewController.swift
//  COVID19
//
//  Created by JeongMin Ko on 2022/02/27.
//

import UIKit
import Charts

import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fetchCovidOverview(completionHandler: { [weak self] result in
            guard let self = self else { return }
            switch result{
            case let .success(result):
                self.configureStackView(koreaCovidOverview: result)
            
        
            case let  .failure(error):
                debugPrint("error \(error)")
                
            }
            
        })
    }
    
    func configureStackView(koreaCovidOverview : CovidOverview){
        self.totalCaseLabel.text = "\(koreaCovidOverview.TotalCase)명"
        self.newCaseLabel.text = "\(koreaCovidOverview.NowCase)"
    }
    
    func fetchCovidOverview(
        completionHandler : @escaping (Result<CovidOverview, Error>) -> Void
    ){
        let url  = "https://api.corona-19.kr/korea/"
        let param = [
            "serviceKey" : "GM7vneb14UlJE2yCBwXcditjz6HLOSso9"
        ]
        
        AF.request(url, method: .get, parameters : param)
            .responseData(completionHandler: { response in
                switch response.result{
                case let .success(data) :
                    do{
                        let decoder = JSONDecoder()
                        let result  = try decoder.decode(CovidOverview.self , from: data)
                        completionHandler(.success(result))
                        
                    }catch{
                        completionHandler(.failure(error))
                        
                    }
                    
                    
                case let .failure(error):
                    completionHandler(.failure(error))
                }
                
            })
    }


}

