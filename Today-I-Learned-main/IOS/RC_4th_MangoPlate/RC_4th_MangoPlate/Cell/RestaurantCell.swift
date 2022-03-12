//
//  RestaurantCell.swift
//  RC_4th_MangoPlate
//
//  Created by JeongMin Ko on 2022/03/10.
//

import UIKit

class RestaurantCell: UICollectionViewCell {

    @IBOutlet weak var foodImg: UIImageView!
    
    @IBOutlet weak var restaurantName: UILabel!
    
    @IBOutlet weak var rate: UILabel!
    
    @IBOutlet weak var position: UILabel!
    
    @IBOutlet weak var countView: UILabel!
    
    @IBOutlet weak var countReview: UILabel!
    
    @IBOutlet weak var starBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
