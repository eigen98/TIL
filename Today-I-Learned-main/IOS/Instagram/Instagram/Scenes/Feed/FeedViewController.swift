//
//  FeedViewController.swift
//  Instagram
//
//  Created by JeongMin Ko on 2022/05/10.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {

    //테이블뷰
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none //컬렉션 뷰 처럼 사용
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
        tableView.dataSource = self
        return tableView
    }()
    
    //이미지피커 컨트롤러
    private lazy var imagePickerController : UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        
        return imagePickerController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
    }


}

extension FeedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell
        cell?.selectionStyle = .none //클릭 효과 없애기
        cell?.setup()
        return cell ?? UITableViewCell()
    }
}

private extension FeedViewController{
    //네비게이션 바 설정 메소드
    func setupNavigationBar(){
        //네비게이션 바 타이틀
        navigationItem.title = "Instagram"
        //네비게이션 바 버튼
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapUploadButton))
        navigationItem.rightBarButtonItem = uploadButton
        
    }
    
    @objc func didTapUploadButton(){
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

}
