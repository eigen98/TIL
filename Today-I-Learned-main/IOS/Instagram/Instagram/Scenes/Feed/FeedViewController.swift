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
        imagePickerController.delegate = self
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
//UIImagePickerControllerDelegate를 사용할 때 UINavigationControllerDelegate도 필요
extension FeedViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    //이미지를 선택하고 choose 눌렀을때 다음에 실행되는 메소드
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //선택된 이미지
        var selectImage : UIImage?
        //수정된 이미지가 존재할때 그대로 선택된 이미지로 할당. 없다면 오리지널 이미지.
        if let editedImage =
            info[UIImagePickerController.InfoKey.editedImage] as? UIImage { //info => 선택된 이미지의 정보를 가진 딕셔너리
            selectImage = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectImage = originalImage
        }
        
        
        picker.dismiss(animated: true, completion: { [weak self] in
            let uploadViewController = UINavigationController(rootViewController: UploadViewController(uploadImage: selectImage ?? UIImage()))
            uploadViewController.modalPresentationStyle = .fullScreen
            
            self?.present(uploadViewController, animated: true)
        })
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
