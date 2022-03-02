
import UIKit
// 음식점 목록 셀
class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var restaurantName: UILabel!
    
    @IBOutlet weak var representMenu: UILabel!
    
    @IBOutlet weak var minimumPrice: UILabel!
    
    @IBOutlet weak var star: UILabel!
    
    @IBOutlet weak var newShopImg: UIImageView!
    
    @IBOutlet weak var shopImg: UIImageView!
    
    @IBOutlet weak var couponImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


