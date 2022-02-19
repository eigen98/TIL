//
//  DetailRoutineViewController.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/19.
//

import UIKit

struct DetailItem {
    let image : UIImage?
    let name : String
    let timer : String
    static func generateData() -> [DetailItem]{
        return [
            DetailItem(image: UIImage(named: "gotobed"), name: "이불 정리", timer: "3분"),
            DetailItem(image: UIImage(named: "water"), name: "물 마시기", timer: "1분"),
            DetailItem(image: UIImage(named: "degree"), name: "몸무게 재기", timer: "2분"),
            DetailItem(image: UIImage(named: "imitation"), name: "명상하기", timer: "5분"),
        
        ]
    }
}

class DetailRoutineViewController: UIViewController {

    var details = DetailItem.generateData()
    
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailTableView.dataSource = self
        self.detailTableView.delegate = self
        
        let floatingButton = UIButton()
        floatingButton.setTitle("시작", for: .normal)
        floatingButton.backgroundColor = .black
        floatingButton.layer.cornerRadius  = 25
        
        view.addSubview(floatingButton)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        
        //너비 높이
        floatingButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        floatingButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

//        floatingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        
        floatingButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true
        
        floatingButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        
        floatingButton.addTarget(self, action:  #selector(onTapButton), for: .touchUpInside)
        
        
    }
    @objc
    func onTapButton(){
        guard let timeVC = self.storyboard?.instantiateViewController(withIdentifier: "timerVC") else { return }
        
        //mainVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(timeVC, animated: true)
        
    }
    
    



}

extension DetailRoutineViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailCell") as! DetailRoutineTableViewCell
        
        cell.nameLB.text = details[indexPath.row].name
        cell.detailImageView.image = details[indexPath.row].image
        cell.detailTimeLB.text = details[indexPath.row].timer
        return cell
    }
}

extension DetailRoutineViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        var detail = self.details[indexPath.row] //배열 요소에 접근
        
        //todo 정보 수정하기
    }
}

