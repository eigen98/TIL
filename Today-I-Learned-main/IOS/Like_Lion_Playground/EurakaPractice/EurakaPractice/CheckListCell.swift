//
//  CheckListCell.swift
//  client-ios
//
//  Created by jaeheon cho on 2022/11/17.
//  Copyright © 2022 logispot. All rights reserved.
//

import UIKit
import Eureka
import RxSwift

final class CheckListCell: Cell<String>, CellType {
    
    @IBOutlet weak var dotView : UILabel!
    @IBOutlet weak var checkDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none

        dotView.text = "."
        checkDescriptionLabel.text = ""
    }
}

final class CheckListRow : Row<CheckListCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<CheckListCell>(nibName: "CheckListCell")
    }
}
