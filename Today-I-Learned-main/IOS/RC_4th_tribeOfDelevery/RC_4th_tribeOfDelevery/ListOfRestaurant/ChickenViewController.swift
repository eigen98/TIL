//
//  ChickenViewController.swift
//  RC_4th_tribeOfDelevery
//
//  Created by JeongMin Ko on 2022/02/22.
//

import UIKit


//음식점 아이템
struct RestaurantItem {
    let restaurantName : String
    let star : Int
    let minimumPrice : String
    let deleveryTip : String
    let representMenu : String
    let restaurantImg : UIImage
    let sign : Int
    static func generateData() -> [RestaurantItem]{
        return [
            RestaurantItem(restaurantName: "라화쿵부 길동점", star: 4 , minimumPrice: "10000원", deleveryTip: "2000원", representMenu: "마라탕, 마라샹궈", restaurantImg: UIImage(named: "restaurant1")!,sign :  111),
            RestaurantItem(restaurantName: "김가네", star: 3 , minimumPrice: "10000원", deleveryTip: "2000원", representMenu: "김밥", restaurantImg: UIImage(named: "restaurant1")!,sign : 101),
            RestaurantItem(restaurantName: "로니로티", star: 5 , minimumPrice: "11000원", deleveryTip: "5000원", representMenu: "마라탕, 마라샹궈", restaurantImg: UIImage(named: "restaurant2")!,sign : 001),
            RestaurantItem(restaurantName: "곱창의 전설", star: 4 , minimumPrice: "10000원", deleveryTip: "2000원", representMenu: "마라탕, 마라샹궈", restaurantImg: UIImage(named: "restaurant1")!,sign : 101),
            RestaurantItem(restaurantName: "굽네치킨", star: 5 , minimumPrice: "10000원", deleveryTip: "3000원", representMenu: "마라탕, 마라샹궈", restaurantImg: UIImage(named: "restaurant3")!,sign : 101),
            RestaurantItem(restaurantName: "팔도식당", star: 5 , minimumPrice: "20000원", deleveryTip: "4000원", representMenu: "마라탕, 마라샹궈", restaurantImg: UIImage(named: "restaurant1")!,sign : 101),
            RestaurantItem(restaurantName: "죠스떡볶이", star: 4 , minimumPrice: "10000원", deleveryTip: "2000원", representMenu: "마라탕, 마라샹궈", restaurantImg: UIImage(named: "restaurant4")!,sign : 101),
            RestaurantItem(restaurantName: "이가네", star: 2 , minimumPrice: "10000원", deleveryTip: "2000원", representMenu: "마라탕, 마라샹궈", restaurantImg: UIImage(named: "restaurant2")!,sign : 101),
            RestaurantItem(restaurantName: "고가네", star: 1 , minimumPrice: "30000원", deleveryTip: "2000원", representMenu: "마라탕, 마라샹궈", restaurantImg: UIImage(named: "restaurant3")!,sign : 101),
            RestaurantItem(restaurantName: "구가네", star: 4 , minimumPrice: "10000원", deleveryTip: "2000원", representMenu: "마라탕, 마라샹궈", restaurantImg: UIImage(named: "restaurant4")!,sign : 101)
           
        ]
    }
}


class ChickenViewController: UIViewController {
    
    //음식점 목록 배열
    var restaurants = RestaurantItem.generateData()
    
    //테이블 뷰
    @IBOutlet weak var restaurantTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restaurantTableView.dataSource = self
        self.restaurantTableView.delegate = self

        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ChickenViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restaurantTableView.dequeueReusableCell(withIdentifier: "restaurantCell") as! RestaurantTableViewCell
        cell.restaurantName.text = restaurants[indexPath.row].restaurantName
        cell.minimumPrice.text = "최소주문 " + restaurants[indexPath.row].minimumPrice + "배달팁 " + restaurants[indexPath.row].deleveryTip
        cell.representMenu.text = restaurants[indexPath.row].representMenu
        cell.ImageView.image = restaurants[indexPath.row].restaurantImg
        return cell
    }
    
}

extension ChickenViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
                
        var routine = self.restaurants[indexPath.row] //배열 요소에 접근
    
        
        
//        guard let detailRoutineVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailRoutineVC") as? DetailRoutineViewController else { retur
        
    }
//
//
//        detailRoutineVC.routine = routine
//
//
//
//        self.navigationController?.pushViewController(detailRoutineVC, animated: true)

}



//    extension RoutineViewController : UITableViewDataSource{
//
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return routines.count
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//            let cell = customTableView.dequeueReusableCell(withIdentifier: "custumCell") as! CustomTableViewCell
//
//            cell.titleView.text = routines[indexPath.row].title
//            cell.PercentView.text = "\(routines[indexPath.row].percent)%"
//            cell.routineTimeView.text = routines[indexPath.row].time
//            return cell
//        }
//    }
//
//    extension RoutineViewController : UITableViewDelegate{
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//            var routine = self.routines[indexPath.row] //배열 요소에 접근
//
//            guard let detailRoutineVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailRoutineVC") as? DetailRoutineViewController else { return }
//
//            detailRoutineVC.routine = routine
//
//            self.navigationController?.pushViewController(detailRoutineVC, animated: true)
//        }
//    }
//
