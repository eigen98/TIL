//
//  OnboardingViewController.swift
//  CustomAlbumImp
//
//  Created by JeongMin Ko on 2023/04/09.
//

import UIKit
import Photos

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapMoveAlbumButton(_ sender: Any) {
        
        let vc = PhotoViewController()
        PermissionControl.requestPhotoAuthorization(from: self, succeedAction: {
            
           
            
            DispatchQueue.main.async { [weak self] in
               
                vc.modalPresentationStyle = .overFullScreen
                
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                fetchOptions.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
                vc.allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                vc.photocount = vc.allPhotos?.count ?? 0
                
               
                self?.present(vc, animated: true)
            }
        }, failedAction: {
            let actionDone = UIAlertAction(title: "설정하기", style: .default) { _ in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }
            let actionCancel = UIAlertAction(title: "취소", style: .cancel)
            self.presentAlert(
                title: "사진에 대한 엑세스 권한이 없어요",
                message: "앱 설정으로 가서 엑세스 권한을 수정할 수 있어요. 이동하시겠어요?",
                with: actionDone, actionCancel
            )
        })
        
        
    }

}
