//
//  ActionSheetTableViewCell.swift
//  Seknova
//
//  Created by imac on 2022/12/7.
//

import UIKit

class PersonalActionSheetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var informationLabel: UILabel!
    
    static let identifier = "PersonalActionSheetTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
