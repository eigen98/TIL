//
//  PermissionControl.swift
//  CustomAlbumImp
//
//  Created by JeongMin Ko on 2023/04/09.
//

import UIKit
import CoreLocation
import Photos
//권한 설정 클래스
class PermissionControl {
    // 위치 권한 설정
    static func requestLocationAuthorization(from viewController: UIViewController, locationManager: CLLocationManager, succeedAction: @escaping (() -> Void), failedAction: @escaping (() -> Void)) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            succeedAction()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            failedAction()
        default:
            break
        }
    }

    // 사진 권한 설정
    static func requestPhotoAuthorization(from viewController: UIViewController, succeedAction: @escaping (() -> Void), failedAction: (() -> Void)? = nil) {
        
        if #available(iOS 14, *) {
            let requiredAccessLevel: PHAccessLevel = .readWrite
            PHPhotoLibrary.requestAuthorization(for: requiredAccessLevel) { authorizationStatus in
                switch authorizationStatus {
                    
                case .notDetermined :
                    PHPhotoLibrary.requestAuthorization { status in
                        if status == PHAuthorizationStatus.authorized {
                            DispatchQueue.main.async {
                                succeedAction()
                            }
                        } else if let failedAction = failedAction {
                            DispatchQueue.main.async {
                                failedAction()
                            }
                        }
                    }
                case .limited:
                    succeedAction()
                case .authorized:
                    succeedAction()
                case.denied :
                    print("권한 denied")
                    let actionDone = UIAlertAction(title: "네, 권한 설정할게요", style: .default) { _ in
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    }
                    let actionCancel = UIAlertAction(title: "아니요, 괜찮습니다", style: .cancel)
                    DispatchQueue.main.async {
                        viewController.presentAlert(
                            title: "사진 접근 권한이 필요합니다",
                            message: "게시물에 사진을 업로드하기 위해 사진 접근 권한이 필요합니다",
                            with: actionDone, actionCancel
                        )
                    }
                    
                case .restricted:
                    DispatchQueue.main.async {
                        viewController.presentAlert(title: "사진에 접근할 수 없습니다")
                    }
                   
                
                default:
                    print("권한 default")
                    DispatchQueue.main.async {
                        failedAction?()
                    }
                    
                }
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    // 카메라 권한 설정
    static func requestCameraAuthorization(from viewController: UIViewController, succeedAction: @escaping (() -> Void), failedAction: (() -> Void)? = nil) {
        
        print("카메라 권한 요청")
        
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        print("\(status)")
        switch status {
        case .notDetermined:
            print("권한 요청 전 상태")
            // 권한 요청
            AVCaptureDevice.requestAccess(for: .video) { grated in
                if grated {
                    print("권한 허용")
                    DispatchQueue.main.async {
                        succeedAction()
                    }
                } else {
                    print("권한 거부")
                    DispatchQueue.main.async {
                        failedAction?()
                    }
                }
            }
            
        case .authorized:
            print("권한 허용 상태")
            succeedAction()
            
        case .denied:
            print("권한 거부 상태")
            print("권한 denied")
            let actionDone = UIAlertAction(title: "네, 권한 설정할게요", style: .default) { _ in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }
            let actionCancel = UIAlertAction(title: "아니요, 괜찮습니다", style: .cancel)
            viewController.presentAlert(
                title: "카메라 접근 권한이 필요합니다",
                message: "게시물에 사진을 업로드하기 위해 사진 접근 권한이 필요합니다",
                with: actionDone, actionCancel
            )
        case .restricted:
            print("액세스 불가 상태")
            
        @unknown default:
            print("unknown default")
        }
        
    }
}
