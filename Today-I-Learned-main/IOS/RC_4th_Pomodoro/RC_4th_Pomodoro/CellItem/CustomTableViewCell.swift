//
//  CustomTableViewCell.swift
//  RC_4th_Pomodoro
//
//  Created by JeongMin Ko on 2022/02/18.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    //셀 전체
    @IBOutlet weak var RoutineCellView: UIView!
    //퍼센트
    @IBOutlet weak var PercentView: UILabel!
    //제목
    @IBOutlet weak var titleView: UILabel!
    // 시간
    @IBOutlet weak var routineTimeView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
