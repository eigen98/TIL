//
//  DetailViewController.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/11.
//

import UIKit

//포기 다중섹션 다중 뷰
class DetailViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var detailTableView: UITableView!
    
    private var dataSource = [DetailSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.detailTableView.dataSource = self
        self.detailTableView.delegate = self
        
        //컬렉션 뷰 셀 등록
        self.detailTableView.register( MapCell.self, forCellReuseIdentifier: MapCell.id)
        self.detailTableView.register( DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.id)
        self.detailTableView.register( CallCell.self, forCellReuseIdentifier: CallCell.id)
        self.detailTableView.register( InformationCell.self, forCellReuseIdentifier: InformationCell.id)
        initSection()
        
        
        
        
    }
    
    private func initSection(){
        
        let descriptionModel = DescriptionModel(
            titleText: "담양의 유명 맛집",
            descriptionText: "담양의 많은 돼지갈비, 떡갈비 중 가장 유명한 집"
        )
        let descriptionSection = DetailSection.descriptionCase([descriptionModel])
        
        let mapModel = MapModel(
            addressText: ""
        )
        let mapSection = DetailSection.mapCase([mapModel])
        
        let callModel = CallModel()
        let callSection = DetailSection.callCase([callModel])
        
        let informationModel = InformationModel(
            updateDate: "", priceText: ""
        )
        let informationSection = DetailSection.informationCase([informationModel])
        
        self.dataSource = [descriptionSection, mapSection, informationSection]
        self.detailTableView.reloadData()
    }
    
//    //식당 설명
//    struct DescriptionModel{
//
//    }
//
//    //지도 설명
//    struct MapModel{
//
//    }
//
//    //식당 설명
//    struct CallModel{
//
//    }
//
//    //식당 설명
//    struct InformationModel{
//
//    }

    
}

extension DetailViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { //섹션 개수
        self.dataSource.count
    }
    //각 섹션 분리
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.dataSource[section] {
            
        case let .descriptionCase(descriptionModels) :
            return descriptionModels.count
        case let .mapCase(mapModels) :
          return mapModels.count
        case let .informationCase(InformationModels) :
          return InformationModels.count
        case let.callCase(CallModels):
            return CallModels.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      switch self.dataSource[indexPath.section] {
          
      case let .descriptionCase(descriptionModels):
        let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.id, for: indexPath) as! DescriptionCell
        let descriptionModel = descriptionModels[indexPath.row]
        cell.prepare(
          titleText: descriptionModel.titleText,
          supplementText: descriptionModel.descriptionText
        )
        return cell
          
      case let .mapCase(mapModels):
        let cell = tableView.dequeueReusableCell(withIdentifier: MapCell.id, for: indexPath) as! MapCell
        let mapModel = mapModels[indexPath.row]
          cell.prepare(titleText: mapModel.addressText, supplementText: mapModel.addressText)
        return cell
          
      case let .callCase(callModels) :
        let cell = tableView.dequeueReusableCell(withIdentifier: CallCell.id, for: indexPath) as! CallCell
          let callModel = callModels[indexPath.row]
          cell.prepare(titleText: "", supplementText: "")
        return cell
          
      case let .informationCase(informationModels) :
          
          let cell = tableView.dequeueReusableCell(withIdentifier: InformationCell.id, for: indexPath) as! InformationCell
          let informationModel = informationModels[indexPath.row]
          cell.prepare(titleText: "", supplementText: "")
        return cell
      }
      
    }
    
    
}
