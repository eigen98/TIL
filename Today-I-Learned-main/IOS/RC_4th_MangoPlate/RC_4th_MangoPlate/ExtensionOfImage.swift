//
//  ExtensionOfImage.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/12.
//

import Foundation
import UIKit
//url을 통해 이미지 넣기
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async {
            [weak self] in if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    
}

extension UIImage {
    func loadImg(url: URL) -> UIImage? {
        var img : UIImage = UIImage()
        DispatchQueue.global().async {
            [weak self] in if let data = try? Data(contentsOf: url) {
                img =  UIImage(data: data)!
                    
                
                
            }
            
        }
        if img != nil {
            return img
        }
        return nil
        
    }
}



