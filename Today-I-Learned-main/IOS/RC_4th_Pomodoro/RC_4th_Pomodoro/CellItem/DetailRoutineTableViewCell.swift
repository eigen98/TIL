//
//  DetailRoutineTableViewCell.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/19.
//

import UIKit

class DetailRoutineTableViewCell: UITableViewCell {

    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var nameLB: UILabel!
    
    @IBOutlet weak var detailTimeLB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
